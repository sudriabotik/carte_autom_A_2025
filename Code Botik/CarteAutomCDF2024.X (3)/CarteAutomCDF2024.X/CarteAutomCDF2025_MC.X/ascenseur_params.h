
/* 
 * File:   ascenseur_params.h
 * Author: James ELOIRE
 * Comments:
 * Revision history: 
 */
/* ascenseur_params.h */
#ifndef ASCENSEUR_PARAMS_H
#define ASCENSEUR_PARAMS_H

#include <xc.h>

#ifdef __cplusplus
extern "C" {
#endif

    /* Valeurs compile-time par défaut */
#define _ASC_VMAX_TICKS   1000.0
#define _ASC_ACCEL_TICKS   70.0
#define _ASC_DECEL_TICKS   100.0

#define _ASC_VMIN_TICKS 100
#define _ASC_DIST_VMIN 3000
#define _ASC_DIST_FINISH 500

#define _HOMING_SPEED     40.0   /* % PWM */
#define _CLAMP_PWM_PID_SPEED 70.0
#define _CLAMP_PWM_PID_BRAKE 30.0 


    /* ----------  PID par défaut (motion) ---------- */
#define _PID_KP            0.5 //0.80
#define _PID_KI            0.022//0.020
#define _PID_KD            0.001//0.000
#define _PID_IMAX          20000.0//20000.0

    /* ----------  PID_BRAKE par défaut ------------- */
#define _PIDB_KP           0.0007 //0.00055
#define _PIDB_KI           0.08//0.0001
#define _PIDB_KD           0.00004//0.00003
#define _PIDB_IMAX         100000.0//100000.0




    /* Variables runtime (extern) */
    extern double ASC_VMAX_TICKS;
    extern double ASC_ACCEL_TICKS;
    extern double ASC_DECEL_TICKS;

    extern double ASC_VMIN_TICKS;
    extern double ASC_DIST_VMIN;
    extern double ASC_DIST_FINISH;

    extern double HOMING_SPEED;
    extern double CLAMP_PWM_PID_SPEED;
    extern double CLAMP_PWM_PID_BRAKE;

    extern double PID_KP;
    extern double PID_KI;
    extern double PID_KD;
    extern double PID_IMAX;


    extern double PIDB_KP;
    extern double PIDB_KI;
    extern double PIDB_KD;
    extern double PIDB_IMAX;

    /* --------- Sélecteur d?instance -------------- */
    typedef enum {
        PID_MOVE = 0, PID_BRAKE = 1
    } asc_pid_instance_t;

    /* --------- Sélecteur de champ ---------------- */
    typedef enum {
        PID_PAR_KP = 0,
        PID_PAR_KI,
        PID_PAR_KD,
        PID_PAR_IMAX,
        PID_PAR_EINT, /* read-only  */
        PID_PAR_EPREV /* read-only  */
    } asc_pid_field_t;

    /* --------- AJOUT, après les extern déjà présents --------- */
    typedef enum {
        ASC_PAR_VMAX = 0, /* id2='0' */
        ASC_PAR_ACCEL, /* 1 */
        ASC_PAR_DECEL, /* 2 */
        ASC_PAR_HOME_SPEED, /* 3 */
        ASC_PAR_CLAMP_SPEED, /* 4 */
        ASC_PAR_CLAMP_BRAKE, /* 5 */
        ASC_PAR_VMIN, /* 6 */
        ASC_PAR_DIST_VMIN, /* 7 */
        ASC_PAR_DIST_FINISH /* 8 */
    } asc_consigne_idx_t;


    /* setters / getters accessibles depuis Serialus */
    /* --------- API publique ---------------------- */

    void asc_set_pid(uint8_t inst, uint8_t field, double val);
    double asc_get_pid(uint8_t inst, uint8_t field);

    void asc_set_consigne(uint8_t idx, long value);
    long asc_get_consigne(uint8_t idx);
    void asc_reset_defaults(void);

#ifdef __cplusplus
}
#endif
#endif /* ASCENSEUR_PARAMS_H */
