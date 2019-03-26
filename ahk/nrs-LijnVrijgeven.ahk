 ToolTip, nrs lijn vrijgeven-ahk  nrs vrijgeven lijn objectdata staan,170 , 950
 SetTitleMatchMode, 1 ; match start of the title
 ;vrijgeven object-data is 3x up
 ;vrijgeven object is 4x up
      
  ; BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  Sleep 500,
   CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
  
WinGetTitle, Title, A ; steek de programmanaam is var %Title%

 

If (title = "LET")
{	
;WinActivate  ; enkel alwe in LET ( nrs staan) mogen we op knoppen drukken
ToolTip, ok we staan in NRS allijk,170 , 950
; MsgBox, wel nrs he: %Title%
 
Sleep 200,
 ToolTip, windows+Y =NRS -objectdata lijst staan en  vrijgeven rmk en 3xUP,170 , 950 4xup in object
MouseClick, Right
Sleep 100,
;;we klikken 3x up
Send, {Up 3}
Sleep 400,
Send, {Enter}
Sleep 600,


}
else
{
	  MsgBox, geen nrs! maar:%Title%
	 }





 












;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
MsgBox emergencystop nieuwemagazijnaanvraag-ahk
ExitApp
return
}
ESC::Goto ExitSub
