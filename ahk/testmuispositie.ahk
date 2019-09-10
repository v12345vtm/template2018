{
	BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
	Sleep 100,
	
	
	

	 
	 ; Move the mouse center of win10logo:
;CoordMode, Window	 
;MouseMove, 32, 1068 ;center win logo is volgenq activewindowspy 
;MouseMove, 22, 1068 ;rekensleutel okee als je in coord window staan

	 ; Move the mouse center of win10logo:
CoordMode, screen	 
MouseMove, 32, 1068 ;en als exe center win logo is volgenq activewindowspy 
;MouseMove, 22, 1068 ;rekensleutel als je in coord window staan



;Besluit als  je een ahk runt , moet je rekensleutel doen 
;echter als je compileert naar exe moet je de rekensleutel niet doen en spy active window volgen


MouseGetPos, xpos, ypos  ; default lezen we de mousepos op active window
WinGetTitle, Title, A
;CoordMode, Mouse, Screen ; zet de muispositie op de funtcie scherm ipv op activewindow
MouseGetPos, xtemp, ytemp 
ToolTip, The cursor ifv aktieve window :is at X%xpos% Y%ypos% `n aktiefVenster=  %Title%   `n    scherm positie= op X%xtemp% Y%ytemp% 
Sleep, 3500	 








	
ExitApp




	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	;;noodstop
	ExitApp ; dit is onze laatste stap na de herhaalloop
	ExitSub:
	{
		MsgBox emergencystop ClipprojectImport-ahk
		ExitApp
		return
	}
	ESC::Goto ExitSub
}                      