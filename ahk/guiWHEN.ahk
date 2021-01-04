; https://autohotkey.com/board/topic/101402-gui-always-on-top-of-a-specific-window/
;This code moves the Gui in and out of the way when Notepad becomes active/inactive. 
;You could also just hide/show the Gui instead of moving it but then that often leads to blinking or 
;to the Gui stealing the focus. 
;Also, because the Gui has style +E0x08000000 it will not steal the focus when you click on its controls
; eigen topic https://www.autohotkey.com/boards/viewtopic.php?f=76&t=83721


#include C:\Users\VTH\Desktop\template2018\ahk\_include_variabelen.ahk  ; dit. bestand staat op je lokale pc , maar de simultane copy runt vanaf fileserver , dus altijd direct adressering gebruiken
#NoEnv
#Persistent
#SingleInstance, Force
;#NoTrayIcon
Menu, Tray, Icon, %A_ScriptDir%\guiWHEN.ico
SetWinDelay, 0
SendMode Input
SendMode, Event
SetBatchLines,-1
Coordmode,Mouse,Relative
;Coordmode,Mouse,Screen
Gui, 1: Margin, 0, 0
Gui, 1: +AlwaysOnTop +ToolWindow +E0x08000000 +LastFound -caption
Gui, Color, D4CB46 ; we kiezen een RGB achtergrondkleur 

;WinSet, Transparent, 255, 
;WinSet, TransColor, D4CB46 150  ;het gekozen achtergrondkleur doorzichtig maken

;;initialisatie
aantalknoppengenreren := 5 ; zorg dat je genoeg functie staan hebt , voor de Onclick events



array := [  "5OMain" , "5Notepad++" ,"5ProMainWin"] ; de verschillnede programmas die we willen 
;              nrs       notepad++      msoft 
; Iterate from 1 to the end of the array: https://www.autohotkey.com/docs/Objects.htm
Loop % array.Length()
{
	;1
	;  MsgBox % array[A_Index]
}
; Enumerate the array's contents:
For index, value in array
{
	;2
	;MsgBox % "Item " index " is '" value "'"
}



;;;;;;;;;;;;start

 

;_______________________________________________
;         CREATING GUI ELEMENTS  :
;_______________________________________________


 
 
loop %aantalknoppengenreren%
{
	;3
	i := (50 *( a_index -1 ))+1  ; xy rooster maken
	j := 2    ; xy rooster maken
	Gui, Add, Button, x%i%  y%j%   h20 w55 g%A_Index% v%A_Index% Hidden, XXX%A_Index% ;voorzetsel g=onclick   v=id-naam
	;msgbox, K%i%  ;https://www.autohotkey.com/boards/viewtopic.php?f=76&t=83993
	;Gui, Add, Button, x210 y0 h15 gTvincent vTvincent Hidden, *T:vincent*  ;voorzetsel g=onclick   v=id 
}


Gui, Add, Text, x270 y1  w160 h19  vWelkprog, ik kreeg binnen : ; %Welksubprogrammawerkjenuin%
 

Gui, Show, x-2000 y-2000 h26 w420, Toolbar ; toon de gui mar zet em op een onzichtbare plaats



 
 
 
;_______________________________________________
;         TIMERS van de functies :
;_______________________________________________

SetTimer, CheckActive, 100
Return


 
 
;_______________________________________________
;         knop functies onClick :
;_______________________________________________



1:
gui, submit, NoHide  ; gather all the data from the GUI
;MsgBox, 48, you pressed 1 , , 1	
Run, "C:\Users\vth\Desktop\template2018\ahk\guiWHENnrsReset.ahk"	 
Return ;einde functie nrs knop



2:
gui, submit, NoHide  ; gather all the data from the GUI
MsgBox, 48, you pressed 2 , , 1	 
Return ;einde functie nrs knop



3:
gui, submit, NoHide  ; gather all the data from the GUI
;MsgBox, 48, you pressed 3 , , 1	 
gui, submit, NoHide ; gather all the data from the GUI	

If (actiefvensterklasseproces() = "Notepad++notepad++.exe")
{
	;4
	BlockInput, MouseMove ;blokeer muis 
	;WinActivate  mag je niet doen
	
	sleep 50
	MouseMove, 66, 60  ; save in notepad++ 	 .  
	Sleep, 50
	
	
	
	MouseClick, left  ;save 
	BlockInput, MouseMoveOff ;terug vrijgeven muis
}else  {
	;5
	BlockInput, MouseMoveOff ;terug vrijgeven muis	 
	MsgBox, 48,  geen  notepad++ draaiende  ,neen, 1
}
Return ;einde functie nrs knop





4:
gui, submit, NoHide  ; gather all the data from the GUI
;MsgBox, 48, you pressed- 4 , , 1	
Run T:\voor vincent 
Return ;einde functie nrs knop




5:
gui, submit, NoHide  ; gather all the data from the GUI
;Run C:\Users\VTH\Desktop\template2018\ahk\guiWHEN.ahk
Run C:\Users\VTH\Desktop\template2018\ahk\AutoHotkeyAug2020-64b.ahk
Return ;einde functie nrs knop


;_______________________________________________
;         noodstop :
;_______________________________________________


;ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
	{
		;6
		BlockInput, MouseMoveOff
		;MsgBox "EXIT-"%scriptnaam%
		;MsgBox, 48, you pressed escape- ,guiWHEN %scriptnaam%, 1
		;ExitApp
		Pause
		return
	}
	
	ESC::Goto ExitSub
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	
	
	
	
;_______________________________________________
;         subroutine(s) :
;_______________________________________________	 
	CheckActive:	
	Coordmode,Mouse,Relative
	WinGetTitle, Title, A ; steek de programmanaam is var %Title%
	
	;FileRead, Welksubprogrammawerkjenuin,  C:/Users/vth/Desktop/template2018/logfiles/Welksubprogrammawerkjenuin.txt  ; bstand naar variable doen 
	;GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
	
 
	
	 switch actiefvensterklasseproces()
{


	case "#32770MSACCESS.EXE": ; *****NRS*****
	if (Title = "Jorosoft 1087") 
	{
				Welksubprogrammawerkjenuin :="NRS project :Weet u zeker om dit te importeren?" ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
		WinActivate
	Send,{Left}  ;Left-arrow key on main keyboard  we gaan ja selectern 
	sleep 1500
		Send, {Enter}    
	}
	if (Title = "Microsoft Access") 
	{
			Welksubprogrammawerkjenuin :="Fout bij invoegen Project" ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
	;	WinActivate
		;Send,{Left}  ;Left-arrow key on main keyboard  we gaan ja selectern 
		;sleep 1500
	;	Send, {Enter}   ; 
	}
	if (Title = "Jorosoft 1069") 
	{
			Welksubprogrammawerkjenuin :="OK // Project werd succesvol geïmporteerd. // " ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
	 	WinActivate
		 Send,{Left}  ;Left-arrow key on main keyboard  we gaan ja selectern 
		;sleep 1500
		;Send, {Enter}   ; 
	}
	if (Title = "Jorosoft 1024") {
			Welksubprogrammawerkjenuin :="Jorosoft 1024 stopbord nrs verlaten" ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
		; als je nrs wil verlaten vraagt hij of je het zeker weet , ja want ik drukte op het stopbord ! hoeveel zekerder moet ik zijn?
		WinActivate	 
		Send, {Left}{Enter}    ;		
	}
		if (Title = "Jorosoft 1021") {
				Welksubprogrammawerkjenuin :="nrs revisie maken is gelukt" ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
		WinActivate	
		BlockInput, MouseMove ;blokeer muis 
		Send, {Enter}  
		BlockInput, MouseMoveOff ;terug loslaten muis		 
	}


	case "rctrl_renwnd32outlook.exe":   
	{
			Welksubprogrammawerkjenuin :="mailbox F9 to refresh" ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
	}
	
	
	case "WindowsForms10.Window.8.app.0.3c4abcc_r9_ad1ClipProjectMarking.exe":  
      {      
		Welksubprogrammawerkjenuin :="clipproject" ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%	  ;WindowsForms10.Window.8.app.0.3c4abcc_r11_ad1ClipProjectMarking.exe
}	
	
	
	case "OMainMSACCESS.EXE":    
	{
	
		Welksubprogrammawerkjenuin :="nrS" ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
;	VK6E:: send  {ASC 46} ; als we op punt numpadDot  drukken komt er een komma , en ik verander dat als ik op punt druk dat er een punt komt
	;kunnen we een gui tonen ?
 ; https://autohotkey.com/board/topic/101402-gui-always-on-top-of-a-specific-window/	
	}
	
	
	
	case "CabinetWClassExplorer.EXE":  
	if (Title = "LET_VAULT") 
	{
				Welksubprogrammawerkjenuin :="LET_vault" ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
	}else  {
					Welksubprogrammawerkjenuin :="verkenner" ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
	;	file := FileOpen("C:/Users/vth/Desktop/template2018/logfiles/Welksubprogrammawerkjenuin.txt", "w") ; write nr bestand
	;file.Close() 
		
	}
	
	
	
	
	case "#32770acadlt.exe":
	if (Title = "AutoCAD LT Alert") 
	{
			Welksubprogrammawerkjenuin :="AutoCAD LT Alert readonly warning" ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
		;WinActivate
	;	Send, {Enter}   ; 
	}
	
	
	
	
	case "#32770ClipProjectMarking.exe":
if (Title = "Question") 
	{
			Welksubprogrammawerkjenuin :="clipproject het update oud mtp bestand maar" ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
		;WinActivate
		;Send, {Enter}   ; 
	}



		case "Credential Dialog Xaml Host":
if (Title = "Gebruikersaccountbeheer") 
	{
			Welksubprogrammawerkjenuin :="firefox wil upd" ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
;WinActivate
;MsgBox, firefox wil upd	
;MouseMove, 92,370 ;  selecteer textveld van u wachtwoord	
		;Sleep 1500
	}



		case "#32770Explorer.EXE":
if (Title = "SOLIDWORKS PDM Login - LET_VAULT") 
	{
			Welksubprogrammawerkjenuin :="als we verkenner pdm vault openen doet pdm dom voor zijn paswoord" ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
		WinActivate
		Send, vithvitH15{Enter}    ; 
		Sleep 1500
	}


	
		case "#32770EXCEL.EXE":
if (Title = "SOLIDWORKS PDM Login - LET_VAULT") 
	{
			Welksubprogrammawerkjenuin :="als we exel openen doet pdm dom voor zijn paswoord" ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
		WinActivate
		Send, vithvitH15{Enter}   ; 
		Sleep 1500
	}


	
	case "SunAwtDialogjavaw.exe":
	if (Title = "Message") {
			Welksubprogrammawerkjenuin :="ujob stoeft met zijn verwerken van data" ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
		WinActivate	
		Send,  {Enter}    ;	
	}
	

	
	case  "ConsoleWindowClasscmd.exe":
	if (Title = "Opdrachtprompt")  
	{
			Welksubprogrammawerkjenuin :="CMD virt env met CONTROLtoets" ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
		; cmd venster of virt env python
			WinMove, %Title%,, 10, 269 , 826 , 573   ; msoft naar left1280 top570  width620  height440	
	}
	
	
	case "ProMainWinprowin32.exe":
	if (Title = "AUTO - Magazijnaanvragen  -  LET Automotive n.v. (AUTO - Magazijnaanvragen  -  LET Automotive n.v.)") 
	{
			Welksubprogrammawerkjenuin :="msoft idividuele mag aanvr" ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
		WinMove, %Title%,, 10, 269 , 826 , 573   ; msoft naar left1280 top570  width620  height440	
	}		
	if (Title = "AUTO - Artikelen  -  LET Automotive n.v.") 
	{
			Welksubprogrammawerkjenuin :="msoft artikelen" ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
	}	
		if (Title = "AUTO - Projecten  -  LET Automotive n.v.") 
	{
			Welksubprogrammawerkjenuin :="msoft projecten" ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
	WinMove, %Title%,, 50, 435 , 1200 , 606   ; msoft naar left1280 top570  width620  height440		
	}
				if (Title = "AUTO - Magazijnaanvragen  -  LET Automotive n.v.") 
	{
			Welksubprogrammawerkjenuin :="msoft overzicht iedereen zijn Magazijnaanvragen" ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
	}
					if (Title = "Artikelen (Aangevraagde artikelen)") 
	{
			Welksubprogrammawerkjenuin :="msoft hoeveel en op welk tiknr Magazijnaanvragen" ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
	}
	if (Title = "AUTO - LET Automotive n.v. ") 
	{
			Welksubprogrammawerkjenuin :="msoft startvenster" ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
	}
		if (Title = "AUTO - Bestelaanvragen  -  LET Automotive n.v.") 
	{
			Welksubprogrammawerkjenuin :="msoft bestelaanvr" ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
	}
	
	
 
	
case "#32770splwow64.exe":
	if (Title = "Accountadministratie") {
			Welksubprogrammawerkjenuin :="we willen printen naar een printer met paswoordbeveiliging" ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
		BlockInput, MouseMove ;blokeer muis 
		Send, {Enter}  
		sleep 600		
		BlockInput, MouseMoveOff ;terug loslaten muis
		MsgBox, 48, printerOKgedaan , ***, 0.3
	}
	
		


	case "#32770FoxitReaderPortable.exe":
	if (Title = "Foxit Reader Portable (PortableApps.com Launcher)") {
			Welksubprogrammawerkjenuin :="pdf reader te rap heropent en er was nog een sessie bezig" ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
	;	BlockInput, MouseMove ;blokeer muis 
	;	Send, {Enter}  
	;	sleep 600		
	;	BlockInput, MouseMoveOff ;terug loslaten muis		 
	}
	
	



	case "MozillaWindowClassfirefox.exe":
	{
			Welksubprogrammawerkjenuin :="firefox" ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
	}
	


		case "#32770SLDWORKS.exe":
	if (Title = "SOLIDWORKS") {
			Welksubprogrammawerkjenuin :="w" ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
;Send, {Enter}  
	;	sleep 600	
		 
	}
	if (Title = "SOLIDWORKS PDM") {
			Welksubprogrammawerkjenuin :="deze operatie word niet terugbetaald door de ziekenkas" ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
;Send, {Enter}  
	;	sleep 600	
		 
	}


case "#32770UnityPDF.exe":
	if (Title = "") {
			Welksubprogrammawerkjenuin :="unitypdf heeft een opdracht afgewerkt die je vroeg" ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
	 	BlockInput, MouseMove ;blokeer muis 
	 	Send, {Enter}  
	 	sleep 600	
 	Send !{f4} ; Simulates the keypress alt+f4 sluit unitypdf	
	 	BlockInput, MouseMoveOff ;terug loslaten muis		 
		 
	}


	case "template":
;	if (Title = "detitel")
 {
 		Welksubprogrammawerkjenuin :="vith" ; 
		GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
		 
	}
	
	
	default:
	Welksubprogrammawerkjenuin := actiefvensterklasseproces() 
	GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
	;ToolTip,     , 500  , %ypos%, 18
}

	
	
	
	;;;;;;;;;;;;;;;;;;;stop
	
	
	switch Welksubprogrammawerkjenuin
	{
	
	case "verkenner": ; case "OMain":  
		{
			;8b
			WinGetPos, XWin, YWin, , , A  ; "A" to get the active window's pos.
			WinMove, Toolbar ahk_class AutoHotkeyGUI,, % (XWin + 30), % (YWin + 3)
			WinSet, AlwaysOnTop, ON, Toolbar ahk_class AutoHotkeyGUI				
			loop %aantalknoppengenreren%
			{
				;9
				GuiControl, Show, %A_Index% ;toon elke knop in gui
			}
	
		}
		
		
			case "nrs": ; case "OMain":  
		{
			;8
			;NRS
			;WinGetPos, XWin, YWin,,, ahk_class  OMain ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;nog huidig venster vragen
			WinGetPos, XWin, YWin, , , A  ; "A" to get the active window's pos.
			WinMove, Toolbar ahk_class AutoHotkeyGUI,, % (XWin + 30), % (YWin + 3)
			WinSet, AlwaysOnTop, ON, Toolbar ahk_class AutoHotkeyGUI
			
			loop %aantalknoppengenreren%
			{
				;9
				GuiControl, Show, %A_Index% ;toon elke knop in gui
			}
	
		}
		
		
		
		
		case "Notepad++ nog niet gedifineerd in de txt log":   ;Notepad++
		{
			;10
			WinGetPos, XWin, YWin, , , A  ; "A" to get the active window's pos.
			WinMove, Toolbar ahk_class AutoHotkeyGUI,, % (XWin + 50), % (YWin + 3)
			WinSet, AlwaysOnTop, ON, Toolbar ahk_class AutoHotkeyGUI
			
			loop %aantalknoppengenreren%
			{
				;11
				GuiControl, Show, %A_Index% ;toon elke knop in gui
			}
			}
			
			
			
			
				case "mailbox":   ;Notepad++
		{
			;10
			WinGetPos, XWin, YWin, , , A  ; "A" to get the active window's pos.
			WinMove, Toolbar ahk_class AutoHotkeyGUI,, % (XWin + 50), % (YWin + 3)
			WinSet, AlwaysOnTop, ON, Toolbar ahk_class AutoHotkeyGUI
			
			loop %aantalknoppengenreren%
			{
				;11
				GuiControl, Show, %A_Index% ;toon elke knop in gui
			}
			}
			
					Default:
		{
			;14			
			
			loop %aantalknoppengenreren%
			{
				;15
				GuiControl, Show, %A_Index% ;toon elke knop in gui
			}
			;renaming buttonlabels
			
			GuiControl ,, 1, nrs*  ;rename button5 to "restart"
			GuiControl ,, 2, xxx  ;rename button5 to "restart"
			GuiControl ,, 3, notepad*  ;rename button5 to "restart"
			GuiControl ,, 4, voorvincent*  ;rename button5 to "restart"
			GuiControl ,, 5, restart*  ;rename button5 to "restart"
			; GuiControl, MoveDraw, 5, x505 y10 h15 ;move button restart
			;GuiControl, Show, 5
			;GuiControl, Hide, 5
			
	 
			
			
			;WinMove, Toolbar ahk_class AutoHotkeyGUI,, -2000, -2000 ; weg met de toolbar
			WinMove, Toolbar ahk_class AutoHotkeyGUI,, 1190, 1 ; bovenrechtsdebugposition
		}
	
	
	}
	
	
	
	WinGetClass, welkeklasseisEr, A
	
	switch welkeklasseisEr
	{
		;7
		
		case % array[1]: ; case "OMain":  
		{
			;8
			;NRS
			WinGetPos, XWin, YWin,,, ahk_class  OMain
			WinMove, Toolbar ahk_class AutoHotkeyGUI,, % (XWin + 30), % (YWin + 3)
			WinSet, AlwaysOnTop, ON, Toolbar ahk_class AutoHotkeyGUI
			
			
			loop %aantalknoppengenreren%
			{
				;9
				GuiControl, Show, %A_Index% ;toon elke knop in gui
			}
	
		}
		
		
		
		
		case % array[2]:   ;Notepad++
		{
			;10
			WinGetPos, XWin, YWin,,, ahk_class Notepad++
			WinMove, Toolbar ahk_class AutoHotkeyGUI,, % (XWin + 50), % (YWin + 3)
			WinSet, AlwaysOnTop, ON, Toolbar ahk_class AutoHotkeyGUI
			
			loop %aantalknoppengenreren%
			{
				;11
				GuiControl, Show, %A_Index% ;toon elke knop in gui
			}
			}
		
		
		case % array[3]: ; case "msoft":  
		{
			;12
			
			WinGetPos, XWin, YWin,,, ahk_class   ProMainWin
			WinMove, Toolbar ahk_class AutoHotkeyGUI,, % (XWin + 30), % (YWin + 3)
			WinSet, AlwaysOnTop, ON, Toolbar ahk_class AutoHotkeyGUI
			
			loop %aantalknoppengenreren%
			{
				;13
				GuiControl, Show, %A_Index% ;toon elke knop in gui
			}
			
			
	
		}
		
		Default:
		{
			;14			
			
			loop %aantalknoppengenreren%
			{
				;15
			;	GuiControl, Show, %A_Index% ;toon elke knop in gui
			}
			;renaming buttonlabels
			
			;GuiControl ,, 1, nrs*  ;rename button5 to "restart"
			;GuiControl ,, 2, xxx  ;rename button5 to "restart"
			;GuiControl ,, 3, notepad*  ;rename button5 to "restart"
			;GuiControl ,, 4, voorvincent*  ;rename button5 to "restart"
			;GuiControl ,, 5, restart*  ;rename button5 to "restart"
			; GuiControl, MoveDraw, 5, x505 y10 h15 ;move button restart
			;GuiControl, Show, 5
			;GuiControl, Hide, 5
			
	 
			
			
			;WinMove, Toolbar ahk_class AutoHotkeyGUI,, -2000, -2000 ; weg met de toolbar
			;WinMove, Toolbar ahk_class AutoHotkeyGUI,, 1190, 1 ; bovenrechtsdebugposition
		}
		}
return     






Tooltip  



;_______________________________________________
;        externe  hotkeys :
;_______________________________________________

#<::Run, "C:\Users\vth\Desktop\template2018\ahk\klembordWritetofile.ahk"   ; win+ < drukken is save selction to klembord
#&::Run, C:\Users\vth\Desktop\template2018\ahk\Msoftcompareartikel1a.ahk ; compare artikel in bestand1 toets1 op klavier
#VK32::Run, C:\Users\vth\Desktop\template2018\ahk\Msoftcompareartikel2a.ahk ;  klop é = compare artikel in bestand2 toets2 op klavier
#"::Run, C:\Users\vth\Desktop\template2018\ahk\ClipElecWaPasPrintenEnLogRename.ahk ; "elec waterpas printen en log resetten toets3 op klavier
#'::Run, C:\Users\vth\Desktop\template2018\macros\aanpassenToolmetAcceswijzigenEnMsoft.xlsm ; script die de gui van psp acces invult: toets4 op klavier  : 
#(::Run, C:\Users\vth\Desktop\template2018\ahk\msoftpartlistsExporteren.ahk ; script partlist in een filezet: toets5 op klavier  : ;msoftpartlistsExporteren
;;; oud #,::Run, "C:\Users\vth\Desktop\template2018\ahk\msoftmaKiesitemuitDB.ahk" ;  msoftmaNextAanvraag  win+komma op 3puntjes klikken in mag.aanvraag
#,::Run, C:\Users\vth\Desktop\template2018\ahk\pdmverkenner.ahk ;  ; win+komma 

Pause::Run C:\Users\vth\Desktop\template2018\ahk\clipprojectopenen.ahk 
Scrolllock::Run C:\Users\vth\Desktop\template2018\ahk\desktop.ahk ;  #d  ;desktop nog rapper tonen met de srollock toets scrollock remapped naar windows+d

#Delete::Run C:\Users\vth\Desktop\template2018\ahk\verkennersSLuiten.ahk ; 8verkernners dooddoen
#End::Run, C:\Users\vth\Desktop\template2018\ahk\msofttabelexportandConcattofile.ahk ;
#Home::Run C:\Users\vth\Desktop\template2018\optischeblok-kolomen-lensfronten.xlsm
#Insert::Run C:\Users\vth\Desktop\template2018\macros\mst-dvsa\MstChecklistGenerator.xlsm
#PgDn::Run C:\Users\vth\Desktop\template2018\projectlabelaar.xlsm
#PgUp::Run C:\Users\vth\Desktop\template2018 ; map met templates openen

#Numlock::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportGrijsKZBusb.ahk" ;
#Numpad0::Run, "C:\Users\vth\Desktop\template2018\ahk\msoftdocumenten2.ahk" ; steek een pv in documenten van msoft ,sta in artikelen
#Numpad1::Run, "C:\Users\vth\Desktop\template2018\ahk\nrsobjectdatamaploknrklembord.ahk" ; sta in nrs in objectdate op de lijn van u PV
#Numpad2::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportHfpriGewoon.ahk" ; hfpri 20x7
#Numpad3::Run "C:\Users\vth\Desktop\template2018\ahk\unmount.ahk"        ; unmount usbstick
#Numpad4::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportComplabel.ahk" ; 
#Numpad5::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportDraadlabel.ahk" ;   label importeren
#Numpad6::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportHoofdcomplabel.ahk" ;   label importeren
#Numpad7::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportBedienlabel.ahk" ;   label importeren
#Numpad8::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportLutzelabel .ahk" ;   label importeren
#Numpad9::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportKabellabel.ahk" ;   label importeren
#NumpadAdd::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportGrijsKlein.ahk" ;  grijs klein serienr label importeren 
#NumpadDiv::Run, "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportGrijsKZBgewoon.ahk"
#NumpadDot::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportComplabel.ahk" ;   label importeren ClipprojectImportComplabel
#NumpadMult::Run, "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportGrijsKZBHomo.ahk"
#NumpadSub::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportVerpaklabel.ahk" ;

#Space::Run, C:\Users\vth\Desktop\template2018\ahk\MsoftstuklijsttoevoegennieuwArtikel.ahk ; in vervangen ve partlijst, aanpassen
#^::Run, "C:\Users\vth\Desktop\template2018\ahk\msoft1elijntabelcopieren.ahk" ; voor projecten en kzb te maken , kopiert een kb regel uit msoft naar serieverpak of naar kzb.xls
#a::Run C:\Users\vth\Desktop\template2018\macros\afkeurbonwizard4.xlsm ; 
#c::Run, "C:\Users\vth\Desktop\template2018\ahk\checklijstopenenexcel.ahk"
#e::Run C:\
#f::Run T:\voor vincent\sdcardbatshFileserver
#g::Run "C:\Users\vth\Desktop\template2018\ahk\msoftprojectenmsoft.ahk" ; data opzoeken voor kb en serienrs te genereren
#h::Run "C:\Users\vth\Desktop\template2018\ahk\fotoscrollermsoft.ahk" ; elke sec pijltje omlaag typen om in msoft prentjes te zoeken
#i::Run C:\Users\vth\Desktop\template2018\ahk\importSDcard.ahk ; fotos van Sd kaart verplaatsen
#j::Run C:\Users\vth\Desktop\template2018\ahk\nrsnieuwd5.ahk  ;(toetsenbordlabel = nieuwPV) uitleg = nieuw pv  D5 docx-object in  nrs 
#k::Run C:\Users\vth\Desktop\template2018\macros\kzb.xlsm  
; #l::Run T:\voor vincent  ; werkt niet windows+L = logoff !
#m::Run, "C:\Users\vth\Desktop\template2018\ahk\mail.ahk" ; mail   "C:\Program Files (x86)\Microsoft Office\Office16\outlook.exe"
#n::Run C:\Users\vth\Desktop\template2018\ahk\msoftnieuwemagazijnaanvraag.ahk ; terug msoftnieuwemagazijnaanvraag.ahk
#o::Run T:\voor vincent
#p::Run C:\Users\VTH\Desktop\template2018\ahk\datafolder.ahk   ; L:\Letdata\Projects

#r::Run C:\Users\vth\Desktop\template2018\ahk\nrsnieuwlabel.ahk  ; uitleg = nieuw label-object  L1 in  nrs 
#s::Run C:\Users\vth\Desktop\template2018\ahk\msoftaanpassenstuklijst.ahk
#t::Run C:\Users\vth\Desktop\template2018\macros\serieverpak2021.xlsm ; 
#u::Run C:\Users\vth\Desktop\template2018\ahk\nrsnieuwlabel.ahk  ;
#v::Run, "C:\Users\vth\Desktop\template2018\ahk\werkurenVTexcel.ahk"
#w::Run C:\Users\vth\Desktop\template2018\ahk\alg20.ahk  ;
#x::Run, "C:\Users\vth\Desktop\template2018\ahk\klembordReadfromfile.ahk" ; Win+ X = plak uit virt klembord
#y::Run, "C:\Users\vth\Desktop\template2018\ahk\nrs-LijnVrijgeven.ahk" ; nrs vrijgeven lijn objectdata
#z::Run, "C:\Users\vth\Desktop\template2018\ahk\msoftpartlisttonen.ahk" ; parlist tonen

;   ^#x::Run, "C:\Users\vth\Desktop\template2018\ahk\klembordWritetofile.ahk" ;  control+WIN + X = virtueel klembord om nummers van nrs en pdm en msoft te kunnen doen

^End::Run, C:\Users\vth\Desktop\template2018\ahk\msofttabelexportandConcattofileMsoft.ahk ; msofttabelexportandConcattofile Msoft.txt
^f10::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirementFINAL.ahk"
^f11::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirementUSB.ahk"
^f5::Run C:\MySandbox ; virtuele omvirement in verkenner  ;control+f5
^f6::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirement.ahk"
^f7::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirementpostscan.ahk"
^f8::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirementGUI.ahk"
^f9::Run, "C:\Users\VTH\Desktop\template2018\_dita-ot\connectorpaneel\test.bat"

#f1::Run, "C:\Users\vth\Desktop\template2018\macros\procedurewizard.lnk"
#f2::Run, "C:\Users\VTH\Desktop\template2018\portableApps\FirefoxPortable\FirefoxPortable.exe"
#f3::Run, "C:\Users\vth\Desktop\template2018\ahk\msoftopstarten.ahk"
#f4::Run, "C:\Users\vth\Desktop\template2018\ahk\nrsopstarten.ahk" ; werkt niet op vmn win+f4 is dan terug afsluiten
#f5::Run, "C:\Users\vth\Desktop\template2018\ahk\tooltipmouspost.ahk"    ; debug tool soort spy voor mousepositie
#f6::Run C:\Users\vth\Desktop\template2018\ahk\wijzigen.ahk  ;
#f7::Run, "C:\Users\VTH\Desktop\template2018\ahk\PSPSoftExcelUpdateIndexmappen.ahk"
#f8::Run C:\Tools\Notepad++\notepad++.exe ;C:\Users\vth\Desktop\template2018\portableApps\Notepad++Portable\Notepad++Portable.exe ;
#f9::Run C:\WINDOWS\system32\mspaint.exe
#f10::Run calc.exe
#f11::Run, "C:\Users\vth\Desktop\template2018\ahk\ujob-gisteren.ahk"
;#f12::Run, "C:\Users\vth\Desktop\template2018\ahk\ujob-inputvandaag.ahk"


:R*?:ddd::
{
	;FormatTime, CurrentDateTime,, dd/MM/yy
	FormatTime, CurrentDateTime,, yyMMddHHmmss
	SendInput %CurrentDateTime%
	return
}


:R*?:vvv::
{
	SendInput vithvitH15 
	return
}


:R*?:bbb::
{
	run C:\Users\VTH\Desktop\template2018\ahk\testmetincludebestand.ahk
	return
}



:R*?:nnn::
{


if (PID := ProcessExist("eDrawings.exe")) and WinExist("eDrawings")
{
BlockInput, MouseMove ; blockeer muis als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
 
	Tooltip  hide in edrawings met n n n
WinActivate  ; Uses the last found window.
   ; MsgBox "process exists and has the Process ID " PID "." winexist bestaan
MouseClick, right ; menuopvragen
	Sleep, 200
	Send, {Down 1} ;6keer pijltje omlaag
	Sleep, 200
	Send, {Enter} ; druk op enter
	;Sleep, 200	
	Tooltip  
	BlockInput, MouseMoveOff
	}
else
   {
; MsgBox "edrawing does not exist."
 send n

}
return
}



:R*?:qqq::
{
	Tooltip  virt kembord plakken met qqq
	Run, "C:\Users\vth\Desktop\template2018\ahk\klembordReadfromfile.ahk" ; Win+ X = plak uit virt klembord	
	Tooltip  
	return
}

:R*?:ppp::
{
	Tooltip  ppp pdm openen
	;Run, "C:\Users\vth\Desktop\template2018\ahk\klembordReadfromfile.ahk" ; Win+ X = plak uit virt klembord
	Run  T:\_PDM
	Tooltip  
	return
}



:R*?:lll::
{
	Tooltip  virt kembord plakken met qqq
	;Run	C:\Users\vth\Desktop\template2018\ahk\lokaal.bat ; dit werkt!!na de corona
	;run N:\MyDocs\wisKolommenVanCompare1.bat ; werkt maar niet zinvol als we alles lokaal kunnen houden
	run C:\Users\VTH\Desktop\template2018\ahk\wisKolommenVanCompare1.bat
	Loop, 1
	{
		ToolTip, N:\MyDocs\wisKolommenVanCompare1.bat ant het testen     %A_Index%  /... seconden    ; A_Index will be 1, 2, then 3
		Sleep, 1000
	}
																		
	
	If WinExist( class  = "ConsoleWindowClass") 
	{
		ToolTip, cmd loopt     %A_Index%  /... seconden    ; A_Index will be 1, 2, then 3
		
		while ( class  = "ConsoleWindowClass") 
		{	   
			ToolTip,wachten tijdens cmd
			Sleep, 10 
		}
		ToolTip
	}else  {	
		ToolTip, cmd loopt niet     %A_Index%  /... seconden    ; A_Index will be 1, 2, then 3
		Sleep, 1000
	}	
	Tooltip  
	return
}


:R*?:fff::
{
	Tooltip  virt kembord plakken met qqq
	Run	N:\MyDocs\fileserver.bat		
	;Run	‪\\file01\users\VTH\MyDocs\fileserver.bat ; vahk kan het bestand niet vinden	
	Loop, 1
	{
		ToolTip, file01 bat ant het testen     %A_Index%  /... seconden    ; A_Index will be 1, 2, then 3
		Sleep, 1000
	}	
	Tooltip  
	return
}


:R*?:<<<::
{
	Tooltip  virt kembord plakken met < < <
	Run, "C:\Users\vth\Desktop\template2018\ahk\klembordReadfromfile.ahk" ;  	
	 Sleep 1000
 Tooltip
return
}      



 
#f12::
{
	Tooltip  programma always on top zetten via win+ f12
	
 WinSet, AlwaysOnTop, toggle, A ; 
;WinSet, Transparent, 200, Untitled - Notepad ; Make the window a little bit transparent.
 Sleep 1000
 Tooltip
 	return
}  



VKDE::
{
	Tooltip  programma OP PAUZEkwadraat
Pause
Tooltip  
	return
}  



