/******************************************************************************/
/************** Carte principale Robot 1 : DSPIC33FJ128MC804*******************/
/******************************************************************************/
/* Fichier 	: interruptions.c
 * Auteur  	: Quentin
 * Revision	: 1.0
 * Date		: 08/11/2014
 *******************************************************************************
 *
 *
 ******************************************************************************/

/******************************************************************************/
/******************************** INCLUDES ************************************/
/******************************************************************************/

#include "system.h"
#include "serialusM2M.h"

/******************************************************************************/
/*********************** INTERRUPTION DES TIMERS ******************************/
/******************************************************************************/


/**
 *  Timer 5 ms : Asserv
 *  /!\ FONCTION BLOQUANTE INTERDITE !!!!  
 */
void __attribute__((__interrupt__, no_auto_psv)) _T1Interrupt(void)
{
    
    FLAG_TIMER_5ms = 0;
    
    
    // odométrie
    //calcul_position_robot();
   // Ajoute l?appel
    get_valeur_codeur(CODEUR_D);
    
    
    
    homingAscenseurTask(); 
    ascenseurTask();


   
   if (CPT_TEMPS_MATCH.actif == true){
       CPT_TEMPS_MATCH.t_ms +=  5;
   }
    
}

/**
 *  Timer 10 ms : Check capteurs
 *  /!\ TIMER SAFE : FONCTION BLOQUANTE INTERDITE /!\ //
 *      /!\ PAS DE FONCTIONS AX12 ICI !!! /!\ //
 */
void __attribute__((__interrupt__, no_auto_psv)) _T2Interrupt(void)
{
    FLAG_TIMER_10ms = 0;
    //
   
}

/**
 * Timer d'autom : 20 ms
 * Décompte relancé à la fin de la fonctions -> temps non fiable
 * UNSFAE : fonction bloquante autorisée
 */
void __attribute__((__interrupt__, no_auto_psv)) _T3Interrupt(void)
{
    TMR3 = 0;

    FLAG_TIMER_20ms = 0;        //On clear le flag d'interruption du timer
    TIMER_20ms = ACTIVE;
}

/**
 * Timer 100 ms : Scheduleur temps de match
 */
void __attribute__((__interrupt__, no_auto_psv)) _T4Interrupt(void)
{  
   

       // envoit_pwm(MOTEUR_DROIT, 0.);
       // envoit_pwm(MOTEUR_GAUCHE, 0.);
       // envoit_pwm(MOTEUR_X, 0.);

        // Pour permettre l'envoit de commande AX12 
        // Depuis ici
    
     if (CPT_TEMPS_MATCH.t_ms >= 100000UL)
    {
        turnOffPump_ARM1();

        turnOffPump_ARM2();

        turnOffPump_ARM3();

        turnOffPump_STOCK1();

        turnOffPump_STOCK2();

        turnOffPump_STOCK3();
        
         angle_AX12(IdM,POSMG,VIT_AX,AVEC_ATTENTE);
         //put herer the funcs pls
         PORTCbits.RC5 = 0;

        //On désactive toutes les interruptions :
        IEC0bits.T1IE = 0;
        IEC0bits.T2IE = 0;
        IEC0bits.T3IE = 0;
        IEC1bits.T4IE = 0;
        IEC1bits.T5IE = 0;
        
        IEC3bits.QEI1IE = 0;
        IEC4bits.QEI2IE = 0;
        
        
      
        
        // couper turb
      

        
        
        IPC7bits.U2TXIP	= 7;
        IPC7bits.U2RXIP = 7;     
        
       
        TIMER_5ms   = DESACTIVE;
        TIMER_10ms  = DESACTIVE;
        TIMER_20ms  = DESACTIVE;
        TIMER_100ms = DESACTIVE;
        
  
        
        while(1);

    
     }
     
     

       

    FLAG_TIMER_100ms = 0;        //On clear le flag d'interruption du timer
}

/**
 *  Timer 200 ms : Liaison série
 *  UNSAFE : Fonction bloquante autorisée 
 */
void __attribute__((__interrupt__, no_auto_psv)) _T5Interrupt(void)
{      
    TMR5 = 0;

    TIMER_200ms = DESACTIVE;
    FLAG_TIMER_200ms = 0;        //On clear le flag d'interruption du timer

}

 
/******************************************************************************/
/************************** INTERRUPTION DES QEI ******************************/
/******************************************************************************/

/**
 * Interruption sur codeur droit
 */
void __attribute__((__interrupt__, no_auto_psv)) _QEI1Interrupt(void)
{
    IFS3bits.QEI1IF = 0;            //Clear du flag de l'event

    if (QEI1CONbits.UPDN == 1)      //codeur croit
        OVERFLOW_CODEUR [CODEUR_D] --;
    else                            // codeur decroit
        OVERFLOW_CODEUR [CODEUR_D] ++;
}




/******************************************************************************/
/***************************** INTERRUPTIONS UART *****************************/
/******************************************************************************/

void __attribute__ ((interrupt, no_auto_psv)) 	_U1RXInterrupt (void)
{
	// Desactivation de l'interruption
     if (U1STAbits.OERR) // Check si overflow
    {
        // Clear overflow
       reset_overflow_error();
    }
    
    serialusM2M_receive();
    serialusM2M_process();
}



void __attribute__ ((interrupt, no_auto_psv)) 	_U2RXInterrupt (void)
{
    IEC1bits.U2RXIE = 0;
    IFS1bits.U2RXIF = 0;

    reception_uart_ax12();

    IEC1bits.U2RXIE = 1;
}

void __attribute__ ((interrupt, no_auto_psv)) 	_U2TXInterrupt (void)
{
    IFS1bits.U2TXIF = 0; //remise du flag à 0 quand le buffer de transmission est vide
    ax12.etat_uart = ENVOIT_FINI;
}


/**
 * @brief Interruption externe INT1 (RC3/RP19).
 *        Détecte, par exemple, endSwitch1 sur front montant.
 */
void __attribute__((__interrupt__, no_auto_psv)) _INT1Interrupt(void)
{
    // Nettoyage du flag
    IFS1bits.INT1IF = 0; // clear flag INT1
    //printf("SWITCH1 PRESSED \n");

    // -> Code de gestion du fin de course #1
 
    endSwitch1_pressed = true; 
}


/**
 * @brief Interruption externe INT2 (RC4/RP20).
 *        Détecte, par exemple, endSwitch2 sur front montant.
 */
void __attribute__((__interrupt__, no_auto_psv)) _INT2Interrupt(void)
{
    // Nettoyage du flag
    IFS1bits.INT2IF = 0;
    //printf("SWITCH2 PRESSED \n");
    

    // -> Code de gestion du fin de course #2
    endSwitch2_pressed = true;  
}


/******************************************************************************/
/******************************************************************************/
/******************************************************************************/