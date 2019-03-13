 
 ToolTip, TESTTEMPLATE,400,800


;;volgende 2 lijnen raken niet door de antivirus
;ControlGet, IconList, List, , SysListView321, Program Manager ahk_class Progman
;Loop, Parse, IconList, `n





getDeskIconsPos() {
    Critical
    static MEM_COMMIT := 0x1000, PAGE_READWRITE := 0x04, MEM_RELEASE := 0x8000
    static LVM_GETITEMPOSITION := 0x00001010, LVM_SETITEMPOSITION := 0x0000100F, WM_SETREDRAW := 0x000B

    ControlGet, hwWindow, HWND,, SysListView321, ahk_class Progman
    if !hwWindow ; #D mode
        ControlGet, hwWindow, HWND,, SysListView321, A
    If WinExist ahk_id %hwWindow% ; last-found window set
        WinGet, iProcessID, PID
    hProcess := DllCall("OpenProcess"   , "UInt",   0x438           ; PROCESS-OPERATION|READ|WRITE|QUERY_INFORMATION
                                        , "Int",    FALSE           ; inherit = false
                                        , "ptr",    iProcessID)
    ret := {}
    if hwWindow and hProcess
    {  
        ControlGet, list, list,Col1
        VarSetCapacity(iCoord, 8)
        pItemCoord := DllCall("VirtualAllocEx", "ptr", hProcess, "ptr", 0, "UInt", 8, "UInt", MEM_COMMIT, "UInt", PAGE_READWRITE)
        Loop, Parse, list, `n ;Loop through items in list and get the information from the POINT structures
        {
            SendMessage, %LVM_GETITEMPOSITION%, % A_Index-1, %pItemCoord%
            DllCall("ReadProcessMemory", "ptr", hProcess, "ptr", pItemCoord, "UInt", &iCoord, "UInt", 8, "UIntP", cbReadWritten)

            ;<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>
            THE_ITEMNAME := A_LoopField
            THE_X_COORD := NumGet(iCoord,"Int")
            THE_Y_COORD := Numget(iCoord, 4,"Int")
            ;<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>
                        if(!ret.HasKey(THE_ITEMNAME))
                        {
                                ret[THE_ITEMNAME] := []
                        }
                        ret[THE_ITEMNAME].Insert({x: THE_X_COORD, y: THE_Y_COORD})
        }
        DllCall("VirtualFreeEx", "ptr", hProcess, "ptr", pItemCoord, "ptr", 0, "UInt", MEM_RELEASE)
    }
    DllCall("CloseHandle", "ptr", hProcess)
    return ret
}







icons := getDeskIconsPos()
chromePos := icons["Google Chrome"]
for k, pos in chromePos
{
        msgbox % "Data Migration.lnk is at X: " pos.x " Y: " pos.y
}


 



















ExitApp ; dit is onze laatste stap na de herhaalloop


ExitSub:
{
MsgBox emergencystop
ExitApp
return
}


 

ESC::Goto ExitSub
