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
#include <stdlib.h>
#include "Variables.h"
#include "CommandStucture.h"
#include "SCIconfig.h"
#include "DataloggerSCI.h"
#include "dee.h"
//#include "DataAndControl.h"

uint16_t ui16_testvar = 3;
uint8_t ui8_test = 245;
uint16_t ui16_test = 34534;
uint32_t i32_test = -87344381;
float   f_test = 2.4533;

uint8_t ui8_buf[50] = {0xFF};


DTYPE e_dtypeArr[] = {eDTYPE_F32};
const VAR varStruct[SIZE_OF_VAR_STRUCT] = 
{   {(void*)&ui16_testvar, eVARTYPE_RAM, eDTYPE_UINT16, NULL},  // Number 1
    {(void*)&f_test, eVARTYPE_RAM, eDTYPE_F32, NULL},           // Number 2
    {(void*)&ui8_test, eVARTYPE_RAM, eDTYPE_UINT8, NULL},       // Number 3
    {(void*)&ui16_test, eVARTYPE_RAM, eDTYPE_UINT16, NULL},     // Number 4
    {(void*)&i32_test, eVARTYPE_EEPROM, eDTYPE_INT32, NULL}};   // Number 5};

/******************************************************************************
 * Callbacks
 *****************************************************************************/
bool writeEEPROM(uint32_t ui32_val, uint16_t ui16_address)
{
    DEE_RETURN_STATUS stat = DEE_NO_ERROR;
    bool b_success = false;

    stat = DEE_Write(ui16_address, (uint16_t)ui32_val);

    if (stat == DEE_NO_ERROR)
        b_success = true;

    return b_success;
}

bool readEEPROM(uint32_t *pui32_val, uint16_t ui16_address)
{
    DEE_RETURN_STATUS stat = DEE_NO_ERROR;
    bool b_success = false;

    stat = DEE_Read(ui16_address, (uint16_t*)pui32_val);

    if (stat == DEE_NO_ERROR)
        b_success = true;

    return b_success;
}
/******************************************************************************
 * Command Function definitions
 *****************************************************************************/
COMMAND_CB_STATUS helloWorld(uint32_t* ui32_valArray, uint8_t ui8_valArrayLen, PROCESS_INFO *p_info)
{
    p_info->pui8_upStreamBuf = ui8_buf;
    p_info->ui32_datLen = 50;
    p_info->ui8_infoFlagBits.dataBufDynamic = false;

    if (ui8_valArrayLen > 1)
        ui16_testvar = ui32_valArray[1];
    else if (ui8_valArrayLen > 0)
        ui16_testvar = ui32_valArray[0];

    return eCOMMAND_STATUS_SUCCESS_UPSTREAM;
}

COMMAND_CB_STATUS helloWorld2(uint32_t* ui32_valArray, uint8_t ui8_valArrayLen, PROCESS_INFO *p_info)
{
    uint32_t *pui32_buf = (uint32_t*)malloc(10 * sizeof(float));
    float f_val = 0.0;

    for (uint8_t i = 0; i < 10; i++)
    {
        f_val = 0.5f + i;
        pui32_buf[i] = *(uint32_t*)&f_val;
    }

    p_info->pui32_dataBuf = pui32_buf;
    p_info->ui32_datLen = 10;
    p_info->ui8_infoFlagBits.dataBufDynamic = true;

    if (ui8_valArrayLen > 1)
        ui16_testvar = ui32_valArray[1];
    else if (ui8_valArrayLen > 0)
        ui16_testvar = ui32_valArray[0];

    return eCOMMAND_STATUS_SUCCESS_DATA;
}
/******************************************************************************
 * Command Structure definition
 *****************************************************************************/
const COMMAND_CB cmdStruct[SIZE_OF_CMD_STRUCT] = 
{   GetDataloggerVersion, 
    RegisterLogFromVarStruct,  
    InitializeDatalogger,
    StartDatalogger,
    StopDatalogger,
    GetLogData,
    GetChannelInfo,
    ResetDatalogger,
    helloWorld, 
    helloWorld2};