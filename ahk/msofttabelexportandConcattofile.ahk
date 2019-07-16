 ToolTip, export zoveel tabellen als je wil naar 1 file,170 , 950
 
    SetKeyDelay, 200 ; hoe rap stuur je typcommandos 
  ;  BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

   CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
  
 InputBox, UserInput, setnaam, Please enter a art number., , 640, 480
if ErrorLevel
    MsgBox, CANCEL was pressed.
else
   ; MsgBox, You entered "%UserInput%" 
  
  
FileAppend, `n%UserInput%*`n, c:/aa/klembord1.txt ;save naar txt file

;if Detail Materiaalkosten 2x up







MouseClick, Right
Sleep 100,

Send, {Up}
Sleep 100,

Send, {Up}
Sleep 100,


Send, {Enter}
Sleep 1400,


;FileAppend,hallo`n,c:/aa/klembord1.txt ;save naar txt file

OnClipboardChange:
FileAppend, `n%clipboard%`n, c:/aa/klembord1.txt ;save naar txt file

Sleep 100,
Run c:/aa/klembord1.txt  

;Send, {ESC}
;Sleep 10,




 











;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
MsgBox exiting port alle tabellen wat je ziet
ExitApp
return
}
#::Goto ExitSub
