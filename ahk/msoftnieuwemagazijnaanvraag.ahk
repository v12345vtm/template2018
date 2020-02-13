;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
scriptnaam :="msoftnieuwemagazijnaanvraag"   
FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
Sleep 300,

;;;;   http://sl5.it/SL5_preg_contentFinder/examples/AutoHotKey/converts_your_autohotkey_code_into_pretty_indented_source_code.php

;;;;;    https://github.com/v12345vtm/template2018

ToolTip, MSOFTnieuwemagazijnaanvraag-ahk = in Msoft magazijnaanvragen staan,170 , 950

SetKeyDelay, 200 ; hoe rap stuur je typcommandos
SetScrollLockState, off

Sleep 300,
CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
Sleep, 200

tabel:= ".............................................................................................................................."
tabel.= " `n KWIJT      `n     bijbestellen op PROJ  `n  op groen blad noteren dat je een kwijt was    `n"
tabel .= " `n GEVONDEN 	`n     terugsturen op PROJ   `n  op groen blad schrappen dat je een kwijt was         `n"
tabel .= " `n AFKEUR 	`n     totaal aantal bestellen op AFKEUR en reeds ok zetten  `n     totaal negatief aantal bestellen op AFKEUR   `n  op groen blad tekorten noteren        `n"
tabel .= " `n WISSEL 	`n     nodige artikel  bestellen op PROJ geen opmerking  `n     overbodige artikel terugsturen op PROJ  en  wel opmerking doen  VOORCALCULATIE aanpassen  `n  op groen blad Aanpassen opzetten       `n"
tabel .= " `n TEVEEL 	`n     overbodige artikel terugsturen op PROJ  en daarin opmerking doen  VOORCALCULATIE aanpassen  `n  op groen blad Aanpassen opzetten       `n"
tabel .= " `n HERANODISEREn enz... 	`n     hier moet je  nu niet zijn , gewoon in BESTELaanvraag order zetten op PROJ      `n  en op groene fische noteren dat ze onderweg zijn naar lev."

s := "Hello, "
s .= "world."
MsgBox % tabel

BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

SetTitleMatchMode 2
If WinExist("AUTO - Magazijnaanvragen")
{
   ;MsgBox, u venster is open	, en ik zal het vooraan zetten
   ToolTip, u programma AUTO - Magazijnaanvragen is open `n  	 en ik zal het vooraan zetten   `n   voila! ,170 , 950
   WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
   
   Sleep 500,  
   ;ga in magazjn aanvraag staan en dan maken we nieuw order via ahk
   
   ToolTip, nieuwe magazijnaanvraag en verplaatsen naar linkerkant,170 , 950
   
   Send, {Ins}  ; 
   Sleep 1500,   
   
   WinGetTitle, Title, A
   ToolTip, %Title% ,170 , 850 ; we krijgen de title niet binnen
   
      
   
   If WinExist  (title = "AUTO - Magazijnaanvragen  -  LET Automotive n.v. (AUTO - Magazijnaanvragen  -  LET Automotive n.v.)")  
   {
      ; WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
      ;lijstje mag aanvraag
      ; Sleep 600
      ;WinGetTitle, Title, A
      ; WinMove, "AUTO - Magazijnaanvragen  -  LET Automotive n.v. (AUTO - Magazijnaanvragen  -  LET Automotive n.v.)",, 50 , 150 ,1400,660   ; msoft naar left300 top400 width1400  height660	
      ; MsgBox magaanvrlijtje      
      ; Sleep 8000,      
      ; exitapp
   }  
      
   
   Send,  {Tab}
   Sleep 300,
   Send,  {Tab}
   Sleep 300,
   Send,  {Tab}
   Sleep 300,
   Send,  {Tab}
   Sleep 300,
   Send,  {Tab}
   Sleep 300,
   Send,  {Tab}
   Sleep 300,
   Send, {Right}
   Sleep 300,
   Send, {Tab}
   Sleep 300,
   Send,  {Tab}
   Sleep 300,
         
   Send, {Enter}
   Sleep 300,
   
   
   
   
   ;de windows 'Artikelen (Aangevraagde artikelen'  aktief zetten door erop ergens te klikken want de cordinaten kloppen hierachter nooit
   MouseMove, 390,240
   Sleep 500,
   MouseClick, left
   Sleep 500,
   
   ;nu gaan we opde 3puntjes klikken 110op105
   ;MsgBox, nu gaan we opde 3puntjes klikken 110op105 ,kutprogramma msoft ondersteund geen tabpositie 
   MouseMove, 110,105
   Sleep 600,
   
   
   
   
   
   ;tot zover gedebugged en ok , nu klikken we op effectief op de 3puntjes en doen we verder
   MouseClick, left
   ;selecteer omschrijvingkolomveld
   Sleep 600,
   Send, {Tab}
   Sleep 300,
   Send, {Tab}
   
   
   
   
   ToolTip, Voila bestel maar,170 , 950  ; 
   Sleep 4000,
   
   ;ExitApp ; debug
}else  {
   MsgBox, je staat niet in programma - magazijnaanvragen
   ExitApp
} 



Sleep 300,
;Run C:\Users\vth\Desktop\template2018\ahk\msoftnieuwemagazijnaanvraag.ahk



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