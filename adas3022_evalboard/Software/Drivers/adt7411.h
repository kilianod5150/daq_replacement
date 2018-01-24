/**************************************************************************//**
*   @file   adt7411.h
*   @brief  Header file for the drivers for adt7411
*   @author Costina Adrian Adrian.Costina@analog.com
*
*******************************************************************************
* Copyright 2012(c) Analog Devices, Inc.
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

#ifndef __ADT7411_H__
#define __ADT7411_H__

/*****************************************************************************/
/***************************** Include Files *********************************/
/*****************************************************************************/

#include "pca9564.h"

/*****************************************************************************/
/******************* Macros and Constants Definitions ************************/
/*****************************************************************************/

#define ADT7411_ADDRESS     0x94    /* I2C address for VIO_FPGA/3V3 controlling digital potentiometer  */

#define CONFIG1_ADDRESS     0x18
#define CONFIG2_ADDRESS     0x19
#define CONFIG3_ADDRESS     0x1A
#define CHANNEL1_ADDRESS    0x08
#define AIN14LSB_ADDRESS    0x04
#define AIN58LSB_ADDRESS    0x05
#define RESOLUTION          0.0048828
#define RATIO2              1.212766
#define RATIO3              1.212766
#define RATIO4              1.212766


/*****************************************************************************/
/************************ Functions Declarations *****************************/
/*****************************************************************************/

void configure_adt7411(unsigned short config1, unsigned short config2, unsigned short config3);

int read_channel_adt7411(unsigned short ch_number );

void stop_adt7411();

#endif /*__ADT7411_H__*/
