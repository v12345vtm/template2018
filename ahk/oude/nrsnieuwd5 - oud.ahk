;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
   Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
   scriptnaam :="nrsnieuwd5"   
  ; FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
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
ToolTip, AUTOHOTKEY zal nu vanzelf docx typen voor jouw , 797 ,427, 19  ;toon op absolute schermposite tooltop
MouseMove, 592,562
MouseClick, Left
Sleep 5000,
Send, docx
Sleep 1500
Send {Enter}
ToolTip, nu mooi wachten..
Sleep 1500 ; betje wachten de popupbox moet zijn data wegschrijven


;ga op de knop selecteer staan en druk erop , om de url-link te kopieren nr klembord  vb 

MouseMove, 760,590
Sleep 100,
MouseClick, Left
Sleep 500,


;L:\Letdata\data\19\0593_01\D5\190593_01-D5N04_.docx zit in je klembord youpie yess!


   FileAppend, %Timestamp% - %scriptnaam% - %Clipboard%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
       Sleep 300,

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