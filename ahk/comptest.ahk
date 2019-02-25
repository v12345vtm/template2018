

 

 MsgBox, parameters ontvangen  %0%
  MsgBox, 1e parameters is  %1%

ExitApp

 


ExitSub:
{
MsgBox emergencystop-tooltipmouspos-ahk
ExitApp
return
}


 

ESC::Goto ExitSub