@echo off
title Fotos van SD kaartje verplaatsen naar de harddisk van Vincent!


echo on
rem http://www.intelliadmin.com/index.php/2007/02/create-a-date-and-time-stamp-in-your-batch-files/


set doelmap=%sdkardbatch%

set curr_date=%date:~-4%-%date:~6,2%-%DATE:~3,2%
mkdir C:\sdkardbatch\%curr_date%
xcopy /s G:\DCIM\*.* C:\sdkardbatch\%curr_date%

rd /s G:\DCIM\
rem copy sd card , folder met fotos to folder en deletes folder op sd


%SystemRoot%\explorer.exe "C:\sdkardbatch\%curr_date%\"

