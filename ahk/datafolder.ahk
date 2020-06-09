
;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
scriptnaam :="datafolder opletten"   
;FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
;Sleep 300,

ToolTip, "starting-"%scriptnaam% 
CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates

SetKeyDelay, 100 ; hoe rap stuur je typcommandos 

;BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen


 
InputBox, UserInput, artikelnr, Please enter a artikel number., , 300, 200
if ErrorLevel
{
MsgBox, 48, you pressed cancel- , you pressed cancel- `n`n This message will self-destruct in 1 seconds., 1
ExitApp
}
   
else
{
BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

  ;  MsgBox, You entered voor deze zoekfilter *%UserInput%*.doc*
  
	Sleep 800
	
	ClipBoard = *%UserInput%*D5*.doc*


	file := FileOpen("C:/Users/vth/Desktop/template2018/logfiles/virtklembord.txt", "w")
	;  TestString := ".`r`n"  ; to start a new line. nieuwe regel 
	file.Write(UserInput)
	;file.Write(ClipBoard)
	file.Close() 


Run L:\Letdata\data
Sleep 1600

Send {F3}
Sleep 1600
Send *%UserInput%**.doc*
Sleep 600
Send {enter}




FileAppend, %Timestamp% - %scriptnaam% - *%UserInput%*.doc*  - `n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
Sleep 100,


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