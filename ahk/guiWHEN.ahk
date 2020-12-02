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

Gui, Add, Button, x10 y0 h15  gkladblok vkladblok Hidden, *kladblok++*
Gui, Add, Button, x80 y0 h15  gNRS  vnrs Hidden , *NRS*
Gui, Add, Button, x120 y0 h15 gtoevoeg vMore2 Hidden, *ahktest*  ;voorzetsel g=onclick   v=id dus More2
Gui, Add, Button, x160 y0 h15 gMsoftMa vMsoftMa Hidden, *MsoftMa*  ;voorzetsel g=onclick   v=id dus More2

Gui, Add, Button, x210 y0 h15 gTvincent vTvincent Hidden, *T:vincent*  ;voorzetsel g=onclick   v=id dus More2


Gui, Color, D4CB46
Gui, Show, x-2000 y-2000 h20 w260, Toolbar ; toon de gui mar zet em op een onzichtbare plaats

SetTimer, CheckActive, 100
Return




;;;;;;;;;;;;;;;;;;;;;;;;;;knop functies
Tvincent:
	gui, submit, NoHide  ; gather all the data from the GUI 
	;MsgBox, 48, you pressed toevoeg , , 1
Run T:\voor vincent
Return



MsoftMa:
	gui, submit, NoHide  ; gather all the data from the GUI
	MsgBox, 48, you pressed MsoftMa , , 1
Return



toevoeg:
	gui, submit, NoHide  ; gather all the data from the GUI 
	;MsgBox, 48, you pressed toevoeg , , 1
Run, "C:\Users\vth\Desktop\template2018\ahk\guiWHENnrsReset.ahk"
Return



kladblok:
	gui, submit, NoHide ; gather all the data from the GUI	
	
		If (actiefvensterklasseproces() = "Notepad++notepad++.exe")
		{
		BlockInput, MouseMove ;blokeer muis 
		;WinActivate  mag je niet doen
	 
		sleep 50
			MouseMove, 66, 60  ; save in notepad++ 	 .  
	 Sleep, 50
	 
 
			 
		 	MouseClick, left  ;save 
				BlockInput, MouseMoveOff ;terug vrijgeven muis	
			
			}
				else
		{
			BlockInput, MouseMoveOff ;terug vrijgeven muis	 
			MsgBox, 48,  geen  notepad++ draaiende  ,neen, 1
		}
Return



NRS:
	gui, submit, NoHide  ; gather all the data from the GUI
Run, "C:\Users\vth\Desktop\template2018\ahk\guiWHENnrsReset.ahk"

	 
Return ;einde functie nrs knop



;;noodstop;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
	BlockInput, MouseMoveOff
	;MsgBox "EXIT-"%scriptnaam%
		;MsgBox, 48, you pressed escape- ,guiWHEN %scriptnaam%, 1
	ExitApp
	return
}

ESC::Goto ExitSub
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;running each 100ms;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	 
CheckActive:

Coordmode,Mouse,Relative

WinGetClass, welkeklasseisEr, A

switch welkeklasseisEr
{
	case "OMain":   {
		;NRS
		WinGetPos, XWin, YWin,,, ahk_class OMain
		WinMove, Toolbar ahk_class AutoHotkeyGUI,, % (XWin + 15), % (YWin + 10)
		WinSet, AlwaysOnTop, ON, Toolbar ahk_class AutoHotkeyGUI
		;   reposition  buttons voor nrs
		GuiControl, MoveDraw, nrs, x0 y0 h15
		GuiControl, Show, nrs
		
		GuiControl, MoveDraw, More2, x80 y0 h15
		GuiControl, Show, More2
		GuiControl, Hide, MsoftMa
		GuiControl, Hide, kladblok
	}
	
	
	
	
	case "Notepad++":  
	{
		WinGetPos, XWin, YWin,,, ahk_class Notepad++
		WinMove, Toolbar ahk_class AutoHotkeyGUI,, % (XWin + 15), % (YWin + 10)
		WinSet, AlwaysOnTop, ON, Toolbar ahk_class AutoHotkeyGUI
			
		;   reposition  buttons voor notepad
		GuiControl, MoveDraw, kladblok, x0 y0 h15
		GuiControl, Show, kladblok
		
		GuiControl, Hide, nrs
		GuiControl, Hide, More2
			GuiControl, Hide, MsoftMa
	}
	
	
	
	
	Default:
	{
		;   reposition  buttons to default
		GuiControl, MoveDraw, kladblok, x05 y0 h15
		GuiControl, MoveDraw, nrs, x75 y0 h15
		GuiControl, MoveDraw, More2, x115 y0 h15
		
		GuiControl, Show, kladblok
		GuiControl, Show, nrs
		GuiControl, Show, More2	
		GuiControl, Show, MsoftMa
		GuiControl, Show, Tvincent
		
		;WinMove, Toolbar ahk_class AutoHotkeyGUI,, -2000, -2000 ; weg met de toolbar
		WinMove, Toolbar ahk_class AutoHotkeyGUI,, 1590, 10 ; bovenrechtsdebugposition
	}}      

return

	