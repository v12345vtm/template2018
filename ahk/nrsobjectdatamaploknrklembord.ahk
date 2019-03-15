{
  CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
  
 WinGetTitle, Title, A ; steek de programmanaam is var %Title%
 If (title = "LET")
{	
;WinActivate  ; enkel alwe in LET ( nrs staan) mogen we op knoppen drukken 
    BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  Sleep 100,
 ToolTip, sta je mooi op je lijntje OBJECT DETAIL =   sta niet in object-data anders ist nieuwe revisie verdomme `n   esc om te anulleren ,170 , 950
Sleep 900,

MouseClick, Right
Sleep 100,
Send {Down 2} ; we gaan detail selecteren
Send {Enter}

;wacht tot venster open is en ga op de knop selecteer staan
ToolTip, object-data detail -- page geladen ? weklikken nu op selecteer,116,230
Sleep 3000,

MouseMove, 750,590
Sleep 200,
;druk nu op de knop selecteer , en de url komt in klembord
MouseClick, Left

;L:\Letdata\data\04\0164_00\D5\040164_00-D5N01A.docx n klembord

; ga op de knop sluiten staan
Sleep 100,
MouseMove, 1860,965
Sleep 100,

;druk op sluit tabblad
MouseClick, Left
Sleep 300,


}

else
	
	{
	  MsgBox, geen nrs! maar:%Title%
		
	}


;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
MsgBox emergencystop objectdata maplokatie naar klembord
ExitApp
return
}
ESC::Goto ExitSub





}