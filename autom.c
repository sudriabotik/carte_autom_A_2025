
/*

* File:   autom.c

* Author: james

*

* Created on April 18, 2024, 12:41 PM

*/
 
 
#include "xc.h"

#include "system.h"
#include "pump.h"
#include "autom.h"


void InitAx(){
    ascenseurSetConsignePourcent(3.);
    angle_AX12(IdD,POSDG,VIT_AX,AVEC_ATTENTE);
    angle_AX12(IdM,POSMI,VIT_AX,AVEC_ATTENTE);
    angle_AX12(IdG,POSGG,VIT_AX,AVEC_ATTENTE);
    lancer_autom_AX12();
}

void Approch(){
    ascenseurSetConsignePourcent(5.9);
    angle_AX12(IdD,POSDG,VIT_AX,AVEC_ATTENTE);
    angle_AX12(IdM,POSMG,VIT_AX,AVEC_ATTENTE);
    angle_AX12(IdG,POSGG,VIT_AX,AVEC_ATTENTE);
    lancer_autom_AX12();
    turnOnPump_ARM1();
    turnOnPump_ARM2();
    turnOnPump_ARM3();
}

void Hold(){
    angle_AX12(IdM,POSMT,VIT_AX,SANS_ATTENTE);
    angle_AX12(IdM,POSMT,VIT_AX,SANS_ATTENTE);
    angle_AX12(IdM,POSMT,VIT_AX,SANS_ATTENTE);
    angle_AX12(IdM,POSMT,VIT_AX,SANS_ATTENTE);
    delay_ms(800);
    angle_AX12(IdM,POSMT-10,VIT_AX,SANS_ATTENTE);
    angle_AX12(IdM,POSMT-10,VIT_AX,SANS_ATTENTE);
    angle_AX12(IdM,POSMT-10,VIT_AX,SANS_ATTENTE);
    angle_AX12(IdM,POSMT-10,VIT_AX,SANS_ATTENTE);   
}

void Construct(){
    angle_AX12(IdD,POSDT,VIT_AX,AVEC_ATTENTE);
    angle_AX12(IdG,POSGT,VIT_AX,AVEC_ATTENTE);
    lancer_autom_AX12();
    delay_ms(800);
    ascenseurSetConsignePourcent(97.);
    delay_ms(3800);
    angle_AX12(IdD,POSDD,VIT_AX,AVEC_ATTENTE);
    angle_AX12(IdG,POSGD,VIT_AX,AVEC_ATTENTE);
    lancer_autom_AX12();
    angle_AX12(IdG,POSGD,VIT_AX,AVEC_ATTENTE);
    angle_AX12(IdD,POSDD,VIT_AX,AVEC_ATTENTE);
    lancer_autom_AX12();
    
    delay_ms(2000);
    ascenseurSetConsignePourcent(85.);
}

void Drop(){
    turnOffPump_ARM1();
    turnOffPump_ARM2();
    turnOffPump_ARM3();
    delay_ms(0400);
    angle_AX12(IdM,POSMG,VIT_AX,SANS_ATTENTE);
    angle_AX12(IdM,POSMG,VIT_AX,SANS_ATTENTE);
    angle_AX12(IdM,POSMG,VIT_AX,SANS_ATTENTE);
    angle_AX12(IdM,POSMG,VIT_AX,SANS_ATTENTE);

}
