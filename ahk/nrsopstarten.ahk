#include C:\Users\VTH\Desktop\template2018\ahk\_include_variabelen.ahk  ; dit bestand staat op je lokale pc , maar de simultane copy runt vanaf fileserver , dus altijd direct adressering gebruiken
Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
scriptnaam :="nrsopstarten win+F4 kan soms anders windows betekenis hebben"  
;FileAppend, %Timestamp% - %scriptnaam%`n, %AhkLogbestand% ;save naar txt file concat
aantalkliksUitgespaart := 0   ; aantalkliksUitgespaart += 1  ; een klik is click of tab of enter of up of down of shiftF9 of ... 
Sleep 300,

BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

 

CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates
SetKeyDelay, 100 ; hoe rap stuur je typcommandos  
 
Loop, 1
{
	ToolTip,     %scriptnaam%    ; ahk variabele oproepen moet met %% 
	Sleep, 1000
	ToolTip
}





 

 SetTitleMatchMode, 3 ; 3 =  A window's title must exactly match WinTitle to be a match.
if  (PID := ProcessExist("MSACCESS.EXE")) and WinExist("LET") 


{

if WinExist("LET")  
  {  WinActivate  ; let ( = nrs ) maar vault noemt LETVault , dus dat moet precieser
  }


	;WinGetTitle, Title, A ; steek de programmanaam is var %Title%
	; MsgBox, %Title%
 WinActivate  "LET"; Uses the last found window.
; #WinActivateForce "LET"

 
 
 
   ; MsgBox "nrs exists and has the Process ID " PID "." LET en msacces bestaan
   Run, "C:\Users\vth\Desktop\template2018\ahk\nrsZoekeenNummer.ahk"
   
	}
else
   { 
   ;MsgBox "nrs does not exist."
   
   ;listVars
;pause
 aantalkliksUitgespaart += 1
Run, %nrsEXE%
;WinWaitActive, Acces, 
MouseMove 1004,  648

Sleep, 1000
WinWait, Beveiligingsmelding van Microsoft Access, 

WinWaitActive, Beveiligingsmelding van Microsoft Access, 
 aantalkliksUitgespaart += 1

MouseClick, left,  215,  275
;MouseClick, left, 1004,  648
Sleep, 1000

WinWait, Login, 
WinWaitActive, Login, 
 aantalkliksUitgespaart += 1
MouseClick, left,  135,  85
Sleep, 100
 aantalkliksUitgespaart += 1
Send, %nrsLogin%{TAB}%nrsPaswoord%
Sleep, 100
;MouseClick, left,  226,  173
 aantalkliksUitgespaart += 1
MouseClick, left,  226,  198
Sleep, 100

;4/3/2020 opbjectinvulveld op gaan staan
; aantalkliksUitgespaart += 1
;MouseClick, left,  100,  900 ; scherm rel waarden
;Sleep, 100





		  				MouseMove, %inputletrefx%, %inputletrefy%  ;  
	Sleep, 100
		aantalkliksUitgespaart += 1
		   MouseClick, left  ; niewe tabllat vers en boven al de oude
		   Sleep, 100



}


FileAppend, %Timestamp% - %scriptnaam%  kliks : %aantalkliksUitgespaart%`n, %AhkLogbestand% ;save naar txt file concat


;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop 
ExitSub:
{
	BlockInput, MouseMoveOff
	;MsgBox "EXIT-"%scriptnaam%
	MsgBox, 48, you pressed escape- , %scriptnaam%, 1
	ExitApp
	return
}
ESC::Goto ExitSub              