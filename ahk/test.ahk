CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
Gui, Add, Edit, R10 W350 vMyInput
Gui, Add, Button, gShowText, toontekst
Gui, Add, Button, gAnnuleren, sluitaf
Gui, Show, w400 h200
Return

ShowText:
{	
	GuiControlGet MyInput
	MsgBox %MyInput%
}

Annuleren:
{
ExitApp
}