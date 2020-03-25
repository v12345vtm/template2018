 	   ;INIT ahk 	elke export zetten we in ons exportbestand , dat is een vaste output filename.
scriptnaam :="nrsopstarten win+F4 kan soms anders windows betekenis hebben"  
BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

;; export to log
FormatTime, CurrentDateTime,, yyMMddHHmmss
timestampel:= CurrentDateTime  ; om een ahk property op te slaan naar ahk variabele geen %% nodig
FileAppend,  %timestampel% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
Sleep 300,


;;pre-start en variabelen


CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates
SetKeyDelay, 100 ; hoe rap stuur je typcommandos  
 
Loop, 1
{
	ToolTip,     %scriptnaam%    ; ahk variabele oproepen moet met %% 
	Sleep, 1000
	ToolTip
}

;;;START


;BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
;Sleep 500,

Run, "L:\Letdata\database\versie_H (Jorosoft)\NRS\VTH\LetP.accdb"
;WinWaitActive, Acces, 
MouseMove 1004,  648

Sleep, 1000
WinWait, Beveiligingsmelding van Microsoft Access, 
WinWaitActive, Beveiligingsmelding van Microsoft Access, 
MouseClick, left,  215,  275
;MouseClick, left, 1004,  648
Sleep, 1000

WinWait, Login, 
WinWaitActive, Login, 
MouseClick, left,  135,  85
Sleep, 100
Send, vth{TAB}vith123
Sleep, 100
;MouseClick, left,  226,  173
MouseClick, left,  226,  198
Sleep, 100

;4/3/2020 opbjectinvulveld op gaan staan
MouseClick, left,  100,  900 ; scherm rel waarden
Sleep, 100


;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
	BlockInput, MouseMoveOff
	;MsgBox "EXIT-"%scriptnaam%
	MsgBox, 48, you pressed escape- , you pressed esc- `n`n This message will self-destruct in 1 seconds., 1
	ExitApp
	return
}
ESC::Goto ExitSub              