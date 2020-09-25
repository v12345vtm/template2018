#include C:\Users\VTH\Desktop\template2018\ahk\_include_variabelen.ahk  ; dit bestand staat op je lokale pc , maar de simultane copy runt vanaf fileserver , dus altijd direct adressering gebruiken


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
;  SetKeyDelay, 500 ; hoe rap stuur je typcommandos 

BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
scriptnaam :="template"   
FileAppend, %Timestamp% - %scriptnaam%`n, %AhkLogbestand% ;save naar txt file concat
 
  
Loop, 1
{
	ToolTip,     %scriptnaam%  vul je nieuwe script maar aan  ; ahk variabele oproepen moet met %% 
	Sleep, 1000
}


;________________
; MAIN Loop
;________________



If WinExist("AUTO - Artikelen  -  LET Automotive n.v.maar dan iets dat ne zal gebruiken")
{
	WinActivate


}
else

{
MsgBox, 48, templatedefault , %scriptnaam%, 8
}




















;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
BlockInput, MouseMoveOff

		MsgBox, 48, you pressed escape- , %scriptnaam%, 1
		
ExitApp
return
}
ESC::Goto ExitSub





