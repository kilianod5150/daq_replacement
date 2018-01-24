/**************************************************************************//**
*   @file   adas3022_regs.h
*   @brief  Header file for the registers of ADAS3022 ADC altera avalon IP
*   @author ACostina
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

#ifndef __ADAS3022_REGS_H__
#define __ADAS3022_REGS_H__

#include <io.h>

/* all registers are 32 bits wide .*/

#define IOADDR_ADAS3022_CONTROL(base)           __IO_CALC_ADDRESS_NATIVE(base, 0)
#define IORD_ADAS3022_CONTROL(base)             IORD(base, 0)
#define IOWR_ADAS3022_CONTROL(base, data)       IOWR(base, 0, data)

#define IOADDR_ADAS3022_ACQ_COUNT(base)         __IO_CALC_ADDRESS_NATIVE(base, 1)
#define IORD_ADAS3022_ACQ_COUNT(base)           IORD(base, 1)
#define IOWR_ADAS3022_ACQ_COUNT(base, data)     IOWR(base, 1, data)

#define IOADDR_ADAS3022_BASE(base)              __IO_CALC_ADDRESS_NATIVE(base, 2)
#define IORD_ADAS3022_BASE(base)                IORD(base, 2)
#define IOWR_ADAS3022_BASE(base, data)          IOWR(base, 2, data)

#define IOADDR_ADAS3022_STATUS(base)            __IO_CALC_ADDRESS_NATIVE(base, 3)
#define IORD_ADAS3022_STATUS(base)              IORD(base, 3)
#define IOWR_ADAS3022_STATUS(base, data)        IOWR(base, 3, data)

#define IOADDR_ADAS3022_DUT(base)               __IO_CALC_ADDRESS_NATIVE(base, 4)
#define IORD_ADAS3022_DUT(base)                 IORD(base, 4)
#define IOWR_ADAS3022_DUT(base, data)           IOWR(base, 4, data)

#endif /* __ADAS3022_REGS_H__ */
