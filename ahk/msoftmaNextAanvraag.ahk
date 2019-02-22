{

;Artikelen (Aangevraagde artikelen)
;win + , (vraagteken)
;druk op de 3puntjes en zoek een object om in je magazijnaanvraag bij te steken


   SetTitleMatchMode 2
 If WinExist("Artikelen (Aangevraagde artikelen)")
{
	;MsgBox, u venster is open	, en ik zal het vooraan zetten
	ToolTip, u programma Artikelen (Aangevraagde artikelen) is open `n  	 en ik zal het vooraan zetten   `n   voila! ,303,750
	WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
;ExitApp ; debug
	
}
else
{
	MsgBox, u venster  Artikelen (Aangevraagde artikelen)  zie ik niet !! open het eerst zelf
ExitApp
} 
    
Sleep 1500,  



  
ToolTip, maNextAanvraag-ahk `n op de 3puntjes klikken script,303,750
MouseMove, 110,105
Sleep 200,
MouseClick, left
;selecteer omschrijvingkolomveld
Send, {Tab}
Send, {F3}
Send, {*}
Send, {LEFT}
Sleep 2200,


;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
MsgBox emergencystop maNextAanvraag-ahk
ExitApp
return
}
ESC::Goto ExitSub





}