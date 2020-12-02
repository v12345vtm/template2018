SysGet, MonitorCount, MonitorCount
SysGet, MonitorPrimary, MonitorPrimary

Loop, %MonitorCount%
{
    SysGet, MonitorName, MonitorName, %A_Index%
    SysGet, Monitor, Monitor, %A_Index%
    SysGet, MonitorWorkArea, MonitorWorkArea, %A_Index%
   ; MsgBox, Monitor Count:`t%MonitorCount%`nPrimary Monitor:`t%MonitorPrimary%   `nMonitor:`t#%A_Index%`nName:`t%MonitorName%`nLeft:`t%MonitorLeft% (%MonitorWorkAreaLeft% work)`nTop:`t%MonitorTop% (%MonitorWorkAreaTop% work)`nRight:`t%MonitorRight% (%MonitorWorkAreaRight% work)`nBottom:`t%MonitorBottom% (%MonitorWorkAreaBottom% work) `nresolutie = %MonitorRight%  x %MonitorBottom% 
}
 
  
 
;resolutie:= "ze"
resolutie:= MonitorRight "x"  MonitorBottom  ; dell 24inch is 1920x1080
 MsgBox, %resolutie%

 if (resolutie = "1920x1080")
{
    MsgBox groot scherm Dell24inch
     
}
else
{
    MsgBox we zitten met ander scherm dan normaal
    
}




;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
	BlockInput, MouseMoveOff
	;MsgBox "EXIT-"%scriptnaam%
	MsgBox, 48, you pressed escape- , you pressed esc- `n`n This message will self-destruct in 1 seconds., 1
	ExitApp
	return
}

ESC::Goto ExitSub
