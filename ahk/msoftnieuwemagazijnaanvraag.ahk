#include C:\Users\VTH\Desktop\template2018\ahk\_include_variabelen.ahk  ; dit bestand staat op je lokale pc , maar de simultane copy runt vanaf fileserver , dus altijd direct adressering gebruiken
Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
scriptnaam :="msoftnieuwemagazijnaanvraag inc"   
;FileAppend, %Timestamp% - %scriptnaam%`n, %AhkLogbestand% ;save naar txt file concat
aantalkliksUitgespaart := 0   ; aantalkliksUitgespaart += 1  ; een klik is click of tab of enter of up of down of shiftF9 of ... 
Sleep 300,

BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

 
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
;MsgBox % tabel
 

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
   aantalkliksUitgespaart += 1
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
      
   aantalkliksUitgespaart += 1
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
   aantalkliksUitgespaart += 1
   Send, {Right}
   Sleep 300,
   aantalkliksUitgespaart += 1
   Send, {Tab}
   Sleep 300,
   Send,  {Tab}
   Sleep 300,
       aantalkliksUitgespaart += 1  
   Send, {Enter}
 
   
   Loop, 3
{
	ToolTip,     %scriptnaam%  = in Msoft artikelen staan   ; ahk variabele oproepen moet met %% 
	Sleep, 1000 ;nu is kot met 3puntjes er
}
   
   
   ;de windows 'Artikelen (Aangevraagde artikelen'  aktief zetten door erop ergens te klikken want de cordinaten kloppen hierachter nooit
   MouseMove, 390,240
   Sleep 1500,
   aantalkliksUitgespaart += 1
   MouseClick, left
   Sleep 1500,
   
   ;nu gaan we opde 3puntjes klikken 110op105
   ;MsgBox, nu gaan we opde 3puntjes klikken 110op105 ,kutprogramma msoft ondersteund geen tabpositie 
   MouseMove, 110,135
   Sleep 600,
   
   
   
   
   aantalkliksUitgespaart += 1
   ;tot zover gedebugged en ok , nu klikken we op effectief op de 3puntjes en doen we verder
   MouseClick, left
   ;selecteer omschrijvingkolomveld
   Sleep 600,
   Send, {Tab}
   Sleep 300,
   aantalkliksUitgespaart += 1
   Send, {Tab}
   
   
   
   
   ToolTip, Voila bestel maar,170 , 950  ; 
   Sleep 4000,
   
   ;ExitApp ; debug
}else  {
	BlockInput, MouseMoveOff ; muis los laten voor gebruiker
  ; MsgBox, je staat niet in programma - magazijnaanvragen
   	MsgBox, 48, je staat niet in programma - magazijnaanvragen , %scriptnaam%, 1
   
   ExitApp
} 



Sleep 300,
;Run C:\Users\vth\Desktop\template2018\ahk\msoftnieuwemagazijnaanvraag.ahk

FileAppend, %Timestamp% - %scriptnaam%  kliks : %aantalkliksUitgespaart%`n, %AhkLogbestand% ;save naar txt file concat

	;;noodstop
	ExitApp ; dit is onze laatste stap na de herhaalloop
	ExitSub:
	{
		BlockInput, MouseMoveOff ; muis los laten voor gebruiker
		 
	MsgBox, 48, you pressed escape- , %scriptnaam%, 1
		ExitApp
		return
	}
	ESC::Goto ExitSub             