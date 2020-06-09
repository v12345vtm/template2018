;INIT ahk 	elke export zetten we in ons exportbestand , dat is een vaste output filename.
scriptnaam :="pdmverkenner"  
; BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

;; export to log
FormatTime, CurrentDateTime,, yyMMddHHmmss
timestampel:= CurrentDateTime  ; om een ahk property op te slaan naar ahk variabele geen %% nodig
FileAppend,  %timestampel% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
Sleep 300,


;;pre-start en variabelen

zoekknopx := 1300 ; 311
zoekknopy := 110 ; 190

zoekveldx := 482 ; 815
zoekveldy:= 190 ; 250

 


CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates

SetKeyDelay, 20 ; hoe rap stuur je typcommandos  
 
Loop, 1
{
	ToolTip,     %scriptnaam%     ; ahk variabele oproepen moet met %% 
	Sleep, 1000
}

;;;START

run C:\Users\VTH\Desktop\pdmfilescopy

;wachtenOPprogram := "ahk_class SunAwtFrame" ; 
wachtenOPprogram := "LET_VAULT" ; typ hier welk programma je wil openen en monitoren wat er mee gebeurd

 ToolTip, var wachten tot %wachtenOPprogram%-inlog er is  %A_Index% 
  Sleep, 1000

 Run C:\LET_VAULT ;pdm met gele mapjes oproepen zonder inhoud wegens geen login
 WinWait, %wachtenOPprogram%, , 6
if ErrorLevel
{
   ToolTip, timed out %wachtenOPprogram%-inlog er is  %A_Index% 
  Sleep, 2000
 ; return
    Exitapp
	
	
}
else
{
      ToolTip,ok  %wachtenOPprogram%  is er  %A_Index% 
	  
  	 WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
		 	ToolTip, pdm via verkenner aktiefzetten   
		 	Sleep 1500,
		 
		;WinMaximize, A 
		WinMaximize
		ToolTip, pdm via verkenner maximaliseren 
  
  
 


Loop, 1
{
	;MouseMove, %zoekknopx%, %zoekknopy%  ; eendagTerug positieknop
	;Sleep, 100
	;	MouseMove, %zoekveldx%, %zoekveldy%  ; tiknr positieknop
	
;	Sleep, 1500
		MsgBox, 48, rtr , rt- `n`n This message will self-destruct in 2 seconds., 2

}
  
MouseMove, %zoekknopx%, %zoekknopy%  ; eendagTerug positieknop
ToolTip, klik op zoekvergrootglas
    MouseClick, left
		Sleep, 1500
		
			MouseMove, %zoekveldx%, %zoekveldy%  ; tiknr positieknop
			ToolTip, klik op zoekveld
			 MouseClick, left
	Sleep, 500
	
	
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






