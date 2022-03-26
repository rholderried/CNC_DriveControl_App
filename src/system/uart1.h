/********************************************************************************//**
 * \file uart.h
 * \author Roman Holderried
 *
 * \brief typedefs, declarations...
 *
 * <b> History </b>
 *      - 2020-04-02 - File creation
 *                     
 ***********************************************************************************/
#ifndef _UART1_H
#define _UART1_H


/************************************************************************************
 * Includes
 ***********************************************************************************/
#include <stdbool.h>
#include <stdint.h>
#include <stddef.h>

#ifdef __cplusplus  // Provide C++ Compatibility
    extern "C" {
#endif

/************************************************************************************
 * Type definitions
 ***********************************************************************************/
typedef void(*RECEIVE_CB)(uint8_t);

typedef struct
{
    RECEIVE_CB receiveCallback;
}UART1_t;

#define UART1_t_DEFAULT {NULL};


/************************************************************************************
 * Function declarations
 ***********************************************************************************/
void UART1_initialize8N1(uint32_t baudrate, uint32_t ui32_Fosc, bool b_halfduplex);
void UART1_writeBlocking(uint8_t *pui8_buf, uint8_t ui8_size);
void UART1_setReceiver(RECEIVE_CB targetCB);

#ifdef __cplusplus  // Provide C++ Compatibility
    }
#endif

#endif //_UART1_H
