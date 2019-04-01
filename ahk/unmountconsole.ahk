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
BlockInput, Off
   MsgBox emergencystop unmountp
   ExitApp
   return
}
ESC::Goto ExitSub              