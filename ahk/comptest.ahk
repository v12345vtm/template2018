 CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:

 

 MsgBox, parameters ontvangen  %0%
  MsgBox, 1e parameters is  %1%

ExitApp

 



ExitSub:
{
BlockInput, MouseMoveOff
MsgBox emergencystop-tooltipmouspos-ahk
ExitApp
return
}


 

ESC::Goto ExitSub