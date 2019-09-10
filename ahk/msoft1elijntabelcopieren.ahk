    
    BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  Sleep 300,
   CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
  

   SetTitleMatchMode 2
 If WinExist("AUTO - Projecten")
{
	;MsgBox, u venster is open	, en ik zal het vooraan zetten
	ToolTip, u programma AUTO - Projecten is open `n tja staat  `n   voila! ,170 , 950
	WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
	
	Sleep 600,  



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


; als serieverpak2019 open is , activeer het en klik erin


   SetTitleMatchMode 2
 If WinExist("serieverpak2019.xlsm - Excel")
{
WinActivate  ; venster aktief zetten
Sleep, 500
MouseClick, Left , 100 , 400 ; aktief zetten labeltool
Sleep, 200
MouseClick, Left , 100 , 400  ; klik op plak

}
else
{
MsgBox, labeltool is er niet ,
}



;ExitApp ; debug
	
}
else
{
	MsgBox, u venster  AUTO - Projecten  zie ik niet !! open het eerst zelf
ExitApp
} 
    




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