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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/CNC_DriveControl_App.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/CNC_DriveControl_App.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=src/CNC_DriveControl_App.c submodules/SCI/Buffer.c submodules/SCI/Datalink.c submodules/SCI/Helpers.c submodules/SCI/SCI.c submodules/SCI/SCICommands.c submodules/SCI/VarAccess.c src/system/clock.c src/system/interrupt_manager.c src/system/mcc.c src/system/pin_manager.c src/system/reset.c src/system/system.c src/system/traps.c src/system/uart1.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/src/CNC_DriveControl_App.o ${OBJECTDIR}/submodules/SCI/Buffer.o ${OBJECTDIR}/submodules/SCI/Datalink.o ${OBJECTDIR}/submodules/SCI/Helpers.o ${OBJECTDIR}/submodules/SCI/SCI.o ${OBJECTDIR}/submodules/SCI/SCICommands.o ${OBJECTDIR}/submodules/SCI/VarAccess.o ${OBJECTDIR}/src/system/clock.o ${OBJECTDIR}/src/system/interrupt_manager.o ${OBJECTDIR}/src/system/mcc.o ${OBJECTDIR}/src/system/pin_manager.o ${OBJECTDIR}/src/system/reset.o ${OBJECTDIR}/src/system/system.o ${OBJECTDIR}/src/system/traps.o ${OBJECTDIR}/src/system/uart1.o
POSSIBLE_DEPFILES=${OBJECTDIR}/src/CNC_DriveControl_App.o.d ${OBJECTDIR}/submodules/SCI/Buffer.o.d ${OBJECTDIR}/submodules/SCI/Datalink.o.d ${OBJECTDIR}/submodules/SCI/Helpers.o.d ${OBJECTDIR}/submodules/SCI/SCI.o.d ${OBJECTDIR}/submodules/SCI/SCICommands.o.d ${OBJECTDIR}/submodules/SCI/VarAccess.o.d ${OBJECTDIR}/src/system/clock.o.d ${OBJECTDIR}/src/system/interrupt_manager.o.d ${OBJECTDIR}/src/system/mcc.o.d ${OBJECTDIR}/src/system/pin_manager.o.d ${OBJECTDIR}/src/system/reset.o.d ${OBJECTDIR}/src/system/system.o.d ${OBJECTDIR}/src/system/traps.o.d ${OBJECTDIR}/src/system/uart1.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/src/CNC_DriveControl_App.o ${OBJECTDIR}/submodules/SCI/Buffer.o ${OBJECTDIR}/submodules/SCI/Datalink.o ${OBJECTDIR}/submodules/SCI/Helpers.o ${OBJECTDIR}/submodules/SCI/SCI.o ${OBJECTDIR}/submodules/SCI/SCICommands.o ${OBJECTDIR}/submodules/SCI/VarAccess.o ${OBJECTDIR}/src/system/clock.o ${OBJECTDIR}/src/system/interrupt_manager.o ${OBJECTDIR}/src/system/mcc.o ${OBJECTDIR}/src/system/pin_manager.o ${OBJECTDIR}/src/system/reset.o ${OBJECTDIR}/src/system/system.o ${OBJECTDIR}/src/system/traps.o ${OBJECTDIR}/src/system/uart1.o

# Source Files
SOURCEFILES=src/CNC_DriveControl_App.c submodules/SCI/Buffer.c submodules/SCI/Datalink.c submodules/SCI/Helpers.c submodules/SCI/SCI.c submodules/SCI/SCICommands.c submodules/SCI/VarAccess.c src/system/clock.c src/system/interrupt_manager.c src/system/mcc.c src/system/pin_manager.c src/system/reset.c src/system/system.c src/system/traps.c src/system/uart1.c



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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/CNC_DriveControl_App.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33CH512MP508
MP_LINKER_FILE_OPTION=,--script=p33CH512MP508.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/src/CNC_DriveControl_App.o: src/CNC_DriveControl_App.c  .generated_files/aed1325d53a65adc0eecb14e6bd16bba726a8656.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/CNC_DriveControl_App.o.d 
	@${RM} ${OBJECTDIR}/src/CNC_DriveControl_App.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/CNC_DriveControl_App.c  -o ${OBJECTDIR}/src/CNC_DriveControl_App.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/CNC_DriveControl_App.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/submodules/SCI/Buffer.o: submodules/SCI/Buffer.c  .generated_files/76db848614be749f62ee70c9d1566ad9cec3de2f.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/submodules/SCI" 
	@${RM} ${OBJECTDIR}/submodules/SCI/Buffer.o.d 
	@${RM} ${OBJECTDIR}/submodules/SCI/Buffer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  submodules/SCI/Buffer.c  -o ${OBJECTDIR}/submodules/SCI/Buffer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/submodules/SCI/Buffer.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/submodules/SCI/Datalink.o: submodules/SCI/Datalink.c  .generated_files/6ef74eb8459179f0a2957e8c928963896df31325.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/submodules/SCI" 
	@${RM} ${OBJECTDIR}/submodules/SCI/Datalink.o.d 
	@${RM} ${OBJECTDIR}/submodules/SCI/Datalink.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  submodules/SCI/Datalink.c  -o ${OBJECTDIR}/submodules/SCI/Datalink.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/submodules/SCI/Datalink.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/submodules/SCI/Helpers.o: submodules/SCI/Helpers.c  .generated_files/4acd28abd14b39b1dc20e806535fd7dc0e5d6248.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/submodules/SCI" 
	@${RM} ${OBJECTDIR}/submodules/SCI/Helpers.o.d 
	@${RM} ${OBJECTDIR}/submodules/SCI/Helpers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  submodules/SCI/Helpers.c  -o ${OBJECTDIR}/submodules/SCI/Helpers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/submodules/SCI/Helpers.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/submodules/SCI/SCI.o: submodules/SCI/SCI.c  .generated_files/682ccad667389c9913f07a929cc18523ebc2e6aa.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/submodules/SCI" 
	@${RM} ${OBJECTDIR}/submodules/SCI/SCI.o.d 
	@${RM} ${OBJECTDIR}/submodules/SCI/SCI.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  submodules/SCI/SCI.c  -o ${OBJECTDIR}/submodules/SCI/SCI.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/submodules/SCI/SCI.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/submodules/SCI/SCICommands.o: submodules/SCI/SCICommands.c  .generated_files/4f82a057c828b59ee54c518c3b17695a97c36fbe.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/submodules/SCI" 
	@${RM} ${OBJECTDIR}/submodules/SCI/SCICommands.o.d 
	@${RM} ${OBJECTDIR}/submodules/SCI/SCICommands.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  submodules/SCI/SCICommands.c  -o ${OBJECTDIR}/submodules/SCI/SCICommands.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/submodules/SCI/SCICommands.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/submodules/SCI/VarAccess.o: submodules/SCI/VarAccess.c  .generated_files/df2ac450283787cd5ee7c2ffb8423e6bc0778120.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/submodules/SCI" 
	@${RM} ${OBJECTDIR}/submodules/SCI/VarAccess.o.d 
	@${RM} ${OBJECTDIR}/submodules/SCI/VarAccess.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  submodules/SCI/VarAccess.c  -o ${OBJECTDIR}/submodules/SCI/VarAccess.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/submodules/SCI/VarAccess.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/clock.o: src/system/clock.c  .generated_files/acc79670c1fc6dbe6fba1ec1363e3e05bc56a38f.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/clock.o.d 
	@${RM} ${OBJECTDIR}/src/system/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/clock.c  -o ${OBJECTDIR}/src/system/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/clock.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/interrupt_manager.o: src/system/interrupt_manager.c  .generated_files/7a100b904ba971e1bc85067823a655df7a140c07.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/src/system/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/interrupt_manager.c  -o ${OBJECTDIR}/src/system/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/interrupt_manager.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/mcc.o: src/system/mcc.c  .generated_files/4bf8ffaffec5d076ebc7e9c2e60f512e0012bce4.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/mcc.o.d 
	@${RM} ${OBJECTDIR}/src/system/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/mcc.c  -o ${OBJECTDIR}/src/system/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/mcc.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/pin_manager.o: src/system/pin_manager.c  .generated_files/2ce04b7e21a9dc4e724e32dace324e908e22f42a.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/src/system/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/pin_manager.c  -o ${OBJECTDIR}/src/system/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/pin_manager.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/reset.o: src/system/reset.c  .generated_files/b24264e7d8154e0f93c81b338b1b65de07e8abb.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/reset.o.d 
	@${RM} ${OBJECTDIR}/src/system/reset.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/reset.c  -o ${OBJECTDIR}/src/system/reset.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/reset.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/system.o: src/system/system.c  .generated_files/9f1cce20d63d37f79fe3d61e2c9c576d0389814f.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/system.o.d 
	@${RM} ${OBJECTDIR}/src/system/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/system.c  -o ${OBJECTDIR}/src/system/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/system.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/traps.o: src/system/traps.c  .generated_files/be3f20b836f5d301879d011b7a24baf77f193885.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/traps.o.d 
	@${RM} ${OBJECTDIR}/src/system/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/traps.c  -o ${OBJECTDIR}/src/system/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/traps.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/uart1.o: src/system/uart1.c  .generated_files/40e9df4616b4551a2eb131a39c8bd124682d1ed9.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/uart1.o.d 
	@${RM} ${OBJECTDIR}/src/system/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/uart1.c  -o ${OBJECTDIR}/src/system/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/uart1.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/src/CNC_DriveControl_App.o: src/CNC_DriveControl_App.c  .generated_files/e4d2da1285103ce68278b76fc32bd458d164d3db.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/CNC_DriveControl_App.o.d 
	@${RM} ${OBJECTDIR}/src/CNC_DriveControl_App.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/CNC_DriveControl_App.c  -o ${OBJECTDIR}/src/CNC_DriveControl_App.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/CNC_DriveControl_App.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/submodules/SCI/Buffer.o: submodules/SCI/Buffer.c  .generated_files/f77352edfd328aca73b1afa4ddca1fda94ee1d84.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/submodules/SCI" 
	@${RM} ${OBJECTDIR}/submodules/SCI/Buffer.o.d 
	@${RM} ${OBJECTDIR}/submodules/SCI/Buffer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  submodules/SCI/Buffer.c  -o ${OBJECTDIR}/submodules/SCI/Buffer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/submodules/SCI/Buffer.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/submodules/SCI/Datalink.o: submodules/SCI/Datalink.c  .generated_files/62099a5ef689c06cc561a9b437820a6f8179cf95.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/submodules/SCI" 
	@${RM} ${OBJECTDIR}/submodules/SCI/Datalink.o.d 
	@${RM} ${OBJECTDIR}/submodules/SCI/Datalink.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  submodules/SCI/Datalink.c  -o ${OBJECTDIR}/submodules/SCI/Datalink.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/submodules/SCI/Datalink.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/submodules/SCI/Helpers.o: submodules/SCI/Helpers.c  .generated_files/75638d84bdb05b4092e40d9eede40468acf8c411.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/submodules/SCI" 
	@${RM} ${OBJECTDIR}/submodules/SCI/Helpers.o.d 
	@${RM} ${OBJECTDIR}/submodules/SCI/Helpers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  submodules/SCI/Helpers.c  -o ${OBJECTDIR}/submodules/SCI/Helpers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/submodules/SCI/Helpers.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/submodules/SCI/SCI.o: submodules/SCI/SCI.c  .generated_files/fb2661255d61da8393a08258d002473ed3e5df66.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/submodules/SCI" 
	@${RM} ${OBJECTDIR}/submodules/SCI/SCI.o.d 
	@${RM} ${OBJECTDIR}/submodules/SCI/SCI.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  submodules/SCI/SCI.c  -o ${OBJECTDIR}/submodules/SCI/SCI.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/submodules/SCI/SCI.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/submodules/SCI/SCICommands.o: submodules/SCI/SCICommands.c  .generated_files/ebd3bb7454a62fcaaac867e52c1d12d3f06433d7.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/submodules/SCI" 
	@${RM} ${OBJECTDIR}/submodules/SCI/SCICommands.o.d 
	@${RM} ${OBJECTDIR}/submodules/SCI/SCICommands.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  submodules/SCI/SCICommands.c  -o ${OBJECTDIR}/submodules/SCI/SCICommands.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/submodules/SCI/SCICommands.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/submodules/SCI/VarAccess.o: submodules/SCI/VarAccess.c  .generated_files/d2f66467e5d1c155faec72c7422542a838c32507.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/submodules/SCI" 
	@${RM} ${OBJECTDIR}/submodules/SCI/VarAccess.o.d 
	@${RM} ${OBJECTDIR}/submodules/SCI/VarAccess.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  submodules/SCI/VarAccess.c  -o ${OBJECTDIR}/submodules/SCI/VarAccess.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/submodules/SCI/VarAccess.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/clock.o: src/system/clock.c  .generated_files/d79e31c46387358709386a351eb5431a535ea6d3.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/clock.o.d 
	@${RM} ${OBJECTDIR}/src/system/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/clock.c  -o ${OBJECTDIR}/src/system/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/clock.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/interrupt_manager.o: src/system/interrupt_manager.c  .generated_files/cd7d3bc1116ce6b1a73c20bc04afc281e32858d7.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/src/system/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/interrupt_manager.c  -o ${OBJECTDIR}/src/system/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/interrupt_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/mcc.o: src/system/mcc.c  .generated_files/514598c60ae0585ff6008acbdf6a29d03d2244ca.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/mcc.o.d 
	@${RM} ${OBJECTDIR}/src/system/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/mcc.c  -o ${OBJECTDIR}/src/system/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/mcc.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/pin_manager.o: src/system/pin_manager.c  .generated_files/81d71220aa02ec7af99c6149e9eb32ef3f19cf51.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/src/system/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/pin_manager.c  -o ${OBJECTDIR}/src/system/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/pin_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/reset.o: src/system/reset.c  .generated_files/e040272269e52101c9705b1c942cf4b6a8f4874a.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/reset.o.d 
	@${RM} ${OBJECTDIR}/src/system/reset.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/reset.c  -o ${OBJECTDIR}/src/system/reset.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/reset.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/system.o: src/system/system.c  .generated_files/e66a23d6ecd350144595b236e0ec7ebc37aa9314.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/system.o.d 
	@${RM} ${OBJECTDIR}/src/system/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/system.c  -o ${OBJECTDIR}/src/system/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/system.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/traps.o: src/system/traps.c  .generated_files/98e9da1135835f1bbd0c39f55df7e88de5213a42.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/traps.o.d 
	@${RM} ${OBJECTDIR}/src/system/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/traps.c  -o ${OBJECTDIR}/src/system/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/traps.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/uart1.o: src/system/uart1.c  .generated_files/8c205a9c34d95c0e5bef3f6348d12c124b8a6a9b.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/uart1.o.d 
	@${RM} ${OBJECTDIR}/src/system/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/uart1.c  -o ${OBJECTDIR}/src/system/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/uart1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -O0 -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp="${DFP_DIR}/xc16"
	
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
dist/${CND_CONF}/${IMAGE_TYPE}/CNC_DriveControl_App.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/CNC_DriveControl_App.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI"  -mreserve=data@0x1000:0x101B -mreserve=data@0x101C:0x101D -mreserve=data@0x101E:0x101F -mreserve=data@0x1020:0x1021 -mreserve=data@0x1022:0x1023 -mreserve=data@0x1024:0x1027 -mreserve=data@0x1028:0x104F   -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/CNC_DriveControl_App.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/CNC_DriveControl_App.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -I"submodules/SCI" -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/CNC_DriveControl_App.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
