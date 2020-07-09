#include C:\Users\VTH\Desktop\template2018\ahk\_include_variabelen.ahk  ; dit bestand staat op je lokale pc , maar de simultane copy runt vanaf fileserver , dus altijd direct adressering gebruiken

BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
scriptnaam :="Clipprojectopenen incl  "   
FileAppend, %Timestamp% - %scriptnaam%`n, %AhkLogbestand% ;save naar txt file concat
Sleep 300,


CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
;  SetKeyDelay, 500 ; hoe rap stuur je typcommandos   
Loop, 3
{
	ToolTip,     %scriptnaam%  = in Msoft artikelen staan   ; ahk variabele oproepen moet met %% 
	Sleep, 10
}
 

SetTitleMatchMode 2
If WinExist("CLIP PROJECT")
{
	;MsgBox, u venster is open	, en ik zal het vooraan zetten
	ToolTip, u programma CLIP PROJECT  is open `n  	 en ik zal het vooraan zetten   `n   voila! ,900 , 500
	WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
	Sleep 200,  ; 2000
	; ExitApp ; debug
}else  {
	;MsgBox, u venster  zie ik niet	, maar ik ga het openen voor u
	BlockInput, MouseMoveOff
	
	Loop, 10
	{
		ToolTip, wacht   om alles in te laden    %A_Index%  /10 seconden ,170 , 950  ; A_Index will be 1, 2, then 3
		;Sleep, 1000
	}
	
	BlockInput, MouseMove 
	
	ToolTip, clipproject openen-ahk  `n   starting  : programma CLIP PROJECT  ,900 , 500
	Sleep 100,
	Run %algemeen_mtp_bestand% ; we starten een label op , werkt perfect om zo clip project te starten ;met de pause toets labeling prog starten
	Sleep 6000,
	ToolTip, clip project gestart,900 , 500
	Sleep 100, ; 2000
	
	ExitApp
} 

Sleep 100, 


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