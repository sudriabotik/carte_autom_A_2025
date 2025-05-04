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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/CarteAutomCDF2025_FACE_A.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/CarteAutomCDF2025_FACE_A.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
	${MAKE}  -f nbproject/Makefile-XC16_dsPIC33FJ128MC804.mk dist/${CND_CONF}/${IMAGE_TYPE}/CarteAutomCDF2025_FACE_A.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33FJ128MC804
MP_LINKER_FILE_OPTION=,--script=p33FJ128MC804.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/main.o: main.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/f007ef14e4709135b93574f55a60939fe9973a7b .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/system.o: system.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/642f7ec6952208318472682e2d4793a03457e1d6 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.o.d 
	@${RM} ${OBJECTDIR}/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system.c  -o ${OBJECTDIR}/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/system.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/traps.o: traps.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/65e9f1ed8140a4b62a63e7b73a202729fd6ead3e .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/traps.o.d 
	@${RM} ${OBJECTDIR}/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  traps.c  -o ${OBJECTDIR}/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/traps.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/user.o: user.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/82016e861e4059865b816a56bd06d71ecae67853 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/user.o.d 
	@${RM} ${OBJECTDIR}/user.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  user.c  -o ${OBJECTDIR}/user.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/user.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/interrupts.o: interrupts.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/d3f287f5c36ec022458b96cd48e70bc371deb747 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/interrupts.o.d 
	@${RM} ${OBJECTDIR}/interrupts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  interrupts.c  -o ${OBJECTDIR}/interrupts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/interrupts.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/gestion_AX12.o: gestion_AX12.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/c240e461d7533ba3a3f8bda0ccbdc578d72bd53c .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/gestion_AX12.o.d 
	@${RM} ${OBJECTDIR}/gestion_AX12.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  gestion_AX12.c  -o ${OBJECTDIR}/gestion_AX12.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/gestion_AX12.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/Uart_1.o: Uart_1.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/c9b71684a4c365da9336fb3fced311210524a41e .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Uart_1.o.d 
	@${RM} ${OBJECTDIR}/Uart_1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Uart_1.c  -o ${OBJECTDIR}/Uart_1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/Uart_1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/pump.o: pump.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/b93ccefbe9e470a7eda23d8404aea8d15d6331f5 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pump.o.d 
	@${RM} ${OBJECTDIR}/pump.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  pump.c  -o ${OBJECTDIR}/pump.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/pump.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/pmw.o: pmw.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/af96e9ef484bf75837fc3cd058dd625fedc97846 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pmw.o.d 
	@${RM} ${OBJECTDIR}/pmw.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  pmw.c  -o ${OBJECTDIR}/pmw.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/pmw.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/serialusM2M.o: serialusM2M.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/bfa3ca27b55b7534c42ec9437c08cbea6ff3b2da .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/serialusM2M.o.d 
	@${RM} ${OBJECTDIR}/serialusM2M.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  serialusM2M.c  -o ${OBJECTDIR}/serialusM2M.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/serialusM2M.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/autom.o: autom.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/923c8a55af475a62a2e766bebfee347ba4bbface .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/autom.o.d 
	@${RM} ${OBJECTDIR}/autom.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  autom.c  -o ${OBJECTDIR}/autom.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/autom.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/asserv.o: asserv.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/63fe554bba93f2d7b0282d030a2bfa2660cd37ad .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/asserv.o.d 
	@${RM} ${OBJECTDIR}/asserv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  asserv.c  -o ${OBJECTDIR}/asserv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/asserv.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/codeurs.o: codeurs.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/344585ca4b7cd22c94b0c7b0108552b343d54a7e .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/codeurs.o.d 
	@${RM} ${OBJECTDIR}/codeurs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  codeurs.c  -o ${OBJECTDIR}/codeurs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/codeurs.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/ascenseur_params.o: ascenseur_params.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/13eb44299d5fe075cd6ffd7953a21269c903a556 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ascenseur_params.o.d 
	@${RM} ${OBJECTDIR}/ascenseur_params.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ascenseur_params.c  -o ${OBJECTDIR}/ascenseur_params.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ascenseur_params.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/ascenseur_asserv.o: ascenseur_asserv.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/6ef3bb346f6ebb5ec94a9a73601d442f449d7fb4 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ascenseur_asserv.o.d 
	@${RM} ${OBJECTDIR}/ascenseur_asserv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ascenseur_asserv.c  -o ${OBJECTDIR}/ascenseur_asserv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ascenseur_asserv.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/main.o: main.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/49887b5a3360a11b27f8de9053e32154b3e2350c .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/system.o: system.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/993dadc790aab6e8077de2e35fc816cc62362a93 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.o.d 
	@${RM} ${OBJECTDIR}/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system.c  -o ${OBJECTDIR}/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/system.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/traps.o: traps.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/4c3da197455da8c49a0263a8b069c28b5e7b37bd .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/traps.o.d 
	@${RM} ${OBJECTDIR}/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  traps.c  -o ${OBJECTDIR}/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/traps.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/user.o: user.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/c6fb14321e51a82aec7dfdff9eb3222a1565d445 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/user.o.d 
	@${RM} ${OBJECTDIR}/user.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  user.c  -o ${OBJECTDIR}/user.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/user.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/interrupts.o: interrupts.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/3f0126aa70177a3d55457eeab2e538db35ea89f0 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/interrupts.o.d 
	@${RM} ${OBJECTDIR}/interrupts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  interrupts.c  -o ${OBJECTDIR}/interrupts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/interrupts.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/gestion_AX12.o: gestion_AX12.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/c720acbd793b39787e64da1301638885cc271351 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/gestion_AX12.o.d 
	@${RM} ${OBJECTDIR}/gestion_AX12.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  gestion_AX12.c  -o ${OBJECTDIR}/gestion_AX12.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/gestion_AX12.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/Uart_1.o: Uart_1.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/a15022898ad62c5f9316db2bb83748a44fb47403 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Uart_1.o.d 
	@${RM} ${OBJECTDIR}/Uart_1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Uart_1.c  -o ${OBJECTDIR}/Uart_1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/Uart_1.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/pump.o: pump.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/7f39d2836d074544eb5156bc3009ec2da85c563f .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pump.o.d 
	@${RM} ${OBJECTDIR}/pump.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  pump.c  -o ${OBJECTDIR}/pump.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/pump.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/pmw.o: pmw.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/5dbec9b6428cc9881ad65c3672c93a603a1819a .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pmw.o.d 
	@${RM} ${OBJECTDIR}/pmw.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  pmw.c  -o ${OBJECTDIR}/pmw.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/pmw.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/serialusM2M.o: serialusM2M.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/36865ce6a4e3069b12706e3d81c5a394ccd51cab .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/serialusM2M.o.d 
	@${RM} ${OBJECTDIR}/serialusM2M.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  serialusM2M.c  -o ${OBJECTDIR}/serialusM2M.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/serialusM2M.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/autom.o: autom.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/8100cb8ad9bb8a0f6b39b9ba0c1c2b742e19d4aa .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/autom.o.d 
	@${RM} ${OBJECTDIR}/autom.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  autom.c  -o ${OBJECTDIR}/autom.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/autom.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/asserv.o: asserv.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/d5f8a1d22226b7603a3dcc0ab4e1928ae9df902f .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/asserv.o.d 
	@${RM} ${OBJECTDIR}/asserv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  asserv.c  -o ${OBJECTDIR}/asserv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/asserv.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/codeurs.o: codeurs.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/48d55212257baff6b1f9f1095e391f28f75e3a .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/codeurs.o.d 
	@${RM} ${OBJECTDIR}/codeurs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  codeurs.c  -o ${OBJECTDIR}/codeurs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/codeurs.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/ascenseur_params.o: ascenseur_params.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/bdc71147d24924e07c2da7182632987d42517071 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ascenseur_params.o.d 
	@${RM} ${OBJECTDIR}/ascenseur_params.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ascenseur_params.c  -o ${OBJECTDIR}/ascenseur_params.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ascenseur_params.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/ascenseur_asserv.o: ascenseur_asserv.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/df35f9a48054d7d027e55a9c0c883ff41c459940 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
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
dist/${CND_CONF}/${IMAGE_TYPE}/CarteAutomCDF2025_FACE_A.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/CarteAutomCDF2025_FACE_A.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x825 -mreserve=data@0x826:0x84F   -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/CarteAutomCDF2025_FACE_A.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/CarteAutomCDF2025_FACE_A.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/CarteAutomCDF2025_FACE_A.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
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
