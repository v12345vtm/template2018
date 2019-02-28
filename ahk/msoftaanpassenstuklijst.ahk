



;comment AANPASSEN  = win+ S = msoft deelfases produktie; shiftF9 , 9keer tab , pijltje rechts

ToolTip, aanpassenstuklijst-ahk = in Msoft artikelen,303,750


    
    BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  Sleep 1500,
  
  

   SetTitleMatchMode 2
 If WinExist("AUTO - Artikelen")
{
	;MsgBox, u venster is open	, en ik zal het vooraan zetten
	ToolTip, u programma AUTO - Artikelen is open `n  	 en ik zal het vooraan zetten   `n   voila! ,303,750
	WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
	Sleep 1500,  
;ExitApp ; debug
	
}
else
{
	MsgBox, u venster  AUTO - Artikelen  zie ik niet !! open het eerst zelf
ExitApp
} 
    
Sleep 1500,  






Send, +{F9} {Tab 9}{Right}
	Sleep 900,
	MouseMove, 52, 150
	Sleep 200, ;200ipv500

MouseClick, left
MouseClick, left
;we klikken op rij produktie vbd tabel
Send, {Tab 5}{Right}{Tab 4}{Right}{Tab 6}{Right}{Tab}


ToolTip, pas maar aan ,303,750
Sleep 3000,


;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
MsgBox emergencystop aanpassenstuklijst-ahk
ExitApp
return
}
ESC::Goto ExitSub
