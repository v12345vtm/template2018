
#include C:\Users\VTH\Desktop\template2018\ahk\_include_variabelen.ahk  ; dit bestand staat op je lokale pc , maar de simultane copy runt vanaf fileserver , dus altijd direct adressering gebruiken

Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
scriptnaam :="nrsnieuwd5 inc"   
FileAppend, %Timestamp% - %scriptnaam%`n, %AhkLogbestand% ;save naar txt file concat
Sleep 300,




 

;;pre-start en variabelen
;artikelomschrijving


CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
   SetKeyDelay, 300 ; hoe rap stuur je typcommandos   
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


   



	;;noodstop
	ExitApp ; dit is onze laatste stap na de herhaalloop
	ExitSub:
	{
		BlockInput, MouseMoveOff ; muis los laten voor gebruiker
		 
	MsgBox, 48, you pressed escape- , %scriptnaam%, 1
		ExitApp
		return
	}
	ESC::Goto ExitSub             






;Return
}