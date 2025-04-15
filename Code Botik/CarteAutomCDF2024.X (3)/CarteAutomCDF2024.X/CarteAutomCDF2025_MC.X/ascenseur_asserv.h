#ifndef ASCENSEUR_ASSERV_H
#define ASCENSEUR_ASSERV_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdbool.h>
#include <stdint.h>

/*---------------------------------------------------------------
  Énumération de l'état de la machine à états de l?ascenseur
  ---------------------------------------------------------------*/
typedef enum {
    ASC_STATE_IDLE = 0,   // Arrêt ou inactif
    ASC_STATE_ACCEL,      // Accélération
    ASC_STATE_CRUISE,     // Vitesse constante
    ASC_STATE_DECEL,      // Décélération
    ASC_STATE_DONE,       // Position finale atteinte (immobile)
    ASC_STATE_BRAKE       // Maintien (PID brake)
} asc_state_t;

/*---------------------------------------------------------------
  Structure PID pour l'ascenseur
  ---------------------------------------------------------------*/
typedef struct {
    double Kp;
    double Ki;
    double Kd;
    double erreur_integree;
    double erreur_precedente;
    double integrale_max; // Limite anti-windup
} asc_pid_t;

/*---------------------------------------------------------------
  Structure pour la rampe (accélération, décélération, vitesse max)
  ---------------------------------------------------------------*/
typedef struct {
    double accel; // Accélération maximale (ticks/itération²)
    double decel; // Décélération maximale (ticks/itération²)
    double vmax;  // Vitesse maximale (ticks/itération)
} asc_rampe_t;

/*---------------------------------------------------------------
  Énumération de l'état du homing
  ---------------------------------------------------------------*/
typedef enum {
    HOMING_IDLE = 0,           // En attente de commande de homing
    HOMING_DESCENT,            // Descente pour atteindre la butée basse
    HOMING_BOTTOM_REACHED,     // Butée basse détectée
    HOMING_ASCENT,             // Montée pour atteindre la butée haute
    HOMING_TOP_REACHED,        // Butée haute détectée
    HOMING_DONE                // Homing terminé
} homing_state_t;

/*---------------------------------------------------------------
  Déclarations des variables globales (définies dans le .c)
  ---------------------------------------------------------------*/
extern volatile double asc_position_actuelle;   // Position mesurée (en ticks)
extern volatile double asc_position_consigne;   // Consigne en ticks
extern volatile double asc_distance_totale;     // Distance totale (ticks)

extern asc_pid_t asc_pid;         // PID pour le mouvement normal
extern asc_pid_t asc_pid_brake;   // PID pour le maintien (brake)
extern asc_rampe_t asc_rampe;     // Paramètres de la rampe

extern volatile asc_state_t asc_current_state; // État courant de la machine

// Variables utilisées pour le homing
extern volatile bool endSwitch1_pressed;
extern volatile bool endSwitch2_pressed;
extern volatile double bottomPos;      // Position (ticks) de la butée basse
extern volatile double topPos;         // Position (ticks) de la butée haute
extern volatile double ascenseur_distance_totale; // Distance mesurée entre butées
extern volatile homing_state_t gHomingState;        // État de la phase homing

/*---------------------------------------------------------------
  Macro pour la vitesse utilisée en homing (en % de PWM par exemple)
  ---------------------------------------------------------------*/
#define HOMING_SPEED 20

/*---------------------------------------------------------------
  Prototypes des fonctions publiques
  ---------------------------------------------------------------*/

/**
 * @brief Initialise le système d'asservissement de l'ascenseur.
 */
void ascenseurAsservInit(void);

/**
 * @brief Définit la consigne de position de l?ascenseur en pourcentage (0 à 100).
 * La consigne est convertie en ticks en fonction d?asc_distance_totale.
 * @param pourcent La consigne en pourcentage.
 */
void ascenseurSetConsignePourcent(double pourcent);

/**
 * @brief Tâche non bloquante à appeler périodiquement (par exemple toutes les 5 ms)
 * pour générer la rampe, calculer le PID et commander le moteur.
 */
void ascenseurTask(void);

/**
 * @brief Retourne la position actuelle de l?ascenseur (en ticks).
 */
double ascenseurGetPosition(void);

/**
 * @brief Indique si l?ascenseur a atteint la position finale (état DONE).
 */
bool ascenseurIsDone(void);

/* Fonctions relatives au homing */

/**
 * @brief Lance la procédure de homing (descente pour atteindre la butée basse).
 */
void homingAscenseurStart(void);

/**
 * @brief Tâche non bloquante à appeler périodiquement pour exécuter la machine
 * à états du homing.
 */
void homingAscenseurTask(void);

/**
 * @brief Retourne une valeur lue sur le codeur (pour le homing).
 */
double getCodeurAscenseur(void);

#ifdef __cplusplus
}
#endif

#endif /* ASCENSEUR_ASSERV_H */
