 
 ToolTip, AUTOHOTKEY start nu NRS en MSOFT,400,800

Sleep 3000
 


ExitApp ; dit is onze laatste stap na de herhaalloop


ExitSub:
{
MsgBox emergencystop
ExitApp
return
}


 

ESC::Goto ExitSub
