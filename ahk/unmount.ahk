;shortest way in windows  = run j , alt+j en alt+j

;   http://sl5.it/SL5_preg_contentFinder/examples/AutoHotKey/converts_your_autohotkey_code_into_pretty_indented_source_code.php

CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
#SingleInstance force




; MsgBox, parameters ontvangen  %0%
  ;MsgBox, 1e parameters is  %1%  als er parameter werd meegeveven in , dan zetten we die n de e inputbox
  
   
 
driveletter := "j"

 



InputBox, UserInput, unmount,unmount a usb vb drive j typ dan j,,%driveletter%
if ErrorLevel
{
   ; MsgBox, CANCEL was pressed.
   exitapp
}else  {
   ;  MsgBox, You want to unmount USB  "%UserInput%"	OR press esc to escape (program breaks if path is not found)
   ;MsgBox % "nu een loop van  " . StrLen(UserInput) 
    
   BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
   Sleep 500,
      
	  
	  
	try  ; Attempts to execute code.
{
   Run %UserInput%:\ 
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
	  
	  
   ;Run, "c:\"
 
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
   MsgBox emergencystop unmount
   ExitApp
   return
}
ESC::Goto ExitSub              