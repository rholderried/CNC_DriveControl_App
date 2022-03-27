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
#include "uart1.h"
#include "dee.h"

//extern VAR varStruct[];

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

