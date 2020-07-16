;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
   Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
   scriptnaam :="ClipprojectImport-nummer-exe"   
   FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
       Sleep 300,





Sleep 10
SetKeyDelay, 150 ; hoe rap stuur je typcommandos
  BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  Sleep 1500,
   CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
      SetTitleMatchMode 2
	  
	  
 If WinExist("CLIP PROJECT")
{
 BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
	;MsgBox, u venster is open	, en ik zal het vooraan zetten
	ToolTip, u programma CLIP PROJECT  is open `n  	 en ik zal het vooraan zetten   `n   voila! ,950 , 1000
	 WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
 
  
ToolTip, ClipprojectImport-nummer-ahk-EXE  `n  sta je in clipproject ?  `n   excel die om import duwt ,950 , 1000
Sleep 500,


Send {ALT}
Sleep 500,
Send t
Sleep 500,
Send {DOWN %1%} ; %1% is de parameter die excel ons meegaf in de ahk.exe
Sleep 500,
Send {ENTER}
Sleep 200,

ToolTip, excel to import `n   scherm laad voor import ,950 , 1000
Sleep 2000,
Send {TAB 13} ; als we 13keer op tab duwen , is onze knop "import" aktief
Sleep 500,


Send {ENTER}
Sleep 200,

 ToolTip, Voila `n   excel heeft labels geimporteerd  ,950 , 1000
Sleep 500,


Sleep 1500
;ExitApp



;om direct te kunnen printen , proberen we een label eens aan te klikken en slepen we de muis ingedrukt weg
	MouseClick, left,  850,  150
	
	Sleep, 1000	
	;Click down
;Sleep 1000
;MouseMove,   1370,  200
;Click up
	
;	
ToolTip we gaan de printer klaarzetten ook :   controlP  ; wissen oude tooltips
Send, ^p ; control+p
Sleep 500,

ToolTip Zit de juiste rol in de printer ?, 950 , 1000 ; wissen oude tooltips
Sleep 2000,








	
}
else
{
	MsgBox, excelserienummers ziet clipproject    niet	open het eerst zelf
ExitApp
} 


 ;MsgBox, parameters oontvangen  %0%
 ; MsgBox, 1e parameters is  %1%
  
 ; ExitApp ; om niet alles te moeten doorlopen in de debugging
    















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





