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


;;noodstop;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
	
	
	
	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;running each 100ms;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	 
	CheckActive:
	
	Coordmode,Mouse,Relative
	
	FileRead, Welksubprogrammawerkjenuin,  C:/Users/vth/Desktop/template2018/logfiles/Welksubprogrammawerkjenuin.txt  ; bstand naar variable doen 
	GuiControl,,Welkprog,%Welksubprogrammawerkjenuin%
	
	
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