 ToolTip, MSOFTpartlistTonen-ahk = in Msoft artikelen staan,170 , 950
 
   ;  SetKeyDelay, 500 ; hoe rap stuur je typcommandos
  ; BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  Sleep 100,
   CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
  
  
  
  	   ;eerst je lijn met je commentaar wegschrijven   
       InputBox, UserInput, msoftSTUKLIJSTTabel2bestand2, ik verwacht dat je in artikel  staat  en je wil dus de stuklijst exporteren naar exportlijst., , 640, 480
	   	if ErrorLevel
{
    MsgBox, CANCEL was pressed.
   exitapp
}else
  
 BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
 
 ;we gaan lotartiken wegdoen en geblokeerde artikelen tonen
 
 ;ALT+G is bug in msoft
 
 
 
 
 ;we gaan de omschrijving eerst inladen dor Alt+enter te doen en te kopieren wat de text is die te kopieren is
 
 Send, !{ENTER} 
 Sleep 1300,
 
  Send, ^{c}  ; control c ,kopier de omschrijving in klembord
 Sleep 1300,
 
 Msoftomschijving := clipboard
 Sleep 900,
 
    Send !{f4} ; Simulates the keypress alt+f4 sluit window 
 
 ;;;;;;;;;;;;;
Send, +{F9}  ;shift f9
Sleep 400


Send,   ^{PgUp}  ; control pageUP
Sleep 400,






If WinExist("AUTO - Artikelen  -  LET Automotive n.v. (AUTO - Artikelen  -  LET Automotive n.v.)")
{	WinActivate
Sleep 200,


Send,  +{Tab 3} ; shift + TAB
Sleep 400,


Send , {Enter}

Sleep 900,

;MouseMove, 640, 210
;Send , {Enter}

Sleep 900,
;nu hebben we nu zicht op de partlijst tabel van msoft
;nu willen we de tabel in klermbord






;Detail Materiaalkosten , hier gaan we een 3e window binnen
	If WinExist("Detail Materiaalkosten")
		{	WinActivate
			Sleep 300,			
			MouseMove, 100, 100 ;in de tabel ergens staan ongeveer 1e rij
				Sleep 300,
			MouseClick, right ; menuopvragen
				Sleep 300,
			Send, {Down 6} ;6keer pijltje omlaag
				Sleep 300,
			Send, {Enter} ; druk op enter
				Sleep 900,
	;voila stuklijst in klembord!!
	ToolTip, stuklijst zit ook in klembord ; 
	Sleep 600,
	
	
	
	
  


   file := FileOpen("C:/Users/vth/Desktop/template2018/logfiles/compare1.txt", "w")
   TestString := ".`r`n"  ; to start a new line. nieuwe regel 
   file.Write(UserInput)
     file.Write(TestString)
      file.Write(Msoftomschijving)
   file.Write(TestString)
   file.Write()
   OnClipboardChange:
   file.Write(clipboard)
   file.Close() 
   
    Sleep 1500,
	
   ;send alt+ f4 om u vensters teveel in msoft weg te doen , normaal zou je op escape drukken , maar in ahk is escpae gebruikt voor onze noodstop
Send !{f4} ; Simulates the keypress alt+f4
   
    
   Sleep 500,
   
   
   Send !{f4} ; Simulates the keypress alt+f4
   
    
   Sleep 500,
   ;Run C:/Users/vth/Desktop/template2018/logfiles/compare1.txt
   
Run	wisKolommenVanCompare1.bat ; verwijder de rechtse kolommen uit de csv file
Sleep 3500,	
	
	
			}

}
else
{
BlockInput, MouseMoveOff
	 MsgBox, je staat niet in artikelen!
	 }





 












;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
BlockInput, MouseMoveOff
MsgBox emergencystop nieuwemagazijnaanvraag-ahk
ExitApp
return
}

ESC::Goto ExitSub
