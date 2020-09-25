#include C:\Users\VTH\Desktop\template2018\ahk\_include_variabelen.ahk  ; dit bestand staat op je lokale pc , maar de simultane copy runt vanaf fileserver , dus altijd direct adressering gebruiken

BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
scriptnaam :="Clipprojectopenen"   
FileAppend, %Timestamp% - %scriptnaam%`n, %AhkLogbestand% ;save naar txt file concat
Sleep 300,


CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
;  SetKeyDelay, 500 ; hoe rap stuur je typcommandos   
Loop, 3
{
	ToolTip,     %scriptnaam%  = in Msoft artikelen staan   ; ahk variabele oproepen moet met %% 
	Sleep, 10
}
 

SetTitleMatchMode 2
If WinExist("CLIP PROJECT")
{
	;MsgBox, u venster is open	, en ik zal het vooraan zetten
	ToolTip, u programma CLIP PROJECT  is open `n  	 en ik zal het vooraan zetten   `n   voila! ,900 , 500
	WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
	 
	 
}else  {
	;MsgBox, u venster  zie ik niet	, maar ik ga het openen voor u 
 	BlockInput, MouseMoveOff
		wachtEenBeetje(300)
	BlockInput, MouseMove 
ToolTip, clip project gestart,900 , 500
	Run %algemeen_mtp_bestand% ; we starten een label op , werkt perfect om zo clip project te starten ;met de pause toets labeling prog starten

;******Routine die kijkt of er een knop in de spy zit die we als feedback kunnen gebruken om te zien of we in juiste venster zitten
Loop {
Sleep 100
WinGetText, ahkspy_data, a ; check inhoud v huidig window
;msgbox, %ahkspy_data%  ; zet de inhoud van ahkspy in een variabele , daaarin kanje uitmaken of de knoppen bestaan die we willen op drukken , zijn we minder blind aan het navigeren
Needle := "Gegevensuitwisseling" ; bestaat de knop die we zoeken?
If InStr(ahkspy_data, Needle)
   { 
   ToolTip, De knop :  %Needle%  was found.    
wachtEenBeetje(100) ; via incl een animerende cursor die wacht  
   }
Else
   { 
   ToolTip, De knop :  %Needle%  was  not found.      
   }
}
Until  InStr(ahkspy_data, Needle)
;****einde routine


 
 
	
	ExitApp
} 

 


;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
	BlockInput, MouseMoveOff
	
		MsgBox, 48, you pressed escape- , %scriptnaam%, 1
	ExitApp
	return
}
ESC::Goto ExitSub              