/**************************************************************************//**
*   @file   adt7411.c
*   @brief  Driver for the ADT411 chip located on the CED1Z board.
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
#include "adt7411.h"


/*****************************************************************************/
/************************ Functions Definitions ******************************/
/*****************************************************************************/

/****************************************************************************
* @brief Updates the adt7411 CONFIG registers
*
* This function is used to send the configuration words to the ADT7411. The order
* in which the registers are written is 3,2,1
*
* @param config1 Holds the value to be written in config1 register
* @param config2 Holds the value to be written in config2 register
* @param config3 Holds the value to be written in config3 register
*
* @return No return value
******************************************************************************/
void configure_adt7411(unsigned short config1, unsigned short config2, unsigned short config3)
{
    init_i2c();
    start_i2c();
    address_i2c(ADT7411_ADDRESS + WRITE_I2C);
    data_write_i2c(CONFIG3_ADDRESS);
    data_write_i2c(config3);
    stop_i2c();

    start_i2c();
    address_i2c(ADT7411_ADDRESS+WRITE_I2C);
    data_write_i2c(CONFIG2_ADDRESS);
    data_write_i2c(config2);
    stop_i2c();

    start_i2c();
    address_i2c(ADT7411_ADDRESS+WRITE_I2C);
    data_write_i2c(CONFIG1_ADDRESS);
    data_write_i2c(config1);
    stop_i2c();

    disable_i2c();

    return;
}

/****************************************************************************
* @brief Reads a character from the I2C line
*
* This function is used to read data from the I2C line. It will read one 8 bit
* string with or without sending ACK
*
* @param ack Used to specify if ACK will be sent
*
* @return   The value read from the ADC convert of -1 if the channel number was
*           not specified correctly
******************************************************************************/
 int read_channel_adt7411(unsigned short ch_number)
{
     int return_value;
     short lsb;

    if (ch_number >7)
    {
        return(-1);
    }
    else
    {
        init_i2c();

        start_i2c();
        address_i2c(ADT7411_ADDRESS | WRITE_I2C);
        data_write_i2c(CHANNEL1_ADDRESS+ch_number);
        stop_i2c();

        start_i2c();
        address_i2c(ADT7411_ADDRESS|READ_I2C);
        return_value = (unsigned short)data_read_i2c (NOACK);
        stop_i2c();

        if(ch_number<4)
        {
            start_i2c();
            address_i2c(ADT7411_ADDRESS | WRITE_I2C);
            data_write_i2c(AIN14LSB_ADDRESS);
            stop_i2c();

            start_i2c();
            address_i2c(ADT7411_ADDRESS|READ_I2C);
            lsb = data_read_i2c (NOACK);
            stop_i2c();
            lsb = lsb >> (2*ch_number);
            lsb = lsb &0x3;
        }
        else
        {
            start_i2c();
            address_i2c(ADT7411_ADDRESS | WRITE_I2C);
            data_write_i2c(AIN58LSB_ADDRESS);
            stop_i2c();

            start_i2c();
            address_i2c(ADT7411_ADDRESS|READ_I2C);
            lsb = data_read_i2c (NOACK);
            stop_i2c();
            lsb = lsb >> (2* (ch_number-4));
            lsb = lsb &0x3;
        }
        usleep(200);
        disable_i2c();
    }
    return_value = return_value*4 + (unsigned)lsb;

    return return_value;
}
