;rgo170020h nieuw artikel toevoegen mousemove moet je loggen in windowSpy ,x -0 en de y waarde -25 doen 110,130 word 105,105

ToolTip, UJOB VANDAAG (herstellingen op RGO = PROTEC en eindcontrole = PROTES),303,750

    
    BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  Sleep 1500,
  

; cert KB180273PROD – Activiteit : Algemeen.
;Klaarzetbonnen worden geboekt op een verzamel-tiknummer, afhankelijk van het soort klant-Certificaten maken voor kzb20180750 bijvoorbeeld: STA_DB18 – activiteit = algemeen.

 






InputBox, UserInput, ujob-inputvandaag, Please enter a job number.OPL19 ADM19 ALG19 (herstellingen op RGO = PROTEC en eindcontrole = PROTES)  en  cert KB180273PROD  met Activiteit : Algemeen -- Certificaten maken voor kzb20180750 bijvoorbeeld: STA_DB19 :activiteit = algemeen,
if ErrorLevel
{
    MsgBox, CANCEL was pressed.
    exitapp
}
else
 ;   MsgBox, You entered "%UserInput%"	
;MsgBox % "nu een loop van  " . StrLen(UserInput) 
   
   
;letter voor letter ons projectnummer ingeven
Loop, Parse, %UserInput%
 {
 ; MsgBox, %A_LoopField%
 ;  Sleep 300 
 }
	
	
	InputBox, UserInputtijd, ujob-inputvandaag, Please tijd, ,
if ErrorLevel
{
    MsgBox, CANCEL was pressed.
    exitapp
}
else
    ;MsgBox, You entered "%UserInputtijd%"




	Run, "C:\Users\vth\Desktop\ujoblet.jar - Snelkoppeling.lnk"
	
	
	
	

	
	
	
	
	WinWaitActive, UJob,  ; het loginvenstertje noemt UJob
	
	

	
	
	
	
	
	Send 1302.50
		Sleep, 300
Send {TAB}
	Sleep, 300
Send vith123
	Sleep, 200
	Send {Enter}
	
	
	
	WinWaitActive, UJob 1.2.0,
	
	
		   SetTitleMatchMode 2
 If WinExist("UJob 1.2.0")
{
	;MsgBox, u venster is open	, en ik zal het vooraan zetten
	ToolTip, u programma "UJob 1.2.0" is open `n  	 en ik zal het vooraan zetten   `n   voila! ,303,750
	 WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
; ExitApp ; debug
	
}
else
{
	MsgBox, u venster  zie ik niet	open het eerst zelf
ExitApp
} 
	
	
	
	;we zijn ingelogd in ujob versie 1.2.0 8/1/2018
	;Sleep, 4000


;de dag op gisteren zetten
Sleep, 300
MouseMove, 189,27
Sleep, 300
;MouseClick, Left
Sleep, 300



	
	
;tiknr ingeven 
MouseMove, 643,93
Sleep, 500
MouseClick, Left
Sleep, 500

;auto invul filter tiknr
;Send,%UserInput%
;letter voor letter ons projectnummer ingeven
Loop, Parse, %UserInput%
 {
  Send, %A_LoopField%
   Sleep 500 
 }
Sleep, 3000 ; wachten tot resultaten binnenkomen


;op u resultaat vd zoekfilter staan
MouseMove, 584,225
Sleep, 300
MouseClick, Left
Sleep, 300


;op totaal gaan klikken
MouseMove, 649,400
Sleep, 300
MouseClick, Left
Sleep, 300



WinWaitActive, UJob,  ; invulform

		   SetTitleMatchMode 2
 If WinExist("UJob")
{
	;MsgBox, u venster invulform is open	, en ik zal het vooraan zetten
	ToolTip, u programma "UJob" invulform is open `n  	 en ik zal het vooraan zetten   `n   voila! ,303,750
	; WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
; ExitApp ; debug
	
}
else
{
	MsgBox, u invulvenster  zie ik niet	open het eerst zelf
ExitApp
} 


	;op tijd invulform staan
		ToolTip, we willen 3tabs nu geven ,303,750
	;Sleep, 4000
Send {TAB}
Sleep, 300
		ToolTip, 1tab ,303,750
	Sleep, 3000
Send {TAB}
	ToolTip, 2tab ,303,750
	Sleep, 300
	
	Send {TAB}
	ToolTip, 3etab = uren-ingeefveld ,303,750
	Sleep, 300




;tijd invullen
Send,%UserInputtijd%
Sleep, 300
	;op activiteit ( algemeen) staan
Send {TAB 2}
Sleep, 100




;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
MsgBox emergencystop
ExitApp
return
}
ESC::Goto ExitSub















