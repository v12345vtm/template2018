ToolTip, mail-ahk = mail openen,303,750

   BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  Sleep 500,


	

Run, "C:\Program Files (x86)\Microsoft Office\Office16\outlook.exe"
Sleep, 1500


;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
MsgBox emergencystop mail-ahk
ExitApp
return
}
ESC::Goto ExitSub
