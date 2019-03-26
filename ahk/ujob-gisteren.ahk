 CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:


ToolTip, ujob.ahk job op gisteren,170,950
	Run, "C:\Users\vth\Desktop\ujoblet.jar - Snelkoppeling.lnk"
	
	BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
		WinWaitActive, UJob, 
	
	Send 1302.50
		Sleep, 300
Send {TAB}
	Sleep, 300
Send vith123
	Sleep, 300
	Send {Enter}
	
	;we zijn ingelogd in ujob
	Sleep, 1000

;onscreen 584,344
;in activbe window 189,52
;nieuw artikel toevoegen mousemove moet je loggen in windowSpy ,x -5 en de y waarde -25 doen 110,130 word 105,105


;de dag op gisteren zetten
Sleep, 1000
MouseMove, 189,27
Sleep, 300
MouseClick, Left
Sleep, 300

ToolTip, UJOB VANDAAG (herstellingen op RGO = PROTEC en  eindcontrole = PROTES),170,950
Sleep, 3000












 

;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
MsgBox emergencystop
ExitApp
return
}
ESC::Goto ExitSub








