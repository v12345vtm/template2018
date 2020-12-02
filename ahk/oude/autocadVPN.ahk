	Loop, 20
	{
	
		ToolTip, autocaddelay : sluit de vpn en kom binnen minutje terug : druk esc om te stoppen   %A_Index%  /20 seconden  ; A_Index will be 1, 2, then 3
		Sleep, 900
	}
	
Run C:\Users\VTH\Desktop\template2018\allevoedingskastjesvariantren.dwg



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