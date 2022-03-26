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
SOURCEFILES_QUOTED_IF_SPACED=src/CNC_DriveControl_App.c src/system/clock.c src/system/interrupt_manager.c src/system/mcc.c src/system/pin_manager.c src/system/reset.c src/system/system.c src/system/traps.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/src/CNC_DriveControl_App.o ${OBJECTDIR}/src/system/clock.o ${OBJECTDIR}/src/system/interrupt_manager.o ${OBJECTDIR}/src/system/mcc.o ${OBJECTDIR}/src/system/pin_manager.o ${OBJECTDIR}/src/system/reset.o ${OBJECTDIR}/src/system/system.o ${OBJECTDIR}/src/system/traps.o
POSSIBLE_DEPFILES=${OBJECTDIR}/src/CNC_DriveControl_App.o.d ${OBJECTDIR}/src/system/clock.o.d ${OBJECTDIR}/src/system/interrupt_manager.o.d ${OBJECTDIR}/src/system/mcc.o.d ${OBJECTDIR}/src/system/pin_manager.o.d ${OBJECTDIR}/src/system/reset.o.d ${OBJECTDIR}/src/system/system.o.d ${OBJECTDIR}/src/system/traps.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/src/CNC_DriveControl_App.o ${OBJECTDIR}/src/system/clock.o ${OBJECTDIR}/src/system/interrupt_manager.o ${OBJECTDIR}/src/system/mcc.o ${OBJECTDIR}/src/system/pin_manager.o ${OBJECTDIR}/src/system/reset.o ${OBJECTDIR}/src/system/system.o ${OBJECTDIR}/src/system/traps.o

# Source Files
SOURCEFILES=src/CNC_DriveControl_App.c src/system/clock.c src/system/interrupt_manager.c src/system/mcc.c src/system/pin_manager.c src/system/reset.c src/system/system.c src/system/traps.c



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

MP_PROCESSOR_OPTION=33CH128MP508
MP_LINKER_FILE_OPTION=,--script=p33CH128MP508.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/src/CNC_DriveControl_App.o: src/CNC_DriveControl_App.c  .generated_files/dd344046d60a886320b45f54af11cf315eba332.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/CNC_DriveControl_App.o.d 
	@${RM} ${OBJECTDIR}/src/CNC_DriveControl_App.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/CNC_DriveControl_App.c  -o ${OBJECTDIR}/src/CNC_DriveControl_App.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/CNC_DriveControl_App.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/clock.o: src/system/clock.c  .generated_files/b47118fedb0810672f30f4565ef3f92435cfc096.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/clock.o.d 
	@${RM} ${OBJECTDIR}/src/system/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/clock.c  -o ${OBJECTDIR}/src/system/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/clock.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/interrupt_manager.o: src/system/interrupt_manager.c  .generated_files/4d097e8ec8406518ada577880ee867615adba47b.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/src/system/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/interrupt_manager.c  -o ${OBJECTDIR}/src/system/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/interrupt_manager.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/mcc.o: src/system/mcc.c  .generated_files/22122352e6cfe479de27ae8fcb3100e4b8b2bb0b.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/mcc.o.d 
	@${RM} ${OBJECTDIR}/src/system/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/mcc.c  -o ${OBJECTDIR}/src/system/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/mcc.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/pin_manager.o: src/system/pin_manager.c  .generated_files/ab9eb85e0f37ebe993d4236d3ee21cddc13c3027.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/src/system/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/pin_manager.c  -o ${OBJECTDIR}/src/system/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/pin_manager.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/reset.o: src/system/reset.c  .generated_files/73ee707079bb84d253f053ecbb270e814e6dd0fd.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/reset.o.d 
	@${RM} ${OBJECTDIR}/src/system/reset.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/reset.c  -o ${OBJECTDIR}/src/system/reset.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/reset.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/system.o: src/system/system.c  .generated_files/1d641584d02870021501e4a3fa48ae556bb58802.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/system.o.d 
	@${RM} ${OBJECTDIR}/src/system/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/system.c  -o ${OBJECTDIR}/src/system/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/system.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/traps.o: src/system/traps.c  .generated_files/c117faaf99f15fc1409cfa6873976103b80e2fbd.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/traps.o.d 
	@${RM} ${OBJECTDIR}/src/system/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/traps.c  -o ${OBJECTDIR}/src/system/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/traps.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/src/CNC_DriveControl_App.o: src/CNC_DriveControl_App.c  .generated_files/ba5a62257e2c4bd3eb899a58bbe92996a4f228b3.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/CNC_DriveControl_App.o.d 
	@${RM} ${OBJECTDIR}/src/CNC_DriveControl_App.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/CNC_DriveControl_App.c  -o ${OBJECTDIR}/src/CNC_DriveControl_App.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/CNC_DriveControl_App.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/clock.o: src/system/clock.c  .generated_files/d734d0a1941ec2500a4ed2a040c023fa29af4640.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/clock.o.d 
	@${RM} ${OBJECTDIR}/src/system/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/clock.c  -o ${OBJECTDIR}/src/system/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/clock.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/interrupt_manager.o: src/system/interrupt_manager.c  .generated_files/3154e2b81bb20b4c1ea41b08f447a50e8b2c1715.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/src/system/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/interrupt_manager.c  -o ${OBJECTDIR}/src/system/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/interrupt_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/mcc.o: src/system/mcc.c  .generated_files/d9272e74dbb831a599ec612a97d5ad4feaf23f1b.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/mcc.o.d 
	@${RM} ${OBJECTDIR}/src/system/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/mcc.c  -o ${OBJECTDIR}/src/system/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/mcc.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/pin_manager.o: src/system/pin_manager.c  .generated_files/71c0d67979a7991cd14ec423bedc92ab15d2fffa.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/src/system/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/pin_manager.c  -o ${OBJECTDIR}/src/system/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/pin_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/reset.o: src/system/reset.c  .generated_files/b56130ea077e4eb3a48126f44a4decd7bbdb7b81.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/reset.o.d 
	@${RM} ${OBJECTDIR}/src/system/reset.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/reset.c  -o ${OBJECTDIR}/src/system/reset.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/reset.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/system.o: src/system/system.c  .generated_files/eaae9a0c27fbd53c672db5c15e089fefa1efbd34.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/system.o.d 
	@${RM} ${OBJECTDIR}/src/system/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/system.c  -o ${OBJECTDIR}/src/system/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/system.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/src/system/traps.o: src/system/traps.c  .generated_files/204b471e88e2949db730789488e283a211bb18f2.flag .generated_files/fcfce899a0ab15069a934fac85e808e120e313a8.flag
	@${MKDIR} "${OBJECTDIR}/src/system" 
	@${RM} ${OBJECTDIR}/src/system/traps.o.d 
	@${RM} ${OBJECTDIR}/src/system/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/system/traps.c  -o ${OBJECTDIR}/src/system/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/src/system/traps.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
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
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/CNC_DriveControl_App.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system"  -mreserve=data@0x1000:0x101B -mreserve=data@0x101C:0x101D -mreserve=data@0x101E:0x101F -mreserve=data@0x1020:0x1021 -mreserve=data@0x1022:0x1023 -mreserve=data@0x1024:0x1027 -mreserve=data@0x1028:0x104F   -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/CNC_DriveControl_App.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/CNC_DriveControl_App.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"src/system" -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
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
