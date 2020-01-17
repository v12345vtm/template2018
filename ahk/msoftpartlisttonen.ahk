 ;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
   Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
   scriptnaam :="msoftpartliststonen"   
   FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
       Sleep 300,




 ToolTip, MSOFTpartlistTonen-ahk = in Msoft artikelen staan,170 , 950
 
   ;  SetKeyDelay, 500 ; hoe rap stuur je typcommandos
   BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  Sleep 100,
   CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
  

Send, +{F9}  ^{PgUp} +{Tab 3}
Sleep 1300,

If WinExist("AUTO - Artikelen  -  LET Automotive n.v. (AUTO - Artikelen  -  LET Automotive n.v.)")
{	WinActivate
Sleep 200,
;MouseMove, 640, 210
Send , {Enter}

;nu hebben we nu zicht op de partlijst tabel van msoft
;nu willen we de tabel in klermbord

;Detail Materiaalkosten , hier gaan we een 3e window binnen
	If WinExist("AUTO - Artikelen  -  LET Automotive n.v. (AUTO - Artikelen  -  LET Automotive n.v.)")
		{	WinActivate
			Sleep 300,			
			MouseMove, 100, 100 ;in de tabel ergens staan ongeveer 1e rij
			MouseClick, right ; menuopvragen
			Send, {Down 6} ;6keer pijltje omlaag
			Send, {Enter} ; druk op enter
	;voila stuklijst in klembord!!
	ToolTip, stuklijst zit ook in klembord,170 , 950  ; 
	Sleep 300,
			}

}
else
{
	 MsgBox, je staat niet in artikelen!
	 }





 












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
