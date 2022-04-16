/********************************************************************************//**
 * \file gpTimer32Bit.c
 * \author Roman Holderried
 *
 * \brief General Purpose Timer module
 *
 * This module extends the functionality of one hardware timer peripheral to 
 * schedule multiple non-critical timer operations. 
 * It provides up to 32 timer slots which can operate at integer multiples of the
 * time base cycle time.
 *
 * <b> History </b>
 *      - 2018-06-04 - Created originally for the RoBoard project. 
 *      - 2021-04-15 - Integrated into RobLib.
 *                     
 ***********************************************************************************/

/************************************************************************************
 * Includes
 ***********************************************************************************/
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>
#include "gpTimer32Bit.h"

/************************************************************************************
 * Defines
 ***********************************************************************************/

/************************************************************************************
 * State variables
 ***********************************************************************************/
static tTIMER_CTL_32BIT sTimerCtl = tTIMER_32BIT_CTL_DEFAULTS;

/************************************************************************************
 * Function definitions
 ***********************************************************************************/

//===================================================================================
// Funktion: timer32BitExecute
//===================================================================================
/********************************************************************************//**
 * \brief Timer exection routine
 *
 * This function must get called by the ISR of the time base counter. It increments
 * or decrements the counters of all active timer structures and executes the
 * corresponding callback routines (if defined).
 *
 ***********************************************************************************/
void timer32BitExecute (void)
{
    uint8_t ui8CurrentIndex = 0;
    int8_t i8ActiveTimers = 0;
    bool bTimerFinished = false;
    tTIMERVAR32 *pTimer;

    i8ActiveTimers = sTimerCtl.ui8ActiveTimers;

    // Loop over all active timers
    while ((i8ActiveTimers > 0) && (ui8CurrentIndex < MAX_TIMER_NUMBER))
    {
        pTimer = &sTimerCtl.sTimerStruct[ui8CurrentIndex];

        // Skip if the current index is a free timer
        if ((sTimerCtl.ui32FreeIndices & (1 << ui8CurrentIndex))
             || pTimer->bActive == false)
        {
            ui8CurrentIndex++;
            continue;
        }

        /****************************************************************************
         * Handle the Counter value
         ***************************************************************************/
        if (pTimer->bUpCounter &&
                (pTimer->ui32TimerVal < pTimer->ui32ResetValue))
        {
            pTimer->ui32TimerVal++;

            if (pTimer->ui32TimerVal == pTimer->ui32ResetValue)
                bTimerFinished = true;
        }
        else if (!pTimer->bUpCounter &&
                    (pTimer->ui32TimerVal > 0))
        {
            pTimer->ui32TimerVal--;

            if (pTimer->ui32TimerVal == 0)
                bTimerFinished = true;
        }
        /****************************************************************************
         * Handle the action on timer finished
         ***************************************************************************/
        
        if (bTimerFinished)
        {
            // Destroy the timer if it was declared as one shot timer
            if (pTimer->bOneShot)
                timer32BitDestruct(ui8CurrentIndex);

            // Call the action procedure
            if (pTimer->pfnTimer_cb != NULL)
                pTimer->pfnTimer_cb(/*pTimer->vUser_data*/);

            // Prepare the var for reuse
            bTimerFinished = false;
        }

        ui8CurrentIndex++;
        i8ActiveTimers--;
    }
}

//===================================================================================
// Funktion: appendTimer32Bit
//===================================================================================
/********************************************************************************//**
 * \brief Appends one timer to the structure and returns its index.
 *
 * @param   psTimerConf Configuration structure
 * @returns index of the timer in the structure. Returns -1 if there is no more free
 *          timer index.
 ***********************************************************************************/
int8_t appendTimer32Bit (tTIMERVAR32 *sTimerConf)
{
    uint8_t ui8Counter;
    int8_t  returnVal = -1;

    // Freien Index suchen
    for (ui8Counter = 0; ui8Counter < MAX_TIMER_NUMBER; ui8Counter++)
    {
        if (!(sTimerCtl.ui32FreeIndices & (1 << ui8Counter)))
            continue;
        
        else
        {
            sTimerCtl.sTimerStruct[ui8Counter] = *sTimerConf;

            // Flag index position of the timer
            sTimerCtl.ui32FreeIndices &= ~(1 << ui8Counter);

            // Save timer index
            sTimerCtl.sTimerStruct[ui8Counter].ui8Index = ui8Counter;

            // Timer can be active from the beginning
            if (sTimerCtl.sTimerStruct[ui8Counter].bActive == true)
                sTimerCtl.ui8ActiveTimers += 1;

            returnVal = ui8Counter;
            break;
        }

    }
    return returnVal;
}

//==============================================================================
// Funktion: timer32BitDestruct
//==============================================================================
/********************************************************************************//**
 * \brief Deletes the Timer on specific index
 *
 * @param ui8Index Index of the timer to delete
 ***********************************************************************************/
void timer32BitDestruct (uint8_t ui8Index)
{
    // Free the index
    sTimerCtl.ui32FreeIndices |= (1 << ui8Index);

    // Reset timer activation
    timer32BitSetActive(ui8Index, false);
}

//==============================================================================
// Funktion: timer32BitSetActive
//==============================================================================
/********************************************************************************//**
 * \brief Sets the bActive bit of the timer at the specific index
 *
 * @param ui8Index  Index of the timer to delete
 * @param bActive   Active flag of the timer
 ***********************************************************************************/

void timer32BitSetActive (uint8_t ui8Index, bool bActive)
{
    // War das bActive - Bit bereits gesetzt?
    bool bActiveOld = sTimerCtl.sTimerStruct[ui8Index].bActive;

    // Aktivieren / Deaktivieren des Timers
    sTimerCtl.sTimerStruct[ui8Index].bActive = bActive;

    // Inkrementieren oder dekrementieren der Anzahl aktiver Timer
    sTimerCtl.ui8ActiveTimers += bActiveOld ? -((uint8_t)(!bActive)) : (uint8_t)bActive;
}

//==============================================================================
// Funktion: ms_timer_16Bit_set_val
//==============================================================================
/********************************************************************************//**
 * \brief Sets a new timer value for the timer at the specific index.
 *
 * The counter values are set according to their bUpCounter setting. If configured
 * as Up-Counter, the actual couter value is set to 0. If configured as down Down-
 * Counter, the actual Counter value is set to the desired value.
 *
 * @param ui8Index      Index of the timer to set
 * @param bActive       Active flag of the timer
 * @param ui32TimerVal  Desired timer value
 ***********************************************************************************/
void timer32BitSetValue (uint8_t ui8Index, bool bActive, uint32_t ui32TimerVal)
{
    tTIMERVAR32 *pTimer = &sTimerCtl.sTimerStruct[ui8Index];


    if (pTimer->bUpCounter)
    {
        pTimer->ui32ResetValue = ui32TimerVal;
        pTimer->ui32TimerVal = 0;
    }
    else
        pTimer->ui32TimerVal = ui32TimerVal;

    // Aktivieren / Deaktivieren des Timers
    timer32BitSetActive(ui8Index, bActive);
}
// EOF timer.c-----------------------------------------------------------------------
