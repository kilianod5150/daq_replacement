/**************************************************************************//**
*   @file   ced1z.h
*   @brief  Header file for the drivers for CED1Z platform
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
#ifndef __CED1Z_H__
#define __CED1Z_H__

/*****************************************************************************/
/***************************** Include Files *********************************/
/*****************************************************************************/
#include <io.h>
#include <altera_avalon_pio_regs.h>
#include <system.h>
#include <stdio.h>
#include "pca9564.h"
#include "adt7411.h"

/*****************************************************************************/
/******************* Macros and Constants Definitions ************************/
/*****************************************************************************/

#define VIO_3V3_ADDRESS     0x5A    /* I2C address for VIO_FPGA/3V3 controlling digital potentiometer  */
#define VARA_VARD_ADDRESS   0x5C    /* I2C address for VARA/VARD controlling digital potentiometer  */

#define VIO_INSTRUCTION     0x00    /* I2C instruction word for VIO controlling digital potentiometer*/
#define _3V3_INSTRUCTION    0x80    /* I2C instruction word for 3V3 controlling digital potentiometer*/
#define VARD_INSTRUCTION    0x00    /* I2C instruction word for VARD controlling digital potentiometer*/
#define VARA_INSTRUCTION    0x80    /* I2C instruction word for VARA controlling digital potentiometer*/

#define P3VD_SD             (1  << 0)
#define P5VD_SD             (1  << 1)
#define VARD_SD             (1  << 2)
#define VARA_SD             (1  << 3)
#define P5VA_SD             (1  << 4)
#define N5VA_EN             (1  << 5)
#define N15_EN              (1  << 6)
#define P12S15_SEL          (1  << 7)

#define VARA_5V				22
#define VARD_5V				21
#define VARA_2_5V			129
#define VARD_2_5V			128
#define VIO_FPGA_2_5V		115
#define VIO_FPGA_3_3V		34

/*****************************************************************************/
/************************ Functions Declarations *****************************/
/*****************************************************************************/

void init_power(short command);          /* Activate / deactivate several power supply pins */
void configure_vio_fpga(short value);    /* Configures the value of the VIO_FPGA voltage */
void configure_3V3D(short value);        /* Configures the value of the 3V3D voltage */
void configure_vara(short value);        /* Configures the value of the VARA voltage */
void configure_vard(short value);        /* Configures the value of the VARD voltage */
float read_3v3d();

#endif /*__CED1Z_H__*/
