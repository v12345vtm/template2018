#include C:\Users\VTH\Desktop\template2018\ahk\_include_variabelen.ahk  ; dit bestand staat op je lokale pc , maar de simultane copy runt vanaf fileserver , dus altijd direct adressering gebruiken

Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
scriptnaam :="ClipElecWaPasPrintenEnLogRename"   
FileAppend, %Timestamp% - %scriptnaam%`n, %AhkLogbestand% ;save naar txt file concat
Sleep 300,

BlockInput, MouseMove ; muis vastzetten als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
ToolTip, MsoftCompare export een tabel of stuklijst naar bestand1TXT file,170 , 950
SetKeyDelay, 200 ; hoe rap stuur je typcommandos 
CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:

; script kijkt of clipproject draait en zet het in de voorgrond
;daarna importeer hij de labels , en gebruikt de file vanaf de netwerkdrive die de student genereerde
; die file is een csv bestand die de tool maakt van de student
;
; de file moet je achteraf wissen , zodat er een nieuwe log aangemaakt kan worden met nieuwe data
; dit script zet de logfile (csv) in de map 'verwerkt' en voegt er een timestamp aan toe , zodat er een backup is van alle metingen
;
;in 2020 worden ook qr codes geprint op het serienr. 
; dit geeft als resultaat dat de log nu ook naar de database gaat
; daarom word er een copy van het zopas verwerkte bestand gemaakt en in de map 'uploaden' gezet

; flowshart 
; inputbox die vraagt of je zeker bent van de importatie
; als clipproject open is , zal deze template 30 inladen met de meetwaarden
; 
; van T:\PRODUKTIE\SOFTWARE\Transfer\Electronische Waterpas\CalibratieElektronischeWaterpas.csv
;naar  T:\PRODUKTIE\SOFTWARE\Transfer\Electronische Waterpas\geprintDoorVith\CalibratieElektronischeWaterpas.csvtijdstipvanverwerking.txt
;en een copy voor de database  T:\PRODUKTIE\SOFTWARE\Transfer\Electronische Waterpas\uploaden\CalibratieElektronischeWaterpas.csvtijdstipvanverwerking.txt

BlockInput, MouseMoveOff ; muis los laten voor gebruiker
InputBox UserInput,waterpasLabels,Bent u zeker dat je waterpaslabels wil maken,,druk ok om verder te gaan * tisomdat er files verzet zullen worden  ; in EXE-veriant klopt deze inputbox wel
if ErrorLevel
{
	MsgBox, CANCEL was pressed ,maar mss wou je een oud nrtje opzoeken om te herprinten
	Run %fileserver_waterpas_folder%
	exitapp
}else  {
	BlockInput, MouseMove ; muis vastzetten
} ; end else inputbox


{
	BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
	Sleep 1500,
	CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
		
	SetTitleMatchMode 2
	If WinExist("CLIP PROJECT")
	{
		;MsgBox, u venster is open	, en ik zal het vooraan zetten
		ToolTip, u programma CLIP PROJECT  is open `n  	 en ik zal het vooraan zetten   `n   voila! ,170 , 950
		WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
		; ExitApp ; debug
	}else  {
		BlockInput, MouseMoveOff ; muis los laten voor gebruiker
		MsgBox, ik verlaat het script want clipproject zie ik niet `n  open het eerst zelf door op de knop Pauze te drukken .
		
		ExitApp
	} 
	
	Sleep 1500,  
		
	ToolTip, ClipprojectImport-ahk  `n  sta je in clipproject ?  `n   script die om import duwt ,170 , 950
	Sleep 500,
		
	Send {ALT}
	Sleep 200,
	Send t
	Sleep 500,
	Send {DOWN 40} ; offset elec waterpas qr
	Sleep 500,
	Send {ENTER}
	Sleep 200,
	
	;ToolTip, lutze labels ofzo `n   scherm laad voor import ,170 , 950
	Sleep 2000,
	Send {TAB 13} ; als we 13keer op tab duwen , is onze knop "import" aktief
	Sleep 500,
		
	Send {ENTER}
	Sleep 4200,
	
	ToolTip, Voila `n   labels geimporteerd en we kunnen nu de logfile verplaatsen ,170 , 950
		
	; van T:\PRODUKTIE\SOFTWARE\Transfer\Electronische Waterpas\CalibratieElektronischeWaterpas.csv
	;naar  T:\PRODUKTIE\SOFTWARE\Transfer\Electronische Waterpas\geprintDoorVith\CalibratieElektronischeWaterpas.csvtijdstipvanverwerking.txt
	;en een copy voor de database  T:\PRODUKTIE\SOFTWARE\Transfer\Electronische Waterpas\uploaden\CalibratieElektronischeWaterpas.csvtijdstipvanverwerking.txt
	
	timestamp_a = %A_YYYY%-%A_MM%-%A_DD%-%A_Hour%h%A_Min%m%A_Sec%s  ; ^d::Send, %A_DD%-%A_MM%-%A_YYYY% %A_Hour%:%A_Min% ; press CTRL+d
	;MsgBox, %timestamp%
		
	fileserver := "T:\PRODUKTIE\SOFTWARE\Transfer\Electronische Waterpas\"  ; via include weten we de map vb : T:\PRODUKTIE\SOFTWARE\Transfer\Electronische Waterpas\
	
	studentbestand := fileserver . "CalibratieElektronischeWaterpas.csv" ; log die van de student komt	
	geprintdoorVith :=  fileserver . "geprintDoorVith\CalibratieElektronischeWaterpas.csv" . timestamp_a . ".txt"
	VoordatabasePSP :=  fileserver . "uploaden\CalibratieElektronischeWaterpas.csv" . timestamp_a . ".txt"
	
	;	MsgBox, %studentbestand%
	;MsgBox, %geprintdoorVith%
	;	MsgBox, %VoordatabasePSP%	
	
	if !FileExist(studentbestand)
	{
		BlockInput, MouseMoveOff ; muis los laten voor gebruiker
		MsgBox, The student file does not exist.
		
		ExitApp
	}else  {
		BlockInput, MouseMoveOff ; muis los laten voor gebruiker
		MsgBox, The student file is gevonden en zal nu verplaatst worden en een copy voor pspDB.
		BlockInput, MouseMove ;muis blokkeren van gebruiker
		FileMove, %studentbestand%, %geprintdoorVith% ; ' verplaatsen incl renamen.	 
		FileCopy, %geprintdoorVith% , %VoordatabasePSP%  ; Make a copy but keep the orig. file name.
	}
	
	Sleep 800,
	
	;ExitApp ;debug
	
	BlockInput, MouseMoveOff ; muis los laten voor gebruiker
	MsgBox, logfile succesvol verplaatst .
	ToolTip, logfile verplaatst ,170 , 950
	BlockInput, MouseMove ;muis blokkeren van gebruiker
		
	Sleep 500,
	
	
	SetTitleMatchMode 2
	If WinExist("CLIP PROJECT")
	{
		;MsgBox, u venster is open	, en ik zal het vooraan zetten
		ToolTip, u programma CLIP PROJECT  is open `n  	 en ik zal het vooraan zetten   `n   en je bestanden zijn intussen verzet maar u labels zijn geipmprteerd! ,170 , 950
		WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
		
		
		
		;om direct te kunnen printen , proberen we een label eens aan te klikken en slepen we de muis ingedrukt weg
		MouseClick, left,  850,  150
		Sleep, 100	
		Click down
		Sleep 500
		MouseMove,   1370,  200
		Click up
		
		;	
		ToolTip we gaan de printer klaarzetten ook :   control+p  ; wissen oude tooltips
		Send, ^p ; control+p
		Sleep 500,
		
		ToolTip Zit de juiste rol in de printer ?,255,430 ; wissen oude tooltips
		Sleep 4000,
	}else  {
		BlockInput, MouseMoveOff ; muis los laten voor gebruiker
		MsgBox, clipproject zie ik  weer niet `n  LET WEL OP U LABELBESTAND IS NU WEL VERZET incl timestamp .
		ExitApp
	} 
	
	
	
	;;noodstop
	ExitApp ; dit is onze laatste stap na de herhaalloop
	ExitSub:
	{
		
		BlockInput, MouseMoveOff ; muis los laten voor gebruiker
		
		
		
	
	
		
		MsgBox, 48, you pressed escape- , %scriptnaam%, 1
	 
	
	
		ExitApp
		
		
		return
	}
	ESC::Goto ExitSub
}              