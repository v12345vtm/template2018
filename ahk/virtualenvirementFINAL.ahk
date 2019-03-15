;^f5::Run C:\MySandbox ; virtuele omvirement in verkenner  ;control+f5
;^f6::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirement.ahk"
;^f7::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirementpostscan.ahk"
;^f8::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirementGUI.ahk"
;^f9::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirementMAKE.ahk"
;^f10::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirementFINAL.ahk"
;^f11::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirementUSB.ahk"



    
    BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  Sleep  500,
   CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
  


 SetTitleMatchMode 2 ; parameter die nodig is voor winexist 
 If WinExist("C:\WINDOWS\SYSTEM32\cmd.exe")
{
	;MsgBox, u venster is open	  en ik zal het vooraan zetten
	ToolTip, u programma (Selecteren Opdrachtprompt) is open `n  	 en ik zal het vooraan zetten   `n   voila! , 170, 950
	WinActivate  ; venster aktief  ; zetten die we net gezocht en gevonden hebben
	Sleep 500,  
;ExitApp ; debug
	
}
else
{
MsgBox, u venster cmd is niet open	 
ExitApp ; debug

}






Send python mk_kb_final{NumpadDot}py KB

;Send {ENTER}
 




;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
MsgBox emergencystop virt envirement
ExitApp
return
}
ESC::Goto ExitSub



