;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
   Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
   scriptnaam :="msofttabelexportandConcattofileMoft"   
   FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
       Sleep 300,





 ToolTip, export de huidige  tabel als je wil naar 1 file,170 , 950
 
    SetKeyDelay, 200 ; hoe rap stuur je typcommandos 
    BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

   CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
  
 InputBox, UserInput, msoftTabelExportAndConcatFile, de huidige  tabel wat je nu ziet komt in bestand en muisblock 20sec., , 640, 480
if ErrorLevel
   ; MsgBox, CANCEL was pressed.
	ExitApp 
	
else
   ; MsgBox, You entered "%UserInput%" 
  
  
;FileAppend, `n%UserInput%*`n, c:/aa/klembord1.txt ;save naar txt file

;if Detail Materiaalkosten 2x up







MouseClick, Right
Sleep 100,

Send, {Up}
Sleep 100,

Send, {Up}
Sleep 100,


Send, {Enter}
Sleep 60000,


;als msoft moet nadenken komt er een window bij
;>>>>>>>>>>( Window Title & Class )<<<<<<<<<<<
;Press Cancel to abort browser copy          
;ahk_class ProMainWin

;FileAppend,hallo`n,c:/aa/klembord1.txt ;save naar txt file

OnClipboardChange:
FileAppend, %clipboard%, C:\Users\vth\Desktop\template2018\logfiles\msoftdb.txt ;save naar txt file

Sleep 100,
Run C:\Users\vth\Desktop\template2018\logfiles\msoftdb.txt

;Send, {ESC}
;Sleep 10,




 











;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
BlockInput, MouseMoveOff
MsgBox "EXIT-"%scriptnaam%
ExitApp
return
}
#::Goto ExitSub
