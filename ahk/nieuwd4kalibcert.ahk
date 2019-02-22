
;windows +4
{


	InputBox, UserInputkb, calib.crt, KBnummer,,%Clipboard%
if ErrorLevel
{
    MsgBox, CANCEL was pressed.
    exitapp
}
else
{
   ; MsgBox, You entered "%UserInputkb%"	
 
  }

  
  
  	InputBox, UserInputtaal, calib.cert, Welke-certifikaatTAAL?,,e
if ErrorLevel
{
     MsgBox, CANCEL was pressed.
    exitapp
}
else
{
   ; MsgBox, You entered "%UserInputtaal%"	
  }
  
  
 ;   	InputBox, UserInputartikel, %UserInputkb%.nieuwd5.ahk, Welke-artikel-pla35-pla5sr,,PLA 5 NR
;if ErrorLevel
;{
 ;   MsgBox, CANCEL was pressed.
 ;   exitapp
;}
;else
;{
 ; ;  MsgBox, You entered "%UserInputartikel%"	
 ; }


Sleep 300,
MouseClick, Right
Sleep 300,
Send {DOWN 1}
Sleep 300,
Send {Enter}
Sleep 3500,

;document
Send d
Sleep 300,

Send {TAB}
Sleep 300,

;D4 certificaat
Send d4
Sleep 300,


Send {TAB}
Sleep 800,


;taal is Duits , zend D vor duits
Send %UserInputtaal%
Sleep 300,
Send {TAB}
Sleep 300,


;we moeten met cursor in omschrijving dubbelklikken
;MouseMove, 420,400
MouseClick, left, 420, 400 ,1
Sleep 300,


Send Calibration Certificate{SPACE} 
Sleep 100,
Send {SPACE} 
Sleep 100,
Send (sn{SPACE}  
Sleep 100,
Send %UserInputkb%
Sleep 100,
Send .
Sleep 100,
Send ){SPACE}   ; serienr
Sleep 100,
send ^{;} 
Sleep 100,
 

ToolTip, niks doen nu wacht beetje op pdf,515,800
   MouseClick, left, 595, 560 ,1
  Sleep 5500,
 
 ToolTip, typt nu de extentie,515,800
 Send pdf ; pdf is ons bestand 
Sleep 500,
Send {ENTER}
Sleep 3500

 ToolTip, check nog het serienummer in de titel,515,800
  Sleep 3500,
 
  ;MouseClick, left, 515, 560 ,1  ; knop selecteer
  ;Sleep 400,
 
;PLA 5 NR (sn KB170334.001) 4-4-2018


;Calibration Certificate PLA 5 NR (sn KB170334.001) 4-4-2018

    exitapp
Return
}


ExitSub:
{
MsgBox emergencystop
ExitApp
return
}


 

ESC::Goto ExitSub