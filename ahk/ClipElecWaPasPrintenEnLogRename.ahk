ToolTip, MsoftCompare export een tabel of stuklijst naar bestand1TXT file,170 , 950
SetKeyDelay, 200 ; hoe rap stuur je typcommandos 
CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
  

 ;T:\PRODUKTIE\SOFTWARE\Transfer\Electronische Waterpas
 ;T:\PRODUKTIE\SOFTWARE\Transfer\Electronische Waterpas\geprintDoorVith
 ;nrs openen en inport nr 30
 {
  
    BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  Sleep 1500,
   CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
  
  
  
   SetTitleMatchMode 2
 If WinExist("CLIP PROJECT")
{
	;MsgBox, u venster is open	, en ik zal het vooraan zetten
	ToolTip, u programma CLIP PROJECT  is open `n  	 en ik zal het vooraan zetten   `n   voila! ,170 , 950
	 WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
; ExitApp ; debug
	
}
else
{
	MsgBox, u venster  zie ik niet	open het eerst zelf
ExitApp
} 
    
Sleep 1500,  
  
  
ToolTip, ClipprojectImport-ahk  `n  sta je in clipproject ?  `n   script die om import duwt ,170 , 950
Sleep 500,


Send {ALT}
Sleep 200,
Send t
Sleep 500,
Send {DOWN 30} ; offset elec waterpas
Sleep 500,
Send {ENTER}
Sleep 200,

;ToolTip, lutze labels ofzo `n   scherm laad voor import ,170 , 950
Sleep 2000,
Send {TAB 13} ; als we 13keer op tab duwen , is onze knop "import" aktief
Sleep 500,


Send {ENTER}
Sleep 200,

 ToolTip, Voila `n   labels geimporteerd en we kunnen nu de logfile verplaatsen ,170 , 950
 
 

  ; van T:\PRODUKTIE\SOFTWARE\Transfer\Electronische Waterpas\CalibratieElektronischeWaterpas.csv
 ;naar  T:\PRODUKTIE\SOFTWARE\Transfer\Electronische Waterpas\geprintDoorVith\CalibratieElektronischeWaterpas.csv
 ;nrs openen en inport nr 30
 

Logbestand := "T:\PRODUKTIE\SOFTWARE\Transfer\Electronische Waterpas\CalibratieElektronischeWaterpas.test"
Verwerkt := "T:\PRODUKTIE\SOFTWARE\Transfer\Electronische Waterpas\geprintDoorVith\CalibratieElektronischeWaterpas.test"

FileMove, %Logbestand%, %Verwerkt%%A_YYYY%%A_MM%%A_dd%m%A_Min%
Sleep 800,

 ;ExitApp ;debug
 
 

ToolTip, logfile verplaatst ,170 , 950
 
 
Sleep 500,


;om direct te kunnen printen , proberen we een label eens aan te klikken en slepen we de muis ingedrukt weg
	MouseClick, left,  850,  150
	Sleep, 100	
	Click down
Sleep 500
MouseMove,   1370,  200
Click up
	
;	
ToolTip we gaan de printer klaarzetten ook :   control+p  ; wissen oude tooltips
Send, ^p ; control+p
Sleep 500,

ToolTip Zit de juiste rol in de printer ?,255,430 ; wissen oude tooltips
Sleep 4000,
































;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
BlockInput, MouseMoveOff
MsgBox emergencystop ClipprojectImport-ahk
ExitApp
return
}
ESC::Goto ExitSub





}