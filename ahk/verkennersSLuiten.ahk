ToolTip, verkenners sluiten 8stuks ,303,750

  ; BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
 ; Sleep 200,
  CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:

SetTitleMatchMode, 2


Loop, 8
{
    WinClose, ahk_class CabinetWClass  ;  closes any explorer window
   ;MsgBox, Iteration number is %A_Index%.  ; A_Index will be 1, 2, then 3
    Sleep, 100
}

  

	




;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
MsgBox emergencystop verkenners sluiten
ExitApp
return
}
ESC::Goto ExitSub
