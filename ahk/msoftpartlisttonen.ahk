 ;INIT ahk 	elke export zetten we in ons exportbestand , dat is een vaste output filename.
scriptnaam :="Msoftpartlisttonen"  
BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

;; export to log
FormatTime, CurrentDateTime,, yyMMddHHmmss
timestampel:= CurrentDateTime  ; om een ahk property op te slaan naar ahk variabele geen %% nodig
FileAppend,  %timestampel% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
Sleep 300,


;;pre-start en variabelen
;artikelomschrijving


CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
;  SetKeyDelay, 500 ; hoe rap stuur je typcommandos   
Loop, 1
{
	ToolTip,     %scriptnaam%  = in Msoft artikelen staan   ; ahk variabele oproepen moet met %% 
	Sleep, 1000
}

;;;START


If WinExist("AUTO - Artikelen  -  LET Automotive n.v.")
{	WinActivate
Sleep 200,
 
	Loop, 4
	{
		ToolTip, ,
ToolTip, je bent wel in artikelen    %A_Index%  /... seconden    ; A_Index will be 1, 2, then 3
		Sleep, 10
	}
	
	
	 
;;  ;;we gaan de omschrijving eerst inladen dor Alt+enter te doen en te kopieren wat de text is die te kopieren is
;;  Send, !{ENTER} 
;;  Sleep 1300, 
;;   Send, ^{c}  ; control c ,kopier de omschrijving in klembord
;;  ; ALS JE TE KORT WACHT ZIT KLEMBORD ER NIET HELAMAAL IN
;;  Loop, 4
;;	{	 
;;		ToolTip, saving tabel to klembord...    nog  %A_Index%  //.2.. seconden    ; A_Index will be 1, 2, then 3
;;		Sleep, 500		
;;	} 
;; artikelomschrijving := clipboard ; stores the clipboard content into a variable
;; Send !{f4} ; Simulates the keypress alt+f4 sluit window  waar ons text artikelnaam stond
 
 ;;;;;;;;;;;;;produktiegegevens openen 
 
Send, +{F9}  ;shift f9
Sleep 400
Send,   ^{PgUp}  ; control pageUP
Sleep 400,
Send +{Tab 3}
Sleep 300
Send , {Enter}  ; hierdoor komt er window = "Detail Materiaalkosten"
	Loop, 3
	{
		ToolTip, wachten tot Detail Materiaalkosten    %A_Index%  /.3.. seconden   ; A_Index will be 1, 2, then 3
		Sleep, 400 ; 1000
	}


;nu hebben we nu zicht op de partlijst tabel van msoft
;nu willen we de tabel in klermbord

;Detail Materiaalkosten , hier gaan we een 3e window binnen
	If WinExist("Detail Materiaalkosten")
		{	WinActivate
		;Sleep, 500
	Loop, 1
	{
		ToolTip, inladen Detail Materiaalkosten    %A_Index%  /minstens 1.1 seconden anders lukt niet  ; A_Index will be 1, 2, then 3
		Sleep, 300
	}
			;Sleep 1300,			
			MouseMove, 100, 100 ;in de tabel ergens staan ongeveer 1e rij
			Sleep, 100
			
			
			MouseClick, right ; menuopvragen
			Sleep, 100
			Send, {Down 6} ;6keer pijltje omlaag
			Sleep, 100
			Send, {Enter} ; druk op enter
			Sleep, 100
			
	;voila stuklijst in klembord!!
	Loop, 6
	{
		ToolTip, voila stuklijst van %Msoftomschijving% in klembord    %A_Index%  /... seconden   ; A_Index will be 1, 2, then 3
		Sleep, 50
	}
	
	
	;sluit nu venster "Detail Materiaalkosten"
	 ;  Send !{f4} ; Simulates the keypress alt+f4 sluit window  waar ons text artikelnaam stond
	   Sleep, 500
	   
	   ;sluit nu venster "waar je knop deelfasen en zo in staan"
	 ;  Send !{f4} ; Simulates the keypress alt+f4 sluit window  waar ons text artikelnaam stond
	   Sleep, 500
	
		Loop, 6
	{
		ToolTip, KLAAR met tonen    %A_Index%  /... seconden   ; A_Index will be 1, 2, then 3
		Sleep, 50
	}
	
	

	
	
			}
			
			else
{
Loop, 10
	{
		ToolTip, je bent niet in Detail Materiaalkosten    %A_Index%  /... seconden ,170 , 950  ; A_Index will be 1, 2, then 3
		Sleep, 10
	}
	 }

	
	
	
	
	
	
	
	
}
else{
 
	Loop, 4
	{
		ToolTip, je bent niet in artikelen    %A_Index%  /... seconden ,170 , 950  ; A_Index will be 1, 2, then 3
		Sleep, 500
	}
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





	;;;;;;;;;;;;DEBUG START
	ToolTip, writefile virtklembordTXT ;
	file := FileOpen("C:/Users/vth/Desktop/template2018/logfiles/virtklembord.txt", "w")
	;  TestString := ".`r`n"  ; to start a new line. nieuwe regel 
	file.Write(artikelomschrijving)
	;  file.Write(TestString)
	file.Close() 
	Sleep 100, 
 Sleep 900,
 ;;;;;;;;;;;;DEBUG STOP


