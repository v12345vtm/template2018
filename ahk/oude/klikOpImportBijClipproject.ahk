;https://www.autohotkey.com/boards/viewtopic.php?f=76&t=58324&sid=982c015ba6e662508c2ac1a81e9cff05&start=20



#NoEnv
WinTitle := "CPM-gegevensoverdracht"    ; the window's title
BtnClass := "WindowsForms10.Window.8.app.0.3c4abcc_r9_ad1"                                 ; this leading part of the ClassNN should be fix!
BtnText  := "Import"                                         ; the button's caption
BtnFound := False
WinGet, CtrlList, ControlListHwnd, %WinTitle%
; MsgBox, 0, Found controls, %CtrlList% ; <<<<< added
Loop, Parse, CtrlList, `n
{
   HWND := A_LoopField
   WinGetClass, CtlClass, ahk_id %HWND%
   If (CtlClass <> BtnClass)
      Continue
   ControlGetText, CtlText, , ahk_id %HWND%
   If (CtlText <> BtnText)
      Continue
   BtnFound := True
    MsgBox, 0, Found controls, ahk_id %HWND%
   ControlClick, , ahk_id %HWND%
   Break
}
If (BtnFound)
   MsgBox, 0, Found, Found and tried to click the button! : ahk_id %HWND%
Else
   MsgBox, 16, Error, Did not find the button!
ExitApp
