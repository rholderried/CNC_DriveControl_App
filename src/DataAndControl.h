/**************************************************************************//**
 * \file DataAndControl.h
 * \author Roman Holderried
 *
 * \brief Data and Control declarations.
 *
 * <b> History </b>
 * 	- 2022-03-26 - File creation 
 *****************************************************************************/

#ifndef _DATA_AND_CONTROL_H_
#define _DATA_AND_CONTROL_H_

/******************************************************************************
 * Includes
 *****************************************************************************/
#include <stdint.h>
#include <stdbool.h>
#include "Variables.h"
#include "CommandStucture.h"
/******************************************************************************
 * Function declarations
 *****************************************************************************/
bool writeEEPROM(uint32_t ui32_val, uint16_t ui16_address);
bool readEEPROM(uint32_t *pui32_val, uint16_t ui16_address);
/******************************************************************************
 * Global variable declarations
 *****************************************************************************/
extern VAR varStruct[];
extern COMMAND_CB cmdStruct[];

#endif //_DATA_AND_CONTROL_H_