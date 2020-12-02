;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
   Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
   scriptnaam :="AccesWijzigenItem"   
   FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
       Sleep 300,





ToolTip, MSOFTpartlistTonen-ahk = in Msoft artikelen staan,170 , 950
 
;  SetKeyDelay, 500 ; hoe rap stuur je typcommandos
; BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
Sleep 100,
CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
 
 
 
;eerst je lijn met je commentaar wegschrijven   
InputBox, UserInput, WijzigenstuklijstenInvuller, ik verwacht dat je accesWijzigen openstaat  en je wil dus de stuklijst vooraf inladen. geef je msoftref in nu!, , %Clipboard%
if ErrorLevel
{
   MsgBox, CANCEL was pressed.
   exitapp
}else
 
   BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  
If WinExist("WijzigenStuklijsten")
{
   WinActivate
   Sleep 200,
   ToolTip, we zitten inde acces wijzigen stuklijsten  ; 
    
   Sleep 300,           
   MouseMove, 246, 93 ; onscreen pos ,
   Sleep 300,
   MouseClick, Left  ; invoegen artikel textbox
   Sleep 300,
     ToolTip, artikelveld sowieso leegmaken  ; 
    Send, {DEL 200} 
	 Sleep 300,
	   Send, {Backspace 100} 
	   Sleep 300
	
     ToolTip, artikelveld is leeg we gaan klembord plakken  ; 
  ; Send %Clipboard% ; de waarde die we in gaven daarnet in de inputpromptbox
   Send, ^{v}  ; control v ,plak de omschrijving in klembord want ahk kan geen + teken senden
   
 
Sleep, 300 ; wachten tot resultaten binnenkomen

  ToolTip, we wachten beetje  op de database  ; 
	Sleep 300
	Send , {Enter}
	Sleep 1000
	
	

	
;    WinGetText, text  ; The window found above will be used.
;  BlockInput, MouseMoveOff

;MsgBox, The text is:`n%text%
 
;Needle := "De tekst die u hebt ingevoerd, is geen item in de lijst"
;If InStr(text, Needle)
;{
;    MsgBox, The errormelding in acces found.
;		 ExitApp
;	}
   
	;als we erzererror hebben in acces krijgen we dit in : >>>>>>>>>>>( Visible Window Text )<<<<<<<<<<<
  ;  OK
;De tekst die u hebt ingevoerd, is geen item in de lijst.
;Selecteer een item in de lijst of voer tekst in die overeenkomt met een van de items in de lijst.

   
	
	
	
    ToolTip, we klikken op invoegen vooraf en wachten 6sec op database ; 
    
   Sleep 300,           
   MouseMove, 196, 239 ; onscreen pos ,
   Sleep 300,
   MouseClick, Left  ; button,drukken van : invoegen vooraf lijst
   Sleep 6000,
    
	

      ToolTip, we klikken nu op opmerkingen veld , zo kan je wat typen  ; 
    
   Sleep 300,           
   MouseMove, 840, 157 ; onscreen pos , 
   Sleep 300,
   MouseClick, Left  ; invoegen opmerking
   Sleep 300,
    
    
	
	BlockInput, MouseMoveOff
	 MsgBox, eventueel opmerking ingeven hier en ga nu naar msoft en pas stuklijst aan
	 
	 
	    ExitApp
    
    
   Sleep 300,           
   MouseMove, 662, 243 ; onscreen pos , 
   Sleep 300,
   ;MouseClick, Left  ; invoegen achteraf lijst
   Sleep 300,
    
    
    
    
    
   ;Send,  +{Tab 3} ; shift + TAB
   ;Sleep 400,
    
    
   ;Send , {Enter}
    
   ;Sleep 900,
    
   ;MouseMove, 640, 210
   ;Send , {Enter}
    
   ;Sleep 900,
   ;nu hebben we nu zicht op de partlijst tabel van msoft
   ;nu willen we de tabel in klermbord
    
    
    
    
    
    
   ;Detail Materiaalkosten , hier gaan we een 3e window binnen
   ;If WinExist("Detail Materiaalkosten")
   ;    {   WinActivate
    
   ;    
   ;    Sleep 300,          
   ;    MouseMove, 100, 100 ;in de tabel ergens staan ongeveer 1e rij
   ;        Sleep 300,
   ;    MouseClick, right ; menuopvragen
   ;        Sleep 300,
   ;    Send, {Down 6} ;6keer pijltje omlaag
   ;        Sleep 300,
   ;    Send, {Enter} ; druk op enter
   ;        Sleep 900,
   ;voila stuklijst in klembord!!
    
   ;    Sleep 900,
    
    
    
    
    
    
    
   ; file := FileOpen("C:/Users/vth/Desktop/template2018/logfiles/compare2.txt", "w")
   ; TestString := ".`r`n"  ; to start a new line. nieuwe regel 
   ; file.Write(UserInput)
   ;  file.Write(TestString)
   ;  file.Write(Msoftomschijving)
   ;   file.Write(TestString)
   ;  file.Write()
   ; OnClipboardChange:
   ;file.Write(clipboard)
   ; file.Close() 
    
   ; Sleep 1500,
    
   ;send alt+ f4 om u vensters teveel in msoft weg te doen , normaal zou je op escape drukken , maar in ahk is escpae gebruikt voor onze noodstop
   ;Send !{f4} ; Simulates the keypress alt+f4
    
    
   ;  Sleep 500,
    
    
   ;  Send !{f4} ; Simulates the keypress alt+f4
    
   ;Run wisKolommenVanCompare2.bat ; verwijder de rechtse kolommen uit de csv file
   ;Sleep 3500,    
    
    
    
    
    
    
   ; Sleep 500,
   ;  Run C:/Users/vth/Desktop/template2018/logfiles/compare1.txt
   ;  Sleep 500,
   ; Run C:/Users/vth/Desktop/template2018/logfiles/compare2.txt
    
    
    
    
    
   ;}}else  {
  
}
 else {
  BlockInput, MouseMoveOff
   MsgBox, je staat niet in acces:stuklijstaanpassen!
 
 }
 
 
 
;we gaan de omschrijving eerst inladen dor Alt+enter te doen en te kopieren wat de text is die te kopieren is
 
;Send, !{ENTER} 
;Sleep 1300,
 
; Send, ^{c}  ; control c ,kopier de omschrijving in klembord
;Sleep 1300,
 
; Msoftomschijving := clipboard
; Sleep 900,
 
;  Send !{f4} ; Simulates the keypress alt+f4 sluit window 
 
;;;;;;;;;;;;;
;Send, +{F9}  ;shift f9
;Sleep 400
 
 
;Send,   ^{PgUp}  ; control pageUP
;Sleep 400,
 
 
 
 
 
 
 
 
 
 
 
 
 
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