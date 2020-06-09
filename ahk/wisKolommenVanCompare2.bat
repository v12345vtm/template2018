echo Hello van  buroblad en runt absolute pathen lokaal

echo van =   C:\Users\vth\Desktop\template2018\temp\compare2-split.txt
echo via  = C:\Users\vth\Desktop\template2018\temp\compare2replace.txt
echo naar = C:\Users\vth\Desktop\template2018\temp\compare2-split.txt
rem pause

@Echo off

rem type "../logfiles/compare1.txt" | repl "(\t| )" "," x > "../logfiles/compare1-conv.txt"

SETLOCAL ENABLEDELAYEDEXPANSION 
SET "sourcedir=C:\Users\vth\Desktop\template2018\temp"
SET "destdir=C:\Users\vth\Desktop\template2018\temp"
SET "filename1=%sourcedir%\compare2.txt"
SET "outfile=%destdir%\compare2replace.txt"
rem C:\Users\vth\Desktop\template2018\logfiles\compare1replace.txt
rem C:\Users\vth\Desktop\template2018\logfiles\compare1-split.txt
 
rem nog files die we gebruiken vroeger met relatieve path : ../logfiles/compare1replace.txt
rem  														../logfiles/compare1-split.txt

(
FOR /f "usebackqdelims=" %%a IN ("%filename1%") DO (
 SET "line=%%a"
 
  rem replace commas to punt
 SET "line=!line:,=.!"
 
 
 rem remove all commas
 SET "line=!line:,=!"
 
 
  rem remove all plus
 SET "line=!line:+=!"
 
 rem     vervang / naar -
 SET "line=!line:/=-!"
 
 
  rem     vervang spaties naar underscore
 SET "line=!line: =_!"
 
  rem     vervang tab naar spatie
 SET "line=!line:	= !"
 

 ECHO !line!
)
)>"%outfile%"

rem vanaf hier gaan we de tabellen die overtollig zijn wegdoen


(for /f "delims=" %%A in (C:\Users\vth\Desktop\template2018\temp\compare2replace.txt) do Call :Split %%A) > C:\Users\vth\Desktop\template2018\temp\compare2-split.txt

goto :Eof
:Split

rem  Echo %1*%2*%3*%4*%5*%6*%7*%8*%9*
rem goto :Eof

:: print arguments 1-9
echo|set /p=%1 
echo|set /p= %2 
echo|set /p= %3 
echo|set /p= %4 
echo|set /p= %5
rem echo|set /p= %6 w
rem echo|set /p= %7 x
rem echo|set /p= %8 y
rem echo|set /p= %9 z

:: print kolommen of arguments 10-18
shift
shift 
shift
shift 
shift
shift 
shift
shift 
shift

rem echo|set /p=%1+
rem echo|set /p= %2+
rem echo|set /p= %3+
rem echo|set /p= %4+
rem echo|set /p= %5+
rem echo|set /p= %6+
rem echo|set /p= %7+
rem echo|set /p= %8+
rem echo|set /p= %9+

:: print kolommen 19-27
shift
shift 
shift
shift 
shift
shift 
shift
shift 
shift
rem echo|set /p=%1-
rem echo|set /p= %2-
rem echo|set /p= %3-
rem echo|set /p= %4-
rem echo|set /p= %5-
rem echo|set /p= %6-
rem echo|set /p= %7-
rem echo|set /p= %8-
rem echo|set /p= %9-
echo .








rem for %%A in (%*) do (    echo %%A)

rem https://ss64.com/nt/syntax-args.html  %10 ?? argument

rem https://stackoverflow.com/questions/8328338/how-do-you-utilize-more-than-9-arguments-when-calling-a-label-in-a-cmd-batch-scr


 


rem FOR /F "tokens=* delims=^t" %%A IN (../logfiles/compare1.txt) DO ECHO %%A %%B %%C %%D %%E   >> ../logfiles/compare1-split.txt

