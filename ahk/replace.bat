
@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION 
SET "sourcedir=C:\Users\vth\Desktop\template2018\logfiles"
SET "destdir=C:\Users\vth\Desktop\template2018\logfiles"
SET "filename1=%sourcedir%\compare1.txt"
SET "outfile=%destdir%\compare1replace.txt"
 

(
FOR /f "usebackqdelims=" %%a IN ("%filename1%") DO (
 SET "line=%%a"
 
  rem replace commas to sterretje
 SET "line=!line:,=*!"
 
 
 rem remove all commas
 SET "line=!line:,=!"
 
 rem     vervang / naar -
 SET "line=!line:/=-!"
 
 
 

 ECHO !line!
)
)>"%outfile%"

GOTO :EOF