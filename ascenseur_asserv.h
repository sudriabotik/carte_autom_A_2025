#ifndef ASCENSEUR_ASSERV_H
#define ASCENSEUR_ASSERV_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdbool.h>
#include <stdint.h>

/*---------------------------------------------------------------
  �num�ration de l'�tat de la machine � �tats de l?ascenseur
  ---------------------------------------------------------------*/
typedef enum {
    ASC_STATE_IDLE = 0,   // Arr�t ou inactif
    ASC_STATE_ACCEL,      // Acc�l�ration
    ASC_STATE_CRUISE,     // Vitesse constante
    ASC_STATE_DECEL,      // D�c�l�ration
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
  Structure pour la rampe (acc�l�ration, d�c�l�ration, vitesse max)
  ---------------------------------------------------------------*/
typedef struct {
    double accel; // Acc�l�ration maximale (ticks/it�ration�)
    double decel; // D�c�l�ration maximale (ticks/it�ration�)
    double vmax;  // Vitesse maximale (ticks/it�ration)
} asc_rampe_t;

/*---------------------------------------------------------------
  �num�ration de l'�tat du homing
  ---------------------------------------------------------------*/
typedef enum {
    HOMING_IDLE = 0,           // En attente de commande de homing
    HOMING_DESCENT,            // Descente pour atteindre la but�e basse
    HOMING_BOTTOM_REACHED,     // But�e basse d�tect�e
    HOMING_ASCENT,             // Mont�e pour atteindre la but�e haute
    HOMING_TOP_REACHED,        // But�e haute d�tect�e
    HOMING_DONE                // Homing termin�
} homing_state_t;

/*---------------------------------------------------------------
  D�clarations des variables globales (d�finies dans le .c)
  ---------------------------------------------------------------*/
extern volatile double asc_position_actuelle;   // Position mesur�e (en ticks)
extern volatile double asc_position_consigne;   // Consigne en ticks
extern volatile double asc_distance_totale;     // Distance totale (ticks)

extern asc_pid_t asc_pid;         // PID pour le mouvement normal
extern asc_pid_t asc_pid_brake;   // PID pour le maintien (brake)
extern asc_rampe_t asc_rampe;     // Param�tres de la rampe

extern volatile asc_state_t asc_current_state; // �tat courant de la machine

// Variables utilis�es pour le homing
extern volatile bool endSwitch1_pressed;
extern volatile bool endSwitch2_pressed;
extern volatile double bottomPos;      // Position (ticks) de la but�e basse
extern volatile double topPos;         // Position (ticks) de la but�e haute
extern volatile double ascenseur_distance_totale; // Distance mesur�e entre but�es
extern volatile homing_state_t gHomingState;        // �tat de la phase homing

/*---------------------------------------------------------------
  Macro pour la vitesse utilis�e en homing (en % de PWM par exemple)
  ---------------------------------------------------------------*/
#define HOMING_SPEED 20

/*---------------------------------------------------------------
  Prototypes des fonctions publiques
  ---------------------------------------------------------------*/

/**
 * @brief Initialise le syst�me d'asservissement de l'ascenseur.
 */
void ascenseurAsservInit(void);

/**
 * @brief D�finit la consigne de position de l?ascenseur en pourcentage (0 � 100).
 * La consigne est convertie en ticks en fonction d?asc_distance_totale.
 * @param pourcent La consigne en pourcentage.
 */
void ascenseurSetConsignePourcent(double pourcent);

/**
 * @brief T�che non bloquante � appeler p�riodiquement (par exemple toutes les 5 ms)
 * pour g�n�rer la rampe, calculer le PID et commander le moteur.
 */
void ascenseurTask(void);

/**
 * @brief Retourne la position actuelle de l?ascenseur (en ticks).
 */
double ascenseurGetPosition(void);

/**
 * @brief Indique si l?ascenseur a atteint la position finale (�tat DONE).
 */
bool ascenseurIsDone(void);

/* Fonctions relatives au homing */

/**
 * @brief Lance la proc�dure de homing (descente pour atteindre la but�e basse).
 */
void homingAscenseurStart(void);

/**
 * @brief T�che non bloquante � appeler p�riodiquement pour ex�cuter la machine
 * � �tats du homing.
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
