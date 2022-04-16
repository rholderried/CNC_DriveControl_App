/********************************************************************************//**
 * \file gpTimer32Bit.h
 * \author Roman Holderried
 *
 * \brief Includes, typedefs, declaration for the General Purpose Timer module
 *
 * <b> History </b>
 *      - 2018-06-04 - Created originally for the RoBoard project. 
 *      - 2021-04-15 - Integrated into RobLib.
 *                     
 ***********************************************************************************/

#ifndef GPTIMER32BIT_H_
#define GPTIMER32BIT_H_
/************************************************************************************
 * Includes
 ***********************************************************************************/
#include <stdint.h>
#include <stdbool.h>

/************************************************************************************
 * Defines
 ***********************************************************************************/
#define MAX_TIMER_NUMBER  10

#if MAX_TIMER_NUMBER > 32
#error "Maximum number of timers is restricted to 32."
#endif

/************************************************************************************
 * Type definitions
 ***********************************************************************************/
// Callback
typedef void (* tTimer_cb)(void);

// Timervar
typedef struct {
    bool        bOneShot;           // Single timer execution flag
    bool        bActive;            // Timer counting flag
    bool        bUpCounter;         // true: Upcounter, false: Downcounter
    uint8_t     ui8Index;           // Timer index value
    uint32_t    ui32ResetValue;     // Reset value / Maximum counter value
    uint32_t    ui32TimerVal;      // Current timer value
    tTimer_cb pfnTimer_cb;          // Callback
//    void *vUser_data;             // Pointer on userdata, passed at callback execution
}tTIMERVAR32;

#define  tTIMERVAR32_DEFAULTS {false, false, false, 0, 0, 0, NULL, /*NULL*/}

// Timer control structure
typedef struct {
    uint32_t        ui32FreeIndices;
    uint8_t         ui8ActiveTimers;
    tTIMERVAR32    sTimerStruct[MAX_TIMER_NUMBER];
}tTIMER_CTL_32BIT;

#define tTIMER_32BIT_CTL_DEFAULTS { 0xFFFFFFFF, 0, {tTIMERVAR32_DEFAULTS}}


/************************************************************************************
 * Function declarations
 ***********************************************************************************/
// void ms_timer_16Bit_init (void);
int8_t appendTimer32Bit (tTIMERVAR32 * psTimerConf);
void timer32BitDestruct (uint8_t index);
void timer32BitExecute (void);
void timer32BitSetActive (uint8_t index, bool bActive);
void timer32BitSetValue (uint8_t index, bool bActive, uint32_t ui32TimerVal);

#endif //GPTIMER32BIT_H_
// EOF 
