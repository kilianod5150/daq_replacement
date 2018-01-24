/**************************************************************************//**
*   @file   main.c
*   @brief  System validation program
*   @author ACostina (adrian.costina@analog.com)
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

#include "Drivers/ced1z.h"
#include <adas3022.h>
#include <adas3022_regs.h>

/*****************************************************************************/
/************************ Variables Definitions ******************************/
/*****************************************************************************/

volatile unsigned short *txData     = (unsigned short *) 0x4e0000;  // address of the start of the memory
unsigned int size                   = 0;                         	//used for the request of number of samples
volatile int startAcquisition     	= 0;                         	// starts one acquisition cycle of 1MB

/*****************************************************************************/
/************************ Functions Definitions ******************************/
/*****************************************************************************/

int main()
{

    //program the variable power pins
    configure_vio_fpga(VIO_FPGA_3_3V);
    configure_vara(VARA_5V);
    configure_vard(VARD_5V);
    //activate the programmable power pins
    init_power(N15_EN|N5VA_EN|P5VA_SD|VARA_SD|VARD_SD|P5VD_SD|P3VD_SD); //All voltages are ON, 12V selected

    usleep(500000);         //waiting for the EvalBoard to initialize

	volatile	int *startAcquisitionTCL  	= (int *)0x4a0000; 	//used to signal to the TCL script that the acquisition process has started
	volatile	int *transferCompleteTCL  	= (int *)0x4a0004; 	//used to signal to the
	volatile	int *processingDataTCL     	= (int *)0x4a0008;
	volatile	int *operationCompleteTCL	= (int *)0x4a000C;
	volatile	int	*startAcqPointer       	= (int *)0x4a0014; 	//used in order to start the acquisition using a TCL script
	volatile 	int *commandWord			= (int *)0x4a0018;

	volatile int old_command;									// variable used for monitoring the configuration word from the TCL script

    *startAcqPointer          				= &startAcquisition;
    *commandWord 							= 0x8fcf;
    old_command								= *commandWord;

    IOWR_ALTERA_AVALON_PIO_DATA (LEDS_BASE, 0x07);

    ADAS3022_Reset();
    ADAS3022_WriteEvalBoardRegister(ADCCFG,(unsigned short)*commandWord); //Write the default configuration on the ADAS3023

    while(1)
    {
        *startAcquisitionTCL            = 0;
        *transferCompleteTCL            = 0;
        *processingDataTCL              = 0;
        *operationCompleteTCL           = 0;

        IOWR_ALTERA_AVALON_PIO_DATA (LEDS_BASE, 0x01);
        size = MAX_MEMORY_LINES  * MEMORY_LINE_SIZE;
        *startAcqPointer                = &startAcquisition;

        if (*commandWord != old_command)
		{
			old_command	= *commandWord;
		    ADAS3022_Reset();
		    ADAS3022_WriteEvalBoardRegister(ADCCFG,(unsigned short)*commandWord);
		}

        if(startAcquisition)
        {
            startAcquisition            = 0;

            //signal the start of the data acquisition
            IOWR_ALTERA_AVALON_PIO_DATA (LEDS_BASE, 0x03);
            ADAS3022_StartAcquisition(size, (int)txData);

            while(!(ADAS3022_ReadStatus() & 0x00000001));

            if (ADAS3022_ReadStatus() != 1);
            IOWR_ALTERA_AVALON_PIO_DATA (LEDS_BASE, 0x05);

            //signal the start of data transfer to the PC
            *startAcquisitionTCL = 1;

            //signal the end of data transfer to the PC
            while (*transferCompleteTCL == 0);
            *startAcquisitionTCL        = 0;

            while (*processingDataTCL == 0);

            while (*operationCompleteTCL == 0);

        }
    }
    return 0;
}
