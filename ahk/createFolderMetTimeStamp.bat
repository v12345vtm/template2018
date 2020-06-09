
echo on
rem http://www.intelliadmin.com/index.php/2007/02/create-a-date-and-time-stamp-in-your-batch-files/


set curr_date=%date:~-4%-%date:~6,2%-%DATE:~3,2%
rem mkdir C:\sdkardbatch\%curr_date%    of   T:\voor vincent\sdcardbatshFileserver\%curr_date%
mkdir "%curr_date%"


C:\Users\VTH\Desktop\template2018\ahk\desktop.ahk
 