@echo off
title Fotos van G-DCIM SD kaartje verplaatsen naar de T schijf van Vincent!




echo on
rem http://www.intelliadmin.com/index.php/2007/02/create-a-date-and-time-stamp-in-your-batch-files/


set doelmap=%sdkardbatch%

set curr_date=%date:~-4%-%date:~6,2%-%DATE:~3,2%
rem mkdir C:\sdkardbatch\%curr_date%    of   T:\voor vincent\sdcardbatshFileserver\%curr_date%
mkdir "T:\voor vincent\sdcardbatshFileserver\%curr_date%"
 

@echo off
IF exist G:\DCIM ( echo myDirName exists ) ELSE ( EXIT)

 pushd G:\DCIM
   for /r %%a in (*.JPG) do (
     COPY "%%a" "T:\voor vincent\sdcardbatshFileserver\%curr_date%"
   )
   popd




%SystemRoot%\explorer.exe "T:\voor vincent\sdcardbatshFileserver\%curr_date%\"



rd /s G:\DCIM\
rem copy sd card , folder met fotos to folder en deletes folder op sd


