/******************************************************************************/
/************** Carte polyvalente Botik  : DSPIC33FJ128MC804*******************/
/******************************************************************************/
/* Fichier 	: fonctions_deplacements.c
    * Auteur  	: Quentin
    * Revision	: 1.0
    * Date		: 14 décembre 2014, 14:29
    *******************************************************************************
    *
    *
******************************************************************************/


/******************************************************************************/
/******************************** INCLUDES ************************************/
/******************************************************************************/

#include "system.h"

/******************************************************************************/
/**************************** FONCTIONS COULEURS ******************************/
/******************************************************************************/
const double max_vitesse = 30.;
    
uint8_t couleur_depart()
{
    if (SYS_COULEUR == 1)
        return JAUNE;
    else
        return BLEU;
}

uint8_t strategie_depart()
{
    if (SYS_STRAT == 1)
        return STRAT1;
    else
        return STRAT2;
}

double inversion_couleur (double param_inversable)
{
    if (COULEUR == BLEU)
        return param_inversable;
    else
        return (- param_inversable);
}

/******************************************************************************/
/********************* FONCTIONS USUELLES (TEST ASSERV) ***********************/
/******************************************************************************/

void trapeze (int8_t sens_marche)
{
    //trapèze type 8
    //    passe_part (1000, 500, sens_marche, 50, DEBUT_TRAJECTOIRE);
    //    passe_part (1000, 0  , sens_marche, 50, MILIEU_TRAJECTOIRE);
    //    passe_part (0   , 500, sens_marche, 50, MILIEU_TRAJECTOIRE);
    //    passe_part (0   , 0  , sens_marche, 50, FIN_TRAJECTOIRE);
    rejoindre (1000, 500, sens_marche, 100);
    rejoindre (1000, 0  , sens_marche, 100);
    rejoindre (0   , 500, sens_marche, 100);
    rejoindre (0   , 0  , sens_marche, 100);
    orienter(0, 100);
}

void petit_demi_cercle (int8_t sens_marche)
{
    //petit demi cercle
    passe_part (200, 0,    sens_marche, 300, DEBUT_TRAJECTOIRE);
    passe_part (450, 67,   sens_marche, 100, MILIEU_TRAJECTOIRE);
    passe_part (633, 250,  sens_marche, 100, MILIEU_TRAJECTOIRE);
    passe_part (700, 500,  sens_marche, 100, MILIEU_TRAJECTOIRE);
    passe_part (633, 750,  sens_marche, 100, MILIEU_TRAJECTOIRE);
    passe_part (450, 933,  sens_marche, 100, MILIEU_TRAJECTOIRE);
    passe_part (200, 1000, sens_marche, 100, FIN_TRAJECTOIRE);
}

void grand_demi_cercle (int8_t sens_marche)
{
    passe_part (200 , 0   , sens_marche, 500, DEBUT_TRAJECTOIRE);
    passe_part (700 , 134 , sens_marche, 100, MILIEU_TRAJECTOIRE);
    passe_part (1066, 500 , sens_marche, 100, MILIEU_TRAJECTOIRE);
    passe_part (1200, 1000, sens_marche, 100, MILIEU_TRAJECTOIRE);
    passe_part (1066, 1500, sens_marche, 100, MILIEU_TRAJECTOIRE);
    passe_part (700 , 1866, sens_marche, 100, MILIEU_TRAJECTOIRE);
    passe_part (200 , 2000, sens_marche, 100, FIN_TRAJECTOIRE);
}

void carre (int8_t sens_marche)
{
    rejoindre (500, 0  , sens_marche, 100);
    rejoindre (500, 500, sens_marche, 100);
    rejoindre (0  , 500, sens_marche, 100);
    rejoindre (0  , 0  , sens_marche, 100);
}

/******************************************************************************/
/******************* FONCTIONS ASSERV HAUT NIVEAU (EVITEMENT) *****************/
/******************************************************************************/


void action_evitement (void)
{

}

uint8_t cibler (double x, double y, double pourcentage_vitesse)
{
    
    uint8_t erreur = _cibler (x, y, pourcentage_vitesse);
    if ( erreur == EVITEMENT)
    {
        if (EVITEMENT_ADV.mode == ACTION_EVITEMENT)
        {
            action_evitement();
        }
        else if (EVITEMENT_ADV.mode == EVITEMENT_NORMAL)
        {
            //action en cas d'évitements
            erreur = cibler(x,y,pourcentage_vitesse);
        }
    }
    if (erreur == BLOCAGE)
    {
        //Actions a faire en cas de blocage
    }

    return erreur;
}

uint8_t orienter (double angle, double pourcentage_vitesse)
{
    uint8_t erreur = _orienter (angle, pourcentage_vitesse);
    if ( erreur == EVITEMENT)
    {
        if (EVITEMENT_ADV.mode == ACTION_EVITEMENT)
        {
            action_evitement();
        }
        else if (EVITEMENT_ADV.mode == EVITEMENT_NORMAL)
        {
            //action en cas d'évitements
            erreur = orienter ( angle, pourcentage_vitesse);
        }
    }
    else if (erreur == BLOCAGE)
    {
        //Actions a faire en cas de blocage
    }

    return erreur;
}

uint8_t rejoindre (double x, double y, int8_t sens_marche, double pourcentage_vitesse)
{
    // Commencer par orienter avant de rejoindre
    if (sens_marche == MARCHE_AVANT) _cibler(x, y, pourcentage_vitesse > 50 ? 50 : pourcentage_vitesse);
    else _cibler_arriere(x, y, pourcentage_vitesse > 50 ? 50 : pourcentage_vitesse);

    pourcentage_vitesse = (pourcentage_vitesse > max_vitesse) ? max_vitesse : pourcentage_vitesse;
    uint8_t erreur = _rejoindre (x, y, sens_marche, pourcentage_vitesse);
    if ( erreur == EVITEMENT)
    {
        if (EVITEMENT_ADV.mode == ACTION_EVITEMENT)
        {
            action_evitement();
        }
        else if (EVITEMENT_ADV.mode == EVITEMENT_NORMAL)
        {
         //action en cas d'évitements
        }
    }
    else if (erreur == BLOCAGE)
    {
        //Actions a faire en cas de blocage
    }

    return erreur;   
}

uint8_t avancer_reculer (double distance, double pourcentage_vitesse)
{
    uint8_t erreur = _avancer_reculer (distance, pourcentage_vitesse);
    if ( erreur == EVITEMENT)
    {
        if (EVITEMENT_ADV.mode == ACTION_EVITEMENT)
        {
            action_evitement();
        }
        else if (EVITEMENT_ADV.mode == EVITEMENT_NORMAL)
        {
            //action en cas d'évitements
        }
    }
    else if (erreur == BLOCAGE)
    {

        //Actions a faire en cas de blocage
    }
    
    return erreur;
}

uint8_t passe_part (double x, double y, int8_t sens_marche, double pourcentage_vitesse, char last)
{
    pourcentage_vitesse = (pourcentage_vitesse > max_vitesse) ? max_vitesse : pourcentage_vitesse;

    uint8_t erreur = _passe_part (x, y, sens_marche, pourcentage_vitesse, last);
    if ( erreur == EVITEMENT)
    {
        if (EVITEMENT_ADV.mode == ACTION_EVITEMENT)
        {
            action_evitement();
        }
        else if (EVITEMENT_ADV.mode == EVITEMENT_NORMAL)
        {
            // Action en cas d'évitements
        }
    }
    else if (erreur == BLOCAGE)
    {
        //Actions a faire en cas de blocage
    }

    return erreur;
}

/******************************************************************************/
/******************* FONCTIONS ASSERV BAS NIVEAU (calage) *********************/
/******************************************************************************/

uint8_t calage (double distance, double pourcentage_vitesse)
{
    uint8_t erreur = _calage (distance, pourcentage_vitesse);
    if ( erreur == EVITEMENT)
    {
        // Evitement sur un calage ?
    }
    else if (erreur == BLOCAGE)
    {
        // Mode de sortie normal pour un calage
    }

    return erreur;
}

uint8_t calage_X (double x, double teta, int8_t sens_marche, double pourcentage_vitesse)
{
    // calage sur 1m pour limiter la vitesse
    uint8_t erreur = _calage (sens_marche * 1000, pourcentage_vitesse);
    if ( erreur == EVITEMENT)
    {
        // Eviitement sur un calage ?
    }
    else if (erreur == BLOCAGE)
    {
        init_position_robot(x, NAN, teta); // Init X et Teta uniquement
    }
    else //si pas encore calé on recommence
        calage_X (x, teta, sens_marche, pourcentage_vitesse);

    return erreur;
}

uint8_t calage_Y (double y, double teta, int8_t sens_marche, double pourcentage_vitesse)
{
    // calage sur 1m pour limiter la vitesse
    uint8_t erreur = _calage (sens_marche * 1000, pourcentage_vitesse);
    if ( erreur == EVITEMENT)
    {
        // Evitement sur un calage ?
    }
    else if (erreur == BLOCAGE)
    {
        init_position_robot(NAN, y, teta); // Init Y et Teta uniquement
    }
    else //si pas encore calé on recommence
        calage_Y (y, teta, sens_marche, pourcentage_vitesse);

    return erreur;
}

uint8_t calage_teta (double teta, int8_t sens_marche, double pourcentage_vitesse)
{
    // calage sur 1m pour limiter la vitesse
    uint8_t erreur = _calage (sens_marche * 1000, pourcentage_vitesse);
    if ( erreur == EVITEMENT)
    {
        // Evitement sur un calage ?
    }
    else if (erreur == BLOCAGE)
    {
        init_position_robot(NAN, NAN, teta); // Init Teta uniquement
    }
    else //si pas encore calé on recommence
        calage_teta (teta, sens_marche, pourcentage_vitesse);

    return erreur;
}

void faire_des_tours (int nb_tour)
{
    int i;
    double j;

    if (nb_tour < 0)
    {
        nb_tour *= -1;
        j = -1.;
    }
    else
        j= 1.;

    _fdt (120 * j  , DEBUT_TRAJECTOIRE);
    for (i = 0 ; i < nb_tour - 1 ; i++)
    {
        _fdt(- 120 * j, MILIEU_TRAJECTOIRE);
        _fdt (0,  MILIEU_TRAJECTOIRE);
        _fdt (120 * j, MILIEU_TRAJECTOIRE);
    }

    _fdt (- 120 * j, MILIEU_TRAJECTOIRE);
    _fdt (0, FIN_TRAJECTOIRE);
}

/******************************************************************************/
/***************** FONCTIONS ASSERV BAS NIVEAU (config asserv) ****************/
/******************************************************************************/


_enum_erreur_asserv _calage (double distance, double pourcentage_vitesse)
{
    FLAG_ASSERV.brake = OFF;
    reinit_asserv();
	
    FLAG_ASSERV.type_consigne = MM;
	
    DISTANCE.consigne = distance * (TICKS_PAR_MM);

    if (distance < 0.)
        FLAG_ASSERV.sens_deplacement = MARCHE_ARRIERE;
    else
        FLAG_ASSERV.sens_deplacement = MARCHE_AVANT;
    
    EVITEMENT_ADV.sens = FLAG_ASSERV.sens_deplacement;
	
    calcul_vitesse_position(pourcentage_vitesse);
    calcul_acceleration_position();
	
    FLAG_ASSERV.position = ON;
    FLAG_ASSERV.orientation = OFF;
    FLAG_ASSERV.vitesse = ON;
    FLAG_ASSERV.vitesse_fin_nulle = ON;

    FLAG_ASSERV.etat_angle = ANGLE_ATTEINT;
    FLAG_ASSERV.etat_distance = EN_COURS;
    FLAG_ASSERV.immobilite = 0;
    PID.VITESSE_DIS.max_I = MAX_ERREUR_INTEGRALLE_V / 10;
    PID.VITESSE_DIS.seuil_immobilite = SEUIL_IMMOBILITE /10;

    FLAG_ASSERV.fin_deplacement = DEBUT_DEPLACEMENT;
    while (FLAG_ASSERV.fin_deplacement != FIN_DEPLACEMENT);
    return FLAG_ASSERV.erreur;
}


_enum_erreur_asserv _cibler (double x, double y, double pourcentage_vitesse)
{
    y = inversion_couleur(y);
    FLAG_ASSERV.brake = OFF;
    //delay_ms(10);

    reinit_asserv();

    x *= TICKS_PAR_MM;
    y *= TICKS_PAR_MM;

    FLAG_ASSERV.type_consigne = MM;

    if ((y - Y.actuelle) != 0 || (x - X.actuelle) != 0 )//&& (Y.consigne - Y.actuelle) != 0)
    {
        ORIENTATION.consigne =  atan2((y - Y.actuelle), (x - X.actuelle)) * ENTRAXE_TICKS/2 ;

        calcul_vitesse_orientation(pourcentage_vitesse);
        calcul_acceleration_orientation();

        FLAG_ASSERV.position = OFF;
        FLAG_ASSERV.orientation = ON;
        FLAG_ASSERV.vitesse = ON;

        FLAG_ASSERV.type_deplacement = ORIENTER;

        FLAG_ASSERV.etat_angle = EN_COURS;
        FLAG_ASSERV.etat_distance = DISTANCE_ATTEINTE;
        FLAG_ASSERV.immobilite = 0;

        FLAG_ASSERV.fin_deplacement = DEBUT_DEPLACEMENT;

        while(FLAG_ASSERV.fin_deplacement != FIN_DEPLACEMENT);
    }
    return FLAG_ASSERV.erreur;
}

_enum_erreur_asserv _cibler_arriere (double x, double y, double pourcentage_vitesse)
{
    y = inversion_couleur(y);
    FLAG_ASSERV.brake = OFF;
    //delay_ms(10);

    reinit_asserv();

    x *= TICKS_PAR_MM;
    y *= TICKS_PAR_MM;

    FLAG_ASSERV.type_consigne = MM;

    if ((y - Y.actuelle) != 0 || (x - X.actuelle) != 0 )//&& (Y.consigne - Y.actuelle) != 0)
    {
        ORIENTATION.consigne = (atan2((y - Y.actuelle), (x - X.actuelle)) + Pi) * ENTRAXE_TICKS/2 ;

        calcul_vitesse_orientation(pourcentage_vitesse);
        calcul_acceleration_orientation();

        FLAG_ASSERV.position = OFF;
        FLAG_ASSERV.orientation = ON;
        FLAG_ASSERV.vitesse = ON;

        FLAG_ASSERV.type_deplacement = ORIENTER;

        FLAG_ASSERV.etat_angle = EN_COURS;
        FLAG_ASSERV.etat_distance = DISTANCE_ATTEINTE;
        FLAG_ASSERV.immobilite = 0;

        FLAG_ASSERV.fin_deplacement = DEBUT_DEPLACEMENT;

        while(FLAG_ASSERV.fin_deplacement != FIN_DEPLACEMENT);
    }
    return FLAG_ASSERV.erreur;
}

_enum_erreur_asserv _orienter (double angle, double pourcentage_vitesse)
{
    angle = inversion_couleur(angle);
    FLAG_ASSERV.brake = OFF;
    delay_ms(10);

    reinit_asserv();

    FLAG_ASSERV.type_consigne = MM;

    ORIENTATION.consigne = (angle * Pi)/ 180 * (ENTRAXE_TICKS/2);

    calcul_vitesse_orientation(pourcentage_vitesse);
    calcul_acceleration_orientation();

    FLAG_ASSERV.position = OFF;
    FLAG_ASSERV.orientation = ON;
    FLAG_ASSERV.vitesse = ON;

    FLAG_ASSERV.type_deplacement = ORIENTER;

    FLAG_ASSERV.etat_angle = EN_COURS;
    FLAG_ASSERV.etat_distance = DISTANCE_ATTEINTE;
    FLAG_ASSERV.immobilite = 0;

    FLAG_ASSERV.fin_deplacement = DEBUT_DEPLACEMENT;

    while(FLAG_ASSERV.fin_deplacement != FIN_DEPLACEMENT);
    return FLAG_ASSERV.erreur;
}


void _fdt (double angle, char last)
{
    if (last == DEBUT_TRAJECTOIRE)
    {
        FLAG_ASSERV.brake = OFF;
        // delay_ms(10);
        reinit_asserv();

        FLAG_ASSERV.type_consigne = MM;
    }

    angle = inversion_couleur(angle);

    ORIENTATION.consigne = (angle * Pi)/ 180 * (ENTRAXE_TICKS/2);

#ifdef PETIT_ROBOT
    VITESSE_MAX.orientation = VITESSE_ANGLE_PAS;
    acc.acceleration.orientation.consigne = acc.acceleration.orientation.max;
    acc.deceleration.orientation.consigne = acc.deceleration.orientation.max;
#endif
#ifdef GROS_ROBOT
    VITESSE_MAX.orientation = VITESSE_ANGLE_PAS;
    calcul_acceleration_orientation();
#endif

    FLAG_ASSERV.position = OFF;
    FLAG_ASSERV.orientation = ON;
    FLAG_ASSERV.vitesse = ON;
    FLAG_ASSERV.phase_deceleration_distance = PHASE_NORMAL;
    FLAG_ASSERV.phase_decelaration_orientation = PHASE_NORMAL;

    FLAG_ASSERV.type_deplacement = FAIRE_DES_TOURS;
    FLAG_ASSERV.etat_angle = EN_COURS;
    FLAG_ASSERV.etat_distance = DISTANCE_ATTEINTE;

    FLAG_ASSERV.immobilite = 0;

    if (last == FIN_TRAJECTOIRE)
        FLAG_ASSERV.vitesse_fin_nulle = ON;
    else
        FLAG_ASSERV.vitesse_fin_nulle = OFF;

    FLAG_ASSERV.fin_deplacement = DEBUT_DEPLACEMENT;
    while (FLAG_ASSERV.fin_deplacement != FIN_DEPLACEMENT);
}

_enum_erreur_asserv _rejoindre (double x, double y, int8_t sens_marche, double pourcentage_vitesse)
{
    EVITEMENT_ADV.sens = sens_marche;
    y = inversion_couleur(y);
    FLAG_ASSERV.brake = OFF;
    //delay_ms(10);

    reinit_asserv();

    X.consigne = x * TICKS_PAR_MM;
    Y.consigne = y * TICKS_PAR_MM;

    FLAG_ASSERV.type_consigne = XY;

    FLAG_ASSERV.sens_deplacement = sens_marche;

    calcul_vitesse_position(pourcentage_vitesse);
    calcul_acceleration_position();

    
#ifdef PETIT_ROBOT
    VITESSE_MAX.orientation = VITESSE_ANGLE_PAS ;
    acc.acceleration.orientation.consigne = acc.deceleration.orientation.max;
    acc.deceleration.orientation.consigne = acc.deceleration.orientation.max;
#else
    VITESSE_MAX.orientation = VITESSE_ANGLE_PAS / 4;
    calcul_acceleration_orientation();
#endif


    FLAG_ASSERV.position = ON;
    FLAG_ASSERV.orientation = ON;
    FLAG_ASSERV.vitesse = ON;

    FLAG_ASSERV.etat_angle = EN_COURS;
    FLAG_ASSERV.etat_distance = EN_COURS;
    FLAG_ASSERV.type_deplacement = AVANCER;
    FLAG_ASSERV.vitesse_fin_nulle = ON;

    FLAG_ASSERV.immobilite = 0;


    FLAG_ASSERV.fin_deplacement = DEBUT_DEPLACEMENT;
    while (FLAG_ASSERV.fin_deplacement != FIN_DEPLACEMENT);
    return FLAG_ASSERV.erreur;
}

_enum_erreur_asserv _avancer_reculer (double distance, double pourcentage_vitesse)
{
    FLAG_ASSERV.brake = OFF;
    reinit_asserv();

    FLAG_ASSERV.type_consigne = MM;

    DISTANCE.consigne = distance * (TICKS_PAR_MM);

    if (distance < 0.)
        FLAG_ASSERV.sens_deplacement = MARCHE_ARRIERE;
    else
        FLAG_ASSERV.sens_deplacement = MARCHE_AVANT;
    
    EVITEMENT_ADV.sens = FLAG_ASSERV.sens_deplacement;

    calcul_vitesse_position(pourcentage_vitesse);
    calcul_acceleration_position();

    FLAG_ASSERV.position = ON;
    FLAG_ASSERV.orientation = OFF;
    FLAG_ASSERV.vitesse = ON;
    FLAG_ASSERV.vitesse_fin_nulle = ON;

    FLAG_ASSERV.etat_angle = ANGLE_ATTEINT;
    FLAG_ASSERV.etat_distance = EN_COURS;
    FLAG_ASSERV.immobilite = 0;

    FLAG_ASSERV.fin_deplacement = DEBUT_DEPLACEMENT;
    while (FLAG_ASSERV.fin_deplacement != FIN_DEPLACEMENT);
    return FLAG_ASSERV.erreur;
}

_enum_erreur_asserv _passe_part (double x, double y, int8_t sens_marche, double pourcentage_vitesse, char last)
{
    EVITEMENT_ADV.sens = sens_marche;
    
    if (last == DEBUT_TRAJECTOIRE)
    {
        FLAG_ASSERV.brake = OFF;
        //  delay_ms(10);
        reinit_asserv();

        FLAG_ASSERV.type_consigne = XY;
    }

    y = inversion_couleur(y);
    X.consigne = x * TICKS_PAR_MM;
    Y.consigne = y * TICKS_PAR_MM;

    calcul_vitesse_position(pourcentage_vitesse);
    calcul_acceleration_position();

    VITESSE_MAX.orientation = VITESSE_ANGLE_PAS;
    acc.acceleration.orientation.consigne = acc.acceleration.orientation.max;
    acc.deceleration.orientation.consigne = acc.deceleration.orientation.max;

    //FLAG_ASSERV.erreur = DEPLACEMENT_NORMAL;
    FLAG_ASSERV.position = ON;
    FLAG_ASSERV.orientation = ON;
    FLAG_ASSERV.vitesse = ON;
    FLAG_ASSERV.sens_deplacement = sens_marche;
    FLAG_ASSERV.phase_deceleration_distance = PHASE_NORMAL;
    FLAG_ASSERV.phase_decelaration_orientation = PHASE_NORMAL;

    FLAG_ASSERV.type_deplacement = PASSE_PART;
    FLAG_ASSERV.etat_angle = EN_COURS;
    FLAG_ASSERV.etat_distance = EN_COURS;

    FLAG_ASSERV.immobilite = 0;

    if (last == FIN_TRAJECTOIRE)
        FLAG_ASSERV.vitesse_fin_nulle = ON;
    else
        FLAG_ASSERV.vitesse_fin_nulle = OFF;

    FLAG_ASSERV.fin_deplacement = DEBUT_DEPLACEMENT;
    while (FLAG_ASSERV.fin_deplacement != FIN_DEPLACEMENT);
    return FLAG_ASSERV.erreur;
}

/******************************************************************************/
/******************************************************************************/
/******************************************************************************/
