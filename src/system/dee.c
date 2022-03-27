/*
Copyright (c) [2012-2020] Microchip Technology Inc.  

    All rights reserved.

    You are permitted to use the accompanying software and its derivatives 
    with Microchip products. See the Microchip license agreement accompanying 
    this software, if any, for additional info regarding your rights and 
    obligations.
    
    MICROCHIP SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT 
    WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT 
    LIMITATION, ANY WARRANTY OF MERCHANTABILITY, TITLE, NON-INFRINGEMENT 
    AND FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT WILL MICROCHIP OR ITS
    LICENSORS BE LIABLE OR OBLIGATED UNDER CONTRACT, NEGLIGENCE, STRICT 
    LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR OTHER LEGAL EQUITABLE 
    THEORY FOR ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES INCLUDING BUT NOT 
    LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES, 
    OR OTHER SIMILAR COSTS. 
    
    To the fullest extend allowed by law, Microchip and its licensors 
    liability will not exceed the amount of fees, if any, that you paid 
    directly to Microchip to use this software. 
    
    THIRD PARTY SOFTWARE:  Notwithstanding anything to the contrary, any 
    third party software accompanying this software is subject to the terms 
    and conditions of the third party's license agreement.  To the extent 
    required by third party licenses covering such third party software, 
    the terms of such license will apply in lieu of the terms provided in 
    this notice or applicable license.  To the extent the terms of such 
    third party licenses prohibit any of the restrictions described here, 
    such restrictions will not apply to such third party software.
*/

#include <stdlib.h>
#include "flash.h"
#include "dee.h"


#define DATA_EE_BANKS                     1
#define DATA_EE_SIZE                      127
#define DATA_EE_TOTAL_SIZE                (DATA_EE_BANKS * DATA_EE_SIZE)
#define NUM_DATA_EE_PAGES                 2
#define	NUMBER_OF_INSTRUCTIONS_IN_PAGE    1024
#define	NUMBER_OF_INSTRUCTIONS_IN_ROW     128
#define DEE_STRUCTURE_FLASH_START_ADDRESS 0x56800
// If the device has ECC
#define __HAS_ECC	                      1
#define ERASE_WRITE_CYCLE_MAX             10000
#define NUMBER_OF_ROWS_IN_PAGE            (_FLASH_PAGE / _FLASH_ROW)
#define PAGE_AVAILABLE                    1
#define PAGE_CURRENT                      0
#define PAGE_EXPIRED                      0
#define PAGE_NOT_AVAILABLE                0
#define PAGE_NOT_CURRENT                  1
#define PAGE_NOT_EXPIRED                  1
#define STATUS_AVAILABLE                  18
#define STATUS_CURRENT                    19
#define STATUS_EXPIRED                    20
#define ERASE_STATE                       0xFFFFFF

/*Data EE info stored in PM in following format
  Status in first two locations of PM page,
  8-bit DEE Address (odd address, low byte) 16-bit DEE data (even address)*/
#define BYTES_PER_DATA_EE 2
#define DEE_DATA_SIZE_IN_BYTES            (DATA_EE_BANKS * NUM_DATA_EE_PAGES * NUMBER_OF_INSTRUCTIONS_IN_PAGE * BYTES_PER_DATA_EE)
uint8_t emulationPages[DEE_DATA_SIZE_IN_BYTES]
    __attribute__ ((space(psv), address(DEE_STRUCTURE_FLASH_START_ADDRESS), aligned(NUMBER_OF_INSTRUCTIONS_IN_PAGE * 2), noload));
#define DEE_BANK_SIZE                     (NUMBER_OF_INSTRUCTIONS_IN_PAGE * BYTES_PER_DATA_EE * NUM_DATA_EE_PAGES)
#define DEE_PAGE_SIZE                     (NUMBER_OF_INSTRUCTIONS_IN_PAGE * BYTES_PER_DATA_EE)
#define DEE_PAGE_ADDRESS(bank, page)      ((__builtin_tbladdress(&emulationPages) + (DEE_BANK_SIZE * (bank)) + (DEE_PAGE_SIZE * (page))) & 0xFFFFFF)

#define GetAddrNotFound()                 dataEEFlags.addrNotFound
#define SetAddrNotFound(x)                dataEEFlags.addrNotFound = x
#define GetPageCorruptStatus()            dataEEFlags.pageCorrupt
#define SetPageCorruptStatus(x)           dataEEFlags.pageCorrupt = x
#define GetPageExpiredPage()              dataEEFlags.expiredPage
#define SetPageExpiredPage(x)             dataEEFlags.expiredPage = x
#define GetPageIllegalAddress()           dataEEFlags.IllegalAddress
#define SetPageIllegalAddress(x)          dataEEFlags.IllegalAddress = x
#define GetPagePackBeforeInit()           dataEEFlags.packBeforeInit
#define SetPagePackBeforeInit(x)          dataEEFlags.packBeforeInit = x
#define GetPagePackBeforePageFull()       dataEEFlags.packBeforePageFull
#define SetPagePackBeforePageFull(x)      dataEEFlags.packBeforePageFull = x
#define GetPagePackSkipped()              dataEEFlags.packSkipped
#define SetPagePackSkipped(x)             dataEEFlags.packSkipped = x
#define GetPageWriteError()               dataEEFlags.writeError
#define SetPageWriteError(x)              dataEEFlags.writeError = x

typedef union
{
    uint8_t val;
    struct
    {
        unsigned addrNotFound:1;
        unsigned expiredPage:1;
        unsigned packBeforePageFull:1;
        unsigned packBeforeInit:1;
        unsigned packSkipped:1;
        unsigned IllegalAddress:1;
        unsigned pageCorrupt:1;
        unsigned writeError:1;
    };
} DATA_EE_FLAGS;

DATA_EE_FLAGS dataEEFlags;

static uint8_t                  GetPageStatus(uint8_t bank, uint8_t page, uint8_t field);
static void                     ErasePage(uint8_t bank, uint8_t page);
static uint16_t                 GetNextAvailCount(uint8_t bank);
static DEE_RETURN_STATUS        DEE_Pack(uint8_t bank);

// User constant validation
#if DATA_EE_BANKS == 0
    #error Minimum data EE banks is 1
#endif

#if DATA_EE_SIZE > 255
    #error Maximum data EE size is 255
#endif

#if NUM_DATA_EE_PAGES < 2
    #error Minimum number of program memory pages is 2
#endif

#if ERASE_WRITE_CYCLE_MAX > 65535
    #error Maximum number of erase/write cycles is 65,535
#endif


DEE_RETURN_STATUS DEE_Init(void)
{
    uint8_t pageCnt;
    uint16_t erasePage;
    uint16_t currentPage;
    uint32_t pageAddress;
    uint16_t packedPage; 
    uint8_t bank;
    uint32_t statusWord[2];

    dataEEFlags.val = 0;

    for (bank = 0; bank < DATA_EE_BANKS; bank++)
    {
        pageCnt = 0;
        erasePage = 0;
        packedPage = 0;

        // Find unexpired page
        for (currentPage = 0;
                (currentPage < NUM_DATA_EE_PAGES) &&
                (GetPageStatus(bank, currentPage, STATUS_EXPIRED) == PAGE_EXPIRED);
                currentPage++)
        {
        }

        if (currentPage == NUM_DATA_EE_PAGES)
        {
            SetPageExpiredPage(1);
            return (DEE_EXPIRED_PAGE); // Error - All pages expired
        }
        // Count active page(s).
        for (currentPage = 0; currentPage < NUM_DATA_EE_PAGES; currentPage++)
        {
            if (GetPageStatus(bank, currentPage, STATUS_CURRENT) == PAGE_CURRENT)
            {
                pageCnt++;
            }
        }
        //If no active pages found, initialize page 0
        if (pageCnt == 0)
        {
            ErasePage(bank, 0);
            pageAddress = DEE_PAGE_ADDRESS(bank, 0);
            //New page: unavailable, active, reset count
            statusWord[0] = 0xF3;
            statusWord[0] = statusWord[0] << 16;
            statusWord[1] = ERASE_STATE;
            FLASH_Unlock(FLASH_UNLOCK_KEY);
            FLASH_WriteInstructions(pageAddress, statusWord);
            FLASH_Lock();
            continue;
        }
        //If one active page, do nothing
        else if (pageCnt == 1)
        {
            continue;
        }
        //If two active pages, erase second and repack first
        else if (pageCnt == 2)
        {
            if ((GetPageStatus(bank, NUM_DATA_EE_PAGES - 1, STATUS_CURRENT) == PAGE_CURRENT) &&
                    (GetPageStatus(bank, 0, STATUS_CURRENT) == PAGE_CURRENT))
            {
                currentPage = NUM_DATA_EE_PAGES - 1;
                erasePage = 0;
            }
            else
            {
                currentPage = 0;
                while ((GetPageStatus(bank, currentPage, STATUS_CURRENT) == PAGE_NOT_CURRENT) &&
                        (currentPage < NUM_DATA_EE_PAGES))
                {
                    currentPage++;
                }
                erasePage = currentPage + 1;
                if (erasePage == NUM_DATA_EE_PAGES)
                {
                    erasePage = 0;
                }
            }
            ErasePage(bank, erasePage);
            if (!GetNextAvailCount(bank))
            {
                DEE_Pack(bank);
            }
            continue;
        }
        else
        {
            SetPageCorruptStatus(1);
            return (DEE_PAGE_CORRUPT);
        }
    }
    return (DEE_NO_ERROR);
}

DEE_RETURN_STATUS DEE_Read(uint16_t addr, uint16_t* dataRead)
{
    uint16_t currentPage;
    uint32_t pageAddress; 
    uint8_t latchAddr;
    uint16_t i;
    uint8_t bank;
    uint32_t latchAddrData;

    if (addr >= DATA_EE_TOTAL_SIZE)
    {
        SetPageIllegalAddress(1);
        return (DEE_ILLEGAL_ADDRESS);
    }

    bank = addr / DATA_EE_SIZE;

    // Find the active page.
    for (currentPage = 0;
            (currentPage < NUM_DATA_EE_PAGES) &&
            (GetPageStatus(bank, currentPage, STATUS_CURRENT) == PAGE_NOT_CURRENT);
            currentPage++)
    {
    }

    if (currentPage == NUM_DATA_EE_PAGES)
    {
        SetPageCorruptStatus(1);
        return (DEE_PAGE_CORRUPT); // Error - no active page
    }

    pageAddress = DEE_PAGE_ADDRESS(bank, (currentPage + 1)) - 4;

    i = NUMBER_OF_INSTRUCTIONS_IN_PAGE;

    do
    {
        FLASH_ReadInstructions(pageAddress, &latchAddrData);
        latchAddr = (latchAddrData >> 16) & 0xFF;
        pageAddress -= 4; // Skip over preceding odd address in devices with ECC
        i -= 2;
    }
    while ((i > 0) && (latchAddr != (addr % DATA_EE_SIZE)));

    if (!i)
    {
        SetAddrNotFound(1);
        return (DEE_ILLEGAL_ADDRESS);
    }

    pageAddress += 4; // Adjust offset to skip the odd word

    FLASH_ReadInstructions(pageAddress, &latchAddrData);
    //Extract the data(lower 16 bits)
    *dataRead = latchAddrData & 0xFFFF;
    return (DEE_NO_ERROR);
}

DEE_RETURN_STATUS DEE_Write(uint16_t addr, uint16_t data)
{
    uint16_t currentPage;
    uint32_t pageAddress; //Current array (page) offset of selected element (PM 16-bit word)
    uint16_t nextLoc;
    volatile uint16_t latchData;
    volatile uint8_t latchAddr;
    uint8_t dataEEFlags_sh;
    uint16_t bank;
    uint16_t pageToBeErased;
    uint32_t deeItem[2];

    if (addr >= DATA_EE_TOTAL_SIZE)
    {
        SetPageIllegalAddress(1);
        return (DEE_ILLEGAL_ADDRESS);
    }

    bank = addr / DATA_EE_SIZE;

    // Find the active page.
    for (currentPage = 0;
            (currentPage < NUM_DATA_EE_PAGES) &&
            (GetPageStatus(bank, currentPage, STATUS_CURRENT) == PAGE_NOT_CURRENT);
            currentPage++)
    {
    }

    if (currentPage == NUM_DATA_EE_PAGES)
    {
        SetPageCorruptStatus(1);
        return (DEE_PAGE_CORRUPT); // Error - no active page
    }

    pageAddress = DEE_PAGE_ADDRESS(bank, currentPage);

    nextLoc = GetNextAvailCount(bank);

    if (!nextLoc)
    {
        pageToBeErased = currentPage + 1;
        if(pageToBeErased == NUM_DATA_EE_PAGES)
        {
            pageToBeErased = 0;
        }
        ErasePage(bank, pageToBeErased);
        DEE_Pack(bank);

        for (currentPage = 0;
            (currentPage < NUM_DATA_EE_PAGES) &&
            (GetPageStatus(bank, currentPage, STATUS_CURRENT) == PAGE_NOT_CURRENT);
            currentPage++)
        {
        }

        if (currentPage == NUM_DATA_EE_PAGES)
        {
            SetPageCorruptStatus(1);
            return (DEE_PAGE_CORRUPT); // Error - no active page
        }

        pageAddress = DEE_PAGE_ADDRESS(bank, currentPage);
        nextLoc = GetNextAvailCount(bank);
    }

    dataEEFlags_sh = dataEEFlags.val;
    //Do not write data if it did not change
    uint16_t dataRead;
    DEE_Read(addr, &dataRead);
    if (dataRead == data)
    {
        if (GetAddrNotFound() == 0) // Check if the read was successful
        {
            dataEEFlags.val = dataEEFlags_sh;
            return (DEE_NO_ERROR);
        }
    }
    dataEEFlags.val = dataEEFlags_sh; //Restore status flags

    pageAddress = pageAddress + nextLoc;

    deeItem[0] = addr % DATA_EE_SIZE;
    deeItem[0] = (deeItem[0] << 16) | data;
    deeItem[1] = ERASE_STATE;
    FLASH_Unlock(FLASH_UNLOCK_KEY);
    FLASH_WriteInstructions(pageAddress, deeItem);
    FLASH_Lock();

    Nop();
    Nop();

    FLASH_ReadInstructions(pageAddress, &deeItem[0]);
    latchData = (deeItem[0] & 0xFFFF);

    if (latchData != (data & 0xFFFF))
    {
        SetPageWriteError(1);
        return (DEE_WRITE_ERROR); //Error - RAM does not match PM
    }

    latchAddr = ((deeItem[0] >> 16) & 0xFF);

    if (latchAddr != (addr % DATA_EE_SIZE))
    {
        SetPageWriteError(1);
        return (DEE_WRITE_ERROR); //Error - RAM does not match PM
    }

    //Pack if page is full
    if ((nextLoc + 4) == ((NUMBER_OF_INSTRUCTIONS_IN_PAGE) * 2))
    {
        DEE_Pack(bank);
    }

    return (DEE_NO_ERROR);
}

DEE_RETURN_STATUS DEE_Pack(uint8_t bank)
{
    uint16_t currentPage; //Array row (PM page) of active DEE page
    uint16_t packedPage; //Array row (PM page) of packed page
    uint32_t currentPageAddress; //Current page address
    uint32_t packedPageAddress; //Packed page address
    uint16_t latchAddr;
    uint16_t latchData;
    uint8_t dataEEFlags_sh;
    uint32_t pageAllignedAddress;
    uint32_t deeItem[2];

    // Find the active page.
    for (currentPage = 0;
            (currentPage < NUM_DATA_EE_PAGES) &&
            (GetPageStatus(bank, currentPage, STATUS_CURRENT) == PAGE_NOT_CURRENT);
            currentPage++)
    {
    }


    if (currentPage == NUM_DATA_EE_PAGES)
    {
        SetPagePackBeforeInit(1);
        return (DEE_PACK_BEFORE_INIT); // Error - no active page
    }
    else
    {
        // Find the next unexpired page to use
        packedPage = currentPage + 1;
        if (packedPage == NUM_DATA_EE_PAGES)
        {
            packedPage = 0;
        }
        while (GetPageStatus(bank, packedPage, STATUS_EXPIRED) == PAGE_EXPIRED)
        {
            packedPage++;
            if (packedPage == NUM_DATA_EE_PAGES)
            {
                packedPage = 0;
            }
            if (packedPage == currentPage)
            {
                SetPageExpiredPage(1);
                return (DEE_EXPIRED_PAGE); // Error - all pages expired
            }
        }
    }

    packedPageAddress = DEE_PAGE_ADDRESS(bank, packedPage);
    pageAllignedAddress = packedPageAddress;

    if (GetNextAvailCount(bank))
    {
        SetPagePackBeforePageFull(1); // Pack called before the page was full
    }

    dataEEFlags_sh = dataEEFlags.val;
    SetAddrNotFound(0); // Initialize flag    


    FLASH_Unlock(FLASH_UNLOCK_KEY);
    deeItem[0] = ERASE_STATE;
    deeItem[1] = ERASE_STATE;
    FLASH_WriteInstructions(packedPageAddress, deeItem);

    packedPageAddress += 4; // Do not use odd Flash words on dsPIC33E devices with ECC
    latchAddr = 0;

    do
    {
        DEE_Read((DATA_EE_SIZE * bank) + latchAddr, &latchData);
        if (GetAddrNotFound()) //if address is unwritten, skip to next address
        {
            SetAddrNotFound(0);
        }
        else
        {
            deeItem[0] = latchAddr;
            deeItem[0] = ((deeItem[0] << 16) | (latchData & 0xFFFF));
            deeItem[1] = ERASE_STATE;
            FLASH_WriteInstructions(packedPageAddress, deeItem);

            packedPageAddress += 4; // Do not use odd Flash words on devices with ECC
        }
        latchAddr++;
    }
    while (latchAddr != DATA_EE_SIZE);

    dataEEFlags.val = dataEEFlags_sh; //Restore status flags

    packedPageAddress = DEE_PAGE_ADDRESS(bank, packedPage) + 4; // Adjust offset to skip the odd word

    uint32_t data;
    FLASH_ReadInstructions(packedPageAddress, &data);
    latchAddr = (data >> 16) & 0xFF;
    latchData = data & 0xFFFF;
    packedPageAddress += 4; // Do not use odd Flash words on devices with ECC

    while (latchAddr != 0xFF)
    {
        uint16_t dataRead;
        DEE_Read((DATA_EE_SIZE * bank) + latchAddr, &dataRead);
        if (dataRead != latchData)
        {
            SetPageWriteError(1);
            return (DEE_WRITE_ERROR); //Error - data does not match
        }
        FLASH_ReadInstructions(packedPageAddress, &data);
        latchAddr = (data >> 16) &0xFF;
        latchData = data & 0xFFFF;
        packedPageAddress += 4; // Do not use odd Flash words on devices with ECC
    }

    //Program page status
    currentPageAddress = DEE_PAGE_ADDRESS(bank, currentPage);
    packedPageAddress = DEE_PAGE_ADDRESS(bank, packedPage);

    FLASH_ReadInstructions(currentPageAddress, &data);
    latchAddr = (data >> 16) & 0xFF;
    latchData = data & 0xFFFF;

    if (packedPage == 0)
    {
        latchData++; //Increment E/W counter
    }

    if (latchData >= ERASE_WRITE_CYCLE_MAX - 1)
    {
        SetPageExpiredPage(1);
        latchAddr &= 0xEF;
    }

    uint32_t dataItem[2];
    dataItem[0] = latchAddr;
    dataItem[0] = (dataItem[0] << 16) | latchData;
    dataItem[1] = ERASE_STATE;
    FLASH_WriteInstructions(packedPageAddress, dataItem);
    FLASH_ReadInstructions(packedPageAddress, &data);
    uint16_t readAddr = (data >> 16) & 0xFF;
    uint16_t readData = data & 0xFFFF;

    if ((latchAddr != readAddr) ||
            (latchData != readData))
    {
        SetPageWriteError(1);
        return (DEE_WRITE_ERROR);
    }

    //Erase active page
    ErasePage(bank, currentPage);
    FLASH_Lock();

    return (GetPageExpiredPage());
}

uint8_t GetPageStatus(uint8_t bank, uint8_t page, uint8_t field)
{
    uint32_t pageAddress;
    uint8_t statusByte;
    uint8_t status;
    uint32_t statusInfo;

    pageAddress = DEE_PAGE_ADDRESS(bank, page);
    FLASH_ReadInstructions(pageAddress, &statusInfo);
    statusByte = statusInfo >> 16 & 0xFF;
    switch (field)
    {
        case STATUS_AVAILABLE:
            status = ((statusByte & 4) >> 2);
            break;
        case STATUS_CURRENT:
            status = ((statusByte & 8) >> 3);
            break;
        case STATUS_EXPIRED:
            status = ((statusByte & 16) >> 4);
            break;
        default:
            status = 0;
            break;
    }
    return (status);
}

void ErasePage(uint8_t bank, uint8_t page)
{
    uint32_t pageAddress = DEE_PAGE_ADDRESS(bank, page);
    FLASH_Unlock(FLASH_UNLOCK_KEY);
    FLASH_EraseBlock(pageAddress, 1);
    FLASH_Lock();
    return;
}

uint16_t GetNextAvailCount(uint8_t bank)
{
    uint16_t nextAvailCount = 0;
    uint16_t currentPage; 
    uint8_t dataEEval;
    uint32_t pageAddress;
    uint32_t latchAddrData;

    // Find the active page.
    for (currentPage = 0;
            (currentPage < NUM_DATA_EE_PAGES) &&
            (GetPageStatus(bank, currentPage, STATUS_CURRENT) == PAGE_NOT_CURRENT);
            currentPage++)
    {
    }

    pageAddress = DEE_PAGE_ADDRESS(bank, currentPage);

    do
    {
        nextAvailCount += 4;
        pageAddress += 4;
        FLASH_ReadInstructions(pageAddress, &latchAddrData);
        dataEEval = (latchAddrData >> 16) & 0xFF;
    }
    while ((nextAvailCount < NUMBER_OF_INSTRUCTIONS_IN_PAGE * 2) && (dataEEval != 0xFF));

    if (nextAvailCount == NUMBER_OF_INSTRUCTIONS_IN_PAGE * 2)
    {
        nextAvailCount = 0; 
    }
    return (nextAvailCount);
}
