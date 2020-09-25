#include C:\Users\VTH\Desktop\template2018\ahk\_include_variabelen.ahk  ; dit bestand staat op je lokale pc , maar de simultane copy runt vanaf fileserver , dus altijd direct adressering gebruiken

Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
scriptnaam :="checklijstopenenexcel"   
FileAppend, %Timestamp% - %scriptnaam%`n, %AhkLogbestand% ;save naar txt file concat
Sleep 300,
 




ToolTip, "starting-"%scriptnaam% 
Run %checklijst_bestand%

 


;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
	BlockInput, MouseMoveOff
	MsgBox, 48, you pressed escape- , %scriptnaam%, 1
	ExitApp
	return
}

ESC::Goto ExitSub              