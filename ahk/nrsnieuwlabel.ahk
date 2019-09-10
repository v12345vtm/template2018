;windows r : nieuw label
{
  BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  Sleep 500,
   CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
   
MouseClick, Right
Sleep 500,
Send {Down 1}
Send {Enter}

;wacht tot venster open is en ga op de knop selecteer staan
Sleep 2500,
MouseMove, 760,590
Sleep 100,

;ingeven parameters
Send l
Send {Tab}
Sleep 500,

Send l1
Send {Tab}
Sleep 500,

Send n
Send {Tab}
Sleep 500,

Send Installatielabel :
Sleep 500,


;vanaf hier moet je nog zelf op knop duwen en bestandstype ingeven




;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
BlockInput, MouseMoveOff
MsgBox noodstop
ExitApp
return
}
ESC::Goto ExitSub






Return
}