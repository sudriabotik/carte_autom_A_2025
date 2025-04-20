
 
// This is a guard condition so that contents of this file are not included
// more than once.  
#ifndef XC_HEADER_TEMPLATE_H
#define	XC_HEADER_TEMPLATE_H
#endif
#include <xc.h>

#include "system.h"
#include "pump.h"// include processor files - each processor file is guarded.

#ifdef	__cplusplus
extern "C" 
#endif
 
    // TODO If C++ is being used, regular C code needs function names to have C 
    // linkage so the functions can be used by the c code.
 
//#define FACE_A
#define FACE_B



#define VIT_AX 300
#define DELAY_AUTOM 1000




#ifdef FACE_A
#undef FACE_B



#endif





#ifdef FACE_B

#undef FACE_A

#define IdD 5


#define IdM 6
#define IdG 7

#define POSDG 303  //position droit grab
#define POSDT 530  //position droit transit
#define POSDD 103  //position droit drop
     


#define POSMI 525  //position middle idle
#define POSMG 780  //position middle grab
#define POSMT 835  //position middile transit
#define POSMD 835  //position middle drop

#define POSGG 413  //position gauche grab
#define POSGT 140  //position gauche transit
#define POSGD 610  //position gauche drop



void InitAx(); //AX init in idle position /!\ utiliser seulment quand le rail est en bas

void Approch(); //aproch position with pumps on 

void Hold(); //attraper les planches

void Construct(); // construi les 2 etages

void Drop(); //lache le tas 

#endif 
    



