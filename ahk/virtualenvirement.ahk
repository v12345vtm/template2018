    
    BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  Sleep  500,
 CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:


Run cmd

Sleep 900




  
  

 SetTitleMatchMode 2 ; parameter die nodig is voor winexist 
 If WinExist("C:\WINDOWS\SYSTEM32\cmd.exe")
{
	;MsgBox, u venster is open	  en ik zal het vooraan zetten
	ToolTip, u programma (Selecteren Opdrachtprompt) is open `n  	 en ik zal het vooraan zetten   `n   voila! , 170,950
	WinActivate  ; venster aktief  ; zetten die we net gezocht en gevonden hebben
	Sleep 200,  



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


;Run  C:\Users\vth\Desktop\template2018\macros\octopiinstaller.xlsm

If WinExist("octopiinstaller.xlsm - Excel")
{
WinActivate  ; venster aktief zetten
Sleep 100
}
else
{

Run "C:\Users\vth\Desktop\template2018\macros\octopiinstaller.xlsm"
     ;C:\Users\vth\Desktop\template2018\macros\octopiinstaller.xls
Sleep 500
Run "C:\Users\vth\Desktop\template2018\macros\diff.xlsm"	 
	 
}



	
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



