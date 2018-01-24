/******************************************************************************
*   @file   adas3022
*   @brief  Driver for the ADAS3022 ADC altera avalon IP
*   @author Costina Adrian Adrian.Costina@analog.com
*
*******************************************************************************
* Copyright 2011(c) Analog Devices, Inc.
*
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without modification, 
* are permitted provided that the following conditions are met:
*  - Redistributions of source code must retain the above copyright
*    notice, this list of conditions and the following disclaimer.
*  - Redistributions in binary form must reproduce the above copyright
*    notice, this list of conditions and the following disclaimer in
*    the documentation and/or other materials provided with the
*    distribution.
*  - Neither the name of Analog Devices, Inc. nor the names of its
*    contributors may be used to endorse or promote products derived
*    from this software without specific prior written permission.
*  - The use of this software may or may not infringe the patent rights
*    of one or more patent holders.  This license does not release you
*    from the requirement that you obtain separate licenses from these
*    patent holders to use this software.
*  - Use of the software either in source or binary form, must be run
*    on or directly connected to an Analog Devices Inc. component.
*
* THIS SOFTWARE IS PROVIDED BY ANALOG DEVICES "AS IS" AND ANY EXPRESS OR IMPLIED 
* WARRANTIES, INCLUDING, BUT NOT LIMITED TO, NON-INFRINGEMENT, MERCHANTABILITY 
* AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
* IN NO EVENT SHALL ANALOG DEVICES BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
* SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
* INTELLECTUAL PROPERTY RIGHTS, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; 
* LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND 
* ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS 
* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*
*******************************************************************************
*   SVN Revision: $WCREV$
******************************************************************************/

/*****************************************************************************/
/***************************** Include Files *********************************/
/*****************************************************************************/

#include "system.h"
#include "adas3022.h"
#include "adas3022_regs.h"

/*****************************************************************************/
/************************ Functions Definitions ******************************/
/*****************************************************************************/

/****************************************************************
* @brief Software reset of the ADAS3022 core and evaluation board
*
* @return None
*****************************************************************/
void ADAS3022_Reset()
{
        IOWR_ADAS3022_CONTROL(ADAS3022_0_BASE, 0x00000002); //reset
        IOWR_ADAS3022_CONTROL(ADAS3022_0_BASE, 0x00000000); //reset
}

/****************************************************************
* @brief Updates the selected register on the Eval Board
*
* parameter reg     Selects the register in which the value should be
*                   written
* parameter value   The new value to be written in the configuration
*                   register
*
* @return There is no return value
*****************************************************************/

void ADAS3022_WriteEvalBoardRegister(char reg, unsigned short value)
{
  IOWR_ADAS3022_DUT (ADAS3022_0_BASE, (reg << 16) + value);
  IOWR_ADAS3022_CONTROL (ADAS3022_0_BASE, 0x0008);
}

/****************************************************************
* @brief Starts the data acquisition process
* parameter size will send the number of samples that need to
*                be acquired. For CED1Z must be under 512*1024
* parameter destination will point to the memory location starting
*                       from where data will be written
*
* @return 0 if acquisition starts successfully
* @return 1 if the number of samples is too large
*****************************************************************/
int ADAS3022_StartAcquisition(int size, int destination)
{
    if ( size > (MEMORY_LINE_SIZE * MAX_MEMORY_LINES))
    {
        return 1;
    }
    else
    {
        if (size % 2)
        {
            size++;
        }
        IOWR_ADAS3022_ACQ_COUNT(ADAS3022_0_BASE, size);     //write number of samples
        IOWR_ADAS3022_BASE(ADAS3022_0_BASE, destination);   //write the memory destination
        IOWR_ADAS3022_CONTROL (ADAS3022_0_BASE, 0x0008);
        IOWR_ADAS3022_CONTROL(ADAS3022_0_BASE, 0x00000001); //start acquisition
    }
    return 0;
}

/****************************************************************
* @brief Reads the status register
*
* @return There is no return value
*****************************************************************/
int ADAS3022_ReadStatus (void)
{
    return IORD_ADAS3022_STATUS(ADAS3022_0_BASE);
}
