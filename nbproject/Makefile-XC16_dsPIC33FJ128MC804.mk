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
SOURCEFILES_QUOTED_IF_SPACED=main.c system.c traps.c user.c interrupts.c gestion_AX12.c Uart_1.c pump.c pmw.c serialusM2M.c autom.c asserv.c codeurs.c acenseur_asserv.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/main.o ${OBJECTDIR}/system.o ${OBJECTDIR}/traps.o ${OBJECTDIR}/user.o ${OBJECTDIR}/interrupts.o ${OBJECTDIR}/gestion_AX12.o ${OBJECTDIR}/Uart_1.o ${OBJECTDIR}/pump.o ${OBJECTDIR}/pmw.o ${OBJECTDIR}/serialusM2M.o ${OBJECTDIR}/autom.o ${OBJECTDIR}/asserv.o ${OBJECTDIR}/codeurs.o ${OBJECTDIR}/acenseur_asserv.o
POSSIBLE_DEPFILES=${OBJECTDIR}/main.o.d ${OBJECTDIR}/system.o.d ${OBJECTDIR}/traps.o.d ${OBJECTDIR}/user.o.d ${OBJECTDIR}/interrupts.o.d ${OBJECTDIR}/gestion_AX12.o.d ${OBJECTDIR}/Uart_1.o.d ${OBJECTDIR}/pump.o.d ${OBJECTDIR}/pmw.o.d ${OBJECTDIR}/serialusM2M.o.d ${OBJECTDIR}/autom.o.d ${OBJECTDIR}/asserv.o.d ${OBJECTDIR}/codeurs.o.d ${OBJECTDIR}/acenseur_asserv.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/main.o ${OBJECTDIR}/system.o ${OBJECTDIR}/traps.o ${OBJECTDIR}/user.o ${OBJECTDIR}/interrupts.o ${OBJECTDIR}/gestion_AX12.o ${OBJECTDIR}/Uart_1.o ${OBJECTDIR}/pump.o ${OBJECTDIR}/pmw.o ${OBJECTDIR}/serialusM2M.o ${OBJECTDIR}/autom.o ${OBJECTDIR}/asserv.o ${OBJECTDIR}/codeurs.o ${OBJECTDIR}/acenseur_asserv.o

# Source Files
SOURCEFILES=main.c system.c traps.c user.c interrupts.c gestion_AX12.c Uart_1.c pump.c pmw.c serialusM2M.c autom.c asserv.c codeurs.c acenseur_asserv.c


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
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/system.o: system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.o.d 
	@${RM} ${OBJECTDIR}/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system.c  -o ${OBJECTDIR}/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/system.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/system.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/traps.o: traps.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/traps.o.d 
	@${RM} ${OBJECTDIR}/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  traps.c  -o ${OBJECTDIR}/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/traps.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/traps.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/user.o: user.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/user.o.d 
	@${RM} ${OBJECTDIR}/user.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  user.c  -o ${OBJECTDIR}/user.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/user.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/user.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/interrupts.o: interrupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/interrupts.o.d 
	@${RM} ${OBJECTDIR}/interrupts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  interrupts.c  -o ${OBJECTDIR}/interrupts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/interrupts.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/interrupts.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/gestion_AX12.o: gestion_AX12.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/gestion_AX12.o.d 
	@${RM} ${OBJECTDIR}/gestion_AX12.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  gestion_AX12.c  -o ${OBJECTDIR}/gestion_AX12.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/gestion_AX12.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/gestion_AX12.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Uart_1.o: Uart_1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Uart_1.o.d 
	@${RM} ${OBJECTDIR}/Uart_1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Uart_1.c  -o ${OBJECTDIR}/Uart_1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Uart_1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Uart_1.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/pump.o: pump.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pump.o.d 
	@${RM} ${OBJECTDIR}/pump.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  pump.c  -o ${OBJECTDIR}/pump.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/pump.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/pump.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/pmw.o: pmw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pmw.o.d 
	@${RM} ${OBJECTDIR}/pmw.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  pmw.c  -o ${OBJECTDIR}/pmw.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/pmw.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/pmw.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/serialusM2M.o: serialusM2M.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/serialusM2M.o.d 
	@${RM} ${OBJECTDIR}/serialusM2M.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  serialusM2M.c  -o ${OBJECTDIR}/serialusM2M.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/serialusM2M.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/serialusM2M.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/autom.o: autom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/autom.o.d 
	@${RM} ${OBJECTDIR}/autom.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  autom.c  -o ${OBJECTDIR}/autom.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/autom.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/autom.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/asserv.o: asserv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/asserv.o.d 
	@${RM} ${OBJECTDIR}/asserv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  asserv.c  -o ${OBJECTDIR}/asserv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/asserv.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/asserv.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/codeurs.o: codeurs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/codeurs.o.d 
	@${RM} ${OBJECTDIR}/codeurs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  codeurs.c  -o ${OBJECTDIR}/codeurs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/codeurs.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/codeurs.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/acenseur_asserv.o: acenseur_asserv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/acenseur_asserv.o.d 
	@${RM} ${OBJECTDIR}/acenseur_asserv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  acenseur_asserv.c  -o ${OBJECTDIR}/acenseur_asserv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/acenseur_asserv.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/acenseur_asserv.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/system.o: system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.o.d 
	@${RM} ${OBJECTDIR}/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system.c  -o ${OBJECTDIR}/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/system.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/system.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/traps.o: traps.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/traps.o.d 
	@${RM} ${OBJECTDIR}/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  traps.c  -o ${OBJECTDIR}/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/traps.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/traps.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/user.o: user.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/user.o.d 
	@${RM} ${OBJECTDIR}/user.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  user.c  -o ${OBJECTDIR}/user.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/user.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/user.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/interrupts.o: interrupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/interrupts.o.d 
	@${RM} ${OBJECTDIR}/interrupts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  interrupts.c  -o ${OBJECTDIR}/interrupts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/interrupts.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/interrupts.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/gestion_AX12.o: gestion_AX12.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/gestion_AX12.o.d 
	@${RM} ${OBJECTDIR}/gestion_AX12.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  gestion_AX12.c  -o ${OBJECTDIR}/gestion_AX12.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/gestion_AX12.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/gestion_AX12.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Uart_1.o: Uart_1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Uart_1.o.d 
	@${RM} ${OBJECTDIR}/Uart_1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Uart_1.c  -o ${OBJECTDIR}/Uart_1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Uart_1.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Uart_1.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/pump.o: pump.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pump.o.d 
	@${RM} ${OBJECTDIR}/pump.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  pump.c  -o ${OBJECTDIR}/pump.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/pump.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/pump.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/pmw.o: pmw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pmw.o.d 
	@${RM} ${OBJECTDIR}/pmw.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  pmw.c  -o ${OBJECTDIR}/pmw.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/pmw.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/pmw.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/serialusM2M.o: serialusM2M.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/serialusM2M.o.d 
	@${RM} ${OBJECTDIR}/serialusM2M.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  serialusM2M.c  -o ${OBJECTDIR}/serialusM2M.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/serialusM2M.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/serialusM2M.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/autom.o: autom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/autom.o.d 
	@${RM} ${OBJECTDIR}/autom.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  autom.c  -o ${OBJECTDIR}/autom.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/autom.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/autom.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/asserv.o: asserv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/asserv.o.d 
	@${RM} ${OBJECTDIR}/asserv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  asserv.c  -o ${OBJECTDIR}/asserv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/asserv.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/asserv.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/codeurs.o: codeurs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/codeurs.o.d 
	@${RM} ${OBJECTDIR}/codeurs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  codeurs.c  -o ${OBJECTDIR}/codeurs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/codeurs.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/codeurs.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/acenseur_asserv.o: acenseur_asserv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/acenseur_asserv.o.d 
	@${RM} ${OBJECTDIR}/acenseur_asserv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  acenseur_asserv.c  -o ${OBJECTDIR}/acenseur_asserv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/acenseur_asserv.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/acenseur_asserv.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
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
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/CarteAutomCDF2025_MC.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x825 -mreserve=data@0x826:0x84F   -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/CarteAutomCDF2025_MC.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/CarteAutomCDF2025_MC.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/CarteAutomCDF2025_MC.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf  
	
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
