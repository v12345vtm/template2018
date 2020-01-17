;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
   Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
   scriptnaam :="ClipElecWaPasPrintenEnLogRename"   
   FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
       Sleep 300,



ToolTip, MsoftCompare export een tabel of stuklijst naar bestand1TXT file,170 , 950
SetKeyDelay, 200 ; hoe rap stuur je typcommandos 
CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
  

 ;T:\PRODUKTIE\SOFTWARE\Transfer\Electronische Waterpas
 ;T:\PRODUKTIE\SOFTWARE\Transfer\Electronische Waterpas\geprintDoorVith
 ;nrs openen en inport nr 30
 
 ; script kijkt of clipproject draait en zet het in de voorgrond
 ;daarna importeer hij de labels , en gebruikt de file vanaf de netwerkdrive 
 ;de file is een csv bestand die de tool maakt van de student
 ; de file moet je achteraf wissen , zodat er een nieuwe log aangemaakt kan worden met nieuwe data
 ; dit script zet de logfile (csv) in de map 'verwerkt' en voegt er een timestamp aan toe
 
 
 
 
  InputBox UserInput,waterpasLabels,Bent u zeker dat je waterpaslabels wil maken,,druk ok om verder te gaan  ; in EXE-veriant klopt deze inputbox wel
if ErrorLevel
{
   ; MsgBox, CANCEL was pressed.
   exitapp
}else  {
  
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
	
}
else
{
	MsgBox, clipproject zie ik niet `n  open het eerst zelf door op de knop Pauze te drukken .
ExitApp
} 
    
Sleep 1500,  
  
  
ToolTip, ClipprojectImport-ahk  `n  sta je in clipproject ?  `n   script die om import duwt ,170 , 950
Sleep 500,


Send {ALT}
Sleep 200,
Send t
Sleep 500,
Send {DOWN 30} ; offset elec waterpas
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
 ;naar  T:\PRODUKTIE\SOFTWARE\Transfer\Electronische Waterpas\geprintDoorVith\CalibratieElektronischeWaterpas.csv
 ;nrs openen en inport nr 30
 

Logbestand := "T:\PRODUKTIE\SOFTWARE\Transfer\Electronische Waterpas\CalibratieElektronischeWaterpas.csv"
Verwerkt := "T:\PRODUKTIE\SOFTWARE\Transfer\Electronische Waterpas\geprintDoorVith\CalibratieElektronischeWaterpas.csv"


 FileMove, %Logbestand%, %Verwerkt%%A_YYYY%-%A_MM%-%A_dd%m%A_Min%.txt
Sleep 800,

 ;ExitApp ;debug
 
BlockInput, MouseMoveOff
MsgBox, logfile succesvol verplaatst .
ToolTip, logfile verplaatst ,170 , 950
BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen 
 
 
Sleep 500,


   SetTitleMatchMode 2
 If WinExist("CLIP PROJECT")
{
	;MsgBox, u venster is open	, en ik zal het vooraan zetten
	ToolTip, u programma CLIP PROJECT  is open `n  	 en ik zal het vooraan zetten   `n   voila! ,170 , 950
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



	
}
else
{
	MsgBox, clipproject zie ik  weer niet `n  LET WEL OP U LABELBESTAND IS NU WEL VERZET incl timestamp .
ExitApp
} 

































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





}