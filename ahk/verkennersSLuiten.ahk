#include C:\Users\VTH\Desktop\template2018\ahk\_include_variabelen.ahk  ; dit bestand staat op je lokale pc , maar de simultane copy runt vanaf fileserver , dus altijd direct adressering gebruiken

Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
scriptnaam :="verkennerSLuiten-incl"  
FileAppend, %Timestamp% - %scriptnaam%`n, %AhkLogbestand% ;save naar txt file concat
Sleep 300,

BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates
SetKeyDelay, 500 ; hoe rap stuur je typcommandos  

Loop, 1
{
	
	ToolTip,     %scriptnaam%    ; ahk variabele oproepen moet met %% 
	
	Sleep, 10
}

SetTitleMatchMode, 2
Loop, 9
{
	WinClose, ahk_class CabinetWClass  ;  closes any explorer window
	;MsgBox, Iteration number is %A_Index%.  ; A_Index will be 1, 2, then 3
	Sleep, 100
}

;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
	BlockInput, MouseMoveOff
	
	MsgBox, 48, you pressed escape- , you pressed esc- `n`n This message will self-destruct in 1 seconds., 1
	ExitApp
	return
}
ESC::Goto ExitSub              