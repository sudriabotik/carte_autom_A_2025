#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-XC16_dsPIC33FJ128MC804.mk)" "nbproject/Makefile-local-XC16_dsPIC33FJ128MC804.mk"
include nbproject/Makefile-local-XC16_dsPIC33FJ128MC804.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=XC16_dsPIC33FJ128MC804
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/CarteAutomCDF2025_MC.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/CarteAutomCDF2025_MC.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS
SUB_IMAGE_ADDRESS_COMMAND=--image-address $(SUB_IMAGE_ADDRESS)
else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=main.c system.c traps.c user.c interrupts.c gestion_AX12.c Uart_1.c pump.c pmw.c serialusM2M.c autom.c asserv.c codeurs.c ascenseur_params.c ascenseur_asserv.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/main.o ${OBJECTDIR}/system.o ${OBJECTDIR}/traps.o ${OBJECTDIR}/user.o ${OBJECTDIR}/interrupts.o ${OBJECTDIR}/gestion_AX12.o ${OBJECTDIR}/Uart_1.o ${OBJECTDIR}/pump.o ${OBJECTDIR}/pmw.o ${OBJECTDIR}/serialusM2M.o ${OBJECTDIR}/autom.o ${OBJECTDIR}/asserv.o ${OBJECTDIR}/codeurs.o ${OBJECTDIR}/ascenseur_params.o ${OBJECTDIR}/ascenseur_asserv.o
POSSIBLE_DEPFILES=${OBJECTDIR}/main.o.d ${OBJECTDIR}/system.o.d ${OBJECTDIR}/traps.o.d ${OBJECTDIR}/user.o.d ${OBJECTDIR}/interrupts.o.d ${OBJECTDIR}/gestion_AX12.o.d ${OBJECTDIR}/Uart_1.o.d ${OBJECTDIR}/pump.o.d ${OBJECTDIR}/pmw.o.d ${OBJECTDIR}/serialusM2M.o.d ${OBJECTDIR}/autom.o.d ${OBJECTDIR}/asserv.o.d ${OBJECTDIR}/codeurs.o.d ${OBJECTDIR}/ascenseur_params.o.d ${OBJECTDIR}/ascenseur_asserv.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/main.o ${OBJECTDIR}/system.o ${OBJECTDIR}/traps.o ${OBJECTDIR}/user.o ${OBJECTDIR}/interrupts.o ${OBJECTDIR}/gestion_AX12.o ${OBJECTDIR}/Uart_1.o ${OBJECTDIR}/pump.o ${OBJECTDIR}/pmw.o ${OBJECTDIR}/serialusM2M.o ${OBJECTDIR}/autom.o ${OBJECTDIR}/asserv.o ${OBJECTDIR}/codeurs.o ${OBJECTDIR}/ascenseur_params.o ${OBJECTDIR}/ascenseur_asserv.o

# Source Files
SOURCEFILES=main.c system.c traps.c user.c interrupts.c gestion_AX12.c Uart_1.c pump.c pmw.c serialusM2M.c autom.c asserv.c codeurs.c ascenseur_params.c ascenseur_asserv.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-XC16_dsPIC33FJ128MC804.mk dist/${CND_CONF}/${IMAGE_TYPE}/CarteAutomCDF2025_MC.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33FJ128MC804
MP_LINKER_FILE_OPTION=,--script=p33FJ128MC804.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/main.o: main.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/3f291d7f097c27431dc492696f5dfe4bffd94f52 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/system.o: system.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/d4f1cac5b186fc36915056256820bb970db1c65f .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.o.d 
	@${RM} ${OBJECTDIR}/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system.c  -o ${OBJECTDIR}/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/system.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/traps.o: traps.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/9daff47c5fe3269427ed24f423ef1979b0f5f3ad .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/traps.o.d 
	@${RM} ${OBJECTDIR}/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  traps.c  -o ${OBJECTDIR}/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/traps.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/user.o: user.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/4f98acd05fb565eb1b21e32d0389377c20f057e5 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/user.o.d 
	@${RM} ${OBJECTDIR}/user.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  user.c  -o ${OBJECTDIR}/user.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/user.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/interrupts.o: interrupts.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/e9c5aa6d8a737d776e9287b66f92de9cb6b3e29a .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/interrupts.o.d 
	@${RM} ${OBJECTDIR}/interrupts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  interrupts.c  -o ${OBJECTDIR}/interrupts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/interrupts.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/gestion_AX12.o: gestion_AX12.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/ed6e6e42e52a49c4b82cb4757acb8b120a760ba2 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/gestion_AX12.o.d 
	@${RM} ${OBJECTDIR}/gestion_AX12.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  gestion_AX12.c  -o ${OBJECTDIR}/gestion_AX12.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/gestion_AX12.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/Uart_1.o: Uart_1.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/282f252186d7673e19b61b7ffa267006a39c4e5b .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Uart_1.o.d 
	@${RM} ${OBJECTDIR}/Uart_1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Uart_1.c  -o ${OBJECTDIR}/Uart_1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/Uart_1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/pump.o: pump.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/aa0505d5b5b845f271c17cb499dc9cfd920025c .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pump.o.d 
	@${RM} ${OBJECTDIR}/pump.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  pump.c  -o ${OBJECTDIR}/pump.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/pump.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/pmw.o: pmw.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/28a695b1f6236dbcfadf3789af86f3030ce7d468 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pmw.o.d 
	@${RM} ${OBJECTDIR}/pmw.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  pmw.c  -o ${OBJECTDIR}/pmw.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/pmw.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/serialusM2M.o: serialusM2M.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/bf7e83991c022079a02537884e8e031adcb8b3d7 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/serialusM2M.o.d 
	@${RM} ${OBJECTDIR}/serialusM2M.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  serialusM2M.c  -o ${OBJECTDIR}/serialusM2M.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/serialusM2M.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/autom.o: autom.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/aa3c567f0d02b10afafbe4f1b992fd263eda6c6c .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/autom.o.d 
	@${RM} ${OBJECTDIR}/autom.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  autom.c  -o ${OBJECTDIR}/autom.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/autom.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/asserv.o: asserv.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/2f25f498519daf8efbe08145b4b46a551c6b0810 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/asserv.o.d 
	@${RM} ${OBJECTDIR}/asserv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  asserv.c  -o ${OBJECTDIR}/asserv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/asserv.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/codeurs.o: codeurs.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/ddda2bdca4f269ec143b200bf95a500f96f4be75 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/codeurs.o.d 
	@${RM} ${OBJECTDIR}/codeurs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  codeurs.c  -o ${OBJECTDIR}/codeurs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/codeurs.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/ascenseur_params.o: ascenseur_params.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/ef7b3fb73629771c619d1e882b082a8a48c8552a .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ascenseur_params.o.d 
	@${RM} ${OBJECTDIR}/ascenseur_params.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ascenseur_params.c  -o ${OBJECTDIR}/ascenseur_params.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ascenseur_params.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/ascenseur_asserv.o: ascenseur_asserv.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/adf11e03b19618b6b9d44e427b2790e8c342a7e0 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ascenseur_asserv.o.d 
	@${RM} ${OBJECTDIR}/ascenseur_asserv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ascenseur_asserv.c  -o ${OBJECTDIR}/ascenseur_asserv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ascenseur_asserv.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/main.o: main.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/d4df0a9babca192e4cc26449c064ef0089eba719 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/system.o: system.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/4d04b7770ad42ccabd3559973f5718270a29d662 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.o.d 
	@${RM} ${OBJECTDIR}/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system.c  -o ${OBJECTDIR}/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/system.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/traps.o: traps.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/69ad2d33902c0b808891c6ccfbbc8fdaf0724eda .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/traps.o.d 
	@${RM} ${OBJECTDIR}/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  traps.c  -o ${OBJECTDIR}/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/traps.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/user.o: user.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/664f476cf6f31c397246cbdcf604e025e1a94a9f .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/user.o.d 
	@${RM} ${OBJECTDIR}/user.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  user.c  -o ${OBJECTDIR}/user.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/user.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/interrupts.o: interrupts.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/e67d8762c390da6d99a8d5c00b547a5a6ea448f5 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/interrupts.o.d 
	@${RM} ${OBJECTDIR}/interrupts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  interrupts.c  -o ${OBJECTDIR}/interrupts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/interrupts.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/gestion_AX12.o: gestion_AX12.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/2ee34f65037c76f8a301b36ab8740277ff4928f4 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/gestion_AX12.o.d 
	@${RM} ${OBJECTDIR}/gestion_AX12.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  gestion_AX12.c  -o ${OBJECTDIR}/gestion_AX12.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/gestion_AX12.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/Uart_1.o: Uart_1.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/80e5f73e02e601c75520e9cbea52ddef025c5ad7 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Uart_1.o.d 
	@${RM} ${OBJECTDIR}/Uart_1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Uart_1.c  -o ${OBJECTDIR}/Uart_1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/Uart_1.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/pump.o: pump.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/61ec195b053aee69bf66624c238a62f0b5e145c7 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pump.o.d 
	@${RM} ${OBJECTDIR}/pump.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  pump.c  -o ${OBJECTDIR}/pump.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/pump.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/pmw.o: pmw.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/6c57c89e1ee8ec4785e304e97a05b688f87f401b .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pmw.o.d 
	@${RM} ${OBJECTDIR}/pmw.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  pmw.c  -o ${OBJECTDIR}/pmw.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/pmw.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/serialusM2M.o: serialusM2M.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/235fd33f1fc2a6de16c78099e19d1c496dffa953 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/serialusM2M.o.d 
	@${RM} ${OBJECTDIR}/serialusM2M.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  serialusM2M.c  -o ${OBJECTDIR}/serialusM2M.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/serialusM2M.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/autom.o: autom.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/7868a149fe28c91efecc659990af9cada6e44d14 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/autom.o.d 
	@${RM} ${OBJECTDIR}/autom.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  autom.c  -o ${OBJECTDIR}/autom.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/autom.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/asserv.o: asserv.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/a5e715d21823713e40e84e549fa7fc9aa72437a7 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/asserv.o.d 
	@${RM} ${OBJECTDIR}/asserv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  asserv.c  -o ${OBJECTDIR}/asserv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/asserv.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/codeurs.o: codeurs.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/2ede11aea2e248877ef3d21955f930ddb1b9af44 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/codeurs.o.d 
	@${RM} ${OBJECTDIR}/codeurs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  codeurs.c  -o ${OBJECTDIR}/codeurs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/codeurs.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/ascenseur_params.o: ascenseur_params.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/b313009e68c81461cd1c34da82d1d504e4c959 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ascenseur_params.o.d 
	@${RM} ${OBJECTDIR}/ascenseur_params.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ascenseur_params.c  -o ${OBJECTDIR}/ascenseur_params.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ascenseur_params.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/ascenseur_asserv.o: ascenseur_asserv.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/5da5d44f32f5bdf2e94ec79e418db3edb9483428 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ascenseur_asserv.o.d 
	@${RM} ${OBJECTDIR}/ascenseur_asserv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ascenseur_asserv.c  -o ${OBJECTDIR}/ascenseur_asserv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ascenseur_asserv.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/CarteAutomCDF2025_MC.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/CarteAutomCDF2025_MC.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x825 -mreserve=data@0x826:0x84F   -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/CarteAutomCDF2025_MC.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/CarteAutomCDF2025_MC.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/CarteAutomCDF2025_MC.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/XC16_dsPIC33FJ128MC804
	${RM} -r dist/XC16_dsPIC33FJ128MC804

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
