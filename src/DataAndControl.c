/**************************************************************************//**
 * \file DataAndControl.c
 * \author Roman Holderried
 *
 * \brief Data and Control structures for the SCI.
 *
 * <b> History </b>
 * 	- 2022-03-26 - File creation 
 *****************************************************************************/


/******************************************************************************
 * Include
 *****************************************************************************/
#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include "Variables.h"
#include "CommandStucture.h"
#include "SCIconfig.h"
//#include "DataAndControl.h"

uint16_t ui16_testvar = 3;

const VAR varStruct[SIZE_OF_VAR_STRUCT] = 
{{(void*)&ui16_testvar, eVARTYPE_RAM, eDTYPE_UINT16, NULL}};

/******************************************************************************
 * Command Function definitions
 *****************************************************************************/
bool helloWorld(float* pf_valArray, uint8_t ui8_valArrayLen)
{
    if (ui8_valArrayLen > 1)
        ui16_testvar = pf_valArray[1];
    else if (ui8_valArrayLen > 0)
        ui16_testvar = pf_valArray[0];

    return true;
}

/******************************************************************************
 * Command Structure definition
 *****************************************************************************/
const COMMAND_CB cmdStruct[SIZE_OF_CMD_STRUCT] = 
{helloWorld};