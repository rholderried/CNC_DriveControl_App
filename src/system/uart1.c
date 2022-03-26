/********************************************************************************//**
 * \file uart1.c
 * \author Roman Holderried
 *
 * \brief UART1 board support functions for the dsPIC33CH512MP508 device.
 *
 * <b> History </b>
 *      - 2020-04-02 - File creation. 
 *                     
 ***********************************************************************************/

#include <stdbool.h>
#include <stddef.h>
#include "xc.h"
#include "uart1.h"


/************************************************************************************
 * Global variable definitions
 ***********************************************************************************/
static UART1_t uart1Data = UART1_t_DEFAULT;

//===================================================================================
// Function: UART1_Initialize8N1
//===================================================================================
/********************************************************************************//**
 * \brief Initializes the UART interface for the serial communication.
 *
 * In order to compute the value for the Baud Rate Generator (BRG), the peripheral
 * clock frequency has to be known.
 ***********************************************************************************/

void UART1_initialize8N1(uint32_t ui32_baudrate, uint32_t ui32_Fosc, bool b_halfduplex)
{
    IEC0bits.U1TXIE = 0;
    IEC0bits.U1RXIE = 0;

    // URXEN disabled; RXBIMD RXBKIF flag when Break makes low-to-high transition after being low for at least 23/11 bit periods; UARTEN enabled; MOD Asynchronous 8-bit UART; UTXBRK disabled; BRKOVR TX line driven by shifter; UTXEN disabled; USIDL disabled; WAKE disabled; ABAUD disabled; BRGH enabled; 
    // Data Bits = 8; Parity = None; Stop Bits = 1 Stop bit sent, 1 checked at RX;
    U1MODE = (0x8080 & ~(1<<15));  // disabling UART ON bit

    // STSEL 1 Stop bit sent, 1 checked at RX; BCLKMOD disabled; SLPEN disabled; FLO Off; BCLKSEL FOSC; C0EN disabled; RUNOVF disabled; UTXINV disabled; URXINV disabled; HALFDPLX disabled; 
    U1MODEH = 0x0000;
    U1MODEHbits.BCLKMOD = 1;
    U1MODEHbits.HALFDPLX = b_halfduplex;
    U1MODEHbits.BCLKSEL1 = 1; // Take FOSC as input clk of the baud rate generator

    // OERIE disabled; RXBKIF disabled; RXBKIE disabled; ABDOVF disabled; OERR disabled; TXCIE disabled; TXCIF disabled; FERIE disabled; TXMTIE disabled; ABDOVE disabled; CERIE disabled; CERIF disabled; PERIE disabled; 
    U1STA = 0x00;

    // URXISEL RX_ONE_WORD; UTXBE enabled; UTXISEL TX_BUF_EMPTY; URXBE enabled; STPMD disabled; TXWRE disabled; 
    U1STAH = 0x22;

    // BaudRate = 115200; Frequency = 180000000 Hz; BRG 390; 
    U1BRG = ui32_Fosc/ui32_baudrate;

    // P1 0; 
    U1P1 = 0x00;
    // P2 0; 
    U1P2 = 0x00;
    // P3 0; 
    U1P3 = 0x00;
    // P3H 0; 
    U1P3H = 0x00;
    // TXCHK 0; 
    U1TXCHK = 0x00;
    // RXCHK 0; 
    U1RXCHK = 0x00;
    // T0PD 1 ETU; PTRCL disabled; TXRPT Retransmit the error byte once; CONV Direct logic; 
    U1SCCON = 0x00;
    // TXRPTIF disabled; TXRPTIE disabled; WTCIF disabled; WTCIE disabled; BTCIE disabled; BTCIF disabled; GTCIF disabled; GTCIE disabled; RXRPTIE disabled; RXRPTIF disabled; 
    U1SCINT = 0x00;
    // ABDIF disabled; WUIF disabled; ABDIE disabled; 
    U1INT = 0x00;

    IEC0bits.U1RXIE = 1;
    
    //Make sure to set LAT bit corresponding to TxPin as high before UART initialization
    U1MODEbits.UARTEN = 1;   // enabling UART ON bit
    U1MODEbits.UTXEN = 1;
    U1MODEbits.URXEN = 1;
}

/********************************************************************************//**
 * \brief RX Interrupt service routine for UART1
 ***********************************************************************************/
void __attribute__ ( ( interrupt, no_auto_psv ) ) _U1RXInterrupt( void )
{   
    IFS0bits.U1RXIF = 0;

    while(!(U1STAHbits.URXBE == 1))
    {
        uart1Data.receiveCallback((uint8_t)U1RXREGbits.RXREG);
    }
}

/********************************************************************************//**
 * \brief Receiver callback setter routine
 * 
 * @param targetCB  Receiver target to call on received symbol.
 ***********************************************************************************/
void UART1_setReceiver(RECEIVE_CB targetCB)
{
    uart1Data.receiveCallback = targetCB; 
}

//===================================================================================
// Function: UART1_writeBlocking
//===================================================================================
/********************************************************************************//**
 * \brief Sends one byte of data via the UART interface.
 *
 * @param *pui8_buf Data buffer holding data to be sent
 * @param ui8_size  Size of the data to be sent
 ***********************************************************************************/
void UART1_writeBlocking(uint8_t *pui8_buf, uint8_t ui8_size)
{
    while(ui8_size > 0)
    {
        while(!U1STAHbits.UTXBE);
        
        U1TXREGbits.TXREG = *pui8_buf++;

        ui8_size--;
    }
}
