#include C:\Users\VTH\Desktop\template2018\ahk\_include_variabelen.ahk  ; dit bestand staat op je lokale pc , maar de simultane copy runt vanaf fileserver , dus altijd direct adressering gebruiken




MsgBox % myvar "`n" myvar2


Send, %msoftPaswoord% ; zie incl

   Loop, 10
{
	ToolTip,    Msoft artikelen staan   ; ahk variabele oproepen moet met %% 
	Sleep, 1000
	ToolTip,    Mfefefn 
	
}

