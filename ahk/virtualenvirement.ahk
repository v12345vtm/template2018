 ;INIT ahk 	elke export zetten we in ons exportbestand , dat is een vaste output filename.
scriptnaam :="virtualenvirement"  
BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

;; export to log
FormatTime, CurrentDateTime,, yyMMddHHmmss
timestampel:= CurrentDateTime  ; om een ahk property op te slaan naar ahk variabele geen %% nodig
FileAppend,  %timestampel% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
Sleep 300,


;;pre-start en variabelen


CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates
SetKeyDelay, 50 ; hoe rap stuur je typcommandos  
 
Loop, 1
{
	ToolTip,     %scriptnaam%    ; ahk variabele oproepen moet met %% 
	Sleep, 1000
}

;;;START





ToolTip, certtool main folder openen , 170,950
 Run T:\_DOC
Loop, 3
{
	ToolTip,    ff wachten op verkenner   ; ahk variabele oproepen moet met %% 
	Sleep, 700
}



	ToolTip, cmd starten , 170,950
;Run C:\WINDOWS\SYSTEM32\cmd.exe ;soms duurt dat lang
Send {RWin} 
Sleep 70
Send  cmd 
Sleep 70
Send  {ENTER}
Sleep 70



	ToolTip, cmd starten normaal , 170,950
Sleep 1800


  
  

 SetTitleMatchMode 2 ; parameter die nodig is voor winexist 
 ;If WinExist("C:\WINDOWS\SYSTEM32\cmd.exe")
  If WinExist("Opdrachtprompt")
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
Send cd tools{ASC 92}docauto{ASC 92}docauto
Send {ENTER}
Sleep 600

;; send command in cmd box  : ; C:\Tools\docauto\docauto-3.7-vth\Scripts\activate.bat
Send C{ASC 58}{ASC 92}Tools{ASC 92}docauto{ASC 92}docauto-vth{ASC 92}Scripts{ASC 92}activate


Send {ENTER}


; C:\Tools\docauto\docauto-3.7-vth\Scripts\activate.bat
;Run  C:\Users\vth\Desktop\template2018\macros\octopiinstaller.xlsm

If WinExist("octopiinstaller.xlsm - Excel")
{
WinActivate  ; venster aktief zetten
Sleep 100
}
else
{

 Run "C:\Users\vth\Desktop\template2018\macros\octopiinstaller.xlsm"
    
Sleep 500
  
	 
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
BlockInput, MouseMoveOff
;MsgBox "EXIT-"%scriptnaam%
	MsgBox, 48, you pressed escape- , you pressed esc- `n`n This message will self-destruct in 1 seconds., 1
ExitApp
return
}
ESC::Goto ExitSub



