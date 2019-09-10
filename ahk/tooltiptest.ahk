  CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
 ToolTip, AUTOHOTKEY start nu NRS en MSOFT,170,950

Sleep 3000
 

ExitApp ; dit is onze laatste stap na de herhaalloop


ExitSub:
{
BlockInput, MouseMoveOff
MsgBox emergencystop
ExitApp
return
}


 

ESC::Goto ExitSub
