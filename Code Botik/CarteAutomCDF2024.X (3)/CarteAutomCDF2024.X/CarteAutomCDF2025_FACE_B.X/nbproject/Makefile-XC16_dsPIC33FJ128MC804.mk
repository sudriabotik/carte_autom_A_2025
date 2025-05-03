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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/CarteAutomCDF2025_FACE_B.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/CarteAutomCDF2025_FACE_B.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
	${MAKE}  -f nbproject/Makefile-XC16_dsPIC33FJ128MC804.mk dist/${CND_CONF}/${IMAGE_TYPE}/CarteAutomCDF2025_FACE_B.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33FJ128MC804
MP_LINKER_FILE_OPTION=,--script=p33FJ128MC804.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/main.o: main.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/7a7f09c9a966c8b99b2f0deb26ae8989e9f7294c .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/system.o: system.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/66532071c721c9204665dfe130bc077b03315a0e .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.o.d 
	@${RM} ${OBJECTDIR}/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system.c  -o ${OBJECTDIR}/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/system.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/traps.o: traps.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/26fa11582036cc4a2b1ac60dd8fbf2299dcb2baa .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/traps.o.d 
	@${RM} ${OBJECTDIR}/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  traps.c  -o ${OBJECTDIR}/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/traps.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/user.o: user.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/7d055b4fb6c20e7bc101f75ca8e4db372fd6723f .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/user.o.d 
	@${RM} ${OBJECTDIR}/user.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  user.c  -o ${OBJECTDIR}/user.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/user.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/interrupts.o: interrupts.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/8e5bc012b19d18cb1f1ec1174b7076563c56c6c4 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/interrupts.o.d 
	@${RM} ${OBJECTDIR}/interrupts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  interrupts.c  -o ${OBJECTDIR}/interrupts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/interrupts.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/gestion_AX12.o: gestion_AX12.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/c2a9c144190ca3219382af7ec552721f7b759bcc .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/gestion_AX12.o.d 
	@${RM} ${OBJECTDIR}/gestion_AX12.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  gestion_AX12.c  -o ${OBJECTDIR}/gestion_AX12.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/gestion_AX12.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/Uart_1.o: Uart_1.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/221625f71d6d81e12ca4328445139cbb8562b97b .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Uart_1.o.d 
	@${RM} ${OBJECTDIR}/Uart_1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Uart_1.c  -o ${OBJECTDIR}/Uart_1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/Uart_1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/pump.o: pump.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/39fd474dbe991d4baeed4fe0b62f4ccf909dbc88 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pump.o.d 
	@${RM} ${OBJECTDIR}/pump.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  pump.c  -o ${OBJECTDIR}/pump.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/pump.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/pmw.o: pmw.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/10209c53bb6e6b9e50f33197f80018c5778e7cd8 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pmw.o.d 
	@${RM} ${OBJECTDIR}/pmw.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  pmw.c  -o ${OBJECTDIR}/pmw.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/pmw.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/serialusM2M.o: serialusM2M.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/a6693adbbc4e4c1ac59313c89e32a7b302204ff2 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/serialusM2M.o.d 
	@${RM} ${OBJECTDIR}/serialusM2M.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  serialusM2M.c  -o ${OBJECTDIR}/serialusM2M.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/serialusM2M.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/autom.o: autom.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/f770d80b69e9f3edd01e9a5dd05dc2ea64b08673 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/autom.o.d 
	@${RM} ${OBJECTDIR}/autom.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  autom.c  -o ${OBJECTDIR}/autom.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/autom.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/asserv.o: asserv.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/646874be6a53059afb428c44c93fc2a9d43a1e25 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/asserv.o.d 
	@${RM} ${OBJECTDIR}/asserv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  asserv.c  -o ${OBJECTDIR}/asserv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/asserv.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/codeurs.o: codeurs.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/1bcb5ff4137ff09af55816c4e2f63a79060e7be8 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/codeurs.o.d 
	@${RM} ${OBJECTDIR}/codeurs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  codeurs.c  -o ${OBJECTDIR}/codeurs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/codeurs.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/ascenseur_params.o: ascenseur_params.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/b86a640e205111d98f2535eff3dbe10962ff3df8 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ascenseur_params.o.d 
	@${RM} ${OBJECTDIR}/ascenseur_params.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ascenseur_params.c  -o ${OBJECTDIR}/ascenseur_params.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ascenseur_params.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/ascenseur_asserv.o: ascenseur_asserv.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/83840421010de55e9adb4bf2ca79f7abc915e407 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ascenseur_asserv.o.d 
	@${RM} ${OBJECTDIR}/ascenseur_asserv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ascenseur_asserv.c  -o ${OBJECTDIR}/ascenseur_asserv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ascenseur_asserv.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/main.o: main.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/c237baa7f4f73a38dc0a37fcf5be297ebdb7df5 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/system.o: system.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/e9f9ceb59cb7b023406e1b4fa100a124d54932da .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.o.d 
	@${RM} ${OBJECTDIR}/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system.c  -o ${OBJECTDIR}/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/system.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/traps.o: traps.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/f3af58d67f7ca9250a69bbfed54c76557858319f .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/traps.o.d 
	@${RM} ${OBJECTDIR}/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  traps.c  -o ${OBJECTDIR}/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/traps.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/user.o: user.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/a63ebce615178c0cef1715a59afdf295da366e49 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/user.o.d 
	@${RM} ${OBJECTDIR}/user.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  user.c  -o ${OBJECTDIR}/user.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/user.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/interrupts.o: interrupts.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/aa9ac202d384cfc2f6f8d96d330851c7a4352600 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/interrupts.o.d 
	@${RM} ${OBJECTDIR}/interrupts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  interrupts.c  -o ${OBJECTDIR}/interrupts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/interrupts.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/gestion_AX12.o: gestion_AX12.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/80029a4f8d156d1f1eed88130a33fe1e8fb37d85 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/gestion_AX12.o.d 
	@${RM} ${OBJECTDIR}/gestion_AX12.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  gestion_AX12.c  -o ${OBJECTDIR}/gestion_AX12.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/gestion_AX12.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/Uart_1.o: Uart_1.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/3943dffe694c42de0a1d83a0159c9fbe008d52de .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Uart_1.o.d 
	@${RM} ${OBJECTDIR}/Uart_1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Uart_1.c  -o ${OBJECTDIR}/Uart_1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/Uart_1.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/pump.o: pump.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/3c77e1861c699534a88c2ff42d12cf28cc15922 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pump.o.d 
	@${RM} ${OBJECTDIR}/pump.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  pump.c  -o ${OBJECTDIR}/pump.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/pump.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/pmw.o: pmw.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/227c1d3aa63b187695dfcdbb5c395ba5caa3e05e .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pmw.o.d 
	@${RM} ${OBJECTDIR}/pmw.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  pmw.c  -o ${OBJECTDIR}/pmw.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/pmw.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/serialusM2M.o: serialusM2M.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/86e03e0dd82b6f7c3d3acf174df295e13502cef0 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/serialusM2M.o.d 
	@${RM} ${OBJECTDIR}/serialusM2M.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  serialusM2M.c  -o ${OBJECTDIR}/serialusM2M.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/serialusM2M.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/autom.o: autom.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/ce943df661d2a2e3b6c36f0a3d135c44fc0b9f1e .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/autom.o.d 
	@${RM} ${OBJECTDIR}/autom.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  autom.c  -o ${OBJECTDIR}/autom.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/autom.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/asserv.o: asserv.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/771c4731a890bcb879587d08375d6fa52fa9088b .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/asserv.o.d 
	@${RM} ${OBJECTDIR}/asserv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  asserv.c  -o ${OBJECTDIR}/asserv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/asserv.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/codeurs.o: codeurs.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/edeaf6ce460f49cb80bf7c2aefe3a8ab32fdb7e0 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/codeurs.o.d 
	@${RM} ${OBJECTDIR}/codeurs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  codeurs.c  -o ${OBJECTDIR}/codeurs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/codeurs.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/ascenseur_params.o: ascenseur_params.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/95e52eac7e603b42ade877871b2b20624964ee07 .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ascenseur_params.o.d 
	@${RM} ${OBJECTDIR}/ascenseur_params.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ascenseur_params.c  -o ${OBJECTDIR}/ascenseur_params.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ascenseur_params.o.d"        -g -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -fno-short-double -O0 -msmart-io=1 -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/ascenseur_asserv.o: ascenseur_asserv.c  .generated_files/flags/XC16_dsPIC33FJ128MC804/ac2ab27e478536bb5794c2f60a885fd25e5ea2e .generated_files/flags/XC16_dsPIC33FJ128MC804/c4f6713bfdb485188cedd0b1cd0fbc22c4c1678f
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
dist/${CND_CONF}/${IMAGE_TYPE}/CarteAutomCDF2025_FACE_B.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/CarteAutomCDF2025_FACE_B.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x825 -mreserve=data@0x826:0x84F   -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/CarteAutomCDF2025_FACE_B.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/CarteAutomCDF2025_FACE_B.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_XC16_dsPIC33FJ128MC804=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/CarteAutomCDF2025_FACE_B.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
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
