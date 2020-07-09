#include C:\Users\VTH\Desktop\template2018\ahk\_include_variabelen.ahk  ; dit bestand staat op je lokale pc , maar de simultane copy runt vanaf fileserver , dus altijd direct adressering gebruiken

Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
scriptnaam :="virtualenvirementMAKE-incl"  
FileAppend, %Timestamp% - %scriptnaam%`n, %AhkLogbestand% ;save naar txt file concat
Sleep 300,

CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates
SetKeyDelay, 50 ; hoe rap stuur je typcommandos  

Loop, 1
{
	ToolTip,     %scriptnaam%    ; ahk variabele oproepen moet met %% 
	Sleep, 1000
}

BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
Sleep 500,
CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:

SetTitleMatchMode 2 ; parameter die nodig is voor winexist 
;If WinExist("C:\WINDOWS\SYSTEM32\cmd.exe")
If WinExist("Opdrachtprompt")
{
	;MsgBox, u venster is open	  en ik zal het vooraan zetten
	ToolTip, u programma (Selecteren Opdrachtprompt) is open `n  	 en ik zal het vooraan zetten   `n   voila! , 170 , 950
	WinActivate  ; venster aktief  ; zetten die we net gezocht en gevonden hebben
	Sleep 500,  
	;ExitApp ; debug
}else  {
	MsgBox, u venster cmd is niet open	 
	ExitApp ; debug
}

;python mk_project.py kb
Send mededeling voor VTH : kies een optie voor -t , en meestal is de taal default --l E{Enter}
Send python mk_project{NumpadDot}py kb

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