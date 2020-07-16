;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
scriptnaam :="msofttabelexportandConcattofileMsoft"   
FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
Sleep 300,

ToolTip, export de huidige  tabel als je wil naar 1 file,170 , 950

If WinExist("AUTO - Artikelen  -  LET Automotive n.v.")
{
	ToolTip, als artikelen open is zet ik het vooraan!!  `n   voila! ,170 , 950
	
	WinActivate  ; venster aktief  ;AUTO - LET Automotive n.v; zetten die we net gezocht en gevonden hebben
	
	Sleep 200
	
	SetKeyDelay, 200 ; hoe rap stuur je typcommandos 
	BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
	
	CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
	
	InputBox, UserInput, msoftTabelExportAndConcatFile in artikelen lotnrs zoeken F3 en artikelgroep *L, de huidige  tabel wat je nu ziet komt in bestand msoftdb -hoelang denk je dat msoft moet nadenken om te exprterten in sec, , 20
	 
 
		; MsgBox, You entered "%UserInput%" 
		;FileAppend, `n%UserInput%*`n, c:/aa/klembord1.txt ;save naar txt file
		;if Detail Materiaalkosten 2x up
		
	MouseClick, Right
	Sleep 100,
	
	Send, {Up}
	Sleep 100,
	
	Send, {Up}
	Sleep 100,
		
	Send, {Enter}
	;Sleep 60000,
		
	Loop, UserInput
	{
		ToolTip, we wachten op msoft die export doet    %A_Index% / %UserInput% . seconden ,170 , 950  ; A_Index will be 1, 2, then 3
		Sleep, 1000
	}
			
	;als msoft moet nadenken komt er een window bij
	;>>>>>>>>>>( Window Title & Class )<<<<<<<<<<<
	;Press Cancel to abort browser copy          
	;ahk_class ProMainWin
	
	;FileAppend,hallo`n,c:/aa/klembord1.txt ;save naar txt file
	
	OnClipboardChange:
	FileAppend, %clipboard%, C:\Users\vth\Desktop\template2018\logfiles\msoftdb.txt ;save naar txt file
	
	
	Sleep 100,
	
	;Run C:\Users\vth\Desktop\template2018\logfiles\msoftdb.txt
	
	
	
	 
}else  {
	Loop, 3
	{
		ToolTip, je staat niet in artikelen - ik kan niks doen voor u exiting script in     %A_Index%  /3 seconden ,170 , 950  ; A_Index will be 1, 2, then 3
		Sleep, 600
	}
	ExitApp
}



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