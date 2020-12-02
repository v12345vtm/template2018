Gui, Add, Text, xm, Text
Gui, Add, Dropdownlist, xp+50, 
Gui, Add, Text, xm vMore1 Hidden, More ; To hide when shown ....
Gui, Add, Dropdownlist, xp+50 vMore2 Hidden, qqqq|www|eee ; .... add the Hidden option to GUI Controls
Gui, Add, Button, gShowHide vShowHide , Show/Hide More
Gui, Show
Return

ShowHide:

GuiControlGet, Hidden1, Visible, More1
GuiControlGet, Hidden2, Visible, More2

if !( Hidden1 && Hidden2 ) { ; if results are false, 0 or blank...
	GuiControl, Show, More1
	GuiControl, Show, More2
}
else {
	GuiControl, Hide, More1
	GuiControl, Hide, More2
}
; hidden:=not hidden ; no need for toggle!
return

GuiClose:
ExitApp