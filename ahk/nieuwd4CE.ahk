
;windows J

ToolTip, windows plus num3 - D4 CE cert- sta in OBJECT DATA,515,800
;Sleep 500,
{


	InputBox, UserInputkb, CE-cert, KBnummer,,%Clipboard%
if ErrorLevel
{
    MsgBox, CANCEL was pressed.
    exitapp
}
else
{
   ; MsgBox, You entered "%UserInputkb%"	
 
  }

  
  
  	InputBox, UserInputtaal, CE-cert, Welke-certifikaatTAAL?,,e
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
;    exitapp
;}
;else
;{
  ;  MsgBox, You entered "%UserInputartikel%"	
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

ToolTip, CE cert we gaan straks  de getekende pdf naar verkenner plakken,515,800
Sleep 500,
Send CE Certificate{SPACE 20} 
;CE Certificate                    
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
 

 ;ToolTip, pc klikt links op 515 560 op de knop
 ;MouseClick, left, 515, 560 ,1
 ;Sleep 400,
 
 
 
 
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
 
 

 
;PLA 5 NR (sn KB170334.001) 4-4-2018


;Calibration Certificate PLA 5 NR (sn KB170334.001) 4-4-2018

ExitApp
Return
}


ExitSub:
{
MsgBox emergencystop
ExitApp
return
}


 

ESC::Goto ExitSub