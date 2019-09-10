{
	BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
	Sleep 100,
	ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
	CoordMode, Relative

	ToolTip, pdm via verkenner openen  `n  hopelijk is het met autologin die werkt  `n    ,170 , 950
	Sleep 100,	
	
	
	
	
	try  ; Attempts to execute code.
{
	
	SetTitleMatchMode 2
Run C:\LET_VAULT\AUTOMOTIVE\ ;pdm met gele mapjes oproepen zonder inhoud wegens geen login
	Sleep 3500,
	WinWait, C:\LET_VAULT\AUTOMOTIVE 
	
	
	ToolTip, pdm via verkenner openent  `n  hopelijk is het met autologin die werkt  `n    ,170 , 950
	 	
		
		 WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
		 	ToolTip, pdm via verkenner aktiefzetten   
		 	Sleep 1500,
		 
		;WinMaximize, A 
		WinMaximize
		ToolTip, pdm via verkenner maximaliseren 
	 Sleep 1700,
	 

	
		;MouseClick, left,  1845,  75  ; klik op zoekfunctie run als ahk
		MouseClick, left,  1853,  110  ; klik op zoekfunctie run als exe
		
		
			ToolTip, klik op zoekfunctie   ,170 , 950
			
	Sleep, 1100
	
	
	
	
	
		 ;MouseClick, left,  830,  175 ; klik n je zoekveld run als ahk
			MouseClick, left,  836,  197	; klik n je zoekveld run als exe
		
			ToolTip, klik op zoekveld   ,170 , 950
	Sleep, 1100	
	
	
MouseGetPos, xpos, ypos  ; default lezen we de mousepos op active window
WinGetTitle, Title, A



MouseGetPos, xtemp, ytemp 
ToolTip, The cursor ifv aktieve window :is at X%xpos% Y%ypos% `n aktiefVenster=  %Title%   `n    scherm positie= op X%xtemp% Y%ytemp% 
Sleep, 500	
	
	
 
;	Send !{UP} ; dir omhoog  =  c:letvault



ExitApp


}
catch e  ; Handles the first error/exception raised by the block above.
{
    BlockInput, Off
	Sleep, 100
	MsgBox, An exception was thrown!`n Specifically: %e% 'n press SPatie
    ;Exit
	ExitApp
}  
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
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