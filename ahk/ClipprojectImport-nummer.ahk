{
  BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  Sleep 500,
   CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
   
   SetTitleMatchMode 2
 If WinExist("CLIP PROJECT")
{
	;MsgBox, u venster is open	, en ik zal het vooraan zetten
	ToolTip, u programma CLIP PROJECT  is open `n  	 en ik zal het vooraan zetten   `n   voila! ,170 , 950
	 WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
 
  
ToolTip, ClipprojectImport-nummer-ahk-EXE  `n  sta je in clipproject ?  `n   excel die om import duwt ,170 , 950
Sleep 500,


Send {ALT}
Sleep 200,
Send t
Sleep 500,
Send {DOWN %1%} ; %1% is de parameter die excel ons meegaf in de ahk.exe
Sleep 500,
Send {ENTER}
Sleep 200,

ToolTip, excel to import `n   scherm laad voor import ,170 , 950
Sleep 2000,
Send {TAB 13} ; als we 13keer op tab duwen , is onze knop "import" aktief
Sleep 500,


Send {ENTER}
Sleep 200,

 ToolTip, Voila `n   excel heeft labels geimporteerd  ,170 , 950
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
MsgBox emergencystop ClipprojectImport-nummer-ahk
ExitApp
return
}
ESC::Goto ExitSub





}