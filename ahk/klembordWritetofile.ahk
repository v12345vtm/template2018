;INIT ahk 	elke export zetten we in ons exportbestand , dat is een vaste output filename.
scriptnaam :="klembordWritetofile-ahk de geselecteerde text"  
;BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

;; export to log
FormatTime, CurrentDateTime,, yyMMddHHmmss
timestampel:= CurrentDateTime  ; om een ahk property op te slaan naar ahk variabele geen %% nodig
FileAppend,  %timestampel% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
Sleep 300,


;;pre-start en variabelen
;artikelomschrijving

CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates
SetKeyDelay, 500 ; hoe rap stuur je typcommandos  
 
Loop, 3
{
	ToolTip,     %scriptnaam%  overal mag je staan   ; ahk variabele oproepen moet met %% 
	; Sleep, 200
}



;;;START
 FileRead, OutputVar,  C:/Users/vth/Desktop/template2018/logfiles/virtklembord.txt 
 
  
 
oCB := ClipboardAll  ; save clipboard contents
Send, ^c
ClipWait,4

;< do whatever you originally wanted with selected text in "clipboard" variable >

 
 
 
 
	; we lezen de vorige nummer uit
	; 	ToolTip, %OutputVar%, 300, 150 , 19
	
	Loop, 2
{
	ToolTip,     %OutputVar%  oudklembordterm  + nieuw %ClipBoard% +  %A_Index%  /... seconden  ; ahk variabele oproepen moet met %% 
	Sleep, 100
}

 
 
;;;;;;;;;;do something here

	Loop, 2
{
	ToolTip,     inputbox mag nu   %A_Index%  /... seconden  ; ahk variabele oproepen moet met %% 
	Sleep, 50
} 
;InputBox, OutputVar , Title,                      Prompt,        HIDE,  Width, Height, X, Y, Locale, Timeout, Default
InputBox, UserInput, program klembordWritetofile, Please enter a  number voor virt klembord., , 300, 170 ,70,500,,, %ClipBoard% ; breed300 hoogte170 posx70 posy500
if ErrorLevel
  {  
  	MsgBox, 48, you pressed cancel- , you pressed cancel- `n`n This message will self-destruct in 1 seconds., 1
  ExitApp
  }
else
{
; MsgBox, You entered "%UserInput%"
 ToolTip,    You entered "%UserInput%" nu   %A_Index%  /... seconden  ; ahk variabele oproepen moet met %% 
}
   



	;FileAppend,hallo`n, C:/Users/vth/Desktop/template2018/logfiles/virtklembord.txt ;save naar txt file
	
	ToolTip, writefile virtklembordTXT ;
	file := FileOpen("C:/Users/vth/Desktop/template2018/logfiles/virtklembord.txt", "w")
	;  TestString := ".`r`n"  ; to start a new line. nieuwe regel 
	file.Write(UserInput)
	;  file.Write(TestString)
	file.Close() 
	Sleep 100, 
;;;;;


	Loop, 4
{
	ToolTip,     einde prog bereikt   %A_Index%  /... seconden  ; ahk variabele oproepen moet met %% 
	Sleep, 100
}




ClipBoard := oCB         ; return original Clipboard contents 
 
 
ExitApp


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	
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
             