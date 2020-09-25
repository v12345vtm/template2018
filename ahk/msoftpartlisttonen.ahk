#include C:\Users\VTH\Desktop\template2018\ahk\_include_variabelen.ahk  ; dit bestand staat op je lokale pc , maar de simultane copy runt vanaf fileserver , dus altijd direct adressering gebruiken
Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
scriptnaam :="Msoftpartlisttonen"   
;FileAppend, %Timestamp% - %scriptnaam%`n, %AhkLogbestand% ;save naar txt file concat
aantalkliksUitgespaart := 0   ; aantalkliksUitgespaart += 1  ; een klik is click of tab of enter of up of down of shiftF9 of ... 
Sleep 300,

BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
;  SetKeyDelay, 500 ; hoe rap stuur je typcommandos   
Loop, 1
{
	ToolTip,     %scriptnaam%  = in Msoft artikelen staan   ; ahk variabele oproepen moet met %% 
	Sleep, 1000
}

If WinExist("AUTO - Artikelen  -  LET Automotive n.v.")
{
	WinActivate
	
	; er is een slow visible text waarinstaat :Artikel
	
	;******Routine die kijkt of er een knop in de spy zit die we als feedback kunnen gebruken om te zien of we in juiste venster zitten
	Loop {
		Sleep 100
		WinGetText, ahkspy_data, a ; check inhoud v huidig window
		;msgbox, %ahkspy_data%  ; zet de inhoud van ahkspy in een variabele , daaarin kanje uitmaken of de knoppen bestaan die we willen op drukken , zijn we minder blind aan het navigeren
		Needle := "Artikel" ; bestaat de knop die we zoeken?
		If InStr(ahkspy_data, Needle)
		{
			ToolTip, De knop :  %Needle%  was found.    
			wachtEenBeetje(100) ; via incl een animerende cursor die wacht
		}else  {
			ToolTip, De knop :  %Needle%  was  not found.
		}}
	Until  InStr(ahkspy_data, Needle)
	;****einde routine
	
	
	;;;;;;;;;;;;produktiegegevens openen 	
	aantalkliksUitgespaart += 1
	Send, +{F9}  ;shift f9
	Sleep 400	
	
	;als we pech hebben is er geen produktiefische en zal msoft u een Question stellen	
	If WinExist("Question")
	{
		BlockInput, MouseMoveOff ;laat de muis weer los
		MsgBox we moeten dringend weg eris hier geen prodfiche
		exitapp
	}
	aantalkliksUitgespaart += 1
	Send,   ^{PgUp}  ; control pageUP 'select laatste tab 'Prod.Totalen met needle Kosten onderliggende artikelen tonen
	Sleep 400	
	
	;******Routine die kijkt of er een knop in de spy zit die we als feedback kunnen gebruken om te zien of we in juiste venster zitten
	Loop {
		Sleep 100
		WinGetText, ahkspy_data, a ; check inhoud v huidig window
		;msgbox, %ahkspy_data%  ; zet de inhoud van ahkspy in een variabele , daaarin kanje uitmaken of de knoppen bestaan die we willen op drukken , zijn we minder blind aan het navigeren
		Needle := "Kosten onderliggende artikelen tonen" ; bestaat de knop die we zoeken?
		If InStr(ahkspy_data, Needle)
		{
			ToolTip, De knop :  %Needle%  was found.    
			wachtEenBeetje(100) ; via incl een animerende cursor die wacht
		}else  {
			ToolTip, De knop :  %Needle%  was  not found.
		}}
	Until  InStr(ahkspy_data, Needle)
	;****einde routine
	
	
	Sleep 400,
	aantalkliksUitgespaart += 1
	Send +{Tab 3}
	Sleep 300
	aantalkliksUitgespaart += 1
	Send , {Enter}  ; hierdoor komt er window = "Detail Materiaalkosten"
	
	;******Routine die kijkt of er een knop in de spy zit die we als feedback kunnen gebruken om te zien of we in juiste venster zitten
	Loop {
		Sleep 100
		WinGetText, ahkspy_data, a ; check inhoud v huidig window
		;msgbox, %ahkspy_data%  ; zet de inhoud van ahkspy in een variabele , daaarin kanje uitmaken of de knoppen bestaan die we willen op drukken , zijn we minder blind aan het navigeren
		Needle := "Nodig voor" ; bestaat de knop die we zoeken?
		If InStr(ahkspy_data, Needle)
		{
			ToolTip, De knop :  %Needle%  was found.    
			wachtEenBeetje(1000) ; via incl een animerende cursor die wacht
		}else  {
			ToolTip, De knop :  %Needle%  was  not found. _  wachten tot Detail Materiaalkosten
		}}
	Until  InStr(ahkspy_data, Needle)
	;****einde routine
	
	
	;nu hebben we nu zicht op de partlijst tabel van msoft
	;nu willen we de tabel in klermbord
	
	;Detail Materiaalkosten , hier gaan we een 3e window binnen
	If WinExist("Detail Materiaalkosten")
	{
		WinActivate		
		;Sleep, 500
		
		MouseMove, 100, 100 ;in de tabel ergens staan ongeveer 1e rij
		Sleep, 100	
aantalkliksUitgespaart += 1		
		MouseClick, right ; menuopvragen
		Sleep, 100
		aantalkliksUitgespaart += 1
		Send, {Down 6} ;6keer pijltje omlaag
		Sleep, 100
		aantalkliksUitgespaart += 1
		Send, {Enter} ; druk op enter
		Sleep, 100
		
		;voila stuklijst in klembord!!
		Loop, 6
		{
			ToolTip, voila stuklijst van %Msoftomschijving% in klembord    %A_Index%  /... seconden   ; A_Index will be 1, 2, then 3
			Sleep, 50
		}
		
		;sluit nu venster "Detail Materiaalkosten"
		;  Send !{f4} ; Simulates the keypress alt+f4 sluit window  waar ons text artikelnaam stond
		Sleep, 500
		
		;sluit nu venster "waar je knop deelfasen en zo in staan"
		;  Send !{f4} ; Simulates the keypress alt+f4 sluit window  waar ons text artikelnaam stond
		Sleep, 500
		
		Loop, 6
		{
			ToolTip, KLAAR met tonen    %A_Index%  /... seconden   ; A_Index will be 1, 2, then 3
			Sleep, 50
		}}else  {
		Loop, 10
		{
			ToolTip, je bent niet in Detail Materiaalkosten    %A_Index%  /... seconden ,170 , 950  ; A_Index will be 1, 2, then 3
			Sleep, 10
		}}}else  {
	Loop, 4
	{
		ToolTip, je bent niet in artikelen    %A_Index%  /... seconden ,170 , 950  ; A_Index will be 1, 2, then 3
		Sleep, 500
	}}


FileAppend, %Timestamp% - %scriptnaam%  kliks : %aantalkliksUitgespaart%`n, %AhkLogbestand% ;save naar txt file concat

;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
	BlockInput, MouseMoveOff ;laat de muis weer los
		MsgBox, 48, you pressed escape- , %scriptnaam%, 1
	ExitApp
	return
}

ESC::Goto ExitSub





;;;;;;;;;;;;DEBUG START
ToolTip, writefile virtklembordTXT ;
file := FileOpen("C:/Users/vth/Desktop/template2018/logfiles/virtklembord.txt", "w")
;  TestString := ".`r`n"  ; to start a new line. nieuwe regel 
file.Write(artikelomschrijving)
;  file.Write(TestString)
file.Close() 
Sleep 100, 
Sleep 900,
;;;;;;;;;;;;DEBUG STOP              