;
; Window Spy vith versie
;

#NoEnv
#NoTrayIcon
#SingleInstance Ignore
SetWorkingDir, %A_ScriptDir%
SetBatchLines, -1
CoordMode, Pixel, Screen

txtNotFrozen := "(Hold Ctrl or Shift to suspend updates)"
txtFrozen := "(Updates suspended)"
txtMouseCtrl := "text van op de knop en pos en formaat"
txtFocusCtrl := "Focused Control"

Gui, New, hwndhGui AlwaysOnTop Resize MinSize
;Gui, Add, Text,, Window Title, Class and Process:
Gui, Add, Checkbox,Checked yp xp+200 w120 Right vCtrl_FollowMouse, Follow Mouse
Gui, Add, Edit, xm w320 r5 ReadOnly -Wrap vCtrl_Title



Gui, Add, Text,, Mouse Position beste is WINDOW kiezen:
Gui, Add, Edit, w320 r3 ReadOnly vCtrl_MousePos

;focussed..lijkt me niet intresant en nuttig maar dit zijn de knoppen die je kan uitlezen in een gui
Gui, Add, Text, w320 vCtrl_CtrlLabel, % txtFocusCtrl ":"
Gui, Add, Edit, w320 r5 ReadOnly vCtrl_Ctrl

;active window pos
Gui, Add, Text,, Active Window Position:
Gui, Add, Edit, w320 r2 ReadOnly vCtrl_Pos


Gui, Add, Text,, Status Bar Text:
Gui, Add, Edit, w320 r8 ReadOnly vCtrl_SBText
Gui, Add, Checkbox, vCtrl_IsSlow, Slow TitleMatchMode=toon details in de velden

;;;;;;;;;;;;;;Gui, Add, Text,, Visible Text:
;;;;;;;;;;;Gui, Add, Edit, w320 r9 ReadOnly vCtrl_VisText

Gui, Add, Text,, All Text:
Gui, Add, Edit, w320 r33 ReadOnly vCtrl_AllText


;Gui, Add, Text, w320 r2 vCtrl_Freeze, % txtNotFrozen
Gui, Show, NoActivate, Window Spy vith versie
GetClientSize(hGui, temp)
horzMargin := temp*96//A_ScreenDPI - 320
SetTimer, Update, 250
return

GuiSize:
Gui %hGui%:Default
if !horzMargin
	return
SetTimer, Update, % A_EventInfo=1 ? "Off" : "On" ; Suspend on minimize
ctrlW := A_GuiWidth - horzMargin
list = Title,MousePos,Ctrl,Pos,SBText,VisText,AllText,Freeze
Loop, Parse, list, `,
	GuiControl, Move, Ctrl_%A_LoopField%, w%ctrlW%
return

Update:
Gui %hGui%:Default
GuiControlGet, Ctrl_FollowMouse
CoordMode, Mouse, Screen
MouseGetPos, msX, msY, msWin, msCtrl
actWin := WinExist("A")
if Ctrl_FollowMouse
{
	curWin := msWin
	curCtrl := msCtrl
	WinExist("ahk_id " curWin)
}
else
{
	curWin := actWin
	ControlGetFocus, curCtrl
}
WinGetTitle, t1
WinGetClass, t2
if (curWin = hGui || t2 = "MultitaskingViewFrame") ; Our Gui || Alt-tab
{
	UpdateText("Ctrl_Freeze", txtFrozen)
	return
}
UpdateText("Ctrl_Freeze", txtNotFrozen)
WinGet, t3, ProcessName
WinGet, t4, PID
;varalles:= t1
varalles:= t2
varalles.= t3
UpdateText("Ctrl_Title", "alles= " varalles  "`nWinGetTitle= "t1 "`nWinGetClass= " t2 "`nWinGetProcesname= " t3 "`nWinGetpid= " t4)
CoordMode, Mouse, Relative
MouseGetPos, mrX, mrY
CoordMode, Mouse, Client
MouseGetPos, mcX, mcY
PixelGetColor, mClr, %msX%, %msY%, RGB
mClr := SubStr(mClr, 3)
UpdateText("Ctrl_MousePos", "Screen:`t" msX ", " msY " (less often used)`nWindow:`t" mrX ", " mrY " (default)"
	. "`nColor:`t" mClr " (Red=" SubStr(mClr, 1, 2) " Green=" SubStr(mClr, 3, 2) " Blue=" SubStr(mClr, 5) ")")
UpdateText("Ctrl_CtrlLabel", (Ctrl_FollowMouse ? txtMouseCtrl : txtFocusCtrl) ":")
if (curCtrl)
{
	ControlGetText, ctrlTxt, %curCtrl%
	cText := "ClassNN:`t" curCtrl "`nText:`t" textMangle(ctrlTxt)
    ControlGetPos cX, cY, cW, cH, %curCtrl%
    cText .= "`n`tx: " cX "`ty: " cY "`tw: " cW "`th: " cH
    WinToClient(curWin, cX, cY)
	ControlGet, curCtrlHwnd, Hwnd,, % curCtrl
    GetClientSize(curCtrlHwnd, cW, cH)
    cText .= "`nknop pos+formaat:`tx: " cX "`ty: " cY "`tw: " cW "`th: " cH
}
else
	cText := ""
UpdateText("Ctrl_Ctrl", cText)
WinGetPos, wX, wY, wW, wH
GetClientSize(curWin, wcW, wcH)
UpdateText("Ctrl_Pos", "`tx: " wX "`ty: " wY "`tw: " wW "`th: " wH "`nClient:`tx: 0`ty: 0`tw: " wcW "`th: " wcH)
sbTxt := ""
Loop
{
	StatusBarGetText, ovi, %A_Index%
	if ovi =
		break
			sbTxt .= "(" A_Index "):`t" textMangle(ovi) "`n"
}
StringTrimRight, sbTxt, sbTxt, 1
UpdateText("Ctrl_SBText", sbTxt)
GuiControlGet, bSlow,, Ctrl_IsSlow
if bSlow
{
	DetectHiddenText, Off
	WinGetText, ovVisText
	DetectHiddenText, On
	WinGetText, ovAllText
}
else
{
	ovVisText := WinGetTextFast(false)
	ovAllText := WinGetTextFast(true)
}
UpdateText("Ctrl_VisText", ovVisText)
UpdateText("Ctrl_AllText", ovAllText)
return

GuiClose:
ExitApp

WinGetTextFast(detect_hidden)
{
	; WinGetText ALWAYS uses the "fast" mode - TitleMatchMode only affects
	; WinText/ExcludeText parameters.  In Slow mode, GetWindowText() is used
	; to retrieve the text of each control.
	WinGet controls, ControlListHwnd
	static WINDOW_TEXT_SIZE := 32767 ; Defined in AutoHotkey source.
	VarSetCapacity(buf, WINDOW_TEXT_SIZE * (A_IsUnicode ? 2 : 1))
	text := ""
	Loop Parse, controls, `n
	{
		if !detect_hidden && !DllCall("IsWindowVisible", "ptr", A_LoopField)
			continue
		if !DllCall("GetWindowText", "ptr", A_LoopField, "str", buf, "int", WINDOW_TEXT_SIZE)
			continue
		text .= buf " // "
	}
	return text
}

UpdateText(ControlID, NewText)
{
	; Unlike using a pure GuiControl, this function causes the text of the
	; controls to be updated only when the text has changed, preventing periodic
	; flickering (especially on older systems).
	static OldText := {}
	global hGui
	if (OldText[ControlID] != NewText)
	{
		GuiControl, %hGui%:, % ControlID, % NewText
		OldText[ControlID] := NewText
	}
}

GetClientSize(hWnd, ByRef w := "", ByRef h := "")
{
	VarSetCapacity(rect, 16)
	DllCall("GetClientRect", "ptr", hWnd, "ptr", &rect)
	w := NumGet(rect, 8, "int")
	h := NumGet(rect, 12, "int")
}

WinToClient(hWnd, ByRef x, ByRef y)
{
    WinGetPos wX, wY,,, ahk_id %hWnd%
    x += wX, y += wY
    VarSetCapacity(pt, 8), NumPut(y, NumPut(x, pt, "int"), "int")
    if !DllCall("ScreenToClient", "ptr", hWnd, "ptr", &pt)
        return false
    x := NumGet(pt, 0, "int"), y := NumGet(pt, 4, "int")
    return true
}

textMangle(x)
{
	if pos := InStr(x, "`n")
		x := SubStr(x, 1, pos-1), elli := true
	if StrLen(x) > 40
	{
		StringLeft, x, x, 40
		elli := true
	}
	if elli
		x .= " (...)"
	return x
}

~*Ctrl::
~*Shift::
SetTimer, Update, Off
UpdateText("Ctrl_Freeze", txtFrozen)
return

~*Ctrl up::
~*Shift up::
SetTimer, Update, On
return
