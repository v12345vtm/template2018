@echo off
CALL:LABEL "one" "two" "three" "four" "five" "six" "seven" "eight" "nine" "ten" "eleven" "twelve"    "1three" "1four" "1five" "1six" "1seven" "1eight" "1nine" "twintig" "21" "22" "23" "24" "25" "26" "27"      
PAUSE
GOTO:EOF

:LABEL
:: print arguments 1-9
echo|set /p=%1
echo|set /p= %2
echo|set /p= %3
echo|set /p= %4
echo|set /p= %5
echo|set /p= %6
echo|set /p= %7
echo|set /p= %8
echo|set /p= %9

:: print arguments 10-18
shift
shift 
shift
shift 
shift
shift 
shift
shift 
shift

echo|set /p=%1
echo|set /p= %2
echo|set /p= %3
echo|set /p= %4
echo|set /p= %5
echo|set /p= %6
echo|set /p= %7
echo|set /p= %8
echo|set /p= %9

:: print arguments 19-27
shift
shift 
shift
shift 
shift
shift 
shift
shift 
shift
echo|set /p=%1
echo|set /p= %2
echo|set /p= %3
echo|set /p= %4
echo|set /p= %5
echo|set /p= %6
echo|set /p= %7
echo|set /p= %8
echo|set /p= %9