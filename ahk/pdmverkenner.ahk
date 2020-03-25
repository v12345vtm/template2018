;INIT ahk 	elke export zetten we in ons exportbestand , dat is een vaste output filename.
scriptnaam :="pdmverkenner"  
; BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

;; export to log
FormatTime, CurrentDateTime,, yyMMddHHmmss
timestampel:= CurrentDateTime  ; om een ahk property op te slaan naar ahk variabele geen %% nodig
FileAppend,  %timestampel% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
Sleep 300,


;;pre-start en variabelen

zoekknopx := 1290 ; 311
zoekknopy := 108 ; 190

zoekveldx := 1064 ; 815
zoekveldy:= 190 ; 250

 


CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates

SetKeyDelay, 20 ; hoe rap stuur je typcommandos  
 
Loop, 1
{
	ToolTip,     %scriptnaam%     ; ahk variabele oproepen moet met %% 
	Sleep, 1000
}

;;;START

;wachtenOPprogram := "ahk_class SunAwtFrame" ; 
wachtenOPprogram := "LET_VAULT" ; 

 ToolTip, var wachten tot %wachtenOPprogram%-inlog er is  %A_Index% ,170,950
  Sleep, 1000

 Run C:\LET_VAULT ;pdm met gele mapjes oproepen zonder inhoud wegens geen login
 WinWait, %wachtenOPprogram%, , 3
if ErrorLevel
{
   ToolTip, timed out %wachtenOPprogram%-inlog er is  %A_Index% ,170,950
  Sleep, 1000
    return
}
else
{
      ToolTip,ok  %wachtenOPprogram%  is er  %A_Index% ,170,950
	  
  	 WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
		 	ToolTip, pdm via verkenner aktiefzetten   
		 	Sleep 1500,
		 
		;WinMaximize, A 
		WinMaximize
		ToolTip, pdm via verkenner maximaliseren 
  
  
 


Loop, 1
{
	MouseMove, %zoekknopx%, %zoekknopy%  ; eendagTerug positieknop
	Sleep, 100
		MouseMove, %zoekveldx%, %zoekveldy%  ; tiknr positieknop
	Sleep, 100

}
  
MouseMove, %zoekknopx%, %zoekknopy%  ; eendagTerug positieknop
    MouseClick, left
		Sleep, 100
		
			MouseMove, %zoekveldx%, %zoekveldy%  ; tiknr positieknop
			 MouseClick, left
	Sleep, 100
	
	
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






