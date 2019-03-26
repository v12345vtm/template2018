;windows r : nieuw label
{
  BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  Sleep 500,
   CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
   
MouseClick, Right
Sleep 100,
Send {Down 1}
Send {Enter}

;wacht tot venster open is en ga op de knop selecteer staan
Sleep 2000,
MouseMove, 760,590
Sleep 100,

;ingeven parameters
Send l
Send {Tab}

Send l1
Send {Tab}

Send n
Send {Tab}

Send Installatielabel : 



Return



;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
MsgBox noodstop 
ExitApp
return
}
ESC::Goto ExitSub






}