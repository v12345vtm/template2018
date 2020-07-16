{
;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
scriptnaam :="timestampcopyfiletest"   
FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
Sleep 300,




;T:\PRODUKTIE\SOFTWARE\Transfer\Electronische Waterpas
;T:\PRODUKTIE\SOFTWARE\Transfer\Electronische Waterpas\geprintDoorVith
;nrs openen en inport nr 30

; script kijkt of clipproject draait en zet het in de voorgrond
;daarna importeer hij de labels , en gebruikt de file vanaf de netwerkdrive 
;de file is een csv bestand die de tool maakt van de student
; de file moet je achteraf wissen , zodat er een nieuwe log aangemaakt kan worden met nieuwe data
; dit script zet de logfile (csv) in de map 'verwerkt' en voegt er een timestamp aan toe

		timestamp = %A_YYYY%-%A_MM%-%A_dd%m%A_Min%
	MsgBox, %timestamp%

	fileserver := "C:aa\"  ; vb : T:\PRODUKTIE\SOFTWARE\Transfer\Electronische Waterpas\
	
	studentbestand := fileserver . "CalibratieElektronischeWaterpas.csv" ; log die van de student komt	
	geprintdoorVith :=  fileserver . "geprintDoorVith\CalibratieElektronischeWaterpas.csv" . timestamp . ".txt"
	VoordatabasePSP :=  fileserver . "uploaden\CalibratieElektronischeWaterpas.csv" . timestamp . ".txt"
	
		MsgBox, %studentbestand%
			MsgBox, %geprintdoorVith%
				MsgBox, %VoordatabasePSP%

	
	if !FileExist(studentbestand)
	{
    MsgBox, The student file does not exist.
	;ExitApp
	
	}
	
	else
	{
	 MsgBox, The student file is gevonden en zal nu verplaatst worden en een copy voor pspDB.
		;  FileMove, %studentbestand%, %geprintdoorVith%.txt ' verplaatsen incl renamen.
	 
	;FileCopy, %geprintdoorVith% , D:\Main Backup\  ; Make a copy but keep the orig. file name.
	
	}
	
	

	
	
	
	;;noodstop
	ExitApp ; dit is onze laatste stap na de herhaalloop
	ExitSub:
	{
		BlockInput, MouseMoveOff
		 
			MsgBox, 48, you pressed escape- , you pressed esc- `n`n "EXIT-"%scriptnaam% This message will self-destruct in 1 seconds., 1
		ExitApp
		return
	}
	ESC::Goto ExitSub
}              