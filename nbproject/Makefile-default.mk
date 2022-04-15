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
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/CNC_DriveControl_App.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/CNC_DriveControl_App.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=submodules/SCI/Buffer.c submodules/SCI/Datalink.c submodules/SCI/Helpers.c submodules/SCI/SCI.c submodules/SCI/SCICommands.c submodules/SCI/VarAccess.c src/system/clock.c src/system/interrupt_manager.c src/system/mcc.c src/system/pin_manager.c src/system/reset.c src/system/system.c src/system/traps.c src/system/uart1.c src/system/dee.c src/system/flash.c src/system/flash_asm.s src/CNC_DriveControl_App.c src/DataAndControl.c src/system/sccp1_tmr.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/submodules/SCI/Buffer.o ${OBJECTDIR}/submodules/SCI/Datalink.o ${OBJECTDIR}/submodules/SCI/Helpers.o ${OBJECTDIR}/submodules/SCI/SCI.o ${OBJECTDIR}/submodules/SCI/SCICommands.o ${OBJECTDIR}/submodules/SCI/VarAccess.o ${OBJECTDIR}/src/system/clock.o ${OBJECTDIR}/src/system/interrupt_manager.o ${OBJECTDIR}/src/system/mcc.o ${OBJECTDIR}/src/system/pin_manager.o ${OBJECTDIR}/src/system/reset.o ${OBJECTDIR}/src/system/system.o ${OBJECTDIR}/src/system/traps.o ${OBJECTDIR}/src/system/uart1.o ${OBJECTDIR}/src/system/dee.o ${OBJECTDIR}/src/system/flash.o ${OBJECTDIR}/src/system/flash_asm.o ${OBJECTDIR}/src/CNC_DriveControl_App.o ${OBJECTDIR}/src/DataAndControl.o ${OBJECTDIR}/src/system/sccp1_tmr.o
POSSIBLE_DEPFILES=${OBJECTDIR}/submodules/SCI/Buffer.o.d ${OBJECTDIR}/submodules/SCI/Datalink.o.d ${OBJECTDIR}/submodules/SCI/Helpers.o.d ${OBJECTDIR}/submodules/SCI/SCI.o.d ${OBJECTDIR}/submodules/SCI/SCICommands.o.d ${OBJECTDIR}/submodules/SCI/VarAccess.o.d ${OBJECTDIR}/src/system/clock.o.d ${OBJECTDIR}/src/system/interrupt_manager.o.d ${OBJECTDIR}/src/system/mcc.o.d ${OBJECTDIR}/src/system/pin_manager.o.d ${OBJECTDIR}/src/system/reset.o.d ${OBJECTDIR}/src/system/system.o.d ${OBJECTDIR}/src/system/traps.o.d ${OBJECTDIR}/src/system/uart1.o.d ${OBJECTDIR}/src/system/dee.o.d ${OBJECTDIR}/src/system/flash.o.d ${OBJECTDIR}/src/system/flash_asm.o.d ${OBJECTDIR}/src/CNC_DriveControl_App.o.d ${OBJECTDIR}/src/DataAndControl.o.d ${OBJECTDIR}/src/system/sccp1_tmr.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/submodules/SCI/Buffer.o ${OBJECTDIR}/submodules/SCI/Datalink.o ${OBJECTDIR}/submodules/SCI/Helpers.o ${OBJECTDIR}/submodules/SCI/SCI.o ${OBJECTDIR}/submodules/SCI/SCICommands.o ${OBJECTDIR}/submodules/SCI/VarAccess.o ${OBJECTDIR}/src/system/clock.o ${OBJECTDIR}/src/system/interrupt_manager.o ${OBJECTDIR}/src/system/mcc.o ${OBJECTDIR}/src/system/pin_manager.o ${OBJECTDIR}/src/system/reset.o ${OBJECTDIR}/src/system/system.o ${OBJECTDIR}/src/system/traps.o ${OBJECTDIR}/src/system/uart1.o ${OBJECTDIR}/src/system/dee.o ${OBJECTDIR}/src/system/flash.o ${OBJECTDIR}/src/system/flash_asm.o ${OBJECTDIR}/src/CNC_DriveControl_App.o ${OBJECTDIR}/src/DataAndControl.o ${OBJECTDIR}/src/system/sccp1_tmr.o

# Source Files
SOURCEFILES=submodules/SCI/Buffer.c submodules/SCI/Datalink.c submodules/SCI/Helpers.c submodules/SCI/SCI.c submodules/SCI/SCICommands.c submodules/SCI/VarAccess.c src/system/clock.c src/system/interrupt_manager.c src/system/mcc.c src/system/pin_manager.c src/system/reset.c src/system/system.c src/system/traps.c src/system/uart1.c src/system/dee.c src/system/flash.c src/system/flash_asm.s src/CNC_DriveControl_App.c src/DataAndControl.c src/system/sccp1_tmr.c



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
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/CNC_DriveControl_App.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33CH512MP508
MP_LINKER_FILE_OPTION=,--script=p33CH512MP508.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/submodules/SCI/Buffer.o: submodules/SCI/Buffer.c  .generated_files/flags/default/fab773b18c49192722e3711895b35d1b5cc1d242 .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/submodules/SCI" 
	@${RM} ${OBJECTDIR}/submodules/SCI/Buffer.o.d 
	@${RM} ${OBJECTDIR}/submodules/SCI/Buffer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  submodules/SCI/Buffer.c  -o ${OBJECTDIR}/submodules/SCI/Buffer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/submodules/SCI/Buffer.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/submodules/SCI/Datalink.o: submodules/SCI/Datalink.c  .generated_files/flags/default/5c395531287b78248d82c3ed942a3d0cbd88b01f .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/submodules/SCI" 
	@${RM} ${OBJECTDIR}/submodules/SCI/Datalink.o.d 
	@${RM} ${OBJECTDIR}/submodules/SCI/Datalink.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  submodules/SCI/Datalink.c  -o ${OBJECTDIR}/submodules/SCI/Datalink.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/submodules/SCI/Datalink.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/submodules/SCI/Helpers.o: submodules/SCI/Helpers.c  .generated_files/flags/default/b161a8184cf672497ba15b7bb45b1f230a8de74f .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/submodules/SCI" 
	@${RM} ${OBJECTDIR}/submodules/SCI/Helpers.o.d 
	@${RM} ${OBJECTDIR}/submodules/SCI/Helpers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  submodules/SCI/Helpers.c  -o ${OBJECTDIR}/submodules/SCI/Helpers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/submodules/SCI/Helpers.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/submodules/SCI/SCI.o: submodules/SCI/SCI.c  .generated_files/flags/default/6b9a951c522edfa4e7f1749e533636e0e78b0f1 .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/submodules/SCI" 
	@${RM} ${OBJECTDIR}/submodules/SCI/SCI.o.d 
	@${RM} ${OBJECTDIR}/submodules/SCI/SCI.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  submodules/SCI/SCI.c  -o ${OBJECTDIR}/submodules/SCI/SCI.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/submodules/SCI/SCI.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/submodules/SCI/SCICommands.o: submodules/SCI/SCICommands.c  .generated_files/flags/default/93306269c08f78b745c2a091252b4d4bef1dde73 .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/submodules/SCI" 
	@${RM} ${OBJECTDIR}/submodules/SCI/SCICommands.o.d 
	@${RM} ${OBJECTDIR}/submodules/SCI/SCICommands.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  submodules/SCI/SCICommands.c  -o ${OBJECTDIR}/submodules/SCI/SCICommands.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/submodules/SCI/SCICommands.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/submodules/SCI/VarAccess.o: submodules/SCI/VarAccess.c  .generated_files/flags/default/4bbed675325036e70cd974972f6b5791d137fef0 .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/submodules/SCI" 
	@${RM} ${OBJECTDIR}/submodules/SCI/VarAccess.o.d 
	@${RM} ${OBJECTDIR}/submodules/SCI/VarAccess.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  submodules/SCI/VarAccess.c  -o ${OBJECTDIR}/submodules/SCI/VarAccess.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/submodules/SCI/VarAccess.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/clock.o: src/system/clock.c  .generated_files/flags/default/7b83bb76949c6894b2580f2b94563fca97382ef0 .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/clock.o.d 
	@${RM} ${OBJECTDIR}/src/system/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/clock.c  -o ${OBJECTDIR}/src/system/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/clock.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/interrupt_manager.o: src/system/interrupt_manager.c  .generated_files/flags/default/ad592397eb3c918b9ff963cc369389e0c87f6095 .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/src/system/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/interrupt_manager.c  -o ${OBJECTDIR}/src/system/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/interrupt_manager.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/mcc.o: src/system/mcc.c  .generated_files/flags/default/52c10e20d5a30d7c6aec942245b8917b5238e35d .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/mcc.o.d 
	@${RM} ${OBJECTDIR}/src/system/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/mcc.c  -o ${OBJECTDIR}/src/system/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/mcc.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/pin_manager.o: src/system/pin_manager.c  .generated_files/flags/default/2169b26eac84afda109d08c2ced0185bdc8b0e14 .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/src/system/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/pin_manager.c  -o ${OBJECTDIR}/src/system/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/pin_manager.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/reset.o: src/system/reset.c  .generated_files/flags/default/e39e5fe24b85aa3f66d08b5fad82d38c00bb3c69 .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/reset.o.d 
	@${RM} ${OBJECTDIR}/src/system/reset.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/reset.c  -o ${OBJECTDIR}/src/system/reset.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/reset.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/system.o: src/system/system.c  .generated_files/flags/default/7fcc498508586d17c570e3df32490be145f4d2b9 .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/system.o.d 
	@${RM} ${OBJECTDIR}/src/system/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/system.c  -o ${OBJECTDIR}/src/system/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/system.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/traps.o: src/system/traps.c  .generated_files/flags/default/dd12ec77ebaa0cfe081da73eb91da382a0a4f159 .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/traps.o.d 
	@${RM} ${OBJECTDIR}/src/system/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/traps.c  -o ${OBJECTDIR}/src/system/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/traps.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/uart1.o: src/system/uart1.c  .generated_files/flags/default/3160950a1a8368276067f544f043ab858a9c84e5 .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/uart1.o.d 
	@${RM} ${OBJECTDIR}/src/system/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/uart1.c  -o ${OBJECTDIR}/src/system/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/uart1.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/dee.o: src/system/dee.c  .generated_files/flags/default/dbf9a06c4450c6348fe04847eda5b1c38904f56b .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/dee.o.d 
	@${RM} ${OBJECTDIR}/src/system/dee.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/dee.c  -o ${OBJECTDIR}/src/system/dee.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/dee.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/flash.o: src/system/flash.c  .generated_files/flags/default/707d25e34e6da038727b58a28a000bf7e1a0d49e .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/flash.o.d 
	@${RM} ${OBJECTDIR}/src/system/flash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/flash.c  -o ${OBJECTDIR}/src/system/flash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/flash.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/CNC_DriveControl_App.o: src/CNC_DriveControl_App.c  .generated_files/flags/default/61646543f993dfe8917952c9d81dcc1088203ee0 .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/CNC_DriveControl_App.o.d 
	@${RM} ${OBJECTDIR}/src/CNC_DriveControl_App.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/CNC_DriveControl_App.c  -o ${OBJECTDIR}/src/CNC_DriveControl_App.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/CNC_DriveControl_App.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/DataAndControl.o: src/DataAndControl.c  .generated_files/flags/default/7f6c25b9f1b372d2644af8569a1a9b7db61db178 .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/DataAndControl.o.d 
	@${RM} ${OBJECTDIR}/src/DataAndControl.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/DataAndControl.c  -o ${OBJECTDIR}/src/DataAndControl.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/DataAndControl.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/sccp1_tmr.o: src/system/sccp1_tmr.c  .generated_files/flags/default/254a3ac3fe62a70ba39190907f55cba5fcc2a43f .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/sccp1_tmr.o.d 
	@${RM} ${OBJECTDIR}/src/system/sccp1_tmr.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/sccp1_tmr.c  -o ${OBJECTDIR}/src/system/sccp1_tmr.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/sccp1_tmr.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/submodules/SCI/Buffer.o: submodules/SCI/Buffer.c  .generated_files/flags/default/d1e1a5e13508a19b7aaef84e56c591c033acdaf7 .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/submodules/SCI" 
	@${RM} ${OBJECTDIR}/submodules/SCI/Buffer.o.d 
	@${RM} ${OBJECTDIR}/submodules/SCI/Buffer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  submodules/SCI/Buffer.c  -o ${OBJECTDIR}/submodules/SCI/Buffer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/submodules/SCI/Buffer.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/submodules/SCI/Datalink.o: submodules/SCI/Datalink.c  .generated_files/flags/default/b8455f3c4012218f3d66d20b49689caf9284477c .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/submodules/SCI" 
	@${RM} ${OBJECTDIR}/submodules/SCI/Datalink.o.d 
	@${RM} ${OBJECTDIR}/submodules/SCI/Datalink.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  submodules/SCI/Datalink.c  -o ${OBJECTDIR}/submodules/SCI/Datalink.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/submodules/SCI/Datalink.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/submodules/SCI/Helpers.o: submodules/SCI/Helpers.c  .generated_files/flags/default/d027daec8820319dd259ea259f9d84872a93ed3e .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/submodules/SCI" 
	@${RM} ${OBJECTDIR}/submodules/SCI/Helpers.o.d 
	@${RM} ${OBJECTDIR}/submodules/SCI/Helpers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  submodules/SCI/Helpers.c  -o ${OBJECTDIR}/submodules/SCI/Helpers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/submodules/SCI/Helpers.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/submodules/SCI/SCI.o: submodules/SCI/SCI.c  .generated_files/flags/default/ad220873650bc9e4193cc98137be97d59ad05e1f .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/submodules/SCI" 
	@${RM} ${OBJECTDIR}/submodules/SCI/SCI.o.d 
	@${RM} ${OBJECTDIR}/submodules/SCI/SCI.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  submodules/SCI/SCI.c  -o ${OBJECTDIR}/submodules/SCI/SCI.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/submodules/SCI/SCI.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/submodules/SCI/SCICommands.o: submodules/SCI/SCICommands.c  .generated_files/flags/default/659ca7acf26d2098d3efc1a38a7acbc932761e80 .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/submodules/SCI" 
	@${RM} ${OBJECTDIR}/submodules/SCI/SCICommands.o.d 
	@${RM} ${OBJECTDIR}/submodules/SCI/SCICommands.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  submodules/SCI/SCICommands.c  -o ${OBJECTDIR}/submodules/SCI/SCICommands.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/submodules/SCI/SCICommands.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/submodules/SCI/VarAccess.o: submodules/SCI/VarAccess.c  .generated_files/flags/default/dbb4d144b11ebdb5d59a49f5ae66a017c837d23d .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/submodules/SCI" 
	@${RM} ${OBJECTDIR}/submodules/SCI/VarAccess.o.d 
	@${RM} ${OBJECTDIR}/submodules/SCI/VarAccess.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  submodules/SCI/VarAccess.c  -o ${OBJECTDIR}/submodules/SCI/VarAccess.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/submodules/SCI/VarAccess.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/clock.o: src/system/clock.c  .generated_files/flags/default/84eb3dbf2854e37476869dba3d0486fa1cfb4c11 .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/clock.o.d 
	@${RM} ${OBJECTDIR}/src/system/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/clock.c  -o ${OBJECTDIR}/src/system/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/clock.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/interrupt_manager.o: src/system/interrupt_manager.c  .generated_files/flags/default/e76d4a514aed18298dbcf7f69b9e0dba086cd1fe .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/src/system/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/interrupt_manager.c  -o ${OBJECTDIR}/src/system/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/interrupt_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/mcc.o: src/system/mcc.c  .generated_files/flags/default/e62739cf1f313ba1f21803f1be8d80c16ae876c2 .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/mcc.o.d 
	@${RM} ${OBJECTDIR}/src/system/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/mcc.c  -o ${OBJECTDIR}/src/system/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/mcc.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/pin_manager.o: src/system/pin_manager.c  .generated_files/flags/default/e9857788d0b8e9bcccc9abebaccdbc58e1afaeb3 .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/src/system/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/pin_manager.c  -o ${OBJECTDIR}/src/system/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/pin_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/reset.o: src/system/reset.c  .generated_files/flags/default/6117b7eb099cd2d952bcd7a22b9d39d59010a3e8 .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/reset.o.d 
	@${RM} ${OBJECTDIR}/src/system/reset.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/reset.c  -o ${OBJECTDIR}/src/system/reset.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/reset.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/system.o: src/system/system.c  .generated_files/flags/default/be6c6e4aa2d1d48665d94e9c5b8d4b58363a77b7 .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/system.o.d 
	@${RM} ${OBJECTDIR}/src/system/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/system.c  -o ${OBJECTDIR}/src/system/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/system.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/traps.o: src/system/traps.c  .generated_files/flags/default/7f0969076ccec42f72d0c04748ef3fe7b1ea9626 .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/traps.o.d 
	@${RM} ${OBJECTDIR}/src/system/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/traps.c  -o ${OBJECTDIR}/src/system/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/traps.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/uart1.o: src/system/uart1.c  .generated_files/flags/default/bdb924f5b540f1e942fdb2cdf454f1d41c138bb7 .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/uart1.o.d 
	@${RM} ${OBJECTDIR}/src/system/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/uart1.c  -o ${OBJECTDIR}/src/system/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/uart1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/dee.o: src/system/dee.c  .generated_files/flags/default/83c95786fb49f3323f403c5d00a4e2e8396b6366 .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/dee.o.d 
	@${RM} ${OBJECTDIR}/src/system/dee.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/dee.c  -o ${OBJECTDIR}/src/system/dee.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/dee.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/flash.o: src/system/flash.c  .generated_files/flags/default/6c0968b3db7d12cbdc8a86907cb893932796ff58 .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/flash.o.d 
	@${RM} ${OBJECTDIR}/src/system/flash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/flash.c  -o ${OBJECTDIR}/src/system/flash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/flash.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/CNC_DriveControl_App.o: src/CNC_DriveControl_App.c  .generated_files/flags/default/518f2666cf62384342f804235620e5cd10671bd7 .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/CNC_DriveControl_App.o.d 
	@${RM} ${OBJECTDIR}/src/CNC_DriveControl_App.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/CNC_DriveControl_App.c  -o ${OBJECTDIR}/src/CNC_DriveControl_App.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/CNC_DriveControl_App.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/DataAndControl.o: src/DataAndControl.c  .generated_files/flags/default/3ab31302e6f26dc488baf9bcc100255f7a6f28c1 .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/DataAndControl.o.d 
	@${RM} ${OBJECTDIR}/src/DataAndControl.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/DataAndControl.c  -o ${OBJECTDIR}/src/DataAndControl.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/DataAndControl.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/sccp1_tmr.o: src/system/sccp1_tmr.c  .generated_files/flags/default/7fc3597cfa5f7b4451713acbf3269ac839ede0da .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/sccp1_tmr.o.d 
	@${RM} ${OBJECTDIR}/src/system/sccp1_tmr.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/sccp1_tmr.c  -o ${OBJECTDIR}/src/system/sccp1_tmr.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/sccp1_tmr.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -mlarge-code -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/src/system/flash_asm.o: src/system/flash_asm.s  .generated_files/flags/default/b699b6760ebe6ad2a8bd510f7aee9bc73d603f2f .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/flash_asm.o.d 
	@${RM} ${OBJECTDIR}/src/system/flash_asm.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  src/system/flash_asm.s  -o ${OBJECTDIR}/src/system/flash_asm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  -I"src/system" -I"submodules/SCI" -Wa,-MD,"${OBJECTDIR}/src/system/flash_asm.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/src/system/flash_asm.o: src/system/flash_asm.s  .generated_files/flags/default/ab9bead023867fd8a4a6091690b21df267e1d122 .generated_files/flags/default/3ad145057a5ba658410a348e162900c413d77fe3
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/flash_asm.o.d 
	@${RM} ${OBJECTDIR}/src/system/flash_asm.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  src/system/flash_asm.s  -o ${OBJECTDIR}/src/system/flash_asm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  -I"src/system" -I"submodules/SCI" -Wa,-MD,"${OBJECTDIR}/src/system/flash_asm.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/CNC_DriveControl_App.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/CNC_DriveControl_App.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI"     -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,,$(MP_LINKER_FILE_OPTION),--heap=512,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/CNC_DriveControl_App.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/CNC_DriveControl_App.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--heap=512,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex ${DISTDIR}/CNC_DriveControl_App.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
