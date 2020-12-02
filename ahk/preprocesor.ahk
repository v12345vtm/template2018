
FormatTime, CurrentDateTime,, dd/MM/yy
 
for n, param in A_Args  ; For each parameter:
{
    MsgBox Parameter number %n% is %param%.
}


 MsgBox, parameters oontvangen  %0%
  MsgBox, 1e parameters is  %1%

FileRead, TheText, test.txt
NewStr := StrReplace(TheText,"hi", CurrentDateTime)
msgbox, %NewStr%
;FileDelete, test.csv
FileAppend, %NewStr%, testdatum.txt