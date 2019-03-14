;https://github.com/v12345vtm/template2018
;10okt2018 , control+pageup voor te scrollen in tabs en shifttab
;nieuw artikel toevoegen mousemove moet je loggen in windowSpy ,x -5 en de y waarde -25 doen 110,130 word 105,105

SetScrollLockState, off
#KeyHistory 500  ; Store up to 500 events.


SetTitleMatchMode, 2
#Persistent
SetTimer, SendHotkey, 300
return


SendHotkey:
  If WinExist("AutoCAD LT Alert")
       {
WinActivate
Send, {Enter}
;MsgBox, AutoCAD LT Alert is open
}
return
;;;;;;;;;;;;;;;;;;;;;;;;;


#-::
{
code:= vithvitH15
clipboard:= code
ClipWait
Send %clipboard%
Return
}

 

#q::
{Send, 0127-04{Enter}
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

#e::Run C:\
#f::Run C:\sdkardbatch
#p::Run L:\Letdata\Projects
#k::Run C:\Users\vth\Desktop\template2018\macros\kzb.xlsm  
#a::Run C:\Users\vth\Desktop\template2018\macros\afkeurbonwizard2.xlsm ;C:\aa\afkeurbonwizard2.xlsm
#s::Run C:\Users\vth\Desktop\template2018\ahk\msoftaanpassenstuklijst.ahk
#v::Run C:\Users\VTH\Desktop\VT.xlsx
#m::Run, "C:\Users\vth\Desktop\template2018\ahk\mail.ahk" ; mail   "C:\Program Files (x86)\Microsoft Office\Office16\outlook.exe"
#i::Run C:\Users\vth\Desktop\template2018\ahk\importSDcard.bat ; fotos van Sd kaart verplaatsen
#n::Run C:\Users\vth\Desktop\template2018\ahk\msoftnieuwemagazijnaanvraag.ahk
#c::Run \\file01.letdeinze.lan\company\Letdata\data\02\0667\G\G03\G03020667N01_\algemeen.xlsx
#o::Run T:\voor vincent
#t::Run C:\Users\vth\Desktop\template2018\macros\serieverpak2019.xlsm ;C:\aa\msoft2serienrs5.xlsm
; #l::Run T:\voor vincent  ; werkt niet windows+L = logoff !
#^::Run, "C:\Users\vth\Desktop\template2018\ahk\msoft1elijntabelcopieren.ahk" ; voor projecten en kzb te maken
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
#f8::Run C:\Tools\Notepad++\notepad++.exe
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
#End::Run C:\Users\vth\Desktop\template2018\optischeblok-kolomen-lensfronten.xlsmvrij
#Delete::Run C:\Users\vth\Desktop\template2018\optischeblok-kolomen-lensfronten.xlsmvrij
#Space::Run, "C:\Users\vth\Desktop\template2018\ahk\MsoftstuklijsttoevoegennieuwArtikel.ahk"



#u::
{ 
SetScrollLockState, off
;open pdf uurkaarten wacht 500ms en control+p drukken
Run C:\aa\uurkaarten.pdf
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
 ToolTip, ALG19 typen ,303,750
SetScrollLockState, off
Send, ALG19
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


