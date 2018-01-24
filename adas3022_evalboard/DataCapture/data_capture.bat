@ set _NIOS2EDS_ROOT=%SOPC_KIT_NIOS2:\=/%
cd %_NIOS2EDS_ROOT%
%QUARTUS_ROOTDIR%\bin\cygwin\bin\bash.exe -c "%_NIOS2EDS_ROOT%/nios2_command_shell.sh system-console.exe -cli --script=data_capture.tcl"
