;dit programma werkt enkel als gecompileerde EXE

FormatTime, CurrentDateTime,, dd/MM/yyyy
 



; MsgBox, parameters oontvangen  %0%
;  MsgBox, 1e parameters is  %1%
  
  inputbestand =  %1%
  outputbestand =  %1%
  outputbestand .= .post.txt


; MsgBox, input is  %inputbestand% en output is  %outputbestand%
 
 
FileRead, TheText, %inputbestand%
NewStr := StrReplace(TheText,"___DOCDATE___", CurrentDateTime)
;msgbox, %NewStr%

;FileAppend, %NewStr%, testdatum.txt

file := FileOpen(outputbestand, "w")
if !IsObject(file)
{
    MsgBox Can't open "%outputbestand%" for writing.
    return
}

file.Write(NewStr)
file.Close()