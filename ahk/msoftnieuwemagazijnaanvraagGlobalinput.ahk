#include C:\Users\VTH\Desktop\template2018\ahk\_include_variabelen.ahk  ; dit bestand staat op je lokale pc , maar de simultane copy runt vanaf fileserver , dus altijd direct adressering gebruiken

Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
scriptnaam :="msoftnieuwemagazijnaanvraag globalInput inc"   
FileAppend, %Timestamp% - %scriptnaam%`n, %AhkLogbestand% ;save naar txt file concat
Sleep 300,
 
;;;;;    https://github.com/v12345vtm/template2018


venster := "AUTO - Magazijnaanvragen  -  LET Automotive n.v. (AUTO - Magazijnaanvragen  -  LET Automotive n.v.)"
 if WinActive(venster)  ; "ahk_class" need not have a space after it. 
 {
    ToolTip, De knop :  %venster%  was found.
 Sleep 1000  
 
 ;******Routine die kijkt of er een knop in de spy zit die we als feedback kunnen gebruken om te zien of we in juiste venster zitten
Loop {
Sleep 100 
WinGetText, ahkspy_data, a ; check inhoud v huidig window
;msgbox, %ahkspy_data%  ; zet de inhoud van ahkspy in een variabele , daaarin kanje uitmaken of de knoppen bestaan die we willen op drukken , zijn we minder blind aan het navigeren
Needle := "Globale input" ; bestaat de knop die we zoeken?
If InStr(ahkspy_data, Needle)
   { 
 ; ToolTip, De knop :  %Needle%  was found.
 Sleep 10
  WinMove, %venster% ,, 10, 200 ,826,573   ; msoft naar left1280 top570  width620  height440
   }
Else
   { 
  ; ToolTip, De knop :  %Needle%  was  not found.      
   }
}
Until  InStr(ahkspy_data, Needle)
;****einde routine 
 }

 
exitapp

;zitten we in bestelaanvragen ?
;******Routine die kijkt of er een knop in de spy zit die we als feedback kunnen gebruken om te zien of we in juiste venster zitten
Loop {
Sleep 100 
	;wachtEenBeetje(100) ; via incl een animerende cursor die wacht
WinGetText, ahkspy_data, a ; check inhoud v huidig window
;msgbox, %ahkspy_data%  ; zet de inhoud van ahkspy in een variabele , daaarin kanje uitmaken of de knoppen bestaan die we willen op drukken , zijn we minder blind aan het navigeren
Needle := "Globale input" ; bestaat de knop die we zoeken?
If InStr(ahkspy_data, Needle)
   { 
   ToolTip, De knop :  %Needle%  was found.
 Sleep 100 
	
   WinGetPos,,, Width, Height, A 
  WinMove, A,, 10, 200 ,826,573   ; msoft naar left1280 top570  width620  height440

   }
Else
   { 
   ToolTip, De knop :  %Needle%  was  not found.      
   }
}
Until  InStr(ahkspy_data, Needle)
;****einde routine







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