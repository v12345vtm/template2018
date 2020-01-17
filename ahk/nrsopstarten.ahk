;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
   Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
   scriptnaam :="nrsopstarten"   
   FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
       Sleep 300,



	
	 CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
	 
	ToolTip, INLOGGEN OP NRS,170 , 950
	
	   BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  Sleep 500,

Run, "L:\Letdata\database\versie_H (Jorosoft)\NRS\VTH\LetP.accdb"
WinWaitActive, Acces, 
;uitvoeren = 1023,543
;openen=215, 245
;naamenpass = 135,85
;ok=226,173

Sleep, 100
WinWait, Beveiligingsmelding van Microsoft Access, 
WinWaitActive, Beveiligingsmelding van Microsoft Access, 
MouseClick, left,  215,  245
Sleep, 100

WinWait, Login, 
WinWaitActive, Login, 
MouseClick, left,  135,  85
Sleep, 100
Send, vth{TAB}vith123
Sleep, 100
MouseClick, left,  226,  173
Sleep, 100


;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
BlockInput, MouseMoveOff
MsgBox "EXIT-"%scriptnaam%
ExitApp
return
}
ESC::Goto ExitSub
