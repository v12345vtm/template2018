 ToolTip, export de huidige  tabel als je wil naar 1 file,170 , 950
 
    SetKeyDelay, 200 ; hoe rap stuur je typcommandos 
  ;  BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

   CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
  
 InputBox, UserInput, msoftTabelExportAndConcatFile, de huidige tabel wat je nu ziet komt in bestand., , 640, 480
if ErrorLevel
   ; MsgBox, CANCEL was pressed.
	ExitApp 
	
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
BlockInput, MouseMoveOff
MsgBox exiting export alle tabellen wat je ziet - msofttabelexportandConcattofile.ahk 
ExitApp
return
}
#::Goto ExitSub
