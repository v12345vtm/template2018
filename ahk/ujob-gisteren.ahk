#include C:\Users\VTH\Desktop\template2018\ahk\_include_variabelen.ahk  ; dit bestand staat op je lokale pc , maar de simultane copy runt vanaf fileserver , dus altijd direct adressering gebruiken

Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
scriptnaam :="ujob-gisteren-incl"  
FileAppend, %Timestamp% - %scriptnaam%`n, %AhkLogbestand% ;save naar txt file concat
Sleep 300,


CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates

SetKeyDelay, 20 ; hoe rap stuur je typcommandos  
 
Loop, 1
{
	ToolTip,     %scriptnaam%     ; ahk variabele oproepen moet met %% 
	Sleep, 1000
}

;;;START

;wachtenOPprogram := "ahk_class SunAwtFrame" ; 
wachtenOPprogram := "UJob" ; 

 ToolTip, var wachten tot %wachtenOPprogram%-inlog er is  %A_Index% ,170,950
  Sleep, 1000

Run, %ujobEXE%
 WinWait, %wachtenOPprogram%, , 3
if ErrorLevel
{
   ToolTip, timed out %wachtenOPprogram%-inlog er is  %A_Index% ,170,950
  Sleep, 1000
    return
}
else
{
      ToolTip,ok  %wachtenOPprogram%-inlog er is  %A_Index% ,170,950
  Sleep, 1000
  
  	Send %ujobLogin%
		Sleep, 300
Send {TAB}
	Sleep, 300
Send %ujobPaswoord%
	Sleep, 300
	Send {Enter}
	
	;we zijn ingelogd in ujob
	Sleep, 1000
  
  
ToolTip, UJOB VANDAAG (herstellingen op RGO = PROTEC en  eindcontrole = PROTES),170,950
;Sleep, 3000


Loop, 1
{
	MouseMove, %eendagTerugx%, %eendagTerugy%  ; eendagTerug positieknop
	Sleep, 100
		MouseMove, %tiknrx%, %tiknry%  ; tiknr positieknop
	Sleep, 100
		MouseMove, %totaalx%, %totaaly%  ; totaal positieknop
	Sleep, 100
}
  
  MouseMove, %eendagTerugx%, %eendagTerugy%  ; eendagTerug positieknop
  MouseClick, left
  
  ;  return
}

Exitapp



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








