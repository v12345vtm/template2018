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


 


;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
MsgBox emergencystop virt envirement
ExitApp
return
}
ESC::Goto ExitSub



