#include C:\Users\VTH\Desktop\template2018\ahk\_include_variabelen.ahk  ; dit bestand staat op je lokale pc , maar de simultane copy runt vanaf fileserver , dus altijd direct adressering gebruiken

Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
scriptnaam :="msoftnieuwemagazijnaanvraag globalInput inc"   
FileAppend, %Timestamp% - %scriptnaam%`n, %AhkLogbestand% ;save naar txt file concat
Sleep 300,
 
;;;;;    https://github.com/v12345vtm/template2018



;Current selection does not support all settings.

{

MouseMove, 195, 20 ; diskettje wegschrijven lijsten
 MouseClick, left
 wachtEenBeetje(2000)  
 wachtEenBeetje(2000)  
 wachtEenBeetje(2000)  
 wachtEenBeetje(2000)  
  wachtEenBeetje(2000)  
 wachtEenBeetje(2000)  
  wachtEenBeetje(2000)  
 wachtEenBeetje(2000)  
  wachtEenBeetje(2000)  
 wachtEenBeetje(2000)  
  wachtEenBeetje(2000)  
 wachtEenBeetje(2000)  
  wachtEenBeetje(2000)  
 wachtEenBeetje(2000)  
  
 
MouseMove, 132, 20 ; pijl importart
  MouseClick, left
   Loop
 {
 
  testbestaat := ActiveVensterAHKspy("klaar met importeren !!") ; returns false or true , 2e paramteter true is om winactivate te doen
  
 }
 Until testbestaat
    
 
  Sleep 600 
 Send {ENTER} 
 Sleep 600 
 ;;;;;;;;;;;;;;;;;;;;;;;
MouseMove, 220, 20 ; oog , nieuwe proc
  
 MouseClick, left
 
 
 Loop
 {
 
  testbestaat := ActiveVensterAHKspy("klaar met importeren !!") ; returns false or true , 2e paramteter true is om winactivate te doen
  
 }
 Until testbestaat
   
 Sleep 600 
 Send {ENTER}
  Sleep 600 
 ;;;;;;;;;;;;;;;;;;;;;
 
 
MouseMove, 160, 20 ; refresh opvragen lijst
 MouseClick, left
 wachtEenBeetje(1000)  
 wachtEenBeetje(1000)  
 wachtEenBeetje(1000)  
 wachtEenBeetje(1000)  
 wachtEenBeetje(1000)  
 wachtEenBeetje(1000)  
  wachtEenBeetje(1000)  
 wachtEenBeetje(1000) 
  wachtEenBeetje(1000)  
 wachtEenBeetje(1000)  
 wachtEenBeetje(1000)  
 wachtEenBeetje(1000)  
 wachtEenBeetje(1000)  

  

}




;;;;;;;


MouseMove, 195, 20 ; diskettje wegschrijven lijsten
 MouseClick, left
 wachtEenBeetje(2000)  
 wachtEenBeetje(2000)  
 wachtEenBeetje(2000)  
 wachtEenBeetje(2000)  
  wachtEenBeetje(2000)  
 wachtEenBeetje(2000)  
  wachtEenBeetje(2000)  
 wachtEenBeetje(2000)  
  wachtEenBeetje(2000)  
 wachtEenBeetje(2000)  
  wachtEenBeetje(2000)  
 wachtEenBeetje(2000)  
  wachtEenBeetje(2000)  
 wachtEenBeetje(2000)  
  
 

 Exitapp
    ;  ListVars
     ;  Pause
 
testbestaat := bestaatHetVenster("LET_VAULT" , false) ; returns false or true , 2e paramteter true is om winactivate te doen
testinvisibledata := ActiveVensterAHKspy("Current selection does not support all settings.")  



  ToolTip, vensterbestaat :  %testbestaat%   
 Sleep 1000  
 
 
 
 
  ToolTip, invisible :  %testinvisibledata%   
 Sleep 1000  






;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
	BlockInput, MouseMoveOff
	MsgBox, 48, you pressed escape- , you pressed esc- `n`n This message will self-destruct in 1 seconds., 1
	ExitApp
	return
}
ESC::Goto ExitSub         