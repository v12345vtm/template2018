
#SingleInstance  Force
#WinActivateForce

    choices := "" ; if you leave this line out, it'll work too I guess, but you might get a warning if #warn was set so
    loop
    {
        FileReadLine, line, C:/Users/vth/Desktop/template2018/logfiles/nrshistoriek.txt, %A_Index%
        if ErrorLevel
            Break
        choices .= line "|"
    }

 
 

 Gui,Add,Listbox,gLbox vIndex +AltSubmit h100,%choices% 
Gui,Show,
return

Lbox:
If (A_GuiEvent = "DoubleClick")
{
 
	Gui,Submit,Nohide
	 
	 
	 
	     loop %Index% 
    {
        FileReadLine, selectedlijn, C:/Users/vth/Desktop/template2018/logfiles/nrshistoriek.txt, %A_Index%
        if ErrorLevel
            Break
       
    }
	 
	 
	 
	MsgBox The index of the selected item is %Index%   en   is ... %selectedlijn%
	exitapp
}
return
 
 
 
 
 
 GuiClose:
ExitApp
 
 
  

