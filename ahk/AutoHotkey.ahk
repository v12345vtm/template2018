;https://github.com/v12345vtm/template2018...test0server



;deze file staat in \\file01\users\vth\MyDocs\AutoHotkey.ahk en werkt op de poratbelapp versie 1.1.30.03
;vroeger VOOR de corona crisis , werkt mijn defautl ahk script vanuit de lokale 'mijn dokumenten'
;sinds de Crash net voor de Corona lockdown is ahk gelinkt aan de fileserver file01 
;de it gelooft niet dat dit vroeger werkte , maar dat heeft niet , we hebben een walkaround gevonden via windows netwerkfolder n:\mydocs
; deze windows netwerkkoppeling is gelinkt naar 

; tidy = http://sl5.it/SL5_preg_contentFinder/examples/AutoHotKey/converts_your_autohotkey_code_into_pretty_indented_source_code.php

;1356okt2018 , control+pageup voor te scrollen in tabs en shifttab
;nieuw artikel toevoegen mousemove moet je loggen in windowSpy ,x -5 en de y waarde -25 doen 110,130 word 105,105



;Hoe mouspos bepalen ?
;in de spy best positie nemen van : ACTIVE SCREEN
;in ahk script zal dit werken
;echter als je er een EXE van maakt , dan verander je de coordinaten naar ONSCREEN...



CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates.

SetScrollLockState, off
#KeyHistory 500  ; Store up to 500 events.

ContinueSearch := true ; anders testen we 10x per seconde  een scherm die openstaat , terwijl we het enkel direkt willen opmerken direct als het opkomt, 
;xpositie := 1050 ; xpos vd tooltip linksrechtspos
;ypos := 1019 ; ypos vd tooltop ,hoogtepos1025 is al weer alboven

xpositie := 500 ; corona laptop xpos vd tooltip linksrechtspos
ypos := 700 ; corona lapto ypos vd tooltop ,hoogtepos1025 is al weer alboven



xpositieTT19 := 800 ; xpos vd tooltip19 linksrechtspos  tooltip19 is dienen met virt clipbord
yposTT19 := 1019 ; ypos vd tooltip19 ,hoogtepos1025 is al weer alboven


FileCopy, \\file01\users\VTH\MyDocs\AutoHotkey.ahk , C:\Users\vth\Desktop\template2018\ahk\ ,1 ; Make a copy but keep the orig. file name.


;toon de data in ons virt klembord bestand
  FileRead, OutputVar,  C:/Users/vth/Desktop/template2018/logfiles/virtklembord.txt 
     ToolTip, init(control)winX=%OutputVar% , %xpositieTT19% , %yposTT19%, 19  ;toon de data in ons virt klembord bestand in tooltip met id19

SetTitleMatchMode, 2
#Persistent
SetTimer, SendHotkey, 70
SetTimer, Autoresetvt, 45000 ;parameter ContinueSearch is hier gebruikt als bool en op true gezet
SetTimer, Autoreadvirtklembordfile, 1000 ;virt klembord lezen textbestand elke minuut ;toon de data in ons virt klembord bestand
return


;;;;FUNCTIES :
Autoresetvt:
	ContinueSearch := true
Return



Autoreadvirtklembordfile: 
	  FileRead, OutputVar,  C:/Users/vth/Desktop/template2018/logfiles/virtklembord.txt 

   ToolTip, 3x drukken p=Tpdm n=hide v=vitH w=vih123  q=%OutputVar% (control)winX=Klembord , %xpositieTT19% , %yposTT19%, 19  ;toon de data in ons virt klembord bestand in tooltip met id19
Return



SendHotkey:
	WinGetTitle, Title, A ; steek de programmanaam is var %Title%
	WinGetClass, class, A
	CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
	
	
	
	;ahk_class ApplicationFrameWindow  office popup als ik print
	
	If WinExist("ahk_class ApplicationFrameWindow") and ContinueSearch 
	{
		;WinActivate
		;infovariabele := " brol office popup" 
		;MsgBox, popupOfficePrint is open en we drukken ok om alleenlezen melding vanzelf weg te doen en omdat IT dit niet weet op te lossen
		
		;WinClose, Office,,1
	}	
	
	
	If WinExist("AutoCAD LT Alert") and ContinueSearch 
	{
		WinActivate
		Send, {Enter}    ;MsgBox, AutoCAD LT Alert is open en we drukken ok om alleenlezen melding vanzelf weg te doen
	}
	
	
	If WinExist("ahk_class #32770") and (title = "Jorosoft 1024") and ContinueSearch 
	{
		; als je nrs wil verlaten vraagt hij of je het zeker weet , ja want ik drukte op het stopbord ! hoeveel zekerder moet ik zijn?
		WinActivate	
		Send, {Left}{Enter}    ;
	}
	


	If WinExist("ahk_class #32770") and (title = "Jorosoft 1021") and ContinueSearch 
	{
		; als je nrs een revisie effectief heeft gemaakt komt er een messagebox om te stoefen dat hij een revisie heeft gemaakt , ahk doet dat zo rap als tellen weg
		WinActivate	
		Send,  {Enter}    ;
	}




	If WinExist("ahk_class SunAwtFrame") and (title = "Message") and ContinueSearch 
	{
		; als je ujob iets doet komt er een messagebox om te stoefen dat hij een iets deed , ahk doet dat zo rap als tellen weg
		WinActivate	
		Send,  {Enter}    ;
	}


If WinExist("ahk_class #32770") and (title = "Reload") and ContinueSearch 
	{
		; als je een script hebt in notepad++ hebt staan , en de inhoud is in de achttergrond verandert , mag je de inhoud herinlezen , dit is gekomen voor compare ahk 
		WinActivate	
		Send,  {Enter}    ;
	}
	
	
	If WinExist("ahk_class #32770") and (title = "Save Modified Documents") and ContinueSearch 
	{
		; OPLETTEN IN SOLIDWORKS WE MOGEN NIET OPSLAAN NOOIT 
		WinActivate
		Send, {Right}   ;
		ContinueSearch := false	
		infovariabele := " NOOIT SAVEN !!  bool =" . ContinueSearch
		ToolTip, %infovariabele% , %xpositie %  , %ypos%, 20
	}
	
	
	
	;;;;;;;;;;;;;;;;;;;;;informatie in de ahk statusbar
	
	;infovariabele := "  tietel=" . title 
	;ToolTip, %infovariabele% , 800 , 800, 19
	
	;infovariabele := "  claass=" . class, 
	;ToolTip, %infovariabele% , 800 , 750, 18
	
	
	 If ( class  = "ConsoleWindowClass") 
	{
		; cmd venster of virt env python
		infovariabele := "AHK macro met CONTROLtoets=  f5:sandbox   f6:virtENV     f7:postscan     f8:GUI    f9:makePJ    f10:finalise    f11:makeUSB"
		ToolTip, %infovariabele% , %xpositie %  , %ypos%, 20
	}else 




	
	If ( class  = "WindowsForms10.Window.8.app.0.3c4abcc_r9_ad1")
	{
		; clip project  ahk_class  = WindowsForms10.Window.8.app.0.3c4abcc_r9_ad1
		infovariabele := "AHK macro met wintoets=  usb:numlock  verpak:-   bedien:7  lutze:8  kabel:9  comp:4   draad:5  hoofdcomp:6  kleinzilver:+"
		ToolTip, %infovariabele% , %xpositie %  , %ypos%, 20
	}else   
	
	
	
		If ( class  = "rctrl_renwnd32")
	 {
		; mail class
		infovariabele := "mailke?"
		ToolTip, %infovariabele% , %xpositie %  , %ypos%, 20
	}else   
	
	
	
		If ( class  = "ProMainWin")
	 {
		; msoft met zijn vele windows	is heeft 1klasse gemeenschappelijk v progress : ahk_class ProMainWin
		infovariabele := "aanpassenstuklijst=s // mag.aanvr=n  // partlisttonen=z  //  stuklijstnieuwItemtoevoegen=spatie  //  documentkoppelen=0 // artikelVERGELIJKEN=& en é"
		ToolTip, %infovariabele% , %xpositie %  , %ypos%, 20
	}else   If (title = "LET")
	 {
		infovariabele := "ronny-C6146L laurents-misterplc13 //objectdata-LijnVrijgeven=y // objectdata-Geturl=1  // objectdata-nieuwlabelobject=r  //  objectdata-nieuwD5=j  //objectdata nieuwlabel=r"
		ToolTip, %infovariabele% , %xpositie %  , %ypos%, 20
	}else  {
		;infovariabele := " ahk runs : desktop=scrollock // clipproject=pauze // bestek=insert // optblokDb=Home //  bool =" . ContinueSearch
		infovariabele := ""
		ToolTip, %infovariabele% , %xpositie %  , %ypos%, 20
	}
return ; return uit functie SendHotkey die we elke 300ms uitvoeren 
;;;;;;;;;;;;;;;;;;;;;;;;;






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






#&::Run, C:\Users\vth\Desktop\template2018\ahk\Msoftcompareartikel1a.ahk ; compare artikel in bestand1 toets1 op klavier
#é::Run, C:\Users\vth\Desktop\template2018\ahk\Msoftcompareartikel2a.ahk ; compare artikel in bestand2 toets2 op klavier
#"::Run, C:\Users\vth\Desktop\template2018\ahk\ClipElecWaPasPrintenEnLogRename.ahk ; "elec waterpas printen en log resetten toets3 op klavier
#'::Run, C:\Users\vth\Desktop\template2018\macros\aanpassenToolmetAcceswijzigenEnMsoft.xlsm ; script die de gui van psp acces invult: toets4 op klavier  : 
#(::Run, C:\Users\vth\Desktop\template2018\ahk\msoftpartlistsExporteren.ahk ; script partlist in een filezet: toets5 op klavier  : ;msoftpartlistsExporteren

;;; oud #,::Run, "C:\Users\vth\Desktop\template2018\ahk\msoftmaKiesitemuitDB.ahk" ;  msoftmaNextAanvraag  win+komma op 3puntjes klikken in mag.aanvraag
#,::Run, C:\Users\vth\Desktop\template2018\ahk\pdmverkenner.ahk ;  ; win+komma 

Pause::Run C:\Users\vth\Desktop\template2018\ahk\clipprojectopenen.ahk 
Scrolllock::#d  ;desktop nog rapper tonen met de srollock toets scrollock remapped naar windows+d

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
#f::Run C:\sdkardbatch
#g::Run "C:\Users\vth\Desktop\template2018\ahk\msoftprojectenmsoft.ahk" ; data opzoeken voor kb en serienrs te genereren
#h::Run "C:\Users\vth\Desktop\template2018\ahk\fotoscrollermsoft.ahk" ; elke sec pijltje omlaag typen om in msoft prentjes te zoeken
#i::Run C:\Users\vth\Desktop\template2018\ahk\importSDcard.bat ; fotos van Sd kaart verplaatsen
#j::Run C:\Users\vth\Desktop\template2018\ahk\nrsnieuwd5.ahk  ;(toetsenbordlabel = nieuwPV) uitleg = nieuw pv  D5 docx-object in  nrs 
#k::Run C:\Users\vth\Desktop\template2018\macros\kzb.xlsm  
; #l::Run T:\voor vincent  ; werkt niet windows+L = logoff !
#m::Run, "C:\Users\vth\Desktop\template2018\ahk\mail.ahk" ; mail   "C:\Program Files (x86)\Microsoft Office\Office16\outlook.exe"
#n::Run C:\Users\vth\Desktop\template2018\ahk\msoftopstartenrubriekmagazijnaanvraag.ahk ; vroeger msoftnieuwemagazijnaanvraag.ahk
#o::Run T:\voor vincent
#p::Run L:\Letdata\Projects

#r::Run C:\Users\vth\Desktop\template2018\ahk\nrsnieuwlabel.ahk  ; uitleg = nieuw label-object  L1 in  nrs 
#s::Run C:\Users\vth\Desktop\template2018\ahk\msoftaanpassenstuklijst.ahk
#t::Run C:\Users\vth\Desktop\template2018\macros\serieverpak2020.xlsm ; 
#v::Run, "C:\Users\vth\Desktop\template2018\ahk\werkurenVTexcel.ahk"
#x::Run, "C:\Users\vth\Desktop\template2018\ahk\klembordReadfromfile.ahk" ; Win+ X = plak uit virt klembord
#y::Run, "C:\Users\vth\Desktop\template2018\ahk\nrs-LijnVrijgeven.ahk" ; nrs vrijgeven lijn objectdata
#z::Run, "C:\Users\vth\Desktop\template2018\ahk\msoftpartlisttonen.ahk" ; parlist tonen





^#x::Run, "C:\Users\vth\Desktop\template2018\ahk\klembordWritetofile.ahk" ;  control+WIN + X = virtueel klembord om nummers van nrs en pdm en msoft te kunnen doen

^End::Run, C:\Users\vth\Desktop\template2018\ahk\msofttabelexportandConcattofileMsoft.ahk ; msofttabelexportandConcattofile Msoft.txt
^f10::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirementFINAL.ahk"
^f11::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirementUSB.ahk"
^f5::Run C:\MySandbox ; virtuele omvirement in verkenner  ;control+f5
^f6::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirement.ahk"
^f7::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirementpostscan.ahk"
^f8::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirementGUI.ahk"
^f9::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirementMAKE.ahk"

#f10::Run calc.exe
#f11::Run, "C:\Users\vth\Desktop\template2018\ahk\ujob-gisteren.ahk"
#f12::Run, "C:\Users\vth\Desktop\template2018\ahk\ujob-inputvandaag.ahk"
#f1::Run, "C:\Users\vth\Desktop\template2018\macros\procedurewizard.lnk"
#f2::Run, "C:\Users\VTH\Desktop\template2018\portableApps\FirefoxPortable\FirefoxPortable.exe"
#f3::Run, "C:\Users\vth\Desktop\template2018\ahk\msoftopstarten.ahk"
#f4::Run, "C:\Users\vth\Desktop\template2018\ahk\nrsopstarten.ahk" ; werkt niet op vmn win+f4 is dan terug afsluiten
#f5::Run, "C:\Users\vth\Desktop\template2018\ahk\tooltipmouspost.ahk"    ; debug tool soort spy voor mousepositie
#f7::Run, "C:\Program Files (x86)\Microsoft Office\Office16\excel.exe"
#f8::Run C:\Tools\Notepad++\notepad++.exe ;C:\Users\vth\Desktop\template2018\portableApps\Notepad++Portable\Notepad++Portable.exe ;
#f9::Run C:\WINDOWS\system32\mspaint.exe


#u::
{
	SetScrollLockState, off
	;open pdf uurkaarten wacht 500ms en control+p drukken
	Run C:\Users\vth\Desktop\template2018\bibliotheek\uurkaarten.pdf
	Sleep 1500,
	Send, ^p
	ToolTip  ; wissen oude tooltips
	Return
}



#f6::
{
	ToolTip, wijzigen stuklijsten acces tool opstarten,303,750
	Run L:\planning\produktie\wijzigen stuklijsten\wijzigen.accdb
	Sleep 1400,
	Send, {Tab 3}
	Sleep 800,
	Send, {Enter}
	ToolTip  ; wissen oude tooltips
	Return
}



;text typen met 1 toetsncombinatie
#w::
{
	ToolTip, ALG20 typen ,303,750
	SetScrollLockState, off
	Send, ALG20
	ToolTip  ; wissen oude tooltips
	
	Return
}

 

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


:R*?:www::
{

SendInput vith123 
return
}



:R*?:nnn::
{
		Tooltip  hide in edrawings met n-n-n
		MouseClick, right ; menuopvragen
		Sleep, 200
		Send, {Down 1} ;6keer pijltje omlaag
		Sleep, 200
		Send, {Enter} ; druk op enter
			;Sleep, 200

Tooltip  
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
	
		}
		 
		 else
		 {
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


#<::
{
	SetScrollLockState, off
	Send, kabdr{ENTER}
	ToolTip  ; wissen oude tooltips
	Return
}              