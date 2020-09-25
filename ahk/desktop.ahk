#include C:\Users\VTH\Desktop\template2018\ahk\_include_variabelen.ahk  ; dit bestand staat op je lokale pc , maar de simultane copy runt vanaf fileserver , dus altijd direct adressering gebruiken

BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
scriptnaam :="desktop.ahk +doet ook scrollock disablen"   
FileAppend, %Timestamp% - %scriptnaam%`n, %AhkLogbestand% ;save naar txt file concat
Sleep 300,
 
  Test := GetKeyState("Scrolllock","T")
  if Test = 1
  {
;MsgBox, You entered 11111111
  }
  else
  {
   ; MsgBox, You entered 0
  }

SetScrollLockState , Off

SetScrollLockState, AlwaysOff

Send #d
 
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