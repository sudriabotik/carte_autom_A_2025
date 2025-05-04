/*
 * File:   ascenseur_params.c
 * Author: james
 *
 * Created on April 26, 2025, 4:58 PM
 */


#include "xc.h"

/* ascenseur_params.c */
#include "ascenseur_params.h"
#include "ascenseur_asserv.h"

/*  Variables réellement utilisées par le code  */
double ASC_VMAX_TICKS      = _ASC_VMAX_TICKS;
double ASC_ACCEL_TICKS     = _ASC_ACCEL_TICKS;
double ASC_DECEL_TICKS     = _ASC_DECEL_TICKS;


double ASC_VMIN_TICKS    = _ASC_VMIN_TICKS;
double ASC_DIST_VMIN     = _ASC_DIST_VMIN;
double ASC_DIST_FINISH   = _ASC_DIST_FINISH;

double HOMING_SPEED        = _HOMING_SPEED;
double CLAMP_PWM_PID_SPEED = _CLAMP_PWM_PID_SPEED;
double CLAMP_PWM_PID_BRAKE = _CLAMP_PWM_PID_BRAKE;

/* ----- Variables PID runtime (motion) ----- */
double PID_KP    = _PID_KP;
double PID_KI    = _PID_KI;
double PID_KD    = _PID_KD;
double PID_IMAX  = _PID_IMAX;

/* ----- Variables PID runtime (brake) ------ */
double PIDB_KP   = _PIDB_KP;
double PIDB_KI   = _PIDB_KI;
double PIDB_KD   = _PIDB_KD;
double PIDB_IMAX = _PIDB_IMAX;

/* Helpers */
void asc_reset_defaults(void)
{
    ASC_VMAX_TICKS = _ASC_VMAX_TICKS;
    ASC_ACCEL_TICKS = _ASC_ACCEL_TICKS;
    ASC_DECEL_TICKS = _ASC_DECEL_TICKS;
    
    ASC_VMIN_TICKS=_ASC_VMIN_TICKS;
    ASC_DIST_VMIN=_ASC_DIST_VMIN;
    ASC_DIST_FINISH=_ASC_DIST_FINISH;
    
    HOMING_SPEED = _HOMING_SPEED;
    CLAMP_PWM_PID_SPEED= _CLAMP_PWM_PID_SPEED;
    CLAMP_PWM_PID_BRAKE= _CLAMP_PWM_PID_BRAKE;
}


/* ----- pointeurs sur les deux PID physiques ----- */
static asc_pid_t* const pid_tbl[2] = { &asc_pid, &asc_pid_brake };

/* ------------------------------------------------ */
void asc_set_pid(uint8_t inst, uint8_t field, double v)
{
    if (inst > PID_BRAKE) return;               /* instance invalide   */
    asc_pid_t* p = pid_tbl[inst];

    switch (field) {
        case PID_PAR_KP:   p->Kp          = v; break;
        case PID_PAR_KI:   p->Ki          = v; break;
        case PID_PAR_KD:   p->Kd          = v; break;
        case PID_PAR_IMAX: p->integrale_max = v; break;
        default: /* read-only ou champ inexistant */ break;
    }
}

double asc_get_pid(uint8_t inst, uint8_t field)
{
    if (inst > PID_BRAKE) return -1.0;
    asc_pid_t* p = pid_tbl[inst];

    switch (field) {
        case PID_PAR_KP:     return p->Kp;
        case PID_PAR_KI:     return p->Ki;
        case PID_PAR_KD:     return p->Kd;
        case PID_PAR_IMAX:   return p->integrale_max;
        case PID_PAR_EINT:   return p->erreur_integree;
        case PID_PAR_EPREV:  return p->erreur_precedente;
        default:             return -1.0;
    }
}

/* ------------------------------------------------------------------ */
/*          Accès aux paramètres "Consignes & Rampe"                  */
/* ------------------------------------------------------------------ */
/* ---------- setter ---------- */
void asc_set_consigne(uint8_t idx, long v)
{
    switch(idx){
        case ASC_PAR_VMAX:        ASC_VMAX_TICKS       = v;  break;
        case ASC_PAR_ACCEL:       ASC_ACCEL_TICKS      = v;  break;
        case ASC_PAR_DECEL:       ASC_DECEL_TICKS      = v;  break;
        case ASC_PAR_HOME_SPEED:  HOMING_SPEED         = v;  break;
        case ASC_PAR_CLAMP_SPEED: CLAMP_PWM_PID_SPEED  = v;  break;
        case ASC_PAR_CLAMP_BRAKE: CLAMP_PWM_PID_BRAKE  = v;  break;
        case ASC_PAR_VMIN:        ASC_VMIN_TICKS       = v;  break;
        case ASC_PAR_DIST_VMIN:   ASC_DIST_VMIN        = v;  break;
        case ASC_PAR_DIST_FINISH: ASC_DIST_FINISH      = v;  break;
        default: break;
    }
}

/* ---------- getter ---------- */
long asc_get_consigne(uint8_t idx)
{
    switch(idx){
        case ASC_PAR_VMAX:         return (long)ASC_VMAX_TICKS;
        case ASC_PAR_ACCEL:        return (long)ASC_ACCEL_TICKS;
        case ASC_PAR_DECEL:        return (long)ASC_DECEL_TICKS;
        case ASC_PAR_HOME_SPEED:   return (long)HOMING_SPEED;
        case ASC_PAR_CLAMP_SPEED:  return (long)CLAMP_PWM_PID_SPEED;
        case ASC_PAR_CLAMP_BRAKE:  return (long)CLAMP_PWM_PID_BRAKE;
        case ASC_PAR_VMIN:         return (long)ASC_VMIN_TICKS;
        case ASC_PAR_DIST_VMIN:    return (long)ASC_DIST_VMIN;
        case ASC_PAR_DIST_FINISH:  return (long)ASC_DIST_FINISH;
        default:                   return -1;
    }
}
