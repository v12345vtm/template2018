;_______________________________________________
;         INFO  :versie ahk aug2020  voor v1.1.33.02    7/9/2020 
;_______________________________________________


/******************************
 

;https://github.com/v12345vtm/template2018...test0server

; regex zoek 6opeenvolgende getallen zoals hf185612_01kol  -->   (?<!\d)\d{6}(?!\d)
;vervang dit in notpad++  naar hf185612demo_01kol   --> $&demo



;deze file staat in  C:\Users\VTH\Desktop\template2018\portableApps\AutoHotkey_1.1.33.02portable_versieAugustus2020\AutoHotkeyAug2020-64b.ahk


 
; tidy = http://sl5.it/SL5_preg_contentFinder/examples/AutoHotKey/converts_your_autohotkey_code_into_pretty_indented_source_code.php

;1356okt2018 , control+pageup voor te scrollen in tabs en shifttab
;nieuw artikel toevoegen mousemove moet je loggen in windowSpy ,x -5 en de y waarde -25 doen 110,130 word 105,105



;Hoe mouspos bepalen ?
;in de spy best positie nemen van : ACTIVE SCREEN
;in ahk script zal dit werken
;echter als je er een EXE van maakt , dan verander je de coordinaten naar ONSCREEN...


Debugging a Script
Commands such as ListVars and Pause can help you debug a script. For example, the following two lines, when temporarily inserted at carefully chosen positions, create "break points" in the script:

      ListVars
      Pause

*/


;_______________________________________________
;         INITIALISATIE  :
;_______________________________________________


SplashImage, C:\Users\VTH\Desktop\template2018\ahk\Logo.jpg, b fs18, Welkom in autohotkey.
Sleep, 1000
SplashImage, Off


#SingleInstance  Force
#WinActivateForce
;codeindent via online tool op 21aug2020 indien miserie neem backup van 20/08/2020 van deze file
#include C:\Users\VTH\Desktop\template2018\ahk\_include_variabelen.ahk  ; dit. bestand staat op je lokale pc , maar de simultane copy runt vanaf fileserver , dus altijd direct adressering gebruiken
;#include C:\Users\VTH\Desktop\template2018\ahk\splitscreen.ahk 


run C:\Users\VTH\Desktop\template2018\portableApps\DesktopHomes\Desktop Homes\sources\DesktopHomes.ahk
run guiWHEN.ahk
 
Pause


CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates.

SetScrollLockState, off
SetScrollLockState, AlwaysOff

#KeyHistory 500  ; Store up to 500 events.

;msgbox %A_AhkVersion%
   
;ContinueSearch := true ; anders testen we 10x per seconde  een scherm die openstaat , terwijl we het enkel direkt willen opmerken direct als het opkomt, 

FileCopy, C:\Users\VTH\Desktop\template2018\ahk\AutoHotkeyAug2020-64b.ahk , C:\Users\vth\Desktop\template2018\ahk\ahk_backup.txt ,1 ; Make a copy but keep the orig. file name.





;__________________________________________________________________________
;         SCHERMRESOLUTIE DEFINIEREN en TOOLTIP default en TOOLTIP19 :
;__________________________________________________________________________


 
;resolutie:= "ze"
resolutie:=  A_ScreenWidth "x"  A_ScreenHeight  ; dell 24inch is 1920x1080
;MsgBox, %resolutie%

if (resolutie = "1920x1080"){
 
	; MsgBox groot scherm Dell24inch
	xpositie := 1050 ; xpos vd tooltip linksrechtspos
	ypos := 1019 ; ypos vd tooltop ,hoogtepos1025 is al weer alboven	
	
	xpositieTT19 := 450 ; xpos vd tooltip19 linksrechtspos  tooltip19 is dienen met virt clipbord
	yposTT19 := 1019 ; ypos vd tooltip19 ,hoogtepos1020 is al weer alboven 
}else  {
 	MsgBox,, starting vith ahk(selfdestructing msgbox) ,we zitten met ANDER scherm dan normaal -normaal hebben we 1920x1080, 2
	;MsgBox, 48, starting vith ahk (selfdestructing msgbox) , you pressed esc- `n`n This message will self-destruct in 1 seconds., 1
	xpositie := 500 ; corona laptop xpos vd tooltip linksrechtspos
	ypos := 820 ; corona lapto ypos vd tooltop ,hoogtepos1025 is al weer alboven
		
	xpositieTT19 := 950 ; xpos vd tooltip19 linksrechtspos  tooltip19 is dienen met virt clipbord
	yposTT19 := 16 ; ypos vd tooltip19 ,hoogtepos1025 is al weer alboven
}



;_______________________________________________
;         VIRTUAL KLEMBORD via bestand :
;_______________________________________________


;toon de data in ons virt klembord bestand
FileRead, OutputVar,  C:/Users/vth/Desktop/template2018/logfiles/virtklembord.txt 
ToolTip, init(control)winX=%OutputVar% , %xpositieTT19% , %yposTT19%, 19  ;toon de data in ons virt klembord bestand in tooltip met id19
;write naar C:/Users/vth/Desktop/template2018/logfiles/Welksubprogrammawerkjenuin.txt 



;_______________________________________________
;         TIMERS van de functies :
;_______________________________________________



SetTitleMatchMode, 2
#Persistent
SetTimer, SendHotkey, 70
SetTimer, Autoresetvt, 250 ;parameter ContinueSearch is hier gebruikt als bool en op true gezet
SetTimer, Autoreadvirtklembordfile, 1000 ;virt klembord lezen textbestand elke minuut ;toon de data in ons virt klembord bestand
return



;_______________________________________________
;         FUNCTIES :
;_______________________________________________

schrijfnaarTXTbestandvoorGuiwhen(programindex){
		file := FileOpen("C:/Users/vth/Desktop/template2018/logfiles/Welksubprogrammawerkjenuin.txt", "w") ; write nr bestand
 
file.Write(programindex)
	;file.Write(infovariabele)
	file.Close() 
}
 





Autoresetvt:	 
	; ContinueSearch := true
	 FormatTime, CurrentDateTime,, yyyyMMddHHmmss
	  Timestamp := CurrentDateTime ; to start a new line. nieuwe regel
;ToolTip,  %Timestamp% ,  , , 18  ;toon de debugdata in ons virt klembord bestand in tooltip met id18
 
Return


Autoreadvirtklembordfile:
	FileRead, OutputVar,  C:/Users/vth/Desktop/template2018/logfiles/virtklembord.txt 	
	;ToolTip, ppp=Tpdm n=hide vvv=vitH www=vih123  q=%OutputVar%  win+< store , %xpositieTT19% , %yposTT19%, 19  ;toon de data in ons virt klembord bestand in tooltip met id19
	ToolTip, %OutputVar%  , %xpositieTT19% , %yposTT19%, 19  ;toon de data in ons virt klembord bestand in tooltip met id19
Return



SendHotkey:
	WinGetTitle, Title, A ; steek de programmanaam is var %Title%
	WinGetClass, class, A
	CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:		
watiserbezig := actiefvensterklasseproces()

;MsgBox, %watiserbezig%
global	infovariabele := watiserbezig
	 	ToolTip, Tooltipnr20= . %infovariabele%        , %xpositie%  ,1000, 20	
	
 
 switch actiefvensterklasseproces()
{


	case "#32770MSACCESS.EXE": ; *****NRS*****
	if (Title = "Jorosoft 1087") 
	{
		infovariabele := "NRS project :Weet u zeker om dit te importeren?"
		ToolTip, %infovariabele%     , 500  , %ypos%, 18			
		WinActivate
	Send,{Left}  ;Left-arrow key on main keyboard  we gaan ja selectern 
	sleep 1500
		Send, {Enter}    ;MsgBox, AutoCAD LT Alert is open en we drukken ok om alleenlezen melding vanzelf weg te doen
		Timestamp := CurrentDateTime ; to start a new line. nieuwe regel
		FileAppend, %Timestamp% - %infovariabele%`n, %AhkLogbestand% ;save naar txt file concat
	}
	if (Title = "Microsoft Access") 
	{
		infovariabele := "Fout bij invoegen Project"
		ToolTip, %infovariabele%     , 500  , %ypos%, 18			
		WinActivate
		;Send,{Left}  ;Left-arrow key on main keyboard  we gaan ja selectern 
		;sleep 1500
		Send, {Enter}    ;MsgBox, AutoCAD LT Alert is open en we drukken ok om alleenlezen melding vanzelf weg te doen
		Timestamp := CurrentDateTime ; to start a new line. nieuwe regel
		FileAppend, %Timestamp% - %infovariabele%`n, %AhkLogbestand% ;save naar txt file concat
	}
	if (Title = "Jorosoft 1069") 
	{
		infovariabele := "OK // Project werd succesvol geïmporteerd. // "
		ToolTip, %infovariabele%     , 500  , %ypos%, 18			
		WinActivate
		;Send,{Left}  ;Left-arrow key on main keyboard  we gaan ja selectern 
		;sleep 1500
		Send, {Enter}    ;MsgBox, AutoCAD LT Alert is open en we drukken ok om alleenlezen melding vanzelf weg te doen
		Timestamp := CurrentDateTime ; to start a new line. nieuwe regel
		FileAppend, %Timestamp% - %infovariabele%`n, %AhkLogbestand% ;save naar txt file concat
	}
	if (Title = "Jorosoft 1024") {
		infovariabele := " Jorosoft 1024 stopbord nrs verlaten"  
		ToolTip, %infovariabele%     , 500  , %ypos%, 18	
		; als je nrs wil verlaten vraagt hij of je het zeker weet , ja want ik drukte op het stopbord ! hoeveel zekerder moet ik zijn?
		WinActivate	 
		Send, {Left}{Enter}    ;		
		Timestamp := CurrentDateTime ; to start a new line. nieuwe regel
		FileAppend, %Timestamp% - %infovariabele%`n, %AhkLogbestand% ;save naar txt file concat
	}
		if (Title = "Jorosoft 1021") {
		infovariabele := " nrs revisie maken is gelukt"  
		ToolTip, %infovariabele%     , 500  , %ypos%, 18
		WinActivate	
		BlockInput, MouseMove ;blokeer muis 
		Send, {Enter}  
		BlockInput, MouseMoveOff ;terug loslaten muis		 
		Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
		FileAppend, %Timestamp% - %infovariabele%`n, %AhkLogbestand% ;save naar txt file concat			 
	}


	case "rctrl_renwnd32outlook.exe":   
	{
	infovariabele := "mailbox F9 to refresh"
		schrijfnaarTXTbestandvoorGuiwhen("mailbox") ;(infovariabele)
	ToolTip, %infovariabele%     , 500  , %ypos%, 18	
	}
	
	
	case "WindowsForms10.Window.8.app.0.3c4abcc_r9_ad1ClipProjectMarking.exe":  
      {       ;WindowsForms10.Window.8.app.0.3c4abcc_r11_ad1ClipProjectMarking.exe
	;infovariabele := "clipproject"
	infovariabele := "cliproject=  usb:numlock  verpak:-   bedien:7  lutze:8  kabel:9  comp:4   draad:5  hoofdcomp:6  kleinzilver:+"
		schrijfnaarTXTbestandvoorGuiwhen("clipproject") ;(infovariabele)
	ToolTip, %infovariabele%     , 500  , %ypos%, 18
}	
	
	
	case "OMainMSACCESS.EXE":    
	{
	;infovariabele := "NRS"	
	infovariabele := "ronny-C6146L laurents-misterplc13 //objectdata-LijnVrijgeven=y // objectdata-Geturl=1  // objectdata-nieuwlabelobject=r  //  objectdata-nieuwD5=j  //objectdata nieuwlabel=r"
		schrijfnaarTXTbestandvoorGuiwhen("nrs") ;(infovariabele)
	ToolTip, %infovariabele%     , 500  , %ypos%, 18	
	VK6E:: send  {ASC 46} ; als we op punt numpadDot  drukken komt er een komma , en ik verander dat als ik op punt druk dat er een punt komt
	;kunnen we een gui tonen ?
 ; https://autohotkey.com/board/topic/101402-gui-always-on-top-of-a-specific-window/	
	}
	
	
	
	case "CabinetWClassExplorer.EXE":  
	if (Title = "LET_VAULT") 
	{
		infovariabele := "LET_vault"
			schrijfnaarTXTbestandvoorGuiwhen("LET_vault") ;(infovariabele)
		ToolTip, %infovariabele%     , 500  , %ypos%, 18
	}else  {
		infovariabele := "verkenner"
		ToolTip, %infovariabele%     , 500  , %ypos%, 18
	 	schrijfnaarTXTbestandvoorGuiwhen("verkenner") ;(infovariabele)		
	;	file := FileOpen("C:/Users/vth/Desktop/template2018/logfiles/Welksubprogrammawerkjenuin.txt", "w") ; write nr bestand
	;file.Write(infovariabele)
	;file.Close() 
		
	}
	
	
	
	
	case "#32770acadlt.exe":
	if (Title = "AutoCAD LT Alert") 
	{
		infovariabele := "AutoCAD LT Alert readonly warning "
		ToolTip, %infovariabele%     , 500  , %ypos%, 18			
		WinActivate
		Send, {Enter}    ;MsgBox, AutoCAD LT Alert is open en we drukken ok om alleenlezen melding vanzelf weg te doen
		Timestamp := CurrentDateTime ; to start a new line. nieuwe regel
		FileAppend, %Timestamp% - %infovariabele%`n, %AhkLogbestand% ;save naar txt file concat
	}
	
	
	
	
	case "#32770ClipProjectMarking.exe":
if (Title = "Question") 
	{
		infovariabele := "clipproject het update oud mtp bestand maar"  
		ToolTip, %infovariabele%     , 500  , %ypos%, 18	
		WinActivate
		Send, {Enter}    ;MsgBox, AutoCAD LT Alert is open en we drukken ok om alleenlezen melding vanzelf weg te doen
		Timestamp := CurrentDateTime ; to start a new line. nieuwe regel
		FileAppend, %Timestamp% - %infovariabele%`n, %AhkLogbestand% ;save naar txt file concat
	}



		case "Credential Dialog Xaml Host":
if (Title = "Gebruikersaccountbeheer") 
	{
WinActivate
MsgBox, firefox wil upd	
MouseMove, 92,370 ;  selecteer textveld van u wachtwoord	
infovariabele := "firefox wil updaten"  
		ToolTip, %infovariabele%     , 500  , %ypos%, 18	
		Timestamp := CurrentDateTime ; 
		;Sleep 1500
		;FileAppend, %Timestamp% - %infovariabele%`n, %AhkLogbestand% ;save naar txt file concat
	}



		case "#32770Explorer.EXE":
if (Title = "SOLIDWORKS PDM Login - LET_VAULT") 
	{
		infovariabele := "als we verkenner pdm vault openen doet pdm dom voor zijn paswoord"  
		ToolTip, %infovariabele%     , 500  , %ypos%, 18	
		WinActivate
		Send, vithvitH15{Enter}    ; 
		Timestamp := CurrentDateTime ; 
		Sleep 1500
		FileAppend, %Timestamp% - %infovariabele%`n, %AhkLogbestand% ;save naar txt file concat
	}


	
		case "#32770EXCEL.EXE":
if (Title = "SOLIDWORKS PDM Login - LET_VAULT") 
	{
		infovariabele := "als we exel openen doet pdm dom voor zijn paswoord"  
		ToolTip, %infovariabele%     , 500  , %ypos%, 18	
		WinActivate
		Send, vithvitH15{Enter}    ;MsgBox, AutoCAD LT Alert is open en we drukken ok om alleenlezen melding vanzelf weg te doen
		Timestamp := CurrentDateTime ; 
		Sleep 1500
		FileAppend, %Timestamp% - %infovariabele%`n, %AhkLogbestand% ;save naar txt file concat
	}


	
	case "SunAwtDialogjavaw.exe":
	if (Title = "Message") {
		infovariabele := "ujob stoeft met zijn verwerken van data" 
		ToolTip, %infovariabele%     , 500  , %ypos%, 18			
		WinActivate	
		Send,  {Enter}    ;	
		Timestamp := CurrentDateTime ; to start a new line. nieuwe regel
		FileAppend, %Timestamp% - %infovariabele%`n, %AhkLogbestand% ;save naar txt file concat
	}
	

	
	case  "ConsoleWindowClasscmd.exe":
	if (Title = "Opdrachtprompt")  
	{
		; cmd venster of virt env python
		infovariabele := "CMD virt env met CONTROLtoets=  f5:sandbox   f6:virtENV     f7:postscan     f8:GUI    f10:finalise    f11:makeUSB"
		ToolTip, %infovariabele%     , 500  , %ypos%, 18
		
			WinMove, %Title%,, 10, 269 , 826 , 573   ; msoft naar left1280 top570  width620  height440	
	}
	
	
	case "ProMainWinprowin32.exe":
	if (Title = "AUTO - Magazijnaanvragen  -  LET Automotive n.v. (AUTO - Magazijnaanvragen  -  LET Automotive n.v.)") 
	{
		infovariabele := "msoft idividuele mag aanvr"  
			schrijfnaarTXTbestandvoorGuiwhen("msoft idividuele mag aanvr" ) ;(infovariabele)
				ToolTip, %infovariabele%     , 500  , %ypos%, 18					
		WinMove, %Title%,, 10, 269 , 826 , 573   ; msoft naar left1280 top570  width620  height440	
	}		
	if (Title = "AUTO - Artikelen  -  LET Automotive n.v.") 
	{
		infovariabele := "msoft artikelen"  
			schrijfnaarTXTbestandvoorGuiwhen("msoft artikelen"  ) ;(infovariabele)
		ToolTip, %infovariabele%     , 500  , %ypos%, 18	
	}	
		if (Title = "AUTO - Projecten  -  LET Automotive n.v.") 
	{
		infovariabele := "msoft projecten"  
			schrijfnaarTXTbestandvoorGuiwhen("msoft projecten"  ) ;(infovariabele)
		ToolTip, %infovariabele%     , 500  , %ypos%, 18
	WinMove, %Title%,, 50, 435 , 1200 , 606   ; msoft naar left1280 top570  width620  height440		
	}
				if (Title = "AUTO - Magazijnaanvragen  -  LET Automotive n.v.") 
	{
		infovariabele := "msoft overzicht iedereen zijn Magazijnaanvragen"  
			schrijfnaarTXTbestandvoorGuiwhen("overzicht iedereen zijn Magazijnaanvragen") ;(infovariabele)
		ToolTip, %infovariabele%     , 500  , %ypos%, 18	
	}
					if (Title = "Artikelen (Aangevraagde artikelen)") 
	{
		infovariabele := "msoft hoeveel en op welk tiknr Magazijnaanvragen"  
			schrijfnaarTXTbestandvoorGuiwhen("hoeveel en op welk tiknr Magazijnaanvragen") ;(infovariabele)
		ToolTip, %infovariabele%     , 500  , %ypos%, 18	
	}
	if (Title = "AUTO - LET Automotive n.v. ") 
	{
		infovariabele := " msoft startvenster" 
	;schrijfnaarTXTbestandvoorGuiwhen("") ;(infovariabele)		
		ToolTip, %infovariabele%     , 500  , %ypos%, 18	
	}
		if (Title = "AUTO - Bestelaanvragen  -  LET Automotive n.v.") 
	{
		infovariabele := "msoft bestelaanvr"  
			schrijfnaarTXTbestandvoorGuiwhen("bestelaanvr" ) ;(infovariabele)
		ToolTip, %infovariabele%     , 500  , %ypos%, 18	
	}
	
	
 
	
case "#32770splwow64.exe":
	if (Title = "Accountadministratie") {
		infovariabele := " we willen printen naar een printer met paswoordbeveiliging"  
		ToolTip, %infovariabele%     , 500  , %ypos%, 18	
		BlockInput, MouseMove ;blokeer muis 
		Send, {Enter}  
		sleep 600		
		BlockInput, MouseMoveOff ;terug loslaten muis
		MsgBox, 48, printerOKgedaan , ***, 0.3
		Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
		FileAppend, %Timestamp% - %infovariabele%`n, %AhkLogbestand% ;save naar txt file concat		 
	}
	
		


	case "#32770FoxitReaderPortable.exe":
	if (Title = "Foxit Reader Portable (PortableApps.com Launcher)") {
		infovariabele := "pdf reader te rap heropent en er was nog een sessie bezig"  
		ToolTip, %infovariabele%     , 500  , %ypos%, 18	
		BlockInput, MouseMove ;blokeer muis 
		Send, {Enter}  
		sleep 600		
		BlockInput, MouseMoveOff ;terug loslaten muis		 
		Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
		FileAppend, %Timestamp% - %infovariabele%`n, %AhkLogbestand% ;save naar txt file concat	
		 
	}
	
	



	case "MozillaWindowClassfirefox.exe":
	if (true) {
		infovariabele := " firefox"  
		ToolTip, %infovariabele%     , 500  , %ypos%, 18			 
	}
	

		case "#32770SLDWORKS.exe":
	if (Title = "SOLIDWORKS") {
		infovariabele := " default toolbar wordt gebruikt.."  
		ToolTip, %infovariabele%     , 500  , %ypos%, 18
Send, {Enter}  
		sleep 600	
		;Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
		;FileAppend, %Timestamp% - %infovariabele%`n, %AhkLogbestand% ;save naar txt file concat	
		 
	}
	if (Title = "SOLIDWORKS PDM") {
		infovariabele := " deze operatie word niet terugbetaald door de ziekenkas"  
		ToolTip, %infovariabele%     , 500  , %ypos%, 18
Send, {Enter}  
		sleep 600	
		;Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
		;FileAppend, %Timestamp% - %infovariabele%`n, %AhkLogbestand% ;save naar txt file concat	
		 
	}


case "#32770UnityPDF.exe":
	if (Title = "") {
		infovariabele := " unitypdf heeft een opdracht afgewerkt die je vroeg!"  
		ToolTip, %infovariabele%     , 500  , %ypos%, 18	
		BlockInput, MouseMove ;blokeer muis 
		Send, {Enter}  
		sleep 600	
	Send !{f4} ; Simulates the keypress alt+f4 sluit unitypdf	
		BlockInput, MouseMoveOff ;terug loslaten muis		 
		Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
		FileAppend, %Timestamp% - %infovariabele%`n, %AhkLogbestand% ;save naar txt file concat	
		 
	}


	case "template":
	if (Title = "detitel") {
		infovariabele := " watis er?"  
		ToolTip, %infovariabele%     , 500  , %ypos%, 18	
		Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
		FileAppend, %Timestamp% - %infovariabele%`n, %AhkLogbestand% ;save naar txt file concat	
		 
	}
	
	
	default:
	infovariabele := "watis er nix speciaals"  
	schrijfnaarTXTbestandvoorGuiwhen("watis er nix speciaals") ;(infovariabele)
	ToolTip,     , 500  , %ypos%, 18
}




return ; return uit functie SendHotkey die we elke 300ms uitvoeren              


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;_______________________________________________
;         HOTKEYS  :
;_______________________________________________



#q::
	{Send, CE Candelameter EP190015.00{Enter}
Return
}


;spatie word 3spaties voor chinese tekens tussen te zetten
;$space::
	;{Send,  {Space}{Space}{Space} 
	;Return
	;}
	
	
;(toetsenbordlabel = geen) uitleg = extra klembordgeheugen
	#b::
	{Send,  0125-04-r{Enter}
Return
}


#<::Run, "C:\Users\vth\Desktop\template2018\ahk\klembordWritetofile.ahk"   ; win+ < drukken is save selction to klembord
#&::Run, C:\Users\vth\Desktop\template2018\ahk\Msoftcompareartikel1a.ahk ; compare artikel in bestand1 toets1 op klavier
#VK32::Run, C:\Users\vth\Desktop\template2018\ahk\Msoftcompareartikel2a.ahk ;  klop é = compare artikel in bestand2 toets2 op klavier
#"::Run, C:\Users\vth\Desktop\template2018\ahk\ClipElecWaPasPrintenEnLogRename.ahk ; "elec waterpas printen en log resetten toets3 op klavier
#'::Run, C:\Users\vth\Desktop\template2018\macros\aanpassenToolmetAcceswijzigenEnMsoft.xlsm ; script die de gui van psp acces invult: toets4 op klavier  : 
#(::Run, C:\Users\vth\Desktop\template2018\ahk\msoftpartlistsExporteren.ahk ; script partlist in een filezet: toets5 op klavier  : ;msoftpartlistsExporteren
;;; oud #,::Run, "C:\Users\vth\Desktop\template2018\ahk\msoftmaKiesitemuitDB.ahk" ;  msoftmaNextAanvraag  win+komma op 3puntjes klikken in mag.aanvraag
#,::Run, C:\Users\vth\Desktop\template2018\ahk\pdmverkenner.ahk ;  ; win+komma 

Pause::Run C:\Users\vth\Desktop\template2018\ahk\clipprojectopenen.ahk 
Scrolllock::Run C:\Users\vth\Desktop\template2018\ahk\desktop.ahk ;  #d  ;desktop nog rapper tonen met de srollock toets scrollock remapped naar windows+d

#Delete::Run C:\Users\vth\Desktop\template2018\ahk\verkennersSLuiten.ahk ; 8verkernners dooddoen
#End::Run, C:\Users\vth\Desktop\template2018\ahk\msofttabelexportandConcattofile.ahk ;
#Home::Run C:\Users\vth\Desktop\template2018\optischeblok-kolomen-lensfronten.xlsm
#Insert::Run C:\Users\vth\Desktop\template2018\macros\mst-dvsa\MstChecklistGenerator.xlsm
#PgDn::Run C:\Users\vth\Desktop\template2018\projectlabelaar.xlsm
#PgUp::Run C:\Users\vth\Desktop\template2018 ; map met templates openen

#Numlock::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportGrijsKZBusb.ahk" ;
#Numpad0::Run, "C:\Users\vth\Desktop\template2018\ahk\msoftdocumenten2.ahk" ; steek een pv in documenten van msoft ,sta in artikelen
#Numpad1::Run, "C:\Users\vth\Desktop\template2018\ahk\nrsobjectdatamaploknrklembord.ahk" ; sta in nrs in objectdate op de lijn van u PV
#Numpad2::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportHfpriGewoon.ahk" ; hfpri 20x7
#Numpad3::Run "C:\Users\vth\Desktop\template2018\ahk\unmount.ahk"        ; unmount usbstick
#Numpad4::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportComplabel.ahk" ; 
#Numpad5::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportDraadlabel.ahk" ;   label importeren
#Numpad6::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportHoofdcomplabel.ahk" ;   label importeren
#Numpad7::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportBedienlabel.ahk" ;   label importeren
#Numpad8::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportLutzelabel .ahk" ;   label importeren
#Numpad9::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportKabellabel.ahk" ;   label importeren
#NumpadAdd::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportGrijsKlein.ahk" ;  grijs klein serienr label importeren 
#NumpadDiv::Run, "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportGrijsKZBgewoon.ahk"
#NumpadDot::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportComplabel.ahk" ;   label importeren ClipprojectImportComplabel
#NumpadMult::Run, "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportGrijsKZBHomo.ahk"
#NumpadSub::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportVerpaklabel.ahk" ;

#Space::Run, C:\Users\vth\Desktop\template2018\ahk\MsoftstuklijsttoevoegennieuwArtikel.ahk ; in vervangen ve partlijst, aanpassen
#^::Run, "C:\Users\vth\Desktop\template2018\ahk\msoft1elijntabelcopieren.ahk" ; voor projecten en kzb te maken , kopiert een kb regel uit msoft naar serieverpak of naar kzb.xls
#a::Run C:\Users\vth\Desktop\template2018\macros\afkeurbonwizard4.xlsm ; 
#c::Run, "C:\Users\vth\Desktop\template2018\ahk\checklijstopenenexcel.ahk"
#e::Run C:\
#f::Run T:\voor vincent\sdcardbatshFileserver
#g::Run "C:\Users\vth\Desktop\template2018\ahk\msoftprojectenmsoft.ahk" ; data opzoeken voor kb en serienrs te genereren
#h::Run "C:\Users\vth\Desktop\template2018\ahk\fotoscrollermsoft.ahk" ; elke sec pijltje omlaag typen om in msoft prentjes te zoeken
#i::Run C:\Users\vth\Desktop\template2018\ahk\importSDcard.ahk ; fotos van Sd kaart verplaatsen
#j::Run C:\Users\vth\Desktop\template2018\ahk\nrsnieuwd5.ahk  ;(toetsenbordlabel = nieuwPV) uitleg = nieuw pv  D5 docx-object in  nrs 
#k::Run C:\Users\vth\Desktop\template2018\macros\kzb.xlsm  
; #l::Run T:\voor vincent  ; werkt niet windows+L = logoff !
#m::Run, "C:\Users\vth\Desktop\template2018\ahk\mail.ahk" ; mail   "C:\Program Files (x86)\Microsoft Office\Office16\outlook.exe"
#n::Run C:\Users\vth\Desktop\template2018\ahk\msoftnieuwemagazijnaanvraag.ahk ; terug msoftnieuwemagazijnaanvraag.ahk
#o::Run T:\voor vincent
#p::Run C:\Users\VTH\Desktop\template2018\ahk\datafolder.ahk   ; L:\Letdata\Projects

#r::Run C:\Users\vth\Desktop\template2018\ahk\nrsnieuwlabel.ahk  ; uitleg = nieuw label-object  L1 in  nrs 
#s::Run C:\Users\vth\Desktop\template2018\ahk\msoftaanpassenstuklijst.ahk
#t::Run C:\Users\vth\Desktop\template2018\macros\serieverpak2021.xlsm ; 
#u::Run C:\Users\vth\Desktop\template2018\ahk\nrsnieuwlabel.ahk  ;
#v::Run, "C:\Users\vth\Desktop\template2018\ahk\werkurenVTexcel.ahk"
#w::Run C:\Users\vth\Desktop\template2018\ahk\alg20.ahk  ;
#x::Run, "C:\Users\vth\Desktop\template2018\ahk\klembordReadfromfile.ahk" ; Win+ X = plak uit virt klembord
#y::Run, "C:\Users\vth\Desktop\template2018\ahk\nrs-LijnVrijgeven.ahk" ; nrs vrijgeven lijn objectdata
#z::Run, "C:\Users\vth\Desktop\template2018\ahk\msoftpartlisttonen.ahk" ; parlist tonen

;   ^#x::Run, "C:\Users\vth\Desktop\template2018\ahk\klembordWritetofile.ahk" ;  control+WIN + X = virtueel klembord om nummers van nrs en pdm en msoft te kunnen doen

^End::Run, C:\Users\vth\Desktop\template2018\ahk\msofttabelexportandConcattofileMsoft.ahk ; msofttabelexportandConcattofile Msoft.txt
^f10::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirementFINAL.ahk"
^f11::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirementUSB.ahk"
^f5::Run C:\MySandbox ; virtuele omvirement in verkenner  ;control+f5
^f6::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirement.ahk"
^f7::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirementpostscan.ahk"
^f8::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirementGUI.ahk"
^f9::Run, "C:\Users\VTH\Desktop\template2018\_dita-ot\connectorpaneel\test.bat"

#f1::Run, "C:\Users\vth\Desktop\template2018\macros\procedurewizard.lnk"
#f2::Run, "C:\Users\VTH\Desktop\template2018\portableApps\FirefoxPortable\FirefoxPortable.exe"
#f3::Run, "C:\Users\vth\Desktop\template2018\ahk\msoftopstarten.ahk"
#f4::Run, "C:\Users\vth\Desktop\template2018\ahk\nrsopstarten.ahk" ; werkt niet op vmn win+f4 is dan terug afsluiten
#f5::Run, "C:\Users\vth\Desktop\template2018\ahk\tooltipmouspost.ahk"    ; debug tool soort spy voor mousepositie
#f6::Run C:\Users\vth\Desktop\template2018\ahk\wijzigen.ahk  ;
#f7::Run, "C:\Users\VTH\Desktop\template2018\ahk\PSPSoftExcelUpdateIndexmappen.ahk"
#f8::Run C:\Tools\Notepad++\notepad++.exe ;C:\Users\vth\Desktop\template2018\portableApps\Notepad++Portable\Notepad++Portable.exe ;
#f9::Run C:\WINDOWS\system32\mspaint.exe
#f10::Run calc.exe
#f11::Run, "C:\Users\vth\Desktop\template2018\ahk\ujob-gisteren.ahk"
;#f12::Run, "C:\Users\vth\Desktop\template2018\ahk\ujob-inputvandaag.ahk"


:R*?:ddd::
{
	;FormatTime, CurrentDateTime,, dd/MM/yy
	FormatTime, CurrentDateTime,, yyMMddHHmmss
	SendInput %CurrentDateTime%
	return
}


:R*?:vvv::
{
	SendInput vithvitH15 
	return
}


:R*?:bbb::
{
	run C:\Users\VTH\Desktop\template2018\ahk\testmetincludebestand.ahk
	return
}



:R*?:nnn::
{


if (PID := ProcessExist("eDrawings.exe")) and WinExist("eDrawings")
{
BlockInput, MouseMove ; blockeer muis als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
 
	Tooltip  hide in edrawings met n n n
WinActivate  ; Uses the last found window.
   ; MsgBox "process exists and has the Process ID " PID "." winexist bestaan
MouseClick, right ; menuopvragen
	Sleep, 200
	Send, {Down 1} ;6keer pijltje omlaag
	Sleep, 200
	Send, {Enter} ; druk op enter
	;Sleep, 200	
	Tooltip  
	BlockInput, MouseMoveOff
	}
else
   {
; MsgBox "edrawing does not exist."
 send n

}
return
}



:R*?:qqq::
{
	Tooltip  virt kembord plakken met qqq
	Run, "C:\Users\vth\Desktop\template2018\ahk\klembordReadfromfile.ahk" ; Win+ X = plak uit virt klembord	
	Tooltip  
	return
}

:R*?:ppp::
{
	Tooltip  ppp pdm openen
	;Run, "C:\Users\vth\Desktop\template2018\ahk\klembordReadfromfile.ahk" ; Win+ X = plak uit virt klembord
	Run  T:\_PDM
	Tooltip  
	return
}



:R*?:lll::
{
	Tooltip  virt kembord plakken met qqq
	;Run	C:\Users\vth\Desktop\template2018\ahk\lokaal.bat ; dit werkt!!na de corona
	;run N:\MyDocs\wisKolommenVanCompare1.bat ; werkt maar niet zinvol als we alles lokaal kunnen houden
	run C:\Users\VTH\Desktop\template2018\ahk\wisKolommenVanCompare1.bat
	Loop, 1
	{
		ToolTip, N:\MyDocs\wisKolommenVanCompare1.bat ant het testen     %A_Index%  /... seconden    ; A_Index will be 1, 2, then 3
		Sleep, 1000
	}
																		
	
	If WinExist( class  = "ConsoleWindowClass") 
	{
		ToolTip, cmd loopt     %A_Index%  /... seconden    ; A_Index will be 1, 2, then 3
		
		while ( class  = "ConsoleWindowClass") 
		{	   
			ToolTip,wachten tijdens cmd
			Sleep, 10 
		}
		ToolTip
	}else  {	
		ToolTip, cmd loopt niet     %A_Index%  /... seconden    ; A_Index will be 1, 2, then 3
		Sleep, 1000
	}	
	Tooltip  
	return
}


:R*?:fff::
{
	Tooltip  virt kembord plakken met qqq
	Run	N:\MyDocs\fileserver.bat		
	;Run	‪\\file01\users\VTH\MyDocs\fileserver.bat ; vahk kan het bestand niet vinden	
	Loop, 1
	{
		ToolTip, file01 bat ant het testen     %A_Index%  /... seconden    ; A_Index will be 1, 2, then 3
		Sleep, 1000
	}	
	Tooltip  
	return
}


:R*?:<<<::
{
	Tooltip  virt kembord plakken met < < <
	Run, "C:\Users\vth\Desktop\template2018\ahk\klembordReadfromfile.ahk" ;  	
	Tooltip
return
}      



 
#f12::
{
	Tooltip  programma always on top zetten via win+ f12
	;Sleep 3000
 WinSet, AlwaysOnTop, toggle, A ; 
;WinSet, Transparent, 200, Untitled - Notepad ; Make the window a little bit transparent.
; Sleep 2000
 Tooltip
 	return
}  



VKDE::
{
	Tooltip  programma OP PAUZEkwadraat
Pause
Tooltip  
	return
}  





