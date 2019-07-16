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
	 	Sleep 1000,
	 WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
	 
	 
ToolTip, pdm via verkenner opgestart (pdmverkenner.ahk)  ,170 , 950
	Sleep 1000,

Sleep 500,
;	Send !{UP} ; dir omhoog  =  c:letvault
 
 
 
 ToolTip, pdm via verkenner 1up   ,170 , 950
	Sleep 1000,
	
	
 ;Run C:\aa ;pdm met gele mapjes oproepen zonder inhoud wegens geen login
	
	Sleep 500,
;	Send !{UP} ; dir omhoog in windowsexplorer  =  c:/ maar letvault is geseecteerd
	
	
	 ToolTip, pdm via vaultselected in verkennder   ,170 , 950
	Sleep 1000,
	
	;hier onder kan er wss login stappen komen
	; log in ?
	
	
	Sleep 500,
;	Send {ENTER}
	 ToolTip, groen mappen normaal gezien in pdm  ,170 , 950
	Sleep 1000,
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