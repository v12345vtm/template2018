 ToolTip, msoftpartlistsExporteren-ahk = in Msoft artikelen staan,170 , 950
 
   ;  SetKeyDelay, 500 ; hoe rap stuur je typcommandos

  Sleep 100,
   CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
  

  	   ;eerst je lijn met je commentaar wegschrijven   
       InputBox, UserInput, msoftpartlistsExporteren, we gaan partlist van u geselecteerde lijn in artikelen  in een bestandje exporteren naar temp-mapje en hoe wilje dat het noemt., ,  
	   	if ErrorLevel
{
    MsgBox, CANCEL was pressed.
   exitapp
}else

   BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

ToolTip, msoftpartlistsExporteren-ahk ik zet je partlist in temp hoor 
Send, +{F9}  ^{PgUp} +{Tab 3}
Sleep 1300,

If WinExist("AUTO - Artikelen  -  LET Automotive n.v. (AUTO - Artikelen  -  LET Automotive n.v.)")
{	WinActivate
Sleep 200,
;MouseMove, 640, 210
Send , {Enter}

;nu hebben we nu zicht op de partlijst tabel van msoft
;nu willen we de tabel in klermbord

;Detail Materiaalkosten , hier gaan we een 3e window binnen
	If WinExist("AUTO - Artikelen  -  LET Automotive n.v. (AUTO - Artikelen  -  LET Automotive n.v.)")
		{	WinActivate
			Sleep 300,			
			MouseMove, 100, 100 ;in de tabel ergens staan ongeveer 1e rij
			MouseClick, right ; menuopvragen
			Send, {Down 6} ;6keer pijltje omlaag  (tabel kopieren
			Send, {Enter} ; druk op enter
	;voila stuklijst in klembord!!
	;ToolTip, stuklijst zit ook in klembord,170 , 950  ; 
	Sleep 300,
	
	
	
;	elke export zetten we in ons exportbestand , dat is een vaste output filename
   file := FileOpen("C:/Users/vth/Desktop/template2018/temp/msoftpartlistsExporteren.txt", "w")
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
	
	
	
	
;van ons exportbestand gaan we de kolommen rechts wissen , daar staan de prijzen in die we niet moeten weten
 Run	wisKolommenexport.bat ; verwijder de rechtse kolommen uit de csv file
Sleep 3500,	 



 	
	;nu hernoemen we het bestand , door het te verplaatsen naar de zelfde folder maar met een andere naam :)
Logbestand := "C:/Users/vth/Desktop/template2018/temp/msoftpartlistsExporteren.txt"
Verwerkt := "C:/Users/vth/Desktop/template2018/temp/"


 FileMove, %Logbestand%,  %Verwerkt%%UserInput%.txt
Sleep 800,
	
	 
Send !{f4} ; Simulates the keypress alt+f4  sluit
Sleep 400,	 
Send !{f4} ; Simulates the keypress alt+f4  sluit


	
	
	
	
			}

}
else
{
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
