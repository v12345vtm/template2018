Gui, font, s10, Verdana
Gui, Add, GroupBox, x10 y15 w165 h115, Page Selection
Gui, font
Gui, Add, Radio, x23 y40 , All
Gui, Add, Radio, x96 y40  vRadioFP , First Page
Gui, Add, Radio, x23 y70  vRadioSP , Single Page :
Gui, Add, Radio, x23 y100 vRadioPages , Pages :
Gui, Add, Edit, x130 y70 w30 h19 ,
Gui, Add, Edit, x90 y100 w30 h19 ,
Gui, font, w600, Verdana
Gui, Add, text, x122 y102 w5 h19 , -
Gui, font
Gui, Add, Edit, x130 y100 w30 h19 ,
Gui, Add, Button, x13 y140 w70 h22 default, Ok
Gui, Add, Button, x103 y140 w70 h22 , Cancel
Gui, Show, x386 y160 h178 w185, Page Setup
Return

GuiEscape:
Gui, Destroy
return

GuiClose:
gui, Destroy
return

ButtonCancel:
gui, Destroy
return

buttonOk:
Gui, submit, NoHide
MsgBox % "RadioAll: " RadioAll "`nRadioFP: " RadioFP "`nRadioSP: " RadioSP "`nRadioPages: " RadioPages
If (RadioAll=1)
	Run Notepad.exe
Else If (RadioFP=1) 
	Run Excel.exe ; etc

return