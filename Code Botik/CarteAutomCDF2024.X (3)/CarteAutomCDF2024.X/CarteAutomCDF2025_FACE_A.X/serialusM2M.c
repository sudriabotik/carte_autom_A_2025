// serialusM2M.c

#include "serialusM2M.h"
#include "Uart.h" // Include your UART code here
#include "system.h"
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <ctype.h>
#include "ascenseur_params.h"
#include "ascenseur_asserv.h"

static void pid_cmd_serialus(void);
static void cons_cmd_serialus(void); /* id0 = '2' */
static void state_cmd_serialus(void); /* id0 = '3' */





SerialusM2M serialusM2M = {
    .head = 0,
    .tail = 0,
    .carriageReturnReceived = false,
    .FLAG_CHECK_CAPT = false
};

void serialusM2M_init() {
    InitUART(UART_XBEE, 1000000);
    serialusM2M.clignotement_en_cours = false;
}

void serialusM2M_receive() {
    // Code to read incoming serial data and place it in the circular buffer
    // You can use your UART functions here to read characters.
    // For example:

    while (U1STAbits.URXDA == 1) { // U1STAbits.URXDA checks if data is available
        volatile char receivedChar = U1RXREG; // Read a character from UART1
        PutcUART(UART_XBEE, receivedChar);

        serialusM2M.buffer[serialusM2M.head] = receivedChar;
        serialusM2M.head = (serialusM2M.head + 1) % BUFFER_SIZE;

        // Check for '\r' (carriage return) to mark the end of a command
        if (receivedChar == '\r') {
            // putchar('\r');
            putchar('\n');
            serialusM2M.carriageReturnReceived = true;
        }
    }
}

void reset_rx_Buffer() {
    while (U1STAbits.URXDA) {
        (void) U1RXREG; // Read and discard the character
    }
}

void serialusM2M_process() {
    // Process the data in the circular buffer

    while (serialusM2M.head != serialusM2M.tail) {
        volatile char currentChar = serialusM2M.buffer[serialusM2M.tail];
        serialusM2M.tail = (serialusM2M.tail + 1) % BUFFER_SIZE;

        // Check for '\r' (carriage return) to mark the end of a command
        if (currentChar == '\r') {
            // Process the complete command here or set a flag to indicate a complete command
            if (serialusM2M.carriageReturnReceived) {
                // printf(serialusM2M.buffer);
                //  Complete command received, process it
                char id0 = serialusM2M.buffer[0];
                char id1;
                char id2;
                int taille_buffer = serialusM2M.tail;

                switch (id0) {

                        /* serialusM2M_process() --------------------------------------------------- */
                    case 0: // id0 = 0  ? gestion debug
                        if (id1 == 0) {
                            gDebugOn = 0;
                            printf("OK\r\n");
                        }// 000
                        else if (id1 == 1) {
                            gDebugOn = 1;
                            printf("OK\r\n");
                        }// 001
                        else {
                            printf("ERR\r\n");
                        }
                        break;


                        /* ====================  id0 = '1' : ASCENSEUR PID  ==================== */
                    case '1':
                    {
                        pid_cmd_serialus(); /* ==> traite tout, renvoie éventuellement */
                        break;
                    }
                        /* ====================  id0 = '2' : ASCENSEUR CONSIGNE  ==================== */
                    case '2': /*  --- CONSIGNES / RAMPE ---  */
                    {
                        cons_cmd_serialus(); /* gère tout en interne        */
                        break;
                    }

                    case '3': /* ---------- lecture des machines états ---------- */
                    {
                        state_cmd_serialus(); /* envoie la valeur demandée */
                        break;
                    }



                    case '4': // AX
                        id1 = serialusM2M.buffer[1];
                        switch (id1) {
                            case '0': ////AX_set
                                id2 = serialusM2M.buffer[2];
                                switch (id2) {
                                    case '0':
                                        if ((taille_buffer) != 13) {
                                            printf("erreur taille char AX %d \n", taille_buffer);
                                            break;
                                        } else if (!sontdesdigits(serialusM2M.buffer)) {
                                            printf("erreur Sont des digits \n");
                                            break;
                                        }
                                        AX_set_ang();
                                        break;
                                    case '1':
                                        if ((taille_buffer) != 14) {
                                            printf("erreur taille char AX %d \n", taille_buffer);
                                            break;
                                        } else if (!sontdesdigits(serialusM2M.buffer)) {
                                            printf("erreur Sont des digits \n");
                                            break;
                                        }
                                        AX_set_pos();
                                        break;
                                    case '2':
                                        if ((taille_buffer) != 7) {
                                            printf("erreur taille char AX %d \n", taille_buffer);
                                            break;
                                        } else if (!sontdesdigits(serialusM2M.buffer)) {
                                            printf("erreur Sont des digits \n");
                                            break;
                                        }
                                        AX_set_led();
                                        break;
                                    case '3': // 
                                        if ((taille_buffer) != 7) {
                                            printf("erreur taille char %d \n", taille_buffer);
                                            break;
                                        } else if (!sontdesdigits(serialusM2M.buffer)) {
                                            printf("erreur Sont des digits \n");
                                            break;
                                        }
                                        AX_set_torque();
                                        break;
                                    case '4': // ()
                                        if ((taille_buffer) != 5) {
                                            printf("erreur taille char %d \n", taille_buffer);
                                            break;
                                        } else if (!sontdesdigits(serialusM2M.buffer)) {
                                            printf("erreur Sont des digits \n");
                                            break;
                                        }
                                        AX_set_alim();
                                        break;

                                    default:
                                        printf("non reconu char3 AXset");
                                        break;
                                }
                                break;

                            case '1': ////AX_get
                                id2 = serialusM2M.buffer[2];
                                switch (id2) {
                                    case '0':
                                        if ((taille_buffer) != 6) {
                                            printf("erreur taille char AX %d \n", taille_buffer);
                                            break;
                                        } else if (!sontdesdigits(serialusM2M.buffer)) {
                                            printf("erreur Sont des digits \n");
                                            break;
                                        }
                                        AX_get_pos();
                                        break;
                                    case '1':
                                        if ((taille_buffer) != 6) {
                                            printf("erreur taille char AX %d \n", taille_buffer);
                                            break;
                                        } else if (!sontdesdigits(serialusM2M.buffer)) {
                                            printf("erreur Sont des digits \n");
                                            break;
                                        }
                                        AX_get_ping();
                                        break;


                                    default:
                                        printf("non reconu char3 AXget");
                                        break;

                                }
                                break;

                            default:
                                printf("non reconu char2 AX \n");
                                break;
                        }
                        break;

                    case '6':
                        //printf("you are here \n");
                        id1 = serialusM2M.buffer[1];
                        switch (id1) {


                            case '1':

                                _ascenseurSetConsignePourcent();

                                break;

                            case '2':
                                turnOnPump_ARM1();
                                turnOnPump_ARM2();
                                turnOnPump_ARM3();
                                printf("pomp on \n");
                                break;

                            case '3':

                                turnOffPump_ARM1();
                                turnOffPump_ARM2();
                                turnOffPump_ARM3();
                                printf("pomp off \n");
                                break;


                            case'4':

                                envoit_pwm(MOTEUR_DROIT, 1.0);
                                break;


                            case '9':
                                start_match();
                                break;
                        }

                        break; //break case 6


                    case '7':

                        //printf("you are here \n");
                        id1 = serialusM2M.buffer[1];
                        switch (id1) {
                            case '0': ////////////////////////////////////////////////////////
                                InitAx();
                                printf("Init AXDC \n");
                                break;

                            case '1': //////////////////////////////////////////////////////
                                Approch();
                                printf("approch\n");
                                break;


                            case '2':

                                Hold();
                                printf("Hold\n");
                                break;


                            case '3':
                                Construct();
                                printf("construct\n");
                                break;

                            case '4':
                                Drop();
                                printf("Drop\n");
                                break;

                            default:
                                printf("Mauvais id1  autom \n");
                                break;
                        }
                        break; //break case 7




                    default:
                        printf("connais pas \n");
                        break;
                }

                // Clear the flag
                serialusM2M.carriageReturnReceived = false;

                // Reset the circular buffer
                serialusM2M.head = 0;
                serialusM2M.tail = 0;
                reset_rx_Buffer();
            }
        }
    }
}

void AX_set_ang() {
    uint8_t id = 0;
    int16_t angle = 0;
    uint16_t v = 0;

    char charID[3];
    char charAngle[4];
    char charV[5];

    // Extract id, angle, and v substrings from the buffer
    strncpy(charID, serialusM2M.buffer + 3, 2);
    strncpy(charAngle, serialusM2M.buffer + 5, 3);
    strncpy(charV, serialusM2M.buffer + 8, 4);

    // Null-terminate the substrings
    charID[2] = '\0';
    charAngle[3] = '\0';
    charV[4] = '\0';

    // Convert the substrings to double

    id = (uint8_t) atoi(charID);
    angle = (int16_t) atoi(charAngle);
    v = (uint16_t) atoi(charV);

    if (!(id >= 0 && id <= ID_MAX_AX12 && abs(angle) <= 270 && v >= 0 && v <= 1023)) {
        printf("data inchoerante ID: %i, angle: %i , v: %i \n ", (uint8_t) id, (int16_t) angle, (uint16_t) v);
    } else {

        synchro_AX12(id, (float) angle, v, SANS_ATTENTE);
        print_erreur_ax12();

    }

}

void AX_set_pos() {

    uint8_t id = 0;
    int16_t position = 0;
    uint16_t v = 0;

    char charID[3];
    char charPosition[5];
    char charV[5];

    // Extract id, angle, and v substrings from the buffer
    strncpy(charID, serialusM2M.buffer + 3, 2);
    strncpy(charPosition, serialusM2M.buffer + 5, 4);
    strncpy(charV, serialusM2M.buffer + 9, 4);

    // Null-terminate the substrings
    charID[2] = '\0';
    charPosition[4] = '\0';
    charV[4] = '\0';

    // Convert the substrings to double

    id = (uint8_t) atoi(charID);
    position = (int16_t) atoi(charPosition);
    v = (uint16_t) atoi(charV);

    if (!((id >= 0 && id <= ID_MAX_AX12 && position >= 0 && position <= 1023 && v >= 0 && v <= 1023))) {
        printf("data inchoerante ID: %d, position: %d , v: %d \n ", id, position, v);
    } else {

        angle_AX12(id, position, v, SANS_ATTENTE);
        print_erreur_ax12();

    }


}

void AX_set_led() {
    uint8_t id = 0;
    uint8_t state = 0;

    char charID[3];
    char charState[2];

    strncpy(charID, serialusM2M.buffer + 3, 2);
    strncpy(charState, serialusM2M.buffer + 5, 1);

    id = (uint8_t) atoi(charID);
    state = (uint8_t) atoi(charState);

    if (state) {

        allumer_LED_AX12((uint8_t) id);
        print_erreur_ax12();
    } else if (!state) {

        eteindre_LED_AX12((uint8_t) id);
        print_erreur_ax12();
    } else {
        printf("on//off AX Led error\n");
    }
}

void AX_set_torque() {
    uint8_t id = 0;
    uint8_t state = 0;

    char charID[3];
    char charState[2];

    strncpy(charID, serialusM2M.buffer + 3, 2);
    strncpy(charState, serialusM2M.buffer + 5, 1);

    id = (uint8_t) atoi(charID);
    state = (uint8_t) atoi(charState);

    if (state) {

        torque_enable_ax12((uint8_t) id, true);
        print_erreur_ax12();
    } else if (!state) {

        torque_enable_ax12((uint8_t) id, false);
        print_erreur_ax12();
    } else {
        printf("on//off AX torque Error \n");
    }

}

void AX_set_alim() {

    uint8_t state = 0;

    char charState[2];

    strncpy(charState, serialusM2M.buffer + 3, 1);

    state = (uint8_t) atoi(charState);

    if (state) {
        printf("iAX -> on \n");
        INHIBIT_AX12 = ALLUME;
    } else if (!state) {
        printf("AX->  off \n");
        INHIBIT_AX12 = ETEINT;
    } else {
        printf("on//off AX alim Error \n");
    }

}

void AX_get_pos() {
    int16_t id = 0;

    char charID[3];

    strncpy(charID, serialusM2M.buffer + 3, 2);

    id = (int16_t) atoi(charID);

    print_position_ax12(id, read_data(id, LIRE_POSITION_ACTU));
    printf("\n");


}

void AX_get_ping() {
    int16_t id = 0;

    char charID[3];

    strncpy(charID, serialusM2M.buffer + 3, 2);

    id = (int16_t) atoi(charID);

    // si c'est un id
    id = check_id_ax12_m2m(id);
    if (id == TOUS_LES_AX12) {
        uint8_t id = 0;
        for (id = 0; id < ID_MAX_AX12; id++) {
            if (Ping(id) == REPONSE_OK) {
                print_ping(id);
            }

        }
        printf("\n");
    } else if (id != -1) {
        if (Ping(id) == REPONSE_OK) {
            print_ping(id);
            printf("\n");
        } else
            printf("NC"); //Not Conected
        printf("\n");
    }
}

void print_erreur_ax12() {
    switch (ax12.erreur) {
        case PAS_D_ERREUR:
            printf("0\n");
            break;
        case TIME_OUT:
            printf("1\n");
            break;
        case ERREUR_CS:
            printf("2\n");
            break;
        case LIMITATION_DE_COURANT:
            printf("3\n");
            break;
        case AUTRE_ERREUR:
            printf("5\n");
        default:
            break;
    }
}

void print_position_ax12(uint8_t id, int16_t position) {
    printf(" ID : %d =%d \r", id, position);
}

void print_ping(uint8_t id) {
    printf("ID : %d \r", id);
}

int16_t check_id_ax12_m2m(int16_t id) {
    if (!(id >= 0 && id <= ID_MAX_AX12))
        id = -1;

    else if (id == 99) {
        id = TOUS_LES_AX12;
    } else
        id = -1;

    if (id == -1)
        print_abort("4\n ");

    return id;
}



////////////////////////////////////////////////autom

void _ascenseurSetConsignePourcent() {
    float percentage = 0.;
    char charState1[5];


    charState1[4] = '\0';


    strncpy(charState1, serialusM2M.buffer + 2, 4);
    percentage = (float) atof(charState1);

    ascenseurSetConsignePourcent(percentage / 10);
    printf("DC to %f %  \n", (percentage / 10));


}

////////////////////////////////////////////////////////////////////////////////////serialus func

bool sontdesdigits(const char *str) {

    for (int i = 0; str[i] != '\r'; i++) {
        if (!isdigit(str[i])) {
            printf("error::");
            PutcUART(UART_XBEE, str[i]);
            return false;
        }
    }
    return true;
}

void print_abort(char* raison) {
    printf("\n\rAbort : %s", raison);
}

void reset_overflow_error() {
    U1STAbits.OERR = 0;
    printf("overflow error");
}

void start_match() {
    CPT_TEMPS_MATCH.actif = 1;
    printf("here we go again \n");
}

/* ------------------------------------------------------------------
 *  id0 = '1'  (PID ascenseur)
 *      id1 = '0'  =>  SET
 *      id1 = '1'  =>  GET
 *
 *  trame : 1  id1 inst fld [valeur] \r
 * ------------------------------------------------------------------*/
static void pid_cmd_serialus(void) {
    char mode = serialusM2M.buffer[1]; /* '0' ou '1' */
    uint8_t inst = serialusM2M.buffer[2] - '0';
    uint8_t field = serialusM2M.buffer[3] - '0';

    /* --- vérifs basiques ----------------------------------------- */
    if (inst > PID_BRAKE || field > 5) {
        print_abort("PID idx");
        return;
    }

    if (mode == '0') /* ---------- SET ---------- */ {
        /* valeur ASCII signée dès l?offset 4, jusqu?au '\r' */
        char num[8] = {0}; /* max 6+sign */
        uint8_t i = 0, p = 4;
        while (serialusM2M.buffer[p] != '\r' && i < 7) {
            num[i++] = serialusM2M.buffer[p++];
        }
        long v = atol(num);
        asc_set_pid(inst, field, (double) v);
        printf("OK\r"); /* acquit */
    } else if (mode == '1') /* -------- GET -------- */ {
        long v = (long) asc_get_pid(inst, field);
        printf("%ld\r", v); /* renvoi valeur */
    } else {
        print_abort("PID mode");
    }
}

/* ------------------------------------------------------------------
 *  id0 = '2'  (Consignes & rampe)
 *      id1 = '0'  =>  SET
 *      id1 = '1'  =>  GET
 *
 *  trame : 2  id1  fld [valeur] \r
 * ------------------------------------------------------------------*/
static void cons_cmd_serialus(void) {
    char mode = serialusM2M.buffer[1]; /* '0' ou '1' */
    uint8_t idx = serialusM2M.buffer[2] - '0'; /* 0..3 */

    if (idx > ASC_PAR_DIST_FINISH) {
        print_abort("CONS idx");
        return;
    }

    if (mode == '0') { /* ----------- SET ----------- */
        char num[10] = {0};
        uint8_t i = 0, p = 3; /* valeur ASCII dès l?offset 3 */
        while (serialusM2M.buffer[p] != '\r' && i < 9) {
            num[i++] = serialusM2M.buffer[p++];
        }
        long v = atol(num);
        asc_set_consigne(idx, v);
        printf("OK\r");
    } else if (mode == '1') { /* ----------- GET ----------- */
        long v = asc_get_consigne(idx);
        printf("%ld\r", v);
    } else {
        print_abort("CONS mode");
    }
}

/* ------------------------------------------------------------------
 *  id0 = '3'   (lecture des machines d?état)
 *  format de trame : 3 1 idx \r
 *      idx = 0  -> état ascenseur   (ASC_STATE_xxx)
 *      idx = 1  -> état homing      (HOMING_xxx)
 * ------------------------------------------------------------------*/
static void state_cmd_serialus(void) {
    /* seule la lecture est autorisée */
    if (serialusM2M.buffer[1] != '1') {
        print_abort("STATE mode");
        return;
    }

    uint8_t idx = serialusM2M.buffer[2] - '0';
    long v = -1;

    if (idx == ASC_STATE_IDX) v = ascenseurGetState();
    else if (idx == ASC_HOME_STATE_IDX) v = ascenseurGetHomeState();

    if (v < 0) {
        print_abort("STATE idx");
        return;
    }

    printf("%ld\r", v); /* renvoi ASCII vers PC/RPi */
}
