 CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
  ToolTip, mail-ahk = mail openen,170 , 950

  ; BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
 ; Sleep 200,

SetTitleMatchMode, 2
If WinExist("Outlook")
		{	
		WinActivate
;MsgBox ja
			}
			
			
			else
			
			{
			;MsgBox nee
			Run, "C:\Program Files (x86)\Microsoft Office\Office16\outlook.exe"
Sleep, 500


			}



	




;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
BlockInput, MouseMoveOff
MsgBox emergencystop mail-ahk
ExitApp
return
}
ESC::Goto ExitSub
