#include C:\Users\VTH\Desktop\template2018\ahk\_include_variabelen.ahk  ; dit bestand staat op je lokale pc , maar de simultane copy runt vanaf fileserver , dus altijd direct adressering gebruiken

Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
scriptnaam :="win+w alg20 typen_incl"   
FileAppend, %Timestamp% - %scriptnaam%`n, %AhkLogbestand% ;save naar txt file concat
Sleep 300 ; hoe rap stuur je typcommandos  

CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates

Loop, 1
{
	ToolTip,     %scriptnaam%  overal mag dit   ; ahk variabele oproepen moet met %% 
	Sleep, 1
}

;;;START
ToolTip, ALG-jaartal typen 
SetScrollLockState, off
FormatTime, CurrentDateTime,, y
Send, ALG%CurrentDateTime%


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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Loop, 3
{
	ToolTip, A=   %CurrentDateTime%     ; A_Index will be 1, 2, then 3
	Sleep, 1000
	ToolTip,  B=   timestampel   ;werkt niet
	Sleep, 1000
	ToolTip,  C=   %timestampel%    ; werkt wel
	Sleep, 1000
}


;;;;;;;;;;;;DEBUG START
ToolTip, writefile virtklembordTXT ;
file := FileOpen("C:/Users/vth/Desktop/template2018/logfiles/virtklembord.txt", "w")
;TestString :="lijn3 .`r`n"  ; to start a new line. nieuwe regel 
file.Write(%timestampel%) ; ahk variabelen moeten geen %% hebben
;file.Write(TestString) ; ahk variabelen moeten geen %% hebben

file.Close() 
Sleep 100, 
Sleep 900,
;ExitApp
;;;;;;;;;;;;DEBUG STOP              