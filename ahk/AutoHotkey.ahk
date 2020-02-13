;https://github.com/v12345vtm/template2018


;deze file staat in \\file01\users\vth\MyDocs\AutoHotkey.ahk en werkt op de poratbelapp versie 1.1.30.03

; tidy = http://sl5.it/SL5_preg_contentFinder/examples/AutoHotKey/converts_your_autohotkey_code_into_pretty_indented_source_code.php

;1356okt2018 , control+pageup voor te scrollen in tabs en shifttab
;nieuw artikel toevoegen mousemove moet je loggen in windowSpy ,x -5 en de y waarde -25 doen 110,130 word 105,105



;Hoe mouspos bepalen ?
;in de spy best positie nemen van : ACTIVE SCREEN
;in ahk script zal dit werken
;echter als je er een EXE van maakt , dan verander je de coordinaten naar ONSCREEN...





SetScrollLockState, off
#KeyHistory 500  ; Store up to 500 events.
ContinueSearch := true ; anders testen we 10x per seconde  een scherm die openstaat , terwijl we het enkel direkt willen opmerken direct als het opkomt, 
xpositie := 1050 ; xpos vd tooltip linksrechtspos
ypos := 1019 ; ypos vd tooltop ,hoogtepos1025 is al weer alboven


FileCopy, \\file01\users\VTH\MyDocs\AutoHotkey.ahk , C:\Users\vth\Desktop\template2018\ahk\ ,1 ; Make a copy but keep the orig. file name.



SetTitleMatchMode, 2
#Persistent
SetTimer, SendHotkey, 70
SetTimer, Autoresetvt, 45000 ;parameter ContinueSearch is hier gebruikt als bool en op true gezet
return


;;;;FUNCTIES :
Autoresetvt:
	ContinueSearch := true
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








;C:\LET_VAULT\AUTOMOTIVE
#e::Run C:\
#f::Run C:\sdkardbatch
#p::Run L:\Letdata\Projects
#k::Run C:\Users\vth\Desktop\template2018\macros\kzb.xlsm  
#a::Run C:\Users\vth\Desktop\template2018\macros\afkeurbonwizard4.xlsm ; 
#s::Run C:\Users\vth\Desktop\template2018\ahk\msoftaanpassenstuklijst.ahk
#v::Run, "C:\Users\vth\Desktop\template2018\ahk\werkurenVTexcel.ahk"
#m::Run, "C:\Users\vth\Desktop\template2018\ahk\mail.ahk" ; mail   "C:\Program Files (x86)\Microsoft Office\Office16\outlook.exe"
#i::Run C:\Users\vth\Desktop\template2018\ahk\importSDcard.bat ; fotos van Sd kaart verplaatsen
#n::Run C:\Users\vth\Desktop\template2018\ahk\msoftnieuwemagazijnaanvraag.ahk
#c::Run, "C:\Users\vth\Desktop\template2018\ahk\checklijstopenenexcel.ahk"
#o::Run T:\voor vincent
#t::Run C:\Users\vth\Desktop\template2018\macros\serieverpak2020.xlsm ; 
; #l::Run T:\voor vincent  ; werkt niet windows+L = logoff !
#^::Run, "C:\Users\vth\Desktop\template2018\ahk\msoft1elijntabelcopieren.ahk" ; voor projecten en kzb te maken , kopiert een kb regel uit msoft naar serieverpak of naar kzb.xls
#,::Run, "C:\Users\vth\Desktop\template2018\ahk\msoftmaKiesitemuitDB.ahk" ;  msoftmaNextAanvraag  win+komma op 3puntjes klikken in mag.aanvraag
#h::Run "C:\Users\vth\Desktop\template2018\ahk\fotoscrollermsoft.ahk" ; elke sec pijltje omlaag typen om in msoft prentjes te zoeken
#g::Run "C:\Users\vth\Desktop\template2018\ahk\msoftprojectenmsoft.ahk" ; data opzoeken voor kb en serienrs te genereren
#z::Run, "C:\Users\vth\Desktop\template2018\ahk\msoftpartlisttonen.ahk" ; parlist tonen
#y::Run, "C:\Users\vth\Desktop\template2018\ahk\nrs-LijnVrijgeven.ahk" ; nrs vrijgeven lijn objectdata
Scrolllock::#d  ;desktop nog rapper tonen met de srollock toets scrollock remapped naar windows+d
Pause::Run C:\Users\vth\Desktop\template2018\ahk\clipprojectopenen.ahk 
#f1::Run, "C:\Users\vth\Desktop\template2018\macros\procedurewizard.lnk"
#f2::Run, "C:\FirefoxPortable\FirefoxPortable.exe"
#f3::Run, "C:\Users\vth\Desktop\template2018\ahk\msoftopstarten.ahk"
#f4::Run, "C:\Users\vth\Desktop\template2018\ahk\nrsopstarten.ahk"
#f5::Run, "C:\Users\vth\Desktop\template2018\ahk\tooltipmouspost.ahk"    ; debug tool soort spy voor mousepositie
#f7::Run, "C:\Program Files (x86)\Microsoft Office\Office16\excel.exe"
#f8::Run C:\Tools\Notepad++\notepad++.exe ;C:\Users\vth\Desktop\template2018\portableApps\Notepad++Portable\Notepad++Portable.exe ;
#f9::Run C:\WINDOWS\system32\mspaint.exe
#f10::Run calc.exe
#f11::Run, "C:\Users\vth\Desktop\template2018\ahk\ujob-gisteren.ahk"
#f12::Run, "C:\Users\vth\Desktop\template2018\ahk\ujob-inputvandaag.ahk"
^f5::Run C:\MySandbox ; virtuele omvirement in verkenner  ;control+f5
^f6::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirement.ahk"
^f7::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirementpostscan.ahk"
^f8::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirementGUI.ahk"
^f9::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirementMAKE.ahk"
^f10::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirementFINAL.ahk"
^f11::Run, "C:\Users\vth\Desktop\template2018\ahk\virtualenvirementUSB.ahk"
#Numpad0::Run, "C:\Users\vth\Desktop\template2018\ahk\msoftdocumenten2.ahk" ; steek een pv in documenten van msoft ,sta in artikelen
#Numpad1::Run, "C:\Users\vth\Desktop\template2018\ahk\nrsobjectdatamaploknrklembord.ahk" ; sta in nrs in objectdate op de lijn van u PV
#Numpad2::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportHfpriGewoon.ahk" ; hfpri 20x7
#Numpad3::Run "C:\Users\vth\Desktop\template2018\ahk\unmount.ahk"        ; unmount usbstick
#Numpad4::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportComplabel.ahk" ; 
#j::Run C:\Users\vth\Desktop\template2018\ahk\nrsnieuwd5.ahk  ;(toetsenbordlabel = nieuwPV) uitleg = nieuw pv  D5 docx-object in  nrs 
#r::Run C:\Users\vth\Desktop\template2018\ahk\nrsnieuwlabel.ahk  ; uitleg = nieuw label-object  L1 in  nrs 
#Numpad5::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportDraadlabel.ahk" ;   label importeren
#Numpad6::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportHoofdcomplabel.ahk" ;   label importeren
#Numpad7::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportBedienlabel.ahk" ;   label importeren
#Numpad8::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportLutzelabel .ahk" ;   label importeren
#Numpad9::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportKabellabel.ahk" ;   label importeren
#NumpadDot::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportComplabel.ahk" ;   label importeren ClipprojectImportComplabel
#NumpadMult::Run, "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportGrijsKZBHomo.ahk"
#NumpadDiv::Run, "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportGrijsKZBgewoon.ahk"
#NumpadAdd::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportGrijsKlein.ahk" ;  grijs klein serienr label importeren 
#NumpadSub::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportVerpaklabel.ahk" ;
#Numlock::Run "C:\Users\vth\Desktop\template2018\ahk\ClipprojectImportGrijsKZBusb.ahk" ;
#Insert::Run C:\Users\vth\Desktop\template2018\macros\bestekgenerator.xlsm
#Home::Run C:\Users\vth\Desktop\template2018\optischeblok-kolomen-lensfronten.xlsm
#PgUp::Run C:\Users\vth\Desktop\template2018 ; map met templates openen
#PgDn::Run C:\Users\vth\Desktop\template2018\projectlabelaar.xlsm
#End::Run, C:\Users\vth\Desktop\template2018\ahk\msofttabelexportandConcattofile.ahk ;
^End::Run, C:\Users\vth\Desktop\template2018\ahk\msofttabelexportandConcattofileMsoft.ahk ; msofttabelexportandConcattofile Msoft.txt
#Delete::Run C:\Users\vth\Desktop\template2018\ahk\verkennersSLuiten.ahk ; 8verkernners dooddoen
#Space::Run, C:\Users\vth\Desktop\template2018\ahk\MsoftstuklijsttoevoegennieuwArtikel.ahk ; in vervangen ve partlijst, aanpassen
#LControl::Run, C:\Users\vth\Desktop\template2018\ahk\pdmverkenner.ahk ;  ; Run C:\LET_VAULT\AUTOMOTIVE ;pdm

#&::Run, C:\Users\vth\Desktop\template2018\ahk\Msoftcompareartikel1.ahk ; compare artikel in bestand1 toets1 op klavier
#é::Run, C:\Users\vth\Desktop\template2018\ahk\Msoftcompareartikel2.ahk ; compare artikel in bestand2 toets2 op klavier
#"::Run, C:\Users\vth\Desktop\template2018\ahk\ClipElecWaPasPrintenEnLogRename.ahk ; elec waterpas printen en log resetten toets3 op klavier


#'::Run, C:\Users\vth\Desktop\template2018\macros\aanpassenToolmetAcceswijzigenEnMsoft.xlsm ; script die de gui van psp acces invult: toets4 op klavier  : 
#(::Run, C:\Users\vth\Desktop\template2018\ahk\msoftpartlistsExporteren.ahk ; script partlist in een filezet: toets5 op klavier  : ;msoftpartlistsExporteren




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


#x::
{
	SetScrollLockState, off
	Send, kabdr{ENTER}
	ToolTip  ; wissen oude tooltips
	Return
}              