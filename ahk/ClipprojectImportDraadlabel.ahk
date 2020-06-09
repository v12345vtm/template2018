;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
scriptnaam :="ClipprojectImportDraadlabel"   
FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
Sleep 300,
SetKeyDelay, 200 ; hoe rap stuur je typcommandos  


{
	BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
	Sleep 100,
	CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
	
	
	SetTitleMatchMode 2
	If WinExist("CLIP PROJECT")
	{
		;MsgBox, u venster is open	, en ik zal het vooraan zetten
		ToolTip, u programma CLIP PROJECT  is open `n  	 en ik zal het vooraan zetten   `n   voila! ,170 , 950
		WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
		Sleep 100, 
		
		ToolTip, ClipprojectImport-ahk  `n  sta je in clipproject ?  `n   script die om import duwt ,170 , 950
		Sleep 1500,
		
		Send {ALT}
		Sleep 200,
		Send t
		Sleep 500,
		Send {DOWN 15} ; draadlabels
		Sleep 500,
		Send {ENTER}
		Sleep 200,
		
		ToolTip, draadlabels ofzo `n   scherm laad voor import ,170 , 950
		Sleep 2000,
		Send {TAB 13} ; als we 13keer op tab duwen , is onze knop aktief
		Sleep 500,
		
		Send {ENTER}
		Sleep 200,
		
		ToolTip, Voila `n   labels geimporteerd  en nu... ze sorteren en lege schildjes wegdoen,170 , 950
		Sleep 500,      
		
		;;;selecteer alle labels en sortzze rze van a-zal
		MouseClick, left,  900,  150 ; kik op een label
		sleep 100
		Send, ^a ; control+a
		Sleep 100,
		
		Send, {Alt} ; 
		Sleep 100,
		
		Send, {Right} ;  
		Sleep 100,
		
		Send, {Enter} ; 
		Sleep 100,
		
		Send, {Down 11} ; oplopend sorteren via 
		Sleep 100,
		
		Send, {Enter} ; sorteren
		Sleep 100,
		
		;lege schildjes verwijderen nu
		
		
		Send, {Alt} ; 
		Sleep 100,
		
		Send, {Right} ;  
		Sleep 100,
		
		Send, {Enter} ;  menu bewerken is nu open
		Sleep 100,
		
		Send, {Down 7} ; Lege schildjes verwijderen
		Sleep 100,
		
		Send, {Enter} ; 
		Sleep 100,    
		
		;MsgBox, u venster is open      
		;ExitApp ; als we hierachter verdergaan zal er geprint worden vd labels      
		;om direct te kunnen printen , proberen we een label eens aan te klikken en slepen we de muis ingedrukt weg
	;	MouseClick, left,  900,  150
	;	Sleep, 500	
	;	Click down
	;	Sleep 1000
	;	MouseMove,   1370,  200
	;	Click up
		
		;	
		ToolTip we gaan de printer klaarzetten ook :   control+p  ; wissen oude tooltips
		Send, ^p ; control+p
		Sleep 500,
		
		ToolTip Zit de juiste rol in de printer ?,255,430 ; wissen oude tooltips
		Sleep 2000,
	}else  {
		MsgBox, u venster  zie ik niet	open het eerst zelf
		ExitApp
	} 
	
	
	;;noodstop
	ExitApp ; dit is onze laatste stap na de herhaalloop
	ExitSub:
	{
		BlockInput, MouseMoveOff
			MsgBox, 48, you pressed escape- , you pressed esc- `n`n This message will self-destruct in 1 seconds., 1
		ExitApp
		return
	}
	ESC::Goto ExitSub
}              