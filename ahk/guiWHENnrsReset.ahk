	#include C:\Users\VTH\Desktop\template2018\ahk\_include_variabelen.ahk  ; dit. bestand staat op je lokale pc , maar de simultane copy runt vanaf fileserver , dus altijd direct adressering gebruiken
	
	If (actiefvensterklasseproces() = "OMainMSACCESS.EXE")
		{
		 	BlockInput, MouseMove ;blokeer muis 
			  
		 
			MouseMove, 40, 87  ;  	
	 Sleep, 30			 
		 	;MouseClick, left  ; nrs activeren
			 Sleep, 300
			MouseClick, left  ; niewe tabllat vers en boven al de oude 
  	Sleep, 30
 		 	send !r ; alt + r = reset
		 	sleep 30
		 	MouseMove, %inputletrefx%, %inputletrefy%  ;  
		 	Sleep 30
		 	MouseClick, left  ; niewe tabllat vers en boven al de oude
	 	BlockInput, MouseMoveOff ;terug vrijgeven muis		
		
		}			
		else
		{
			BlockInput, MouseMoveOff ;terug vrijgeven muis	
			MsgBox, 48,  geen nrs draaiende  ,neen, 1
		}
		
		
		
		ExitApp
		
;;noodstop;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
	BlockInput, MouseMoveOff
	;MsgBox "EXIT-"%scriptnaam%
		MsgBox, 48, you pressed escape- ,guiWHENnrsreset %scriptnaam%, 1
	ExitApp
	return
}

ESC::Goto ExitSub
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

