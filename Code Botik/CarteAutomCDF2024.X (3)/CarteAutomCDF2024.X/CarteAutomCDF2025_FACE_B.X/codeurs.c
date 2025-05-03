/******************************************************************************/
/************** Carte principale Robot 1 : DSPIC33FJ128MC804*******************/
/******************************************************************************/
/* Fichier 	: codeurs.c
 * Auteur  	: Quentin
 * Revision	: 1.0
 * Date		: 9 novembre 2014, 01:07
 *******************************************************************************
 *
 *
 ******************************************************************************/

/******************************************************************************/
/******************************** INCLUDES ************************************/
/******************************************************************************/

#include "system.h"
#include "codeurs.h"


    volatile __attribute__((near)) int32_t OVERFLOW_CODEUR[3] ;//= { PAS_D_OVERFLOW_CODEUR, PAS_D_OVERFLOW_CODEUR };
    volatile __attribute__((near)) _position POSITION[3] ;// = {{0, 0}, {0, 0}};


/******************************************************************************/
/*************************** Configurations des QEI ***************************/
/******************************************************************************/

void ConfigQEI (void)
{


    /**************************************************************************/
    /************************  Codeur Droit ***********************************/
    /**************************************************************************/

	// QEI1CON
	QEI1CONbits.CNTERR	= 0;				// Reset flag erreur sur compteur
	QEI1CONbits.QEISIDL	= 0;				// Mode continu en idle
    QEI1CONbits.QEIM    = 0b111;            // Mode QEI avec X4
   
	QEI1CONbits.SWPAB	= 0;				// PA et PB non entrelacés
	QEI1CONbits.PCDOUT	= 1;				// Position counter dir. status output active (IO controle par QEI)

	// DFLT1CON
	DFLT1CONbits.IMV1	= 0;				// Etat de PB lors d'un INDEX
	DFLT1CONbits.IMV0	= 0;				// Etat de PA lors d'un INDEX
	DFLT1CONbits.CEID	= 0;				// Interruption sur erreur compteur desactive
	DFLT1CONbits.QEOUT	= 1;				// Activation des filtres
	DFLT1CONbits.QECK	= 0b110;			// Filtre / de 1:4

	MAX1CNT			= MAX_CODEUR_D;                 // Limite du compteur codeur




    /**************************************************************************/
    /************************  Codeur Gauche **********************************/
    /**************************************************************************/

	// QEI2CON
	//QEI2CONbits.CNTERR	= 0;				// Reset flag erreur sur compteur
	//QEI2CONbits.QEISIDL	= 0;				// Mode continu en idle
    //QEI2CONbits.QEIM    = 0b111;            // Mode QEI avec X4
	//QEI2CONbits.SWPAB	= 0;				// PA et PB non intervertis
	//QEI2CONbits.PCDOUT	= 1;				// Position counter dir. status output active (IO controle par QEI)

	// DFLT2CON
	//DFLT2CONbits.IMV1	= 0;				// Etat de PB lors d'un INDEX
	//DFLT2CONbits.IMV0	= 0;				// Etat de PA lors d'un INDEX
	//DFLT2CONbits.CEID	= 0;				// Interruption sur erreur compteur desactivee
	//DFLT2CONbits.QEOUT	= 1;				// Activation des filtres
	//DFLT2CONbits.QECK	= 0b010;			// Filtre / de 1:4

	//MAX2CNT			= MAX_CODEUR_G;                 // Limite du compteur codeur

            
}




/******************************************************************************/
/*************************** Utilisation des codeurs **************************/
/******************************************************************************/


// On reconstitue la position absolue 32 bits
void get_valeur_codeur(int codeur)
{
    // on NE remet PAS overflow_codeur à 0 si on veut un compteur permanent
    // => on lit juste la valeur
    int32_t of = OVERFLOW_CODEUR[codeur];

    uint16_t raw;
    int32_t pos32;
    int8_t sens;
    uint16_t max_codeur;

    if(codeur == CODEUR_D)
    {
        raw = POS1CNT;
        max_codeur = MAX_CODEUR_D;
        sens = SENS_ROT_D; // +1 ou -1
    }
    
    
   
    // reconstitution
    pos32 = of * ((int32_t)max_codeur + 1) + (int32_t)raw;

    // application du signe
    pos32 *= (int32_t)sens;

    // conversion double
    // ex : 1 tick = 1 mm => si RESOLUTION_LOGICIELLE=1 => direct
    // si c'est 0.5mm / tick => on multiplie par 0.5
    double posD = (double)pos32 * (double)RESOLUTION_LOGICIELLE;

    // on stocke dans "cumul"
    POSITION[codeur].cumul = posD;
    
   //printf("    POS1CNT = %d    ",raw);
    //printf("   OVERFLOW_CODEUR[codeur] = %f    ",(double)of);
    //printf("  MAX_CODEUR_D = %d     ",max_codeur);
    //printf("  POSITION[codeur].cumul = %f    ",posD);

    // si besoin, "ecart" = difference par rapport a l'ancien, etc.
    //POSITION[codeur].ecart = posD - oldVal; // ?

}
/******************************************************************************/
/******************************************************************************/
/******************************************************************************/
