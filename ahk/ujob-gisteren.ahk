;INIT ahk 	elke export zetten we in ons exportbestand , dat is een vaste output filename.
scriptnaam :="ujob-gisteren"  
BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

;; export to log
FormatTime, CurrentDateTime,, yyMMddHHmmss
timestampel:= CurrentDateTime  ; om een ahk property op te slaan naar ahk variabele geen %% nodig
FileAppend,  %timestampel% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
Sleep 300,


;;pre-start en variabelen

eendagTerugx := 190 ; 311
eendagTerugy := 55 ; 190

tiknrx := 640 ; 815
tiknry:= 120 ; 250

totaalx:= 665 ; 760
totaaly:= 420 ; 550


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

Run, "C:\Users\vth\Desktop\ujoblet.jar - Snelkoppeling.lnk" ;"
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
  
  	Send 1302.50
		Sleep, 300
Send {TAB}
	Sleep, 300
Send vith123
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








