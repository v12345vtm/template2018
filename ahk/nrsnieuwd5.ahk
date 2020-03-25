;INIT ahk 	elke export zetten we in ons exportbestand , dat is een vaste output filename.
scriptnaam :="nrsnieuwd5"  
BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

;; export to log
FormatTime, CurrentDateTime,, yyMMddHHmmss
timestampel:= CurrentDateTime  ; om een ahk property op te slaan naar ahk variabele geen %% nodig
FileAppend,  %timestampel% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
Sleep 300,


;;pre-start en variabelen
;artikelomschrijving


CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
;  SetKeyDelay, 500 ; hoe rap stuur je typcommandos   
Loop, 1
{
	ToolTip,     %scriptnaam%  = in Msoft artikelen staan   ; ahk variabele oproepen moet met %% 
	Sleep, 1000
}

;;;START






;windows r : nieuw label
{

MouseClick, Right
Sleep 500,
Send {Down 1}
Sleep 100,
Send {Enter}




;wacht tot venster open  
MouseMove, 760,595 ; knop selecteer
Sleep 100,
Loop, 3
{
	ToolTip,     wacht tot venster open is en ga op de knop selecteer staan  ; ahk variabele oproepen moet met %% 
	Sleep, 800
}



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
Loop, 5
{
	ToolTip,     5sec  ; ahk variabele oproepen moet met %% 
	Sleep, 1000
}
Send, docx
Sleep 1500
Send {Enter}
ToolTip, nu mooi wachten..
Sleep 1500 ; betje wachten de popupbox moet zijn data wegschrijven


;ga op de knop selecteer staan en druk erop , om de url-link te kopieren nr klembord  vb 

MouseMove, 760,590
Sleep 100,
MouseClick, Left


Loop, 3
{
	ToolTip,    saving to klembord  ; ahk variabele oproepen moet met %% 
	Sleep, 900
}
;L:\Letdata\data\19\0593_01\D5\190593_01-D5N04_.docx zit in je klembord youpie yess!


   FileAppend, %timestampel% - %scriptnaam% - %Clipboard%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
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