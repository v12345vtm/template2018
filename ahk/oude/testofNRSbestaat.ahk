#include C:\Users\VTH\Desktop\template2018\ahk\_include_variabelen.ahk  ; dit bestand staat op je lokale pc , maar de simultane copy runt vanaf fileserver , dus altijd direct adressering gebruiken


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
;  SetKeyDelay, 500 ; hoe rap stuur je typcommandos 

BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
scriptnaam :="test2020 - acces detecteren"   
FileAppend, %Timestamp% - %scriptnaam%`n, %AhkLogbestand% ;save naar txt file concat
 
  
Loop, 1
{
	ToolTip,     %scriptnaam%  vul je nieuwe script maar aan  ; ahk variabele oproepen moet met %% 
	
	Sleep, 10
	
	ToolTip
	
}


;________________
; MAIN Loop
;________________



if (PID := ProcessExist("MSACCESS.EXE")) and WinExist("LET")
{
 WinActivate  ; Uses the last found window.
    MsgBox "nrs exists and has the Process ID " PID "." LET en msacces bestaan
	}
else
   { MsgBox "nrs does not exist."

}


Exitapp


;bestaatHetVenster(vensternaam , zetvooraan){
;returns the active venster

if WinExist("LET") ;or WinExist("ahk_class" . ClassName)
   { 
   WinActivate  ; Uses the last found window.

MsgBox % "The active window's ID is " . WinExist("A")




WinGetTitle, t1 ,A
WinGet, t3, ProcessName  ; steek de procesnam in variabele t3

 

ToolTip


 }
 else {
  MsgBox %t1%
 MsgBox %t3%

}



;Exitapp
;;;;;;;





;ProcessExist(Name){
;	Process,Exist,%Name%
;	return Errorlevel
;}


;WinGetTitle= "LET"  werkt
;;WinGetClass= OMain
;WinGetProcesname= MSACCESS.EXE
;WinGetpid= 3788




 


















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





