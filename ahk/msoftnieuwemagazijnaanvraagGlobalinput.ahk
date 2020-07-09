#include C:\Users\VTH\Desktop\template2018\ahk\_include_variabelen.ahk  ; dit bestand staat op je lokale pc , maar de simultane copy runt vanaf fileserver , dus altijd direct adressering gebruiken

Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
scriptnaam :="msoftnieuwemagazijnaanvraag globalInput inc"   
FileAppend, %Timestamp% - %scriptnaam%`n, %AhkLogbestand% ;save naar txt file concat
Sleep 300,
 
;;;;;    https://github.com/v12345vtm/template2018


WinGetText, ahkspy_data, a ; check inhoud v huidig window
;msgbox, %ahkspy_data%  ; zet de inhoud van ahkspy in een variabele , daaarin kanje uitmaken of de knoppen bestaan die we willen op drukken , zijn we minder blind aan het navigeren

Needle := "Globale input" ; bestaat de knop die we zoeken?

If InStr(ahkspy_data, Needle)

   { 
   MsgBox, De knop :  %Needle%  was found.
    MouseMove, 584,470 ; positie van de knop   "Globale input"  via ahk spy , in active window
   Sleep 1500,
  ; MouseClick, left
   Sleep 1500,
   
   
   }
Else
   { 
   MsgBox, De knop :  %Needle%  was  not found.
   
   
   }





 











	;;noodstop
	ExitApp ; dit is onze laatste stap na de herhaalloop
	ExitSub:
	{
		BlockInput, MouseMoveOff ; muis los laten voor gebruiker
		 
			MsgBox, 48, you pressed escape- , you pressed esc- `n`n "EXIT-"%scriptnaam% This message will self-destruct in 1 seconds., 1
		ExitApp
		return
	}
	ESC::Goto ExitSub             