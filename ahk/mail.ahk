




	ToolTip, mail-ahk = mail openen,303,750

Run, "C:\Program Files (x86)\Microsoft Office\Office16\outlook.exe"
Sleep, 2000


;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
MsgBox emergencystop mail-ahk
ExitApp
return
}
ESC::Goto ExitSub
