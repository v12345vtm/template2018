  

    
    BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  Sleep 1500,
   CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
  


  SetTitleMatchMode 2 ; parameter die nodig is voor winexist 
 If WinExist("AUTO - LET Automotive n.v.")
{
	;MsgBox, u venster is open	, en ik zal het vooraan zetten
	ToolTip, u programma Artikelen (AUTO - LET Automotive n.v) is open `n  	 en ik zal het vooraan zetten   `n   en klein in de rechterhoek! ,170 , 950
	WinActivate  ; venster aktief  ;AUTO - LET Automotive n.v; zetten die we net gezocht en gevonden hebben
	Sleep 700
	   WinGetPos,,, Width, Height, %WinTitle%	
    WinMove, %WinTitle%,, 1280, 570 ,620,440   ; msoft naar left1280 top570  width620  height440
	
	;WinMove, 1280, 570 ; testje oud
 
	
	Sleep 1500,  
ExitApp ; debug
	
}

ExitApp ; debug
 




;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
BlockInput, MouseMoveOff
MsgBox emergencystop
ExitApp
return
}
ESC::Goto ExitSub