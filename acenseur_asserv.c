/*
 * File:   ascenseur_asserv.c
 * Author: james
 *
 * Created on February 26, 2025, 1:33 PM
 */

#include "xc.h"
#include "ascenseur_asserv.h"
#include "system.h"   // Pour envoit_pwm(), etc.
#include "pmw.h"
#include <math.h>
#include <stdio.h>

/* ---------------- Variables Globales ---------------- */

// Variables utilisées par l'asserv (définies ici)
volatile double asc_position_actuelle   = 0.0;
volatile double asc_position_consigne   = 0.0;
// Nous utilisons une seule variable pour la distance totale
volatile double asc_distance_totale     = 0.0;

asc_pid_t asc_pid = {
    .Kp = 0.10,
    .Ki = 0.02,
    .Kd = 0.0,
    .erreur_integree = 0.0,
    .erreur_precedente = 0.0,
    .integrale_max = 10000.0
};

// PID ?brake? pour le maintien en position
asc_pid_t asc_pid_brake = {
    .Kp = 0.003,
    .Ki = 0.0000,
    .Kd = 0.00001,
    .erreur_integree = 0.0,
    .erreur_precedente = 0.0,
    .integrale_max = 10000.0
};

asc_rampe_t asc_rampe = {
    .accel = 10.0,   // ticks/itération²
    .decel = 10.0,
    .vmax  = 50.0   // ticks/itération
};

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
    if(p < 0) p = 0.0;
    if(p > 100) p = 100.0;
    double ptt = (1-(p / 100.0)) * asc_distance_totale;
    //printf("pourcent: %f  ->  ticks: %f\n", p, ptt);
    return ptt;
}

// PID standard pour le déplacement
static double ascenseurPID(double consigne, double mesure) {
    double erreur = consigne - mesure;
    asc_pid.erreur_integree += erreur;
    
    asc_pid.erreur_integree = clamp(asc_pid.erreur_integree, -asc_pid.integrale_max, asc_pid.integrale_max);
    double derive = erreur - asc_pid.erreur_precedente;
    asc_pid.erreur_precedente = erreur;
    double commande = asc_pid.Kp * erreur + asc_pid.Ki * asc_pid.erreur_integree + asc_pid.Kd * derive;
    //commande=(commande/asc_distance_totale)*100;
    return clamp(commande, -30.0, 30.0);
}

// PID pour le maintien (brake)
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
        commande += 3;} // adjust offset as needed


    //commande=(commande/asc_distance_totale)*100;
    return clamp(commande, -100.0, 100.0);
}

/* ---------------- Fonctions Publiques ---------------- */

// Initialisation de l'asservissement
void ascenseurAsservInit(void) {
    asc_current_state = ASC_STATE_IDLE;
    asc_pid.Kp = 0.01;
    asc_pid.Ki = 0.02;
    asc_pid.Kd = 0.0;
    asc_pid.integrale_max = 20000.0;
    asc_rampe.accel = 1.0;
    asc_rampe.decel = 1.0;
    asc_rampe.vmax  = 20.0;
    
    OVERFLOW_CODEUR[CODEUR_D] = PAS_D_OVERFLOW_CODEUR;
    POSITION[CODEUR_D].ancien = 0U;
    POSITION[CODEUR_D].nouvelle = 0U;
    POSITION[CODEUR_D].cumul = 0.0;
    
    // Lecture initiale de la position en utilisant le compteur cumulatif
    asc_position_actuelle = ascenseurGetPosition();
    asc_position_consigne = asc_position_actuelle;
    
    asc_current_state = ASC_STATE_IDLE;  // L'ascenseur est initialement immobile
}

// Définir la consigne de position en pourcentage [0..100]
void ascenseurSetConsignePourcent(double pourcent) {
    
    
    // Si le homing n'est pas terminé, on ne prend pas la consigne
    
    double newPos = pourcentToTicks(pourcent);
    asc_position_consigne = newPos;
    asc_vitesse_consigne = 0.0;
    asc_pid.erreur_integree = 0.0;
    asc_pid.erreur_precedente = 0.0;
    asc_current_state = ASC_STATE_ACCEL;
    //printf("New target (accel mode): asc_position_consigne = %f\n", asc_position_consigne);
}

// Tâche à appeler périodiquement (par exemple, toutes les 5 ms)
void ascenseurTask(void) {
    asc_position_actuelle = ascenseurGetPosition();
    //printf("Pos actuelle: %f, Consigne: %f\n", asc_position_actuelle, asc_position_consigne);
    
    double delta = asc_position_consigne - asc_position_actuelle;
    double distRestante = delta;
    //printf("Dist restante: %f\n", distRestante);
    double sens = (delta >= 0.0) ? 1.0 : -1.0;
    
    switch(asc_current_state) {
        case ASC_STATE_IDLE:
            //printf("ASC_STATE_IDLE\n");
            break;
        case ASC_STATE_DONE: {
            // Maintien en position (PID brake)
            double cmd = ascenseurPID_brake(asc_position_consigne, asc_position_actuelle);
            envoit_pwm(MOTEUR_DROIT, cmd);
            //printf("ASC_STATE_DONE\n");
            break;
        }
        case ASC_STATE_ACCEL: {
            asc_vitesse_consigne += asc_rampe.accel;
            if (asc_vitesse_consigne > asc_rampe.vmax)
                asc_vitesse_consigne = asc_rampe.vmax;
            double distFreinage = (asc_vitesse_consigne * asc_vitesse_consigne) / (2.0 * asc_rampe.decel);
            if (asc_vitesse_consigne >= asc_rampe.vmax) {
                asc_vitesse_consigne = asc_rampe.vmax;
                asc_current_state = ASC_STATE_CRUISE;
                //printf("Transition to ASC_STATE_CRUISE\n");
            } else if (distFreinage >=  fabs(distRestante)) {
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
        case ASC_STATE_CRUISE: {
            //printf("ASC_STATE_CRUISE\n");
            double distFreinage = (asc_rampe.vmax * asc_rampe.vmax) / (2.0 * asc_rampe.decel);
            if (distFreinage >=  fabs(distRestante)) {
                asc_current_state = ASC_STATE_DECEL;
            } else {
                double vCible = asc_rampe.vmax * sens;
                double position_theorique = asc_position_actuelle + vCible;
                double cmd = ascenseurPID(position_theorique, asc_position_actuelle);
                envoit_pwm(MOTEUR_DROIT, cmd);
            }
            break;
        }
        case ASC_STATE_DECEL: {
            asc_vitesse_consigne -= asc_rampe.decel;
            if (asc_vitesse_consigne < 0.0)
                asc_vitesse_consigne = 0.0;
            double unSeuil = 50000;
            double petiteVmax = 10;
            if (distRestante < unSeuil && asc_vitesse_consigne > petiteVmax)
                asc_vitesse_consigne = petiteVmax;
            if (fabs(distRestante) < 2000.0) {
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
        case ASC_STATE_BRAKE: {
            // Maintien de la position avec PID brake
            double cmd = ascenseurPID_brake(asc_position_consigne, asc_position_actuelle);
            //printf("cmd= %f",cmd);
            envoit_pwm(MOTEUR_DROIT, cmd);
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
static bool consigne_set = false;

// Démarrer le homing (descente)
void homingAscenseurStart(void) {
    endSwitch1_pressed = false;
    endSwitch2_pressed = false;
    // Réinitialiser la distance totale (sera recalculée)
    asc_distance_totale = 0.0;
    gHomingState = HOMING_DESCENT;
    // Commande pour descendre à une vitesse lente
    envoit_pwm(MOTEUR_DROIT, HOMING_SPEED);
}

// Tâche de homing à appeler périodiquement
void homingAscenseurTask(void) {
    switch(gHomingState) {
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
        case HOMING_TOP_REACHED: {
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
            
             
            if (!consigne_set) {
                ascenseurSetConsignePourcent(2.);
                consigne_set = true;
            }
            
            break;
    }
}
