/********************************************************************************//**
 * \file CNC_DriveControl_App.c
 * \author Roman Holderried
 *
 * \brief Main file of the CNC drive control Application.
 *
 * <b> History </b>
 *      - 2022-03-27 - File creation. 
 *                     
 ***********************************************************************************/

/************************************************************************************
 * Includes
 ***********************************************************************************/
#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include "system.h"
#include "SCI.h"
#include "DataAndControl.h"
#include "Datalogger.h"
#include "gpTimer32Bit.h"
#include "uart1.h"
#include "dee.h"

void testTimerCb (void)
{
  char *text = "Timer Hallo Welt";

  UART1_writeBlocking(text, 16);
}

/************************************************************************************
 * Main Application
 ***********************************************************************************/
int main(void)
{
    
    // initialize the device
    SYSTEM_Initialize();

    // Initializing the EEPROM and the Serial Communication Interface
    {
      DEE_RETURN_STATUS returnVal = DEE_Init();
      SCI_CALLBACKS cbs = SCI_CALLBACKS_DEFAULT;

      cbs.transmitBlockingCallback = UART1_writeBlocking;

      if (returnVal == DEE_NO_ERROR)
      {
        cbs.writeEEPROMCallback = writeEEPROM;
        cbs.readEEPROMCallback = readEEPROM;
      }
      
      // Initialize the Serial Communication Interface
      SCI_init(cbs, &varStruct[0], &cmdStruct[0]);
    }

    // Initializing the general purpose Timer module for the Datalogger
    {


    }

    
    while (1)
    {
      // Call the SCI state machine
      SCI_statemachine();
    }
    return 1; 
}
/**
 End of File
*/

