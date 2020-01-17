;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
   Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
   scriptnaam :="unmountconsole"   
   FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
       Sleep 300,
	   
	   
	   
	   ;shortest way in windows  = run j , alt+j en alt+j

{
CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
#SingleInstance force
  BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
   Sleep 500, 
 
	try  ; Attempts to execute code.
{
   Run %1%:\    ;Run, "c:\"
   Sleep, 400
}
catch e  ; Handles the first error/exception raised by the block above.
{
    BlockInput, Off
	Sleep, 100
	MsgBox, An exception was thrown!`n Specifically: %e% 'n press SPatie
    ;Exit
	ExitApp
}  
	
Sleep, 1600      
   ;alt+j
   Send !j
   Sleep, 600
   ;alt+j
   Send !j
   Sleep, 600
}














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