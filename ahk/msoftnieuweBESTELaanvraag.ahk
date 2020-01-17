
;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
   Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
   scriptnaam :="msoftnieuweBESTELaanvraag"   
   FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
       Sleep 300,












 ToolTip, MSOFTnieuwemagazijnaanvraag-ahk = in Msoft Bestelaanvragen staan,170 , 950
 
    SetKeyDelay, 200 ; hoe rap stuur je typcommandos 
    BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  Sleep 1500,
   CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
   
 
 Sleep, 1500



   SetTitleMatchMode 2
 If WinExist("AUTO - Bestelaanvragen")
{
	;MsgBox, u venster is open	, en ik zal het vooraan zetten
	ToolTip, u programma AUTO - Magazijnaanvragen is open `n  	 en ik zal het vooraan zetten   `n   voila! ,170 , 950
	WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
	Sleep 500,  
;ExitApp ; debug
	
}
else
{
	MsgBox, u venster  AUTO - Bestelaanvragen  zie ik niet !! open het eerst zelf
ExitApp
} 
    
Sleep 1500,  




;ga in magazjn aanvraag staan en dan maken we nieuw order via ahk
 
 ToolTip, nieuwe BESTELaanvraag script,170 , 950
SetScrollLockState, off
Send, {Ins} 
Sleep 600,
Send,  AA{Tab} ; aankoop
Sleep 300,
Send,  {Tab}
Sleep 300,
Send,  {Tab}
Sleep 300,
Send,  P{Tab} ; produktie
Sleep 300,
Send,  THE{Tab} ; Theuninick
Sleep 300,
Send,  prod ; produktie leverplaats
Sleep 300,

;hier moeten we nog instelend dat we een berekeing gaan doen

Send, {Tab}
Sleep 300,
Send,  {Tab}
Sleep 300,
Send, {Enter}
Sleep 300,



;de windows 'Artikelen (Aangevraagde artikelen'  aktief zetten door erop ergens te klikken want de cordinaten kloppen hierachter nooit
MouseMove, 390,240
Sleep 500,
MouseClick, left
Sleep 500,

;nu gaan we opde 3puntjes klikken 110op105
;MsgBox, nu gaan we opde 3puntjes klikken 110op105 ,kutprogramma msoft ondersteund geen tabpositie 
MouseMove, 110,105
Sleep 600,
 




;tot zover gedebugged en ok , nu klikken we op effectief op de 3puntjes en doen we verder
MouseClick, left
;selecteer omschrijvingkolomveld
Sleep 600,
Send, {Tab}
Sleep 300,
Send, {Tab}




ToolTip, Voila bestel maar,170 , 950  ; 
Sleep 4000,
 












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
