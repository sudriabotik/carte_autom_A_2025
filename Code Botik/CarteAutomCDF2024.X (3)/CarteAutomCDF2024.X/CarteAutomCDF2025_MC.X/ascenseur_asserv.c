/*
 * File:   ascenseur_asserv.c
 * Author: james
 *
 * Created on February 26, 2025, 1:33 PM
 */

#include "xc.h"
#include "ascenseur_asserv.h"
#include "ascenseur_params.h"
#include "system.h"   // Pour envoit_pwm(), etc.
#include "pmw.h"
#include <math.h>
#include <stdio.h>
#include <stdint.h>


#define ASC_TSK_DT_S   0.005      // 5 ms : période d'appel de ascenseurTask()

/* ---------------- Variables Globales ---------------- */

// Variables utilisées par l'asserv (définies ici)
volatile double asc_position_actuelle = 0.0;
volatile double asc_position_consigne = 0.0;
// Nous utilisons une seule variable pour la distance totale
volatile double asc_distance_totale = 0.0;

volatile uint16_t compt = 0;



asc_pid_t asc_pid = {
    .Kp = _PID_KP,
    .Ki = _PID_KI,
    .Kd = _PID_KD,
    .erreur_integree = 0.0,
    .erreur_precedente = 0.0,
    .integrale_max = _PID_IMAX
};

asc_pid_t asc_pid_brake = {
    .Kp = _PIDB_KP,
    .Ki = _PIDB_KI,
    .Kd = _PIDB_KD,
    .erreur_integree = 0.0,
    .erreur_precedente = 0.0,
    .integrale_max = _PIDB_IMAX
};

asc_rampe_t asc_rampe = {
    .accel = _ASC_ACCEL_TICKS, // ticks/itération²
    .decel = _ASC_DECEL_TICKS,
    .vmax = _ASC_VMAX_TICKS // ticks/itération
};

/*
asc_pid_t asc_pid = {
    .Kp = 0.0,
    .Ki = 0.02,
    .Kd = 0.0,
    .erreur_integree = 0.0,
    .erreur_precedente = 0.0,
    .integrale_max = 10000.0
};


// PID brake? pour le maintien en position
asc_pid_t asc_pid_brake = {
    .Kp = 0.00015,
    .Ki = 0.001,
    .Kd = 0.000,
    .erreur_integree = 0.0,
    .erreur_precedente = 0.0,
    .integrale_max = 10000.0
};
 

asc_pid_t asc_pid_brake = {
    .Kp = 0.002, // ? nouveaux gains de départ
    .Ki = 0.0004,
    .Kd = 0.0008,
    .erreur_integree = 0.0,
    .erreur_precedente = 0.0,
    .integrale_max = 1000.0 // plus petit maintenant qu'on multiplie par DT
};
 * 
 */


volatile asc_state_t asc_current_state = ASC_STATE_IDLE;

// Vitesse cible dans la rampe (interne)
static double asc_vitesse_consigne = 0.0;

// Variables pour le homing
volatile bool endSwitch1_pressed = false;
volatile bool endSwitch2_pressed = false;

volatile double bottomPos = 0.0;
volatile double topPos = 0.0;
volatile homing_state_t gHomingState = HOMING_IDLE;

/* ---------------- Fonctions Privées ---------------- */

// Clamp : limite une valeur dans [minv, maxv]

static double clamp(double val, double minv, double maxv) {
    if (val > maxv) val = maxv;
    if (val < minv) val = minv;
    return val;
}

// Conversion d'un pourcentage [0..100] en ticks selon asc_distance_totale

static double pourcentToTicks(double p) {
    if (p < 0) p = 0.0;
    if (p > 100) p = 100.0;
    double ptt = (1 - (p / 100.0)) * asc_distance_totale;
    //printf("pourcent: %f  ->  ticks: %f\n", p, ptt);
    return ptt;
}

// PID standard pour le déplacement avec DT

static double ascenseurPID(double consigne, double mesure) {
    double erreur = consigne - mesure;
    // Intégration avec dt
    asc_pid.erreur_integree += erreur * ASC_TSK_DT_S;
    asc_pid.erreur_integree = clamp(asc_pid.erreur_integree,
            -asc_pid.integrale_max,
            asc_pid.integrale_max);
    // Dérivée (delta erreur / dt)
    double derive = (erreur - asc_pid.erreur_precedente) / ASC_TSK_DT_S;
    asc_pid.erreur_precedente = erreur;
    // Loi de commande
    double commande = asc_pid.Kp * erreur
            + asc_pid.Ki * asc_pid.erreur_integree
            + asc_pid.Kd * derive;
    return clamp(commande, -CLAMP_PWM_PID_SPEED, CLAMP_PWM_PID_SPEED);
}


// PID pour le maintien (brake) avec DT

static double ascenseurPID_brake(double consigne, double mesure) {
    double erreur = consigne - mesure;

    // Intégration avec dt
    asc_pid_brake.erreur_integree += erreur * ASC_TSK_DT_S;
    asc_pid_brake.erreur_integree = clamp(asc_pid_brake.erreur_integree,
            -asc_pid_brake.integrale_max,
            asc_pid_brake.integrale_max);

    // Dérivée brute / dt
    double raw_derivative = (erreur - asc_pid_brake.erreur_precedente) / ASC_TSK_DT_S;
    asc_pid_brake.erreur_precedente = erreur;

    // Filtrage de la dérivée
    static double filtered_derivative = 0.0;
    double alpha = 0.05;
    filtered_derivative = alpha * raw_derivative
            + (1.0 - alpha) * filtered_derivative;

    // Loi de commande
    double commande = asc_pid_brake.Kp * erreur
            + asc_pid_brake.Ki * asc_pid_brake.erreur_integree
            + asc_pid_brake.Kd * filtered_derivative;



    return clamp(commande, -CLAMP_PWM_PID_BRAKE, CLAMP_PWM_PID_BRAKE);
}

/*
// PID standard pour le déplacement sans DT

static double ascenseurPID(double consigne, double mesure) {
    double erreur = consigne - mesure;
    asc_pid.erreur_integree += erreur;
    asc_pid.erreur_integree = clamp(asc_pid.erreur_integree, -asc_pid.integrale_max, asc_pid.integrale_max);
    double derive = erreur - asc_pid.erreur_precedente;
    asc_pid.erreur_precedente = erreur;
    double commande = asc_pid.Kp * erreur + asc_pid.Ki * asc_pid.erreur_integree + asc_pid.Kd * derive;
    return clamp(commande, -CLAMP_PWM_PID_SPEED, CLAMP_PWM_PID_SPEED);
}


// PID pour le maintien (brake) sans DT

static double ascenseurPID_brake(double consigne, double mesure) {
    double erreur = consigne - mesure;



    asc_pid_brake.erreur_integree += erreur;
    asc_pid_brake.erreur_integree = clamp(asc_pid_brake.erreur_integree,
            -asc_pid_brake.integrale_max,
            asc_pid_brake.integrale_max);
    double raw_derivative = erreur - asc_pid_brake.erreur_precedente;
    asc_pid_brake.erreur_precedente = erreur;

    static double filtered_derivative = 0.0;
    double alpha = 0.1;
    filtered_derivative = alpha * raw_derivative + (1.0 - alpha) * filtered_derivative;

    double commande = asc_pid_brake.Kp * erreur +
            asc_pid_brake.Ki * asc_pid_brake.erreur_integree +
            asc_pid_brake.Kd * filtered_derivative;

    // Friction compensation: if output is nonzero, add a small offset
    if (commande < 0) {
        commande += 0;
    } // adjust offset as needed


    //commande=(commande/asc_distance_totale)*100;
    return clamp(commande, -CLAMP_PWM_PID_BRAKE, CLAMP_PWM_PID_BRAKE);
}
 */



/* ---------------- Fonctions Publiques ---------------- */

// Initialisation de l'asservissement

void ascenseurAsservInit(void) {
    asc_current_state = ASC_STATE_IDLE;

    /* -- PID motion initialisation -- */
    asc_pid.Kp = PID_KP;
    asc_pid.Ki = PID_KI;
    asc_pid.Kd = PID_KD;
    asc_pid.integrale_max = PID_IMAX;

    /* -- PID brake initialisation -- */
    asc_pid_brake.Kp = PIDB_KP;
    asc_pid_brake.Ki = PIDB_KI;
    asc_pid_brake.Kd = PIDB_KD;
    asc_pid_brake.integrale_max = PIDB_IMAX;

    /* -- rampes et codeur inchangés -- */
    asc_rampe.accel = ASC_ACCEL_TICKS;
    asc_rampe.decel = ASC_DECEL_TICKS;
    asc_rampe.vmax = ASC_VMAX_TICKS;

    OVERFLOW_CODEUR[CODEUR_D] = PAS_D_OVERFLOW_CODEUR;
    POSITION[CODEUR_D].ancien = 0U;
    POSITION[CODEUR_D].nouvelle = 0U;
    POSITION[CODEUR_D].cumul = 0.0;

    asc_position_actuelle = ascenseurGetPosition();
    asc_position_consigne = asc_position_actuelle;

    asc_current_state = ASC_STATE_IDLE; // immobile au démarrage

    homingAscenseurStart(); //lancement homing
}


// Définir la consigne de position en pourcentage [0..100]

void ascenseurSetConsignePourcent(double pourcent) {
    // On ne reprend une nouvelle consigne que si l'ascenseur est immobile
    if (asc_current_state != ASC_STATE_IDLE && asc_current_state != ASC_STATE_BRAKE) {
        return;
    }

    // Conversion du % en ticks
    double newPos = pourcentToTicks(pourcent);

    // Si c'est la même consigne, on ne réinitialise pas la rampe
    if (newPos == asc_position_consigne) {
        return;
    }

    // on bloque la rampe au nouveau départ
    asc_position_consigne = newPos;
    asc_vitesse_consigne = 0.0;
    asc_pid.erreur_integree = 0.0;
    asc_pid.erreur_precedente = 0.0;
    asc_current_state = ASC_STATE_ACCEL;
    endSwitch1_pressed = false;
    endSwitch2_pressed = false;
}

// Tâche à appeler périodiquement (

void ascenseurTask(void) {



    // 1) Lecture de la position
    asc_position_actuelle = ascenseurGetPosition();
    //printf("Pos actuelle: %f, Consigne: %f\n", asc_position_actuelle, asc_position_consigne);

    // 2) Vérification blocage immédiat


    if (gHomingState == HOMING_DONE) {

        if (endSwitch1_pressed || endSwitch2_pressed) {

            compt++;

            if (compt == 100) {
                //envoit_pwm(MOTEUR_DROIT, 0.0);
                //asc_current_state = ASC_STATE_BLOCKED;
                //printf("!!! Blocage détecté (endSwitch1=%d, endSwitch2=%d) -> MOTEUR ARRETE\n",
                //endSwitch1_pressed, endSwitch2_pressed);
                compt = 0;
                return;
            }
            // arrêt immédiat du moteur

        }
    }

    double delta = asc_position_consigne - asc_position_actuelle;
    double distRestante = delta;
    //printf("Dist restante: %f\n", distRestante);
    double sens = (delta >= 0.0) ? 1.0 : -1.0;

    switch (asc_current_state) {
        case ASC_STATE_IDLE:
            //printf("ASC_STATE_IDLE\n");
            break;
        case ASC_STATE_DONE:
        {
            static double filtered_position = 0.0;
            
            double alpha = 1.0;
            filtered_position = alpha * asc_position_actuelle
                    + (1.0 - alpha) * filtered_position;


            // Maintien en position (PID brake)
            double cmd = ascenseurPID_brake(asc_position_consigne, filtered_position);
            envoit_pwm(MOTEUR_DROIT, cmd);
            //printf("ASC_STATE_DONE\n");
            break;
        }
        case ASC_STATE_ACCEL:
        {

            asc_vitesse_consigne += asc_rampe.accel;
            if (asc_vitesse_consigne > asc_rampe.vmax)
                asc_vitesse_consigne = asc_rampe.vmax;
            double distFreinage = (asc_vitesse_consigne * asc_vitesse_consigne) / (2.0 * asc_rampe.decel);
            if (asc_vitesse_consigne >= asc_rampe.vmax) {
                asc_vitesse_consigne = asc_rampe.vmax;
                asc_current_state = ASC_STATE_CRUISE;
                //printf("Transition to ASC_STATE_CRUISE\n");
            } else if (distFreinage >= distRestante) {
                asc_current_state = ASC_STATE_DECEL;
                //printf("Transition to ASC_STATE_DECEL\n");
            } else {
                //printf("ASC_STATE_ACCEL\n");
            }
            double vCible = asc_vitesse_consigne * sens;
            double position_theorique = asc_position_actuelle + vCible;
            double cmd = ascenseurPID(position_theorique, asc_position_actuelle);

            envoit_pwm(MOTEUR_DROIT, cmd);
            break;
        }
        case ASC_STATE_CRUISE:
        {
            //printf("ASC_STATE_CRUISE\n");
            double distFreinage = (asc_rampe.vmax * asc_rampe.vmax) / (2.0 * asc_rampe.decel);
            if (distFreinage >= distRestante) {
                asc_current_state = ASC_STATE_DECEL;
            } else {
                double vCible = asc_rampe.vmax * sens;
                double position_theorique = asc_position_actuelle + vCible;
                double cmd = ascenseurPID(position_theorique, asc_position_actuelle);
                envoit_pwm(MOTEUR_DROIT, cmd);
            }
            break;
        }
        case ASC_STATE_DECEL:
        {
            asc_vitesse_consigne -= asc_rampe.decel;
            if (asc_vitesse_consigne < 0.0)
                asc_vitesse_consigne = 0.0;


            if (distRestante < ASC_DIST_VMIN && asc_vitesse_consigne > ASC_VMIN_TICKS)
                asc_vitesse_consigne = ASC_VMIN_TICKS;
            if (fabs(distRestante) < ASC_DIST_FINISH) {
                asc_current_state = ASC_STATE_BRAKE;
                asc_pid_brake.erreur_integree = 0.0;
                asc_pid_brake.erreur_precedente = 0.0;
            } else {
                double vCible = asc_vitesse_consigne * sens;
                double position_theorique = asc_position_actuelle + vCible;
                double cmd = ascenseurPID(position_theorique, asc_position_actuelle);
                envoit_pwm(MOTEUR_DROIT, cmd);
                //printf("In ASC_STATE_DECEL\n");
            }
            break;
        }
        case ASC_STATE_BRAKE:
        {
            // Maintien de la position avec PID brake
            double cmd = ascenseurPID_brake(asc_position_consigne, asc_position_actuelle);
            envoit_pwm(MOTEUR_DROIT, cmd);
            break;
        }

        case ASC_STATE_BLOCKED:
        { // On reste bloqué ici ; pour relancer on devra sortir manuellement de ce mode
            // Pas de PWM, pas de transition automatique
            envoit_pwm(MOTEUR_DROIT, 0.0);
            //printf("ASC_STATE_BLOCKED : moteur coupé, attendre reset\n");
            break;
        }

        default:
        { // Sécurité : ne jamais arriver ici
            envoit_pwm(MOTEUR_DROIT, 0.0);
            asc_current_state = ASC_STATE_IDLE;
            break;

        }

    }
}

// Lecture de la position de l'ascenseur (en ticks)
// On se base sur le compteur cumulatif pour avoir une valeur absolue.

double ascenseurGetPosition(void) {
    get_valeur_codeur(CODEUR_D);
    return POSITION[CODEUR_D].cumul;
}

bool ascenseurIsDone(void) {
    //printf("ascenseurIsDone: DONE\n");
    return (asc_current_state == ASC_STATE_DONE);
}

/* ---------------- Fonctions de Homing ---------------- */

// Démarrer le homing (descente)

void homingAscenseurStart(void) {
    endSwitch1_pressed = false;
    endSwitch2_pressed = false;
    // Réinitialiser la distance totale (sera recalculée)
    asc_distance_totale = 0.0;
    gHomingState = HOMING_DESCENT;
    // Commande pour descendre à une vitesse lente
    envoit_pwm(MOTEUR_DROIT, +HOMING_SPEED);
}

// Tâche de homing à appeler périodiquement

void homingAscenseurTask(void) {
    switch (gHomingState) {
        case HOMING_IDLE:
            break;
        case HOMING_DESCENT:
            if (endSwitch1_pressed) {
                envoit_pwm(MOTEUR_DROIT, 0.0);
                OVERFLOW_CODEUR[CODEUR_D] = PAS_D_OVERFLOW_CODEUR;
                POSITION[CODEUR_D].ancien = 0U;
                POSITION[CODEUR_D].nouvelle = 0U;
                POSITION[CODEUR_D].ecart = 0.0;
                // Remise à zéro du cumul pour définir la position absolue de la butée basse
                POSITION[CODEUR_D].cumul = 0.0;
                bottomPos = 0.0;
                topPos = 0.0;
                gHomingState = HOMING_BOTTOM_REACHED;
                //printf("HOMING_BOTTOM_REACHED\n");
            }
            break;
        case HOMING_BOTTOM_REACHED:
            endSwitch1_pressed = false;
            gHomingState = HOMING_ASCENT;
            envoit_pwm(MOTEUR_DROIT, -HOMING_SPEED);
            //printf("HOMING_ASCENT\n");
            break;
        case HOMING_ASCENT:
            if (endSwitch2_pressed) {
                envoit_pwm(MOTEUR_DROIT, 0.0);
                // Utilisation du cumul pour mesurer la position absolue de la butée haute

                topPos = POSITION[CODEUR_D].cumul;
                gHomingState = HOMING_TOP_REACHED;
                //printf("HOMING_TOP_REACHED\n");
            }
            break;
        case HOMING_TOP_REACHED:
        {
            endSwitch2_pressed = false;
            double dist = topPos;
            if (dist < 0) dist = -dist;
            // On enregistre la distance totale dans asc_distance_totale (utilisée pour la conversion %->ticks)
            asc_distance_totale = dist;


            OVERFLOW_CODEUR[CODEUR_D] = PAS_D_OVERFLOW_CODEUR;
            POSITION[CODEUR_D].ancien = 0U;
            POSITION[CODEUR_D].nouvelle = 0U;
            POSITION[CODEUR_D].ecart = 0.0;
            // Remise à zéro du cumul pour définir la position absolue de la butée basse
            POSITION[CODEUR_D].cumul = 0.0;

            //printf("-----------------HOMING_DONE, asc_distance_totale = %f ----------------------\n", asc_distance_totale);


            gHomingState = HOMING_DONE;
            break;
        }
        case HOMING_DONE:
            // Une fois le homing terminé, on peut lancer le mode brake pour maintenir la position
            // Si vous disposez d'une fonction brake() dans votre système.

            break;
    }
}

/* ==================================================
 *              getters d?état (public)
 * ==================================================*/
uint8_t ascenseurGetState(void) {
    return (uint8_t) asc_current_state;
}

uint8_t ascenseurGetHomeState(void) {
    return (uint8_t) gHomingState;
}

#define DBG_DT_S   0.02   // intervalle du debug_autom en secondes
#define ASC_DT_S   0.005  // intervalle de la rampe interne : 5 ms

#ifdef DEBUG_AUTOM

static uint32_t debug_time_ms = 0;
static double last_position = 0.0;

void debug_autom(void) {
    // --- 1) Sauvegarde locale des gains et états PID vitesse ---
    double Kp_sp = asc_pid.Kp;
    double Ki_sp = asc_pid.Ki;
    double Kd_sp = asc_pid.Kd;
    double Imax_sp = asc_pid.integrale_max;
    double eint_sp = asc_pid.erreur_integree;
    double eprev_sp = asc_pid.erreur_precedente;

    // --- 2) Sauvegarde locale des gains et états PID brake ---
    double Kp_br = asc_pid_brake.Kp;
    double Ki_br = asc_pid_brake.Ki;
    double Kd_br = asc_pid_brake.Kd;
    double Imax_br = asc_pid_brake.integrale_max;
    double eint_br = asc_pid_brake.erreur_integree;
    double eprev_br = asc_pid_brake.erreur_precedente;

    // --- 3) Vitesse mesurée (ticks/s) ---
    double delta_pos = asc_position_actuelle - last_position;
    double vitesse_mes = delta_pos / DBG_DT_S;
    last_position = asc_position_actuelle;

    // --- 4) Vitesse consigne (ticks/s) ---
    double delta = asc_position_consigne - asc_position_actuelle;
    double sens = (delta >= 0.0) ? 1.0 : -1.0;
    double vCible_s = (asc_vitesse_consigne * sens) / ASC_DT_S;

    // --- 5) Position théorique ---
    double pos_theo = asc_position_actuelle + asc_vitesse_consigne * sens;

    // --- 6) Limite vitesse pour échelle ---
    double speed_limit = 2.0 * ASC_VMAX_TICKS;

    // --- 7) Calcul « en lecture » du PID vitesse ---
    double err_sp = pos_theo - asc_position_actuelle;
    double eint_sp_new = clamp(eint_sp + err_sp, -Imax_sp, Imax_sp);
    double deriv_sp = err_sp - eprev_sp;
    double cmd_sp = Kp_sp * err_sp
            + Ki_sp * eint_sp_new
            + Kd_sp * deriv_sp;
    cmd_sp = clamp(cmd_sp, -CLAMP_PWM_PID_SPEED, CLAMP_PWM_PID_SPEED);

    // --- 8) Calcul « en lecture » du PID brake ---
    double err_br = asc_position_consigne - asc_position_actuelle;
    double eint_br_new = clamp(eint_br + err_br, -Imax_br, Imax_br);
    double deriv_br = err_br - eprev_br;
    double cmd_br = Kp_br * err_br
            + Ki_br * eint_br_new
            + Kd_br * deriv_br;
    cmd_br = clamp(cmd_br, -CLAMP_PWM_PID_BRAKE, CLAMP_PWM_PID_BRAKE);

    // --- 9) Choix de la commande effectivement appliquée ---
    uint8_t pid_mode = (asc_current_state == ASC_STATE_BRAKE
            || asc_current_state == ASC_STATE_DONE)
            ? 1 : 0;
    double cmd_used = pid_mode ? cmd_br : cmd_sp;

    // --- 10) Erreurs en % de la distance totale ---
    double err_pct = (asc_distance_totale > 0.0)
            ? (err_sp / asc_distance_totale) * 100.0
            : 0.0;
    double eprev_pct = (asc_distance_totale > 0.0)
            ? (eprev_sp / asc_distance_totale) * 100.0
            : 0.0;

    // --- 11) Impression de TOUT ---
    // time;
    // pos_mes; pos_con; dist_total;
    // asc_state; homing_state;
    // pos_theo;
    // vCible_s; vitesse_mes; speed_limit;
    // cmd_used;
    // err_pct; eprev_pct;
    // eint_sp_new; Imax_sp;
    // eint_br_new; Imax_br;
    // pid_mode
    printf("%lu;" // 1
            "%ld;%ld;%ld;" // 2?4
            "%u;%u;" // 5?6
            "%ld;" // 7
            "%.2f;%.2f;%.2f;" // 8?10
            "%.2f;" // 11
            "%.2f;%.2f;" // 12?13
            "%.2f;%.2f;" // 14?15
            "%.2f;%.2f;" // 16?17
            "%u\n", // 18
            debug_time_ms,
            (long) asc_position_actuelle,
            (long) asc_position_consigne,
            (long) asc_distance_totale,
            (unsigned) asc_current_state,
            (unsigned) gHomingState,
            (long) pos_theo,
            vCible_s,
            vitesse_mes,
            speed_limit,
            cmd_used,
            err_pct,
            eprev_pct,
            eint_sp_new,
            Imax_sp,
            eint_br_new,
            Imax_br,
            pid_mode);


    // --- 12) Avance du temps de debug ---
    debug_time_ms += (uint32_t) (DBG_DT_S * 1000.0);
}

#endif  // DEBUG_AUTOM




