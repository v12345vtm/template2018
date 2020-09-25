#include C:\Users\VTH\Desktop\template2018\ahk\_include_variabelen.ahk  ; dit bestand staat op je lokale pc , maar de simultane copy runt vanaf fileserver , dus altijd direct adressering gebruiken
Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
scriptnaam :="pdmverkenner"  
;FileAppend, %Timestamp% - %scriptnaam%`n, %AhkLogbestand% ;save naar txt file concat
aantalkliksUitgespaart := 0   ; aantalkliksUitgespaart += 1  ; een klik is click of tab of enter of up of down of shiftF9 of ... 
Sleep 300,

BlockInput, MouseMove ; blockeer muis als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates
SetKeyDelay, 500 ; hoe rap stuur je typcommandos  

Loop, 1
{
	ToolTip,     %scriptnaam%     ; ahk variabele oproepen moet met %% 
	Sleep, 10
}


; eerst de oude pdm sessies weg doen
	SetTitleMatchMode 2
		If WinExist(wachtenOPprogram)
		{

			 Loop, 9
{
	WinClose, ahk_class CabinetWClass  ;  closes any explorer window
	;MsgBox, Iteration number is %A_Index%.  ; A_Index will be 1, 2, then 3
	Sleep, 100
}
		
		}




run C:\Users\VTH\Desktop\pdmfilescopy

wachtEenBeetje(1000) ; via incl een animerende cursor die wacht

 aantalkliksUitgespaart += 1
Run %pdmstartmap% ;pdm met gele mapjes oproepen zonder inhoud wegens geen login


	
	
	
	
wachtEenBeetje(1300) ; via incl een animerende cursor die wacht
	
	
	;needle is CardPreview
	
	
		;******Routine die kijkt of er een knop in de spy zit die we als feedback kunnen gebruken om te zien of we in juiste venster zitten
	Loop {
		Sleep 100
		WinGetText, ahkspy_data, a ; check inhoud v huidig window
		;msgbox, %ahkspy_data%  ; zet de inhoud van ahkspy in een variabele , daaarin kanje uitmaken of de knoppen bestaan die we willen op drukken , zijn we minder blind aan het navigeren
		Needle := "CardPreview" ; bestaat de knop die we zoeken?
		If InStr(ahkspy_data, Needle)
		{
			ToolTip, De knop :  %Needle%  was found.    
			wachtEenBeetje(100) ; via incl een animerende cursor die wacht
			BlockInput, MouseMoveOff ;laat de muis weer los
				;MsgBox,  we hebben needle gezien op pdmGUI  
				BlockInput, MouseMove ; blockeer muis als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

		}else  {
			ToolTip, De knop :  %Needle%  was  not found.
			
		}}
	Until  InStr(ahkspy_data, Needle)
	;****einde routine
	
	wachtEenBeetje(100) ; via incl een animerende cursor die wacht
	;nu moeten we het venster maximlisern 
	WinMaximize, A ; maximize the active window. (Pdm GUI)
	wachtEenBeetje(100) ; via incl een animerende cursor die wacht
		aantalkliksUitgespaart += 1

		MouseMove, %knopvergrootglasx%, %knopvergrootglasy%  ; eendagTerug positieknop
	ToolTip, klik op knopvergrootglas-xy
	Sleep, 150 ; check viuseel of je juist staat
	MouseClick, left
wachtEenBeetje(100) ; via incl een animerende cursor die wacht
	
	MouseMove, %zoekveldx%, %zoekveldy%  ; tiknr positieknop 
	ToolTip, klik op zoekveld
	
wachtEenBeetje(1500) ; via incl een animerende cursor die wacht
		aantalkliksUitgespaart += 1
	MouseClick, left
	wachtEenBeetje(500) ; via incl een animerende cursor die wacht

	
 
		FileAppend, %Timestamp% - %scriptnaam%  kliks : %aantalkliksUitgespaart%`n, %AhkLogbestand% ;save naar txt file concat
	
	
 

Exitapp



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