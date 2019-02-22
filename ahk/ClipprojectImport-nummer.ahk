{
  
  
   SetTitleMatchMode 2
 If WinExist("CLIP PROJECT")
{
	;MsgBox, u venster is open	, en ik zal het vooraan zetten
	ToolTip, u programma CLIP PROJECT  is open `n  	 en ik zal het vooraan zetten   `n   voila! ,303,750
	 WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
; ExitApp ; debug
	
}
else
{
	MsgBox, u clipproject  zie ik niet	open het eerst zelf
ExitApp
} 


 MsgBox, parameters oontvangen  %0%
  MsgBox, 1e parameters is  %1%
  
  ExitApp ; om niet alles te moeten doorlopen in de debugging
    
Sleep 1500,  
  
  
ToolTip, ClipprojectImport-ahk  `n  sta je in clipproject ?  `n   script die om import duwt ,303,750
Sleep 500,


Send {ALT}
Sleep 200,
Send t
Sleep 500,
Send {DOWN 29} ; klein grijs serienr labels
Sleep 500,
Send {ENTER}
Sleep 200,

ToolTip, lutze labels ofzo `n   scherm laad voor import ,303,750
Sleep 2000,
Send {TAB 13} ; als we 13keer op tab duwen , is onze knop "import" aktief
Sleep 500,


Send {ENTER}
Sleep 200,

 ToolTip, Voila `n   labels geimporteerd  ,303,750
Sleep 500,


;om direct te kunnen printen , proberen we een label eens aan te klikken en slepen we de muis ingedrukt weg
	MouseClick, left,  850,  150
	Sleep, 100	
	Click down
Sleep 1000
MouseMove,   1370,  200
Click up
	
;	
ToolTip we gaan de printer klaarzetten ook :   control+p  ; wissen oude tooltips
Send, ^p ; control+p
Sleep 500,

ToolTip Zit de juiste rol in de printer ?,255,430 ; wissen oude tooltips
Sleep 2000,



;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
MsgBox emergencystop ClipprojectImport-ahk
ExitApp
return
}
ESC::Goto ExitSub





}