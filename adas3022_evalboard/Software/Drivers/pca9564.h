/**************************************************************************//**
*   @file   pca9564.h
*   @brief  Header file for the drivers for pca9564
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
#ifndef __PCA9564_H__
#define __PCA9564_H__

/*****************************************************************************/
/***************************** Include Files *********************************/
/*****************************************************************************/
#include <io.h>
#include <altera_avalon_pio_regs.h>
#include <system.h>
#include <stdio.h>

/*****************************************************************************/
/******************* Macros and Constants Definitions ************************/
/*****************************************************************************/
#define I2CSTA      (0x00  << 3)
#define I2CDAT      (0x01  << 3)
#define I2CADR      (0x02  << 3)
#define I2CCON      (0x03  << 3)

#define BR330k      0x00
#define BR288k      0x01
#define BR217k      0x02
#define BR146k      0x03
#define BR88k       0x04
#define BR59k       0x05
#define BR44K       0x06
#define BR36K       0x07

#define SI          (1 << 3)
#define STO         (1 << 4)
#define STA         (1 << 5)
#define ENSIO       (1 << 6)
#define ACK         (1 << 7)
#define NOACK       0x00

#define IDLE_PCA        0x03
#define READ_PCA        0x01
#define WRITE_PCA       0x02
#define DISABLE_PCA     0x00

#define READ_I2C    1
#define WRITE_I2C   0

/*****************************************************************************/
/************************ Functions Declarations *****************************/
/*****************************************************************************/

void init_i2c();                            /* Activates the pca9564 chip and sets the ENSIO bit */
void start_i2c();                           /* Sends start on the I2C line */
void address_i2c(unsigned short addressrw);  /* Sends address + wr on the I2C line */
short data_read_i2c(unsigned short ack);      /* Reads a character from the I2C line */
void data_write_i2c(unsigned short data);    /* Writes data to the I2C line */
void stop_i2c();                            /* Sends stop on the I2C line */
void disable_i2c();                         /* Disables the ENSIO bit and deasserts CS for pca9564 chip */

#endif /*__PCA9564_H__*/
