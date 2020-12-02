#include C:\Users\VTH\Desktop\template2018\ahk\_include_variabelen.ahk  ; dit bestand staat op je lokale pc , maar de simultane copy runt vanaf fileserver , dus altijd direct adressering gebruiken

Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
scriptnaam :="mail incl debugged "   
FileAppend, %Timestamp% - %scriptnaam%`n, %AhkLogbestand% ;save naar txt file concat
Sleep 300,

CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
;  SetKeyDelay, 500 ; hoe rap stuur je typcommandos   
Loop, 1
{
	ToolTip,     %scriptnaam%  opstarten  ; ahk variabele oproepen moet met %% 
	Sleep, 1000
}

SetTitleMatchMode, 2
If WinExist("Outlook" ) && (ahk_class rctrl_renwnd32)
{
	WinActivate
	;MsgBox ja
}else  {
;	MsgBox nee
	Run, %outlookEXE%
	Sleep, 500
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