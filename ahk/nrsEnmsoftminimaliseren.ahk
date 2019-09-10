SetScrollLockState, off

 CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
 
 ToolTip, AUTOHOTKEY start nu NRS en MSOFT,900 , 500 ,20
  ToolTip, NIKS DOEN !! ESCAPE OM TE STOPPEN,900 , 500 ,20
 
 
    
    BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  Sleep 1500,
  
   

	Run, "L:\Letdata\database\versie_H (Jorosoft)\NRS\VTH\LetP.accdb"
	WinWaitActive, Acces, 
;uitvoeren = 1023,543
;openen=215, 245
;naamenpass = 135,85
;ok=226,173

	Sleep, 10
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
;WinMinimize, Acces, 

	
	;msoft 
	
	Run, "C:\Users\Public\Desktop\M-Soft 11.7 (ERP01).lnk"
WinWait, Welkom bij L.E.T. NV - MSP, 
;If WinNotActive, Welkom bij L.E.T. NV - MSP, , WinActivate, Welkom bij L.E.T. NV - MSP, 
WinWaitActive, Welkom bij L.E.T. NV - MSP, 
Sleep, 100
MouseClick, left,  159,  21
Sleep, 100
Send, {BACKSPACE}{BACKSPACE}{BACKSPACE}{BACKSPACE}{BACKSPACE}{BACKSPACE}vth
MouseClick, left,  147,  54
Sleep, 100
Send, vith123
MouseClick, left,  136,  157
Sleep, 1000
;WinMinimize, Welkom bij L.E.T. NV - MSP, 
Send, {Down 5}{Tab 1}{Down 2}
WinMinimizeAll





ExitApp ; dit is onze laatste stap na de herhaalloop


ExitSub:
{
BlockInput, MouseMoveOff
MsgBox emergencystop
ExitApp
return
}


 

ESC::Goto ExitSub
