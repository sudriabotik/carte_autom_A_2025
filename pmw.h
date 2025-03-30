/*
 * File:   pmw.c
 * Author: james
 *
 * Created on Feb 22, 2025, 4:08 PM
 */

#ifndef PMW_H
#define PMW_H

// This is a guard condition so that contents of this file are not included
// more than once.  

#include <xc.h> // include processor files - each processor file is guarded.  

   
/******************************************************************************/
/******************************** INCLUDES ************************************/
/******************************************************************************/

#include "Config_robots.h"
#include "system.h"

/******************************************************************************/
/***************************** Defines ****************************************/
/******************************************************************************/

    typedef enum 
    {
        MOTEUR_DROIT,
        MOTEUR_GAUCHE,
        MOTEUR_X
    }_enum_moteur;  

#define PWM_MAX_VALUE           2046

#define TENSION_MOTEUR_X        _TENSION_MOTEUR_X

#define PWM_DROIT_VALEUR_MAX    (uint16_t) ( PWM_MAX_VALUE * TENSION_MOTEUR_DROIT / TENSION_SORTIE_PTN )
#define PWM_GAUCHE_VALEUR_MAX   (uint16_t) ( PWM_MAX_VALUE * TENSION_MOTEUR_GAUCHE / TENSION_SORTIE_PTN )
#define PWM_X_VALEUR_MAX        (uint16_t) ( PWM_MAX_VALUE * TENSION_MOTEUR_X / TENSION_SORTIE_PTN )

#define AVANCER_MOTEUR_D        _AVANCER_MOTEUR_D
#define RECULER_MOTEUR_D        _RECULER_MOTEUR_D

#define AVANCER_MOTEUR_G        _AVANCER_MOTEUR_G
#define RECULER_MOTEUR_G        _RECULER_MOTEUR_G

#define AVANCER_MOTEUR_X        _AVANCER_MOTEUR_X
#define RECULER_MOTEUR_X        _RECULER_MOTEUR_X

#define AVANCER_MOTEUR_Y        _AVANCER_MOTEUR_Y
#define RECULER_MOTEUR_Y        _RECULER_MOTEUR_Y

/******************************************************************************/
/***************************** MAPPING ****************************************/
/******************************************************************************/

    

#define REGISTRE_MOTEUR_D   P2DC1




void ConfigPWM (void);
void envoit_pwm (char moteur, double valeur);



#endif // PMW_H

