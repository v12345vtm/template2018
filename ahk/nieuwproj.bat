@echo off
title nieuw project!

SET /P uname=Please enter your projectnaam: 
IF "%uname%"=="" GOTO Error
ECHO Hello %uname%, Welcome to DOS inputs!
GOTO End
:Error
ECHO You did not enter your name! Bye bye!!
:End
 
mkdir C:\Users\vth\Desktop\%uname%
echo F|xcopy /S /Q /Y /F C:\Users\vth\Desktop\template2018\projectlabelaar.xlsm C:\Users\vth\Desktop\%uname%\%uname%.xlsm
xcopy /s C:\Users\vth\Desktop\template2018\pdftotext.exe C:\Users\vth\Desktop\%uname%
rem xcopy /s C:\Users\vth\Desktop\template2018\GetDWGfilenames.bat C:\Users\vth\Desktop\%uname%
 

 

%SystemRoot%\explorer.exe "C:\Users\vth\Desktop\%uname%"

