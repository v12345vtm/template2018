;INIT ahk 	elke export zetten we in ons exportbestand , dat is een vaste output filename.
scriptnaam :="ClipprojectImportComplabel"  
BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

;; export to log
FormatTime, CurrentDateTime,, yyMMddHHmmss
timestampel:= CurrentDateTime  ; om een ahk property op te slaan naar ahk variabele geen %% nodig
FileAppend,  %timestampel% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
Sleep 300,


;;pre-start en variabelen
;artikelomschrijving


CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
SetKeyDelay, 500 ; hoe rap stuur je typcommandos   
Loop, 1
{
	ToolTip,     %scriptnaam%  = in Msoft artikelen staan   ; ahk variabele oproepen moet met %% 
	Sleep, 1000
}

;;;START



;;;;;;;;;;;;;;;;;;;;;;;;;;






{
	BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
	Sleep 1500,
	CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
	
	
	SetTitleMatchMode 2
	If WinExist("CLIP PROJECT")
	{
		;MsgBox, u venster is open	, en ik zal het vooraan zetten
		ToolTip, u programma CLIP PROJECT  is open `n  	 en ik zal het vooraan zetten   `n   voila! ,170 , 950
		WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
		; ExitApp ; debug
	}else  {
		MsgBox, u venster  zie ik niet	open het eerst zelf
		ExitApp
	} 
	
	Sleep 1500,  
	
	ToolTip, ClipprojectImport-ahk  `n  sta je in clipproject ?  `n   script die om import duwt ,170 , 950
	Sleep 500,
	
	Send {ALT}
	Sleep 200,
	Send t
	Sleep 500,
	Send {DOWN 11} ; component labels
	Sleep 500,
	Send {ENTER}
	Sleep 200,
	
	ToolTip, lutze labels ofzo `n   scherm laad voor import ,170 , 950
	Sleep 2000,
	Send {TAB 13} ; als we 13keer op tab duwen , is onze knop aktief
	Sleep 500,
	
	Send {ENTER}
	Sleep 200,
	
	ToolTip, Voila `n   labels geimporteerd  ,170 , 950
	Sleep 500,
	
	
	;om direct te kunnen printen , proberen we een label eens aan te klikken en slepen we de muis ingedrukt weg
	MouseClick, left,  900,  150
	Sleep, 100	
	Click down
	Sleep 1000
	MouseMove,   1370,  200
	Click up
	
	;	
	ToolTip we gaan de printer klaarzetten ook :   control+p  ; wissen oude tooltips
	Send, ^p ; control+p
	Sleep 500,
	
	ToolTip Zit de juiste rol in de printer ?,255,430 ; wissen oude tooltips
	Sleep 2000,
	
	
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
}              