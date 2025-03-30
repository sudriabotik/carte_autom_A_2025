/*
 * File:   pmw.c
 * Author: james
 *
 * Created on April 1, 2024, 4:08 PM
 */

#include "system.h"
#include "pmw.h"

// configuration of the pwm register
void ConfigPWM (void)
{
    P1TCONbits.PTEN        = 1;    //PWM1 ON
    P2TCONbits.PTEN        = 1;    //PWM2 ON

    P1TCONbits.PTSIDL      = 0;    //cpu run in idle
    P1TCONbits.PTOPS       = 0;    //Postscaler 1 : 1
    P1TCONbits.PTCKPS      = 0b11; //Prescaler 1 : 64 controlling 50Hz servo
    P1TCONbits.PTMOD       = 0b00; // Single event mode

    // *** NO CHANGES FOR PWM2 BELOW ***
    P2TCONbits.PTSIDL      = 0;    //cpu run in idle
    P2TCONbits.PTOPS       = 0;    //Postscaler 1 : 1
    P2TCONbits.PTCKPS      = 0b00; //Prescaler 1 : 1
    P2TCONbits.PTMOD       = 0b00; // Single event mode

    // Period for PWM1 @ 50Hz => 20ms
    // PTPER = FCY / (Freq * Prescaler) - 1 = 40e6 / (50 * 64) - 1 ? 12500
    P1TPER = 12500;

    // PWM2 period as originally given (unchanged)
    // P2TPER = 999;
    P2TPER = 999;

    // --- PWM1 and PWM2 Con settings ---
    PWM1CON1bits.PMOD1 = 1;   // independent mode
    PWM1CON1bits.PMOD2 = 1;
    PWM1CON1bits.PMOD3 = 1;

    PWM2CON1bits.PMOD1 = 1;

    PWM1CON1bits.PEN1H = 0;   //PWM1H1 
    PWM1CON1bits.PEN1L = 1;   //PWM1L1 (PWM_Turb3_L)

    PWM1CON1bits.PEN2H = 0;   //PWM1H2
    PWM1CON1bits.PEN2L = 1;   //PWM1L2 (PWM_Turb1_L)

    PWM1CON1bits.PEN3H = 0;   //PWM1H3 
    PWM1CON1bits.PEN3L = 1;   //PWM1L3 (PWM_Turb2_L) 

    PWM2CON1bits.PEN1H = 0;   //PWM2H1
    PWM2CON1bits.PEN1L = 1;   //PWM2L1 (PWM_Servo_L)

    PWM1CON2bits.IUE   = 1;   // immediate update
    PWM2CON2bits.IUE   = 1;   // immediate update

    // Set initial duty cycles to ~1ms (625 counts)
    // so servos start near the "minimum" position
    P1DC1 = 1250;  
    P1DC2 = 1250;  
    P1DC3 = 1250;  

    P2DC1 = 0;  // PWM2 unchanged
}

void setPWMOutput(char output, uint16_t percent) 
{
    double dutyCycleValue;

    // Cap input at 100%
    if (percent > 100) {
        percent = 100;
    }

    // Map 0%?100% to 1ms?2ms, i.e. 625?1250 counts
    dutyCycleValue = 1250 + (1250 * percent / 100.0);

    switch(output) {
        case '3':
            P1DC1 = (uint16_t)dutyCycleValue; 
            break;
        case '1':
            P1DC2 = (uint16_t)dutyCycleValue; 
            break;
        case '2':
            P1DC3 = (uint16_t)dutyCycleValue; 
            break;
        default:
            // Handle invalid output
            break;
    }
}

void envoit_pwm (char moteur, double valeur)
{
    double abs_valeur;

    if (valeur < 0.)
        abs_valeur = (double)(-valeur);
    else
        abs_valeur = (double)valeur;

    abs_valeur *= PWM_DROIT_VALEUR_MAX / 100;

    if (moteur == MOTEUR_DROIT)
    {
        if (abs_valeur > PWM_DROIT_VALEUR_MAX)
            abs_valeur = PWM_DROIT_VALEUR_MAX;

        if (valeur < (double)0.)
        {
           SENS_MOTEUR_DROIT = AVANCER_MOTEUR_D;
        }
        else
        {
            SENS_MOTEUR_DROIT = RECULER_MOTEUR_D;
        } 

        REGISTRE_MOTEUR_D = (uint16_t) abs_valeur;
    }
}
