/**************************************************************************//**
*   @file   ced1z.c
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

/*****************************************************************************/
/***************************** Include Files *********************************/
/*****************************************************************************/
#include "ced1z.h"

/*****************************************************************************/
/************************ Private Functions Prototypes ***********************/
/*****************************************************************************/

void configure_power_pin(short address, short instruction, short value);   /* Internal function used to configure the programmable power pins */

/*****************************************************************************/
/************************ Functions Definitions ******************************/
/*****************************************************************************/

/*****************************************************************************
* @brief Internal function used to configure the programmable voltages
*
* This function will program one of the 4 programmable voltages: VIO_FPGA,
* 3V3D, VARA, VARD.
*
* @param address        The address of the I2C slave
* @param instruction    The instruction to be sent to the AD5825
* @param value          The value to be written in the digital potentiometer
*
* @return No return value
******************************************************************************/
void configure_power_pin(short address, short instruction, short value)
{
    init_i2c();

    start_i2c();

    address_i2c(address+WRITE_I2C);

    data_write_i2c(instruction);

    data_write_i2c(value);

    stop_i2c();

    disable_i2c();

    return;
}


/*****************************************************************************
* @brief Activate/deactivate several power supply pins
*
* This function will activate/deactivate the +3VD, +5VD, +VARD, +VARA, +5VA,
* -5VA, +-15VA and select between 12/15V supply for the +-15 pins
*
* @param command The value to be set on the output pins of the U7 Latch (please
*                see EVAL_CED1Z.pdf)
*
* @return No return value
******************************************************************************/
void init_power(short command)
{
    IOWR_ALTERA_AVALON_PIO_DIRECTION (PWR_DATA_BASE, 0xff);

    IOWR_ALTERA_AVALON_PIO_DATA (PWR_DATA_BASE, command);
    IOWR_ALTERA_AVALON_PIO_DATA (PWR_EN_CLK_BASE, 0x01);    //pulse PWR_EN_REG_CLK
    IOWR_ALTERA_AVALON_PIO_DATA (PWR_EN_CLK_BASE, 0x00);    //pulse PWR_EN_REG_CLK
    IOWR_ALTERA_AVALON_PIO_DATA (PWR_EN_CLK_BASE, 0x01);    //pulse PWR_EN_REG_CLK
    IOWR_ALTERA_AVALON_PIO_DATA (PWR_EN_CLK_BASE, 0x00);    //pulse PWR_EN_REG_CLK

    IOWR_ALTERA_AVALON_PIO_DIRECTION (PWR_DATA_BASE, 0x00);
    return;
}



/*****************************************************************************
* @brief Configures the value of the vio_fpga voltage
*
* @param value The value to be sent to the digital potentiometer
*
* @return No return value
******************************************************************************/
void configure_vio_fpga(short value)
{

    configure_power_pin(VIO_3V3_ADDRESS,VIO_INSTRUCTION,value);

    return;
}

/*****************************************************************************
* @brief Configures the value of the 3V3D voltage
*
* @param value The value to be sent to the digital potentiometer
*
* @return No return value
******************************************************************************/
void configure_3V3D(short value)
{

    configure_power_pin(VIO_3V3_ADDRESS,_3V3_INSTRUCTION,value);

    return;
}

/*****************************************************************************
* @brief Configures the value of the VARA voltage
*
* @param value The value to be sent to the digital potentiometer
*
* @return No return value
******************************************************************************/
void configure_vara(short value)
{

    configure_power_pin(VARA_VARD_ADDRESS,VARA_INSTRUCTION,value);

    return;
}

/*****************************************************************************
* @brief Configures the value of the VARD voltage
*
* @param value The value to be sent to the digital potentiometer

* @return No return value
******************************************************************************/
void configure_vard(short value)
{
    configure_power_pin(VARA_VARD_ADDRESS,VARD_INSTRUCTION,value);
    return;
}

/*****************************************************************************
* @brief Read the value of the 3V3D voltage from the IN2 of the ADT7411
*
* This function is used to read the value of the 3V3D voltage and convert it
* to float
*
* @return Returns the computed voltage on the 3V3D pin as float
******************************************************************************/
float read_3v3d()
{
    float voltage;
    int temp;
    temp = read_channel_adt7411(1);
    voltage = (float ) RATIO2 * (float) temp * (float)RESOLUTION;
    printf("Read value %x:\n",temp);
    printf ("Voltage is %f:\n",voltage);
    return voltage;
}
