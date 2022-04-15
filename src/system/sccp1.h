/**************************************************************************//**
 * \file sccp1.h
 * \author Microchip MCC, Roman Holderried
 *
 * \brief SCCP1 timer module.
 * 
 * This file is originally derived from the MCC peripheral driver by Microchip.
 *
 * <b> History </b>
 * 	- 2022-04-15 - File creation
 *****************************************************************************/

#ifndef _SCCP1_H_
#define _SCCP1_H_

/******************************************************************************
 * Includes
 *****************************************************************************/

#include <xc.h> 
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>

/******************************************************************************
 * Config section
 *****************************************************************************/
// TODO: Basic config as defines


#ifdef __cplusplus  // Provide C++ Compatibility

    extern "C" {

#endif

/******************************************************************************
 * Type definitions
 *****************************************************************************/
typedef void (*tTIMERCB)(void);

typedef struct
{
  tTIMERCB  primeTmrCb;
  tTIMERCB  secTmrCb;
}tSCCP1;

#define tSCCP1_DEFAULTS {NULL, NULL}
/******************************************************************************
 * Function declarations
 *****************************************************************************/
/**\brief SCCP1 gets used as dual timer, the secondary timer is to be initialized*/
void SCCP1_Initialize(void);

void SCCP1_TMR_Start( void );

void SCCP1_TMR_Stop( void );

void SCCP1_TMR_Period16BitPrimarySet( uint16_t value );
 
void SCCP1_TMR_Period16BitSecondarySet( uint16_t value );

uint16_t SCCP1_TMR_Period16BitPrimaryGet( void );

uint16_t SCCP1_TMR_Period16BitSecondaryGet( void );

void SCCP1_TMR_Counter16BitPrimarySet ( uint16_t value );

void SCCP1_TMR_Counter16BitSecondarySet( uint16_t value );

uint16_t SCCP1_TMR_Counter16BitPrimaryGet( void );

uint16_t SCCP1_TMR_Counter16BitSecondaryGet( void );

#endif // _SCCP1_H_
