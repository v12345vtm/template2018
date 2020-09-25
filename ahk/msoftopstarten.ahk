#include C:\Users\VTH\Desktop\template2018\ahk\_include_variabelen.ahk  ; dit bestand staat op je lokale pc , maar de simultane copy runt vanaf fileserver , dus altijd direct adressering gebruiken
Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
scriptnaam :="msoftopstarten_incl"   
;FileAppend, %Timestamp% - %scriptnaam%`n, %AhkLogbestand% ;save naar txt file concat
aantalkliksUitgespaart := 0   ; aantalkliksUitgespaart += 1  ; een klik is click of tab of enter of up of down of shiftF9 of ... 
Sleep 300,


    ;  ListVars
    ;  Pause

;msoft opstarten
;indien msoft niet draait , starten we het en loggen we in
;direkt erna kijken we of het effectief draait en verkleinen en herpositioneren we
;indien msoft reeds draaide op de pc , gaan we het vooraan zetten en verkleinen en herpositioneren
  
SetKeyDelay, 200 ; hoe rap stuur je typcommandos
BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
Sleep 100,
CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
SetTitleMatchMode 2 ; parameter die nodig is voor winexist 

If WinExist("AUTO - LET Automotive n.v.")
{
	;MsgBox, u venster is open	, en ik zal het vooraan zetten + verkleinen !!!
	ToolTip, u programma Artikelen (AUTO - LET Automotive n.v) is open `n  	 en ik zal het vooraan zetten   `n   voila! ,170 , 950
	WinActivate  ; venster aktief  ;AUTO - LET Automotive n.v; zetten die we net gezocht en gevonden hebben
	Sleep 700
	WinGetPos,,, Width, Height, %WinTitle%	
	WinMove, %WinTitle%,, 1280, 570 ,620,440   ; msoft naar left1280 top570  width620  height440
	ExitApp ; debug
}else  {
	;MsgBox, u venster:  AUTO - LET Automotive n.v  zie ik niet !! open het eerst zelf
	
	ToolTip, INLOGGEN en OPSTARTEN MSOFT,170 , 950
	 aantalkliksUitgespaart += 1
	
	Run,%msoftEXE% ;  "C:\Users\Public\Desktop\M-Soft 11.7 (ERP01).lnk" ; zie includefile
	WinWait, Welkom bij L.E.T. NV - MSP, 
	WinWaitActive, Welkom bij L.E.T. NV - MSP, 
	Sleep, 100
	;Send, {BACKSPACE 6}vth
	aantalkliksUitgespaart += 1
	Send, {TAB}
	Sleep, 100
	Send, %msoftPaswoord% ; zie incl
	aantalkliksUitgespaart += 1
	MouseClick, left,  160,  185 ; in active window
	; MouseClick, left,  942,  316 ; screen window
	Sleep, 1000 ; inladen msoft , niet verkorten
	aantalkliksUitgespaart += 1
	Send, {Down 5}{Tab 1}{Down 2} ; ga in linker boord naar meest gebruikte  en dan tab en beland op "ARTIKELEN"
	Sleep 1500,  
	
	
	;verkleinen formaat en positie window    
	Sleep 1500, 
	If WinExist("AUTO - LET Automotive n.v.")
	{
		ToolTip, verkleining !!  `n   voila! ,170 , 950
		WinActivate  ; venster aktief  ;AUTO - LET Automotive n.v; zetten die we net gezocht en gevonden hebben
		Sleep 700
		WinGetPos,,, Width, Height, %WinTitle%	
		WinMove, %WinTitle%,, 1280, 570 ,620,440   ; msoft naar left1280 top570  width620  height440
		Sleep 0500,
	}else  {
		ToolTip, winexist niet gezien !!  `n   voila! ,170 , 950
	}
	
	
	FileAppend, %Timestamp% - %scriptnaam%  kliks : %aantalkliksUitgespaart%`n, %AhkLogbestand% ;save naar txt file concat
	ExitApp
} 







;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
	BlockInput, MouseMoveOff ; muis los laten voor gebruiker
	
	MsgBox, 48, you pressed escape- , %scriptnaam%, 1
	ExitApp
	return
}
ESC::Goto ExitSub              