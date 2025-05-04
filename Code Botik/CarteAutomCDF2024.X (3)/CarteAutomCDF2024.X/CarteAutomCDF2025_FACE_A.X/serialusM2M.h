/* 
 * File:   serialusM2M.h
 * Author: AJREI
 *
 * Created on September 4, 2023, 4:54 PM
 */

// serialusM2M.h

#ifndef SERIALUS_M2M_H
#define SERIALUS_M2M_H

#include <stdint.h>
#include <stdbool.h>
#include "system.h"
#include "ascenseur_params.h"         

#define BUFFER_SIZE 512 //
#define TIMEOUT_CAPT 20 // =1s -> 5*200ms=1s

/* index utilis�s par la commande 3 1 idx \r */
#define ASC_STATE_IDX         0   /* �tat principal */
#define ASC_HOME_STATE_IDX    1   /* �tat homing    */




typedef struct {
    bool clignotement_en_cours;
    char buffer[BUFFER_SIZE];
    uint8_t head;
    uint8_t tail;
    bool carriageReturnReceived;
    bool FLAG_CHECK_CAPT ;
    uint8_t counter_capt;
    
} SerialusM2M;

typedef struct {
    bool actif;
     uint8_t t_ms;
    
} _CPT_TEMPS_MATCH;


extern SerialusM2M serialusM2M;

void serialusM2M_init();
void serialusM2M_receive();
void serialusM2M_process();
void reset_rx_Buffer();
void reset_overflow_error();
bool sontdesdigits(const char *str);
void print_abort(char* raison);


void AX_set_ang();
void AX_set_pos();
void AX_set_led();
void AX_set_torque();
void AX_set_alim();

void AX_get_pos();
void AX_get_ping();

int16_t check_id_ax12_m2m(int16_t id);
void print_ping(uint8_t id);
void print_position_ax12(uint8_t id, int16_t position);
void print_erreur_ax12();
void start_match();

void _ascenseurSetConsignePourcent();


/* --- nouveaux prototypes --- */
//void pid_cmd_serialus(void);   /* id0 = '1' */

void asc_set_consigne(uint8_t idx, long value);
long asc_get_consigne(uint8_t idx);

// Add other function declarations...


#endif