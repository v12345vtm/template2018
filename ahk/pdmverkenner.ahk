{
	BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
	Sleep 100,
	CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
	

	ToolTip, pdm via verkenner openen  `n  hopelijk is het met autologin die werkt  `n    ,170 , 950
	Sleep 10,	
	
	
	
	
	try  ; Attempts to execute code.
{
	
	SetTitleMatchMode 2
Run C:\LET_VAULT\AUTOMOTIVE\ ;pdm met gele mapjes oproepen zonder inhoud wegens geen login
	 	Sleep 500,
		WinMaximize, A
		 
 
	 WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
	 Sleep 700,
		MouseClick, left,  1845,  75  ; klik op zoekfunctie
	Sleep, 500	 
	
	
		MouseClick, left,  830,  175 ; klik n je zoekveld
	Sleep, 100	
 
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