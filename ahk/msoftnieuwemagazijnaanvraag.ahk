 ToolTip, MSOFTnieuwemagazijnaanvraag-ahk = in Msoft magazijnaanvragen staan,303,750
 
    MsgBox, Bij kwijt/kapot/slecht	`n     aantal kwijt -2 en zetten : reeds ok zetten  `n  en dan je nieuwe artikels aanvragen op proj of prodfische.

	
    BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  Sleep 600,
  
  
 
 
 Sleep, 1500



   SetTitleMatchMode 2
 If WinExist("AUTO - Magazijnaanvragen")
{
	;MsgBox, u venster is open	, en ik zal het vooraan zetten
	ToolTip, u programma AUTO - Magazijnaanvragen is open `n  	 en ik zal het vooraan zetten   `n   voila! ,303,750
	WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
	Sleep 500,  
;ExitApp ; debug
	
}
else
{
	MsgBox, u venster  AUTO - Magazijnaanvragen  zie ik niet !! open het eerst zelf
ExitApp
} 
    
Sleep 1500,  




;ga in magazjn aanvraag staan en dan maken we nieuw order via ahk
 
 ToolTip, nieuwe magazijnaanvraag script,303,750
SetScrollLockState, off
Send, {Ins} 
Sleep 600,
Send,  {Tab}
Sleep 300,
Send,  {Tab}
Sleep 300,
Send,  {Tab}
Sleep 300,
Send,  {Tab}
Sleep 300,
Send,  {Tab}
Sleep 300,
Send,  {Tab}
Sleep 300,
Send, {Right}
Sleep 300,
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




ToolTip, Voila bestel maar,303,750  ; 
Sleep 4000,
 












;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
MsgBox emergencystop nieuwemagazijnaanvraag-ahk
ExitApp
return
}
ESC::Goto ExitSub
