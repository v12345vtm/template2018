;shortest way in windows  = run j , alt+j en alt+j
 CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:



#SingleInstance force



    
    BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  Sleep 1500,
  
  



InputBox, UserInput, unmount,unmount a usb vb drive j typ dan j,
if ErrorLevel
{
   ; MsgBox, CANCEL was pressed.
    exitapp
}
else
{
  ;  MsgBox, You want to unmount USB  "%UserInput%"	OR press esc to escape (program breaks if path is not found)
;MsgBox % "nu een loop van  " . StrLen(UserInput) 
  


;Run, "c:\"
Run %UserInput%:\




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
MsgBox emergencystop virt envirement
ExitApp
return
}
ESC::Goto ExitSub
