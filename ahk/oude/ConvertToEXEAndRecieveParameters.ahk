

;dit programma mot EXE worden en als je via de command line dan parameters ingeeft , kan dit script er iets mee doen
 CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:

 

 MsgBox, parameters ontvangen  %0%
  MsgBox, 1e parameters is  %1%

ExitApp

 



ExitSub:
{
BlockInput, MouseMoveOff
MsgBox "EXIT-"%scriptnaam%
ExitApp
return
}


 

ESC::Goto ExitSub