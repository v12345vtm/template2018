;INIT ahk 	elke export zetten we in ons exportbestand , dat is een vaste output filename.
scriptnaam :="uurkaarten"  
BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

;; export to log
FormatTime, CurrentDateTime,, yyMMddHHmmss
timestampel:= CurrentDateTime  ; om een ahk property op te slaan naar ahk variabele geen %% nodig
FileAppend,  %timestampel% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
Sleep 300,


;;pre-start en variabelen
;artikelomschrijving

CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates
SetKeyDelay, 500 ; hoe rap stuur je typcommandos  
 
Loop, 1
{
	ToolTip,     %scriptnaam%  = in Msoft artikelen staan   ; ahk variabele oproepen moet met %% 
	Sleep, 100
}

;;;START



 
 	SetScrollLockState, off
	;open pdf uurkaarten wacht 500ms en control+p drukken
	Run C:\Users\vth\Desktop\template2018\bibliotheek\uurkaarten.pdf
	Sleep 1500,
	Send, ^p
	ToolTip  ; wissen oude tooltips



;;;;;;;;;;;;;;;;;;;;;;;;;;






;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
	BlockInput, MouseMoveOff
	;MsgBox "EXIT-"%scriptnaam%
	MsgBox, 48, you pressed escape- , you pressed esc- `n`n This message will self-destruct in 1 seconds., 1
	ExitApp
	return
}

ESC::Goto ExitSub


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Loop, 3
{
	ToolTip, A=   %CurrentDateTime%     ; A_Index will be 1, 2, then 3
	Sleep, 1000
	ToolTip,  B=   timestampel   ;werkt niet
	Sleep, 1000
	ToolTip,  C=   %timestampel%    ; werkt wel
	Sleep, 1000
}


;;;;;;;;;;;;DEBUG START
ToolTip, writefile virtklembordTXT ;
file := FileOpen("C:/Users/vth/Desktop/template2018/logfiles/virtklembord.txt", "w")
;TestString :="lijn3 .`r`n"  ; to start a new line. nieuwe regel 
file.Write(%timestampel%) ; ahk variabelen moeten geen %% hebben
;file.Write(TestString) ; ahk variabelen moeten geen %% hebben

file.Close() 
Sleep 100, 
Sleep 900,
;ExitApp
;;;;;;;;;;;;DEBUG STOP              