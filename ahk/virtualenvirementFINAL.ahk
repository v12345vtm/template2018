 ;INIT ahk 	elke export zetten we in ons exportbestand , dat is een vaste output filename.
scriptnaam :="virtualenvirementFINAL"  
BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

;; export to log
FormatTime, CurrentDateTime,, yyMMddHHmmss
timestampel:= CurrentDateTime  ; om een ahk property op te slaan naar ahk variabele geen %% nodig
FileAppend,  %timestampel% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
Sleep 300,


;;pre-start en variabelen
;artikelomschrijving

CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates
SetKeyDelay, 500 ; hoe rap stuur je typcommandos  
 
Loop, 1
{
	ToolTip,     %scriptnaam%    ; ahk variabele oproepen moet met %% 
	Sleep, 1000
}

;;;START

 







;^f5::Run C:\MySandbox ; virtuele omvirement in verkenner  ;control+f5
;^f6::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirement.ahk"
;^f7::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirementpostscan.ahk"
;^f8::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirementGUI.ahk"
;^f9::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirementMAKE.ahk"
;^f10::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirementFINAL.ahk"
;^f11::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirementUSB.ahk"



 
  


 SetTitleMatchMode 2 ; parameter die nodig is voor winexist 
 ;If WinExist("C:\WINDOWS\SYSTEM32\cmd.exe")
  If WinExist("Opdrachtprompt")
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
BlockInput, MouseMoveOff
MsgBox "EXIT-"%scriptnaam%
ExitApp
return
}
ESC::Goto ExitSub



