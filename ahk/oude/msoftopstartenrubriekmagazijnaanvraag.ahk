;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
scriptnaam :="msoftopsartenrubriekmagazijnaanvraag"   
FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
Sleep 300,

;msoft opstarten
;indien msoft niet draait , starten we het en loggen we in
;direkt erna kijken we of het effectief draait en verkleinen en herpositioneren we
;indien msoft reeds draaide op de pc , gaan we het vooraan zetten en verkleinen en herpositioneren
;
;


SetKeyDelay, 200 ; hoe rap stuur je typcommandos
BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
Sleep 500,
CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:


SetTitleMatchMode 2 ; parameter die nodig is voor winexist 
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
	Send, {Down 5} ; magaanvr is 5x down
	Send {Enter}
	;Sleep 7000, ; wachten to magaanvr op u scherm is
	
	ToolTip, effectief nieuwe aanvraag doen! ,170 , 950
	Sleep 1200, 
	Run C:/Users/vth/Desktop/template2018/ahk/msoftnieuwemagazijnaanvraag.ahk 
	Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 	
	FileAppend, %Timestamp% - %scriptnaam% - "debug45"`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
	ExitApp ; debug
}else  {
	;MsgBox, u venster:  AUTO - LET Automotive n.v  zie ik niet !! ahk zal openene en inloggen voor u
	ToolTip, INLOGGEN en OPSTARTEN MSOFT,170 , 950
	Run, "C:\Users\Public\Desktop\M-Soft 11.7 (ERP01).lnk"
	WinWait, Welkom bij L.E.T. NV - MSP, 
	WinWaitActive, Welkom bij L.E.T. NV - MSP, 
	Sleep, 100
	;Send, {BACKSPACE 6}vth
	Send, {TAB}
	Sleep, 100
	Send, vith123
	MouseClick, left,  136,  157
	Sleep, 100
	Send, {Down 5}{Tab 1}{Down 2} ; meest gebruikte en dan selecteren
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
		Send, {Down 5} ; magaanvr is 5x down
		Send {Enter} ; programma magaanvr in msoft is nu vooraan in je beeldscherm
		; we hebben nu een verse msoft en verse magaanvr mogelijks op magaanvr int beeeldvullend , maar run deze ahk maar nog ne keer
		ToolTip, effectief nieuwe aanvraag doen! ,170 , 950
		Sleep 1900, 
		Run C:/Users/vth/Desktop/template2018/ahk/msoftnieuwemagazijnaanvraag.ahk
		Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
		FileAppend, %Timestamp% - %scriptnaam% - "debug94"`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
		
		ExitApp
	}} 

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