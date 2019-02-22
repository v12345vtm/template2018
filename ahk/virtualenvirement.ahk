Run cmd

Sleep 900


 SetTitleMatchMode 2 ; parameter die nodig is voor winexist 
 If WinExist("C:\WINDOWS\SYSTEM32\cmd.exe")
{
	;MsgBox, u venster is open	  en ik zal het vooraan zetten
	ToolTip, u programma (Selecteren Opdrachtprompt) is open `n  	 en ik zal het vooraan zetten   `n   voila! ,303,750
	WinActivate  ; venster aktief  ; zetten die we net gezocht en gevonden hebben
	Sleep 500,  
;ExitApp ; debug
	
}
else
{
MsgBox, u venster cmd is niet open	 
ExitApp ; debug

}






Send cd{NumpadDot}{NumpadDot}
Send {ENTER}
Sleep 70
Send cd{NumpadDot}{NumpadDot}
Send {ENTER}
Sleep 70
Send cd{NumpadDot}{NumpadDot}
Send {ENTER}
Sleep 70
Send cd{NumpadDot}{NumpadDot}
Send {ENTER}
Sleep 70
Send cd{NumpadDot}{NumpadDot}
Send {ENTER}
Sleep 70
Send cd{NumpadDot}{NumpadDot}
Send {ENTER}
Sleep 70
Send cd{NumpadDot}{NumpadDot}
Send {ENTER}
Sleep 70


Send c{ASC 58}
Send {ENTER}
Sleep 600
Send cd Mysandbox{ASC 92}docauto
Send {ENTER}
Sleep 600
Send C{ASC 58}{ASC 92}Users{ASC 92}vth{ASC 92}Documents{ASC 92}docauto{ASC 92}docauto{ASC 92}Scripts{ASC 92}activate
Send {ENTER}




;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
MsgBox emergencystop virt envirement
ExitApp
return
}
ESC::Goto ExitSub



