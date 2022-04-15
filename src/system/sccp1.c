/**************************************************************************//**
 * \file sccp1.c
 * \author Microchip MCC, Roman Holderried
 *
 * \brief SCCP1 timer module driver function definitions.
 * 
 * This file is originally derived from the MCC peripheral driver by Microchip.
 *
 * <b> History </b>
 * 	- 2022-04-15 - File creation
 * 
 * TODOs:
 * ------
 * - Define a callback initializer function.
 *****************************************************************************/


/******************************************************************************
 * Includes
 *****************************************************************************/
#include "sccp1.h"
#include <stdint.h>
#include <stdlib.h>

/******************************************************************************
 * Global variables
 *****************************************************************************/
static tSCCP1 sSCCP1 = tSCCP1_DEFAULTS;

/******************************************************************************
 * Function definitions
 *****************************************************************************/
void SCCP1_Initialize(void)
{
    // CCPON enabled; MOD 16-Bit/32-Bit Timer; CCSEL disabled; CCPSIDL disabled; T32 16 Bit; CCPSLP disabled; TMRPS 1:4; CLKSEL FOSC/2; TMRSYNC disabled; 
    CCP1CON1L = (0x8040 & 0x7FFF); //Disabling CCPON bit
    //RTRGEN disabled; ALTSYNC disabled; ONESHOT disabled; TRIGEN disabled; OPS Each Time Base Period Match; SYNC None; OPSSRC Timer Interrupt Event; 
    CCP1CON1H = 0x00;
    //ASDGM disabled; SSDG disabled; ASDG 0; PWMRSEN disabled; 
    CCP1CON2L = 0x00;
    //ICGSM Level-Sensitive mode; ICSEL IC1; AUXOUT Disabled; OCAEN disabled; OENSYNC disabled; 
    CCP1CON2H = 0x00;
    //OETRIG disabled; OSCNT None; POLACE disabled; PSSACE Tri-state; 
    CCP1CON3H = 0x00;
    //ICDIS disabled; SCEVT disabled; TRSET disabled; ICOV disabled; ASEVT disabled; ICGARM disabled; TRCLR disabled; 
    CCP1STATL = 0x00;
    //TMR 0; 
    CCP1TMRL = 0x00;
    //TMR 0; 
    CCP1TMRH = 0x00;
    //PR 0; 
    CCP1PRL = 0x00;
    //PR 22500; 
    CCP1PRH = 0x57E4;
    //CMP 0; 
    CCP1RA = 0x00;
    //CMP 0; 
    CCP1RB = 0x00;
    //BUF 0; 
    CCP1BUFL = 0x00;
    //BUF 0; 
    CCP1BUFH = 0x00;

    //CCP1CON1Lbits.CCPON = 0x1; //Enabling CCP

    // Reset the interrupt signals
    IFS0bits.CCP1IF = 0;
    IFS0bits.CCT1IF = 0;
      

    // Enabling SCCP1 interrupt.
    IEC0bits.CCT1IE = 1;

}

//=============================================================================
void SCCP1_Start( void )
{
    /* Start the Timer */
    CCP1CON1Lbits.CCPON = true;
}

//=============================================================================
void SCCP1_TMR_Stop( void )
{
    /* Stop the Timer */
    CCP1CON1Lbits.CCPON = false;
}

//=============================================================================
void __attribute__ ( ( interrupt, no_auto_psv ) ) _CCT1Interrupt ( void )
{
    /* Check if the Timer Interrupt/Status is set */
    if(IFS0bits.CCT1IF)
    {         
		// SCCP1 Primary Timer callback function 
        if (sSCCP1.primeTmrCb != NULL)
		    sSCCP1.primeTmrCb();
        
        // Reset the interrupt signal
        IFS0bits.CCT1IF = 0;
    }
}

//=============================================================================
void __attribute__ ( ( interrupt, no_auto_psv ) ) _CCP1Interrupt ( void )
{
    /* Check if the Timer Interrupt/Status is set */
    if(IFS0bits.CCP1IF)
    {         
		// SCCP1 Primary Timer callback function 
        if (sSCCP1.secTmrCb != NULL)
		    sSCCP1.secTmrCb();
        
        // Reset the interrupt signal
        IFS0bits.CCP1IF = 0;
    }
}


//=============================================================================
void SCCP1_TMR_Period16BitPrimarySet( uint16_t value )
{
    /* Update the counter values */
    CCP1PRL = value;
}

//=============================================================================
void SCCP1_TMR_Period16BitSecondarySet( uint16_t value )
{
    /* Update the counter values */
    CCP1PRH = value;
}

//=============================================================================
uint16_t SCCP1_TMR_Period16BitPrimaryGet( void )
{
    return( CCP1PRL );
}

//=============================================================================
uint16_t SCCP1_TMR_Period16BitSecondaryGet( void )
{
    return( CCP1PRH );
}

//=============================================================================
void SCCP1_TMR_Counter16BitPrimarySet ( uint16_t value )
{
    /* Update the counter values */
    CCP1TMRL = value;
}

//=============================================================================
void SCCP1_TMR_Counter16BitSecondarySet ( uint16_t value )
{
    /* Update the counter values */
    CCP1TMRH = value;
}

//=============================================================================
uint16_t SCCP1_TMR_Counter16BitPrimaryGet( void )
{
    return( CCP1TMRL );
}

//=============================================================================
uint16_t SCCP1_TMR_Counter16BitSecondaryGet( void )
{
    return( CCP1TMRH );
}
