;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
   Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
   scriptnaam :="msoftKiesitemuitDB"   
   FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
       Sleep 300,









{

SetKeyDelay, 200 ; hoe rap stuur je typcommandos
 CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
 
InputBox, LETREF, wat is je letref?,
if ErrorLevel
{
   ; MsgBox, CANCEL was pressed.
    exitapp
}
else
{
    ToolTip, artikel  "%LETREF%"	OR press esc to escape 
 Sleep 500
  }
  
  
 InputBox, AANTAL, wat is je aantal?,
if ErrorLevel
{
   ; MsgBox, CANCEL was pressed.
    exitapp
}
else
{
   ToolTip, artikel  "%AANTAL%"	OR press esc to escape 
 Sleep 500
  } 
  
  
  

   
    BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  Sleep 1500,
  
  
  
  

;Artikelen (Aangevraagde artikelen)
;win + , (vraagteken)
;druk op de 3puntjes en zoek een object om in je magazijnaanvraag bij te steken


   SetTitleMatchMode 2
 If WinExist("Artikelen (Aangevraagde artikelen)")
{
	;MsgBox, u venster is open	, en ik zal het vooraan zetten
	ToolTip, u programma Artikelen (Aangevraagde artikelen) is open `n  	 en ik zal het vooraan zetten   `n   voila! ,170 , 950
	WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
;ExitApp ; debug
	
}
else
{
	MsgBox, u venster  Artikelen (Aangevraagde artikelen)  zie ik niet !! open het eerst zelf
ExitApp
} 
    
Sleep 100,  



  
ToolTip, maNextAanvraag-ahk `n op de 3puntjes klikken script,170 , 950
MouseMove, 102,102 ; mouspos relatief in actief window
Sleep 200,
MouseClick, left
Sleep 100, ; wacht tot window is ingeladen op u scherm
;selecteer omschrijvingkolomveld
Send, {Tab}
Send, {Tab} ; sta in letref veld
Send, %LETREF%
Sleep 1000, 
Send, {ENTER}
Sleep 2500,; msoft moet denken en zoeken in db
;MsgBox, alles goed ? of esc?
Send, {ENTER}


;ExitApp ; debug

Sleep 2500,; msoft moet laden 


;AUTO - Artikelen  -  LET Automotive n.v.

   SetTitleMatchMode 2
 If WinExist("Artikelen (Aangevraagde artikelen)")
{
WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben

;MsgBox, aantazlkot?

Send, {Tab} ; aantal veld
Send, %AANTAL%
Send, {Tab}
Send, {Tab}
Send, {Tab}  ; tiknr moet er al staan vanaf de 2e keer , 1e keer moet je manueel doen

Send, {Tab}
Send, {Tab}
Send, {Tab}
ToolTip, binnen 3sec druk de pc op enter `
Sleep 3000, 
Send, {ENTER}



}
else
{
MsgBox, geen Artikelen (Aangevraagde artikelen) gezien!
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