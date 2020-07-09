#include C:\Users\VTH\Desktop\template2018\ahk\_include_variabelen.ahk  ; dit bestand staat op je lokale pc , maar de simultane copy runt vanaf fileserver , dus altijd direct adressering gebruiken

BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
scriptnaam :="msoftopstartenrubriekprojecten incl"   
FileAppend, %Timestamp% - %scriptnaam%`n, %AhkLogbestand% ;save naar txt file concat
Sleep 300,


CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
SetKeyDelay, 500 ; hoe rap stuur je typcommandos  
 
Loop, 1
{
	ToolTip,     %scriptnaam%  = in Msoft artikelen staan   ; ahk variabele oproepen moet met %% 
	Sleep, 1000
}

;msoft opstarten
;indien msoft niet draait , starten we het en loggen we in
;direkt erna kijken we of het effectief draait en verkleinen en herpositioneren we
;indien msoft reeds draaide op de pc , gaan we het vooraan zetten en verkleinen en herpositioneren
;
;

SetTitleMatchMode 2 ; parameter die nodig is voor winexist 
MouseMove,   125,  538  ; dat is al in de toekomst kijken waar ons projectprogramma zijn invulkotje staat

If WinExist("AUTO - Projecten  -  LET Automotive n.v.")
{
	ToolTip, verkleining msoft projecten: %WinTitle%  !!  `n   voila! ,1303,100
	
	BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
	Sleep 500,
	
	WinActivate  ; project-venster aktief  ;AUTO - projecten; zetten die we net openden
	WinGetTitle, Title, A ; steek de programmanaam is var %Title%
	;MsgBox %Title%
	
	WinMove, %Title%,, 50, 435 ,1200,600   ; msoft naar left50 top435  width1200  height600	
	Sleep 100
	
	exitapp  ; we verlaten het script want msoft draait al als projecten zelfs al open is
}

If WinExist("AUTO - LET Automotive n.v.")
{
	;MsgBox, u venster is nog open	, en ik zal het vooraan zetten + verkleinen !!!
	ToolTip, u programma Artikelen (AUTO - LET Automotive n.v) is open `n  	 en ik zal het vooraan zetten   `n   voila! ,1303,100
	WinActivate  ; venster aktief  ;AUTO - LET Automotive n.v; zetten die we net gezocht en gevonden hebben
	Sleep 700
	WinGetPos,,, Width, Height, %WinTitle%	
	WinMove, %WinTitle%,, 1280, 570 ,620,440   ; msoft naar left1280 top570  width620  height440
	
	;voor serienrs te generenen moeten we n project zijn 
	;we gaan eerst blindelings pijltje up doen 
	;daarna x aantal pijltje down tot we op project zijn
	
	Send, {Up 10} ; gans  boven gaan staan zeker voldoende up doen ...
	Send, {Down %hoeveelse_regel_staat_prog_projecten%} ; projrct is nu 7x down
	Send {Enter}
	Sleep 2000 ; wachten to projecten op u scherm is
	
	;toon afgesloten zaken
	ToolTip, toon afgesloten zaken  !!  `n    ! ,1303,100
	Send, {Alt} ;
	Sleep 90
	Send, {Right 3} ;
	Sleep 90
	Send {Enter}
	Sleep 90
	Send, {Up 2} ;
	Sleep 90
	Send {Enter}
	Sleep 250
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;projecten verkleienen
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	If WinExist("AUTO - Projecten  -  LET Automotive n.v.")
	{
		ToolTip, verkleining msoft projecten: %WinTitle%  !!  `n   voila! ,1303,100
		BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
		Sleep 500,		
		WinActivate  ; project-venster aktief  ;AUTO - projecten; zetten die we net openden
		WinGetTitle, Title, A ; steek de programmanaam is var %Title%
		;MsgBox %Title%			 	
		WinMove, %Title%,, 50, 435 ,1200,600   ; msoft naar left50 top435  width1200  height600	
		Sleep 100
	}else  {
		MsgBox   geenn msoft-projecten gezien maar  %Title%
	}
	
	ExitApp ; debug
}else  {
	;MsgBox, u venster:  AUTO - LET Automotive n.v  zie ik niet !! ahk zal openene en inloggen voor u
	ToolTip, INLOGGEN en OPSTARTEN MSOFT,170 , 950
	Run, %msoftEXE%
	WinWait, Welkom bij L.E.T. NV - MSP, 
	WinWaitActive, Welkom bij L.E.T. NV - MSP, 
	Sleep, 100
	;Send, {BACKSPACE 6}vth
	Send, {TAB}
	Sleep, 100
	Send, %msoftPaswoord%
	;MouseClick, left,  136,  157
	MouseClick, left,  136,  182 ;nieieuw winacount
	Sleep, 100
	Send, {Down 5}{Tab 1}{Down %hoeveelse_regel_staat_prog_artikelen%} ; meest gebruikte en dan selecteren
	Sleep 1500,   ; loaden msoft , niet inkorten
	
	
	;verkleinen formaat en positie window 	
	Sleep 1500, ;2e loading msoft niet inkorten
	If WinExist("AUTO - LET Automotive n.v.")
	{
		ToolTip, verkleining msoft hoofdprog !!  `n   voila! ,170 , 950
		WinActivate  ; venster aktief  ;AUTO - LET Automotive n.v; zetten die we net gezocht en gevonden hebben
		Sleep 500
		WinGetPos,,, Width, Height, %WinTitle%	
		WinMove, %WinTitle%,, 1280, 570 ,620,440   ; msoft naar left1280 top570  width620  height440	
		Sleep 1500, 
		
		;voor serienrs te generenen moeten we n project zijn 
		;we gaan eerst blindelings pijltje up doen 
		;daarna x aantal pijltje down tot we op project zijn
		
		Send, {Up 10} ; gans  boven gaan staan zeker voldoende up doen ...
		Send, {Down %hoeveelse_regel_staat_prog_projecten%} ; projrct is nu 7x down
		Send {Enter} ; programma projecten in msoft is nu vooraan in je beeldscherm
		; we hebben nu een verse msoft en verse projecten mogelijks op projecten int beeeldvullend , maar run deze ahk maar nog ne keer
				
		;toon afgesloten zaken
		ToolTip, toon afgesloten zaken  !!  `n    ! ,1303,100
		Send, {Alt} ;
		Sleep 90
		Send, {Right 3} ;
		Sleep 90
		Send {Enter}
		Sleep 90
		Send, {Up 2} ;
		Sleep 90
		Send {Enter}
		Sleep 250
	}
	
	
	
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