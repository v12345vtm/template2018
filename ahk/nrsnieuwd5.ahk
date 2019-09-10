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

MouseMove, 592,562
MouseClick, Left
Sleep 5000,
Send, docx
Sleep 1500
Send {Enter}
Sleep 1500 ; betje wachten de popupbox moet zijn data wegschrijven


;ga op de knop selecteer staan en druk erop , om de url-link te kopieren nr klembord  vb 

MouseMove, 760,590
Sleep 100,
MouseClick, Left
Sleep 500,


;L:\Letdata\data\19\0593_01\D5\190593_01-D5N04_.docx zit in je klembord youpie yess!

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