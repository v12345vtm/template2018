{
  
ToolTip, objectdatamaploknrklembordahk = we wilenn de maplokatie vd file in klembord  `n   sta op het object waarvan je de maplokatie van wil hebben ,303,750
Sleep 500,

	InputBox, UserInputkb, sta je op de regel van je object data ?, cancel om te annuleren ,,druk op ok om verder te gaan ,letop muispos zal veranderen
if ErrorLevel
{
    MsgBox, CANCEL was pressed.
    exitapp
}
else
{
   ; MsgBox, You entered "%UserInputkb%"	 
  }





MouseClick, Right
Sleep 100,
Send {Down 2}
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