
    
    BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  Sleep 1500,
   CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
  

   SetTitleMatchMode 2
 If WinExist("AUTO - Projecten")
{
	;MsgBox, u venster is open	, en ik zal het vooraan zetten
	ToolTip, u programma AUTO - Projecten is open `n  	 en ik zal het vooraan zetten   `n   voila! ,170 , 950
	WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
;ExitApp ; debug
	
}
else
{
	MsgBox, u venster  AUTO - Projecten  zie ik niet !! open het eerst zelf
ExitApp
} 
    
Sleep 1500,  



;Send {ENTER} ;wegens msoft strontprogramma mag je niet consequent zijn

;WinWaitActive, AUTO - Projecten  -  LET Automotive n.v.

ToolTip, msoft de tabel de 1e regel in klembord zetten,170 , 950

Sleep, 200

MouseMove, 110,100 ; op 1e regel gaan staan en dan tabel kopieren


Sleep, 50
MouseClick, Right
Sleep, 50
Send {UP 2}
Sleep, 50
Sleep, 2
Send {ENTER}



;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
MsgBox emergencystop
ExitApp
return
}
ESC::Goto ExitSub