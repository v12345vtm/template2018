;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
scriptnaam :="testwindowtaskbar"   

 FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
Sleep 300,
 
 ;I am trying to figure out how to write a script that will compile a list of all the names of windows that are currently open, and store them in variables (window1, window2, etc.) I would like to be able to do this without having to activate each window one by one.
; I'm sure this is possible but I just can't figure out how. Thanks for your help.

 
WinGet, Window, List

Loop %Window%

{

Id:=Window%A_Index%

WinGetTitle, TVar , % "ahk_id " Id

Window%A_Index%:=TVar ;use this if you want an array

tList.=TVar "`n" ;use this if you just want the list

}

MsgBox %tList%

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