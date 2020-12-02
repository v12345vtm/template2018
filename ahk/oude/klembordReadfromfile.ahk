 
;INIT ahk 	elke export zetten we in ons exportbestand , dat is een vaste output filename.
scriptnaam :="klembordReadfromfile-ahk"  
;BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

;; export to log
FormatTime, CurrentDateTime,, yyMMddHHmmss
timestampel:= CurrentDateTime  ; om een ahk property op te slaan naar ahk variabele geen %% nodig
FileAppend,  %timestampel% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
Sleep 300,


;;pre-start en variabelen
;artikelomschrijving

CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates
SetKeyDelay, 50 ; hoe rap stuur je typcommandos  
 
Loop, 3
{
	ToolTip,     %scriptnaam%  overal mag je staan   ; ahk variabele oproepen moet met %% 
	; Sleep, 200
}



;;;START





	; BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
	; Sleep 100, ;1500
	 
	;ToolTip, klembordReadfromfile ; 
		
	;  MsgBox, 48, you pressed CANCELED, you pressed CANCELED `n`n This message will self-destruct in 2 seconds., 2
	;FileAppend,hallo`n, C:/Users/vth/Desktop/template2018/logfiles/virtklembord.txt ;save naar txt file
	
	ToolTip, readfile virtklembordTXT ;
	
	
	; file := FileOpen("C:/Users/vth/Desktop/template2018/logfiles/virtklembord.txt", "r")
	; file.Write(UserInput)
	;  file.Close() 
	
	FileRead, OutputVar,  C:/Users/vth/Desktop/template2018/logfiles/virtklembord.txt 
	; ToolTip, Multiline`nTooltip, 100, 150 , 20
	;ToolTip, %OutputVar%, 300, 150 , 19
	Send,%OutputVar%   ;
	Send,{Enter}  ;
	
	Sleep 1	
	
	;;noodstop
	ExitApp ; dit is onze laatste stap na de herhaalloop
	ExitSub:
	{
		BlockInput, MouseMoveOff
		;MsgBox "EXIT-"%scriptnaam%
			MsgBox, 48, you pressed escape- , %scriptnaam%, 1
		ExitApp
		return
	}
	ESC::Goto ExitSub
           