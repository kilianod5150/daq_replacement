/**************************************************************************//**
*   @file   pca9564
*   @brief  Driver for the PCA9564 chip located on the CED1Z board.
*   @author Adrian Costina Adrian.Costina@analog.com
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
#include "pca9564.h"

/*****************************************************************************/
/************************ Private Functions Prototypes ***********************/
/*****************************************************************************/

void pca9564_reg_write ( unsigned short reg_value, unsigned short reg );  /* Function used to perform a PCA register write */
short pca9564_reg_read (unsigned short reg );                             /* Function used to perform a PCA register read */
void pca9564_reg_disable();                                             /* Function used to disable the PCA9564 */

/*****************************************************************************/
/************************ Functions Definitions ******************************/
/*****************************************************************************/

/*****************************************************************************
* @brief Function used to perform a register write
*
* This function will write in the reg register of the PCA the value reg_value.
* After it is done, it will program the PWR_DATA pins as inputs
*
* @param reg_value  The value that will be written in the register
* @param reg        The address of the register in which the write will be performed
* @return  No return value
******************************************************************************/
void pca9564_reg_write ( unsigned short reg_value, unsigned short reg )
{
    usleep (80);
    IOWR_ALTERA_AVALON_PIO_DIRECTION (PWR_DATA_BASE, 0xff);
    IOWR_ALTERA_AVALON_PIO_DATA (PWR_DATA_BASE, reg_value); // Prepares data to be written
    IOWR_ALTERA_AVALON_PIO_DATA (I2C_INT_BASE, reg|WRITE_PCA);  // Write Data
    IOWR_ALTERA_AVALON_PIO_DATA (I2C_INT_BASE, IDLE_PCA);       // Idle
    IOWR_ALTERA_AVALON_PIO_DIRECTION (PWR_DATA_BASE, 0x00);

}

/****************************************************************************
* @brief Function used to perform a register read
*
* This function will read the reg register and return the read value.
* After it is done, it will program the PWR_DATA pins as inputs
*
* @param reg The address of the register which will be read
*
* @return The value read from the register
******************************************************************************/
short pca9564_reg_read (unsigned short reg )
{
    short read_value;

    IOWR_ALTERA_AVALON_PIO_DIRECTION (PWR_DATA_BASE, 0x00);

    IOWR_ALTERA_AVALON_PIO_DATA (I2C_INT_BASE, reg|READ_PCA);   // Prepares the data to be read
    read_value = IORD_ALTERA_AVALON_PIO_DATA (PWR_DATA_BASE);   // Read data
    IOWR_ALTERA_AVALON_PIO_DATA (I2C_INT_BASE, 0x03);           // Idle

    IOWR_ALTERA_AVALON_PIO_DIRECTION (PWR_DATA_BASE, 0x00);

    return read_value;
}

/****************************************************************************
* @brief Function used to disable the PCA9564
*
* This function will disable the ENSIO bit and remove deassert of the CS pin
* After it is done, it will program the PWR_DATA pins as inputs
*
* @param reg The address of the register which will be read
*
* @return The value read from the register
******************************************************************************/
void pca9564_reg_disable()
{
    IOWR_ALTERA_AVALON_PIO_DIRECTION (PWR_DATA_BASE, 0xff);
    IOWR_ALTERA_AVALON_PIO_DATA (PWR_DATA_BASE, DISABLE_PCA);       //Disable ENSIO
    IOWR_ALTERA_AVALON_PIO_DATA (I2C_INT_BASE, I2CCON|WRITE_PCA);
    IOWR_ALTERA_AVALON_PIO_DATA (I2C_INT_BASE, 0xff);           //Deasserts PCA9564
    IOWR_ALTERA_AVALON_PIO_DIRECTION (PWR_DATA_BASE, 0x00);

    return;

}

/****************************************************************************
* @brief Activates the pca9564 chip and sets the ENSIO bit
*
*   This function is used to initialize the PCA9564. After it selects the chip
*   it will wait for 500 us so that the internal oscillator to be also initialized
*
* @return No return value
******************************************************************************/
void init_i2c()
{
    pca9564_reg_write (ENSIO|BR36K,I2CCON );

    usleep (1500);

    return;
}

/****************************************************************************
* @brief Sends start on the I2C line
*
* This function sends the start character on the I2C line initializing a data
* transfer
*
* @return No return value
******************************************************************************/
void start_i2c()
{
    short response = 0;

    pca9564_reg_write (ENSIO|STA|BR36K,I2CCON );


    while (response != 0x08 && response != 0x10 )
    {
        response = pca9564_reg_read(I2CSTA) ;   //read STATUS
    }

    return;
}

/****************************************************************************
* @brief Sends address + wr on the I2C line
*
* This function sends the address read/write bit on the I2C line. It must
* be followed by a data_read_i2c or data_write_i2c function
*
* @param addressrw the most significant 7 bits are used for addressing the I2C
*                   slave device, and the LSB is used signaling the direction,
*                   either Read (1) or Write (0)

* @return No return value
******************************************************************************/
void address_i2c(unsigned short addressrw)
{
    int response = 0;

    pca9564_reg_write (addressrw, I2CDAT );
    pca9564_reg_write (ENSIO|BR36K,I2CCON );

    while (response != 0x18 &&response != 0x40)
    {
        response = pca9564_reg_read(I2CSTA) ;   //read STATUS
    }

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
* @return The value read from the I2C line
******************************************************************************/
short data_read_i2c(unsigned short ack)
{
    int response = 0;
    short read_data;
    pca9564_reg_write (ENSIO|BR36K|ack,I2CCON );

    while (response != 0x58 && response != 0x50 )
    {
        response =  pca9564_reg_read(I2CSTA) ;  //read STATUS
    }

    read_data = pca9564_reg_read (I2CDAT);  //read DATA

    return read_data;
}

/****************************************************************************
* @brief Writes data to the I2C line
*
* Function used to write data to the I2C line.
*
* @param data Data to be written on the I2C line

* @return No return value
******************************************************************************/
void data_write_i2c(unsigned short data)
{
    int response=0;

    pca9564_reg_write (data,I2CDAT );
    pca9564_reg_write (ENSIO|BR36K,I2CCON );

    while (response != 0x28 )
    {
        response =  pca9564_reg_read(I2CSTA) ;  //read STATUS
    }

    return;
}

/****************************************************************************
* @brief sends stop on the I2C line.
*
* This function will send a STOP signal on the I2C line, closing the current
* data transfer
*
* @return No return value
******************************************************************************/
void stop_i2c()
{

    pca9564_reg_write (ENSIO|BR36K|STO,I2CCON );
    usleep(200);

    return;
}

/****************************************************************************
* @brief Disables the ENSIO bit and deasserts CS for pca9564 chip
*
* This function is to be used after all the I2C devices have been configured
*
* @return No return value
******************************************************************************/
void disable_i2c()
{

    pca9564_reg_disable();

    return;
}
