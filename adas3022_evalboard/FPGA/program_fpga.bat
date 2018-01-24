@echo off

set PROGRAM_FILE=ced1z.sof

%QUARTUS_ROOTDIR%/bin/quartus_pgm.exe -c "USB-Blaster [USB-0]" -m JTAG -o p;%PROGRAM_FILE%

@ set _NIOS2EDS_ROOT=%SOPC_KIT_NIOS2:\=/%
cd %_NIOS2EDS_ROOT%
%QUARTUS_ROOTDIR%\bin\cygwin\bin\bash.exe -c "%_NIOS2EDS_ROOT%/nios2_command_shell.sh nios2-download -g ADIEvalBoard.elf"