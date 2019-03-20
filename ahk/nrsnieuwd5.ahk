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
Send d
Send {Tab}
Sleep 500,

Send d5
Send {Tab}
Sleep 500,

Send n
Send {Tab}
Sleep 500,

Send Productie voorschrift
Sleep 500,



;vanaf hier moet je nog zelf op knop duwen en bestandstype ingeven




;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
MsgBox noodstop
ExitApp
return
}
ESC::Goto ExitSub






Return
}