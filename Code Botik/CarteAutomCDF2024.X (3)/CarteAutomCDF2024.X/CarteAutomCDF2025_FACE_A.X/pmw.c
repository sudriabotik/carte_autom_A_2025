/*
 * File:   pmw.c
 * Author: james
 *
 * Created on April 1, 2024, 4:08 PM
 */



#include"system.h"
#include "pmw.h"
// configuration of the pwm register

void ConfigPWM (void)
{
	
	P1TCONbits.PTEN		= 1;		//PWM1 ON
    P2TCONbits.PTEN     = 1;        //PWM2 ON

    P1TCONbits.PTSIDL       = 0;            //cpu run in idle
    P1TCONbits.PTOPS        = 0;            //Postscaller 1 : 1 (no need )
    P1TCONbits.PTCKPS       = 0b11;            //Prescaller  1 : 64 controling 50hz servo 
	P1TCONbits.PTMOD        = 0b00;	    	// Single event mode using pwm only when need
   
     
    P2TCONbits.PTSIDL       = 0;            //cpu run in idle
    P2TCONbits.PTOPS        = 0;            //Postscaller 1 : 1 (no need )
    P2TCONbits.PTCKPS       = 0b00;            //Prescaller  1 : 64 controling 50hz servo 
	P2TCONbits.PTMOD        = 0b00;		// Single event mode using pwm only when need
    

        P1TPER     = 10417;		//F=60Hz  15 bits PTPER = FCY/F*prescale*postscale -1 
    // 40Mz/50*64*1 -1 = 12500
    
   
    P2TPER     = 999;		//F=20kHz  15 bits PTPER = FCY/F*prescale*postscale -1 
    //
   
    

	PWM1CON1bits.PMOD1      = 1;		//  indepedant mode             
	PWM1CON1bits.PMOD2      = 1;		//              
    PWM1CON1bits.PMOD3      = 1;        //          

    PWM2CON1bits.PMOD1      = 1;
    
	
	PWM1CON1bits.PEN1H	= 0;		//PWM1H1 
    PWM1CON1bits.PEN1L	= 1;		//PWM1L1 PWM_Turb3_L
    
	PWM1CON1bits.PEN2H	= 0;		//PWM1H2
	PWM1CON1bits.PEN2L	= 1;		//PWM1L2 PWM_Turb1_L
    
	PWM1CON1bits.PEN3H	= 0;		//PWM1H3 
	PWM1CON1bits.PEN3L	= 1;		//PWM1L3 PWM_Turb2_L 

	PWM2CON1bits.PEN1H	= 0;		//PWM2H1 
	PWM2CON1bits.PEN1L	= 1;		//PWM2L1  PWM_Servo_L
    
    PWM1CON2bits.IUE    = 1; // imediate update no transient pwm while udpade
    PWM2CON2bits.IUE    = 1;
    
  
    P1DC1 = 0; // servo operate in 1->2ms on 50hz so 20ms so 12500/20 = 625 ticks/ms 
    // here we set to 0% so 1ms
    
    P1DC2 = 0; // servo operate in 1->2ms on 50hz so 20ms so 12500/20 = 625 ticks/ms 
    // here we set to 0% so 1ms
    
    P1DC3 = 0; // servo operate in 1->2ms on 50hz so 20ms so 12500/20 = 625 ticks/ms 
    // here we set to 0% so 1ms
    
    P2DC1 = 0; // servo operate in 1->2ms on 50hz so 20ms so 12500/20 = 625 ticks/ms 
    // here we set to 0% so 1ms

}






void setPWMOutput(char output,  uint16_t percent) {
     double dutyCycleValue;

    if (percent > 100){
        
        percent = 100; // Cap the percentage at 100
    }
    dutyCycleValue = 1 + (percent *( (5000) / 100)); // 0%-100% maps to 0ms-ms
    
    switch(output) {
        case '3':
            
            P1DC1 = (uint16_t) dutyCycleValue; 
           
            break;
        case '1':
           
            P1DC2 = (uint16_t) dutyCycleValue; 
            break;
        case '2':
           
            P1DC3 = (uint16_t) dutyCycleValue; 
            break;
        case '4':
           
            P2DC1 = (uint16_t) dutyCycleValue;
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
        abs_valeur = (double) (-valeur);
    else
      abs_valeur = (double) valeur;

    abs_valeur *= PWM_DROIT_VALEUR_MAX / 100;

    if (moteur == MOTEUR_DROIT)
    {
        if (abs_valeur > PWM_DROIT_VALEUR_MAX)
            abs_valeur = PWM_DROIT_VALEUR_MAX;

        if (valeur < (double) 0.) //>
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