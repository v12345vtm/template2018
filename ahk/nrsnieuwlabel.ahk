;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
   Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
   scriptnaam :="nrsnieuwlabel"   
   FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
       Sleep 300,






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
MsgBox "EXIT-"%scriptnaam%
ExitApp
return
}
ESC::Goto ExitSub






Return
}