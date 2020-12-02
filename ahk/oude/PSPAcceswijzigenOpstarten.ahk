;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
scriptnaam :="PSPAcceswijzigenOpstarten"   
FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
Sleep 300,

ToolTip, "starting-"%scriptnaam%,170 , 950
;ToolTip, wijzigen stuklijsten acces tool opstarten,303,750
	Run L:\planning\produktie\wijzigen stuklijsten\wijzigen.accdb
	Sleep 1400,
	Send, {Tab 3}
	Sleep 800,
	Send, {Enter}
	ToolTip  ; wissen oude tooltips
	;Return


;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
	BlockInput, MouseMoveOff
	MsgBox "EXIT-"%scriptnaam%
	ExitApp
	return
}

ESC::Goto ExitSub              