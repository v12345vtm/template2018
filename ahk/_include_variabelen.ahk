;; een variabele aanroepen is dan met %myvar% 
;; tidy Ahk online  : http://sl5.it/SL5_preg_contentFinder/examples/AutoHotKey/converts_your_autohotkey_code_into_pretty_indented_source_code.php

;PDM
;//ook een needle : Adres: C:\LET_VAULT\01. Automotive\03. Proj
wachtenOPprogram := "LET_VAULT" ; typ hier welk programma je wil openen en monitoren wat er mee gebeurd
pdmstartmap := "C:\LET_VAULT" ; welk dom programma moet je nu zo starten ?
knopvergrootglasx := 1845 ;  inactive window gemaximaliseerd
knopvergrootglasy := 116 ; inactive window gemaximaliseerd

zoekveldx := 460 ;  inactive window gemaximaliseerd
zoekveldy:= 193 ;  inactive window gemaximaliseerd
NeedlePdmGui := "CardPreview"
 



; AHK zelf
FormatTime, CurrentDateTime,, yyyyMMddHHmmss
myvar := "hello world"
myvar2 := 42

;//NRS
;programmaparameters zijn : LET   ahk_class OMain  ahk_exe MSACCESS.EXE    ahk_pid 14620

objectx := 94
objecty := 188
objectdatax := 236
objectdatay := 190
sluitenx := 1880
sluiteny := 984
inputletrefx := 133
inputletrefy := 936
objectoverzichtx := 34
objectoverzichty := 90
bovenstelijnx := 772
bovenstelijny := 239


;:ujob

eendagTerugx := 190 ; 311
eendagTerugy := 55 ; 190
tiknrx := 640 ; 815
tiknry:= 120 ; 250
totaalx:= 665 ; 760
totaaly:= 420 ; 550



;//PC variabelen


;logins
msoftPaswoord := "vith123"
ujobLogin := "1302.50"
ujobPaswoord := "vith123"
nrsLogin := "vth"
nrsPaswoord := "vith123"
redmineLogin := "vth"
redminePaswoord := "vithvitH15"
cloudconvertDotComLogin := "vithprodlet"
LetConnectLogin := "vincent theuninck"
LetConnectPaswoord := "12345678"

;Msoft
hoeveelse_regel_staat_prog_projecten := 7
hoeveelse_regel_staat_prog_artikelen := 2
checkif_exists_serieverpak := "serieverpak2021.xlsm - Excel"
checkif_exists_kzb := "kzb.xlsm - Excel"

;clipproject
label_ID_verp := 34
label_ID_bedien := 10
label_ID_comp := 11
label_ID_draad := 15
label_ID_kleingrijs := 29
label_ID_kzbgewoon := 6
label_ID_kzbhomo := 5
label_ID_kzbukca := 9
label_ID_witusb := 7
label_ID_hfpri20x7 := 26
label_ID_hoofdcomp := 12
label_ID_kabel := 16
label_ID_lutze := 18
NeedleLabelZelfAanhetEditen := "Current selection does not support all settings."



;fileserver en mappen en folders en bestanden
ujobEXE := "C:\Users\vth\Desktop\ujoblet.jar - Snelkoppeling.lnk" 
AhkLogbestand := "C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt"
msoftEXE := "C:\Users\Public\Desktop\M-Soft 11.7 (ERP01).lnk" ; spatie in de string pakt niet
octopibestand := "C:\Users\vth\Desktop\template2018\macros\octopiinstaller.xlsm" ; virt env
compare_een := "C:/Users/vth/Desktop/template2018/temp/compare1.txt" ; msoftcompare
compare_twee := "C:/Users/vth/Desktop/template2018/temp/compare2.txt" ; msoftcompare
grep_xls := "C:\Users\VTH\Desktop\template2018\macros\grep.xlsm" ; msoftcopare
compare_een_split  := "C:/Users/vth/Desktop/template2018/temp/compare1-split-grep.txt"  ; msoftcopare
compare_twee_split := "C:/Users/vth/Desktop/template2018/temp/compare2-split-grep.txt"  ; msoftcopare
wis_kolom_v_comp_een := "C:\Users\vth\Desktop\template2018\ahk\wisKolommenVanCompare1.bat" ; output die we zijn in notepad++
wis_kolom_v_comp_twee := "C:\Users\vth\Desktop\template2018\ahk\wisKolommenVanCompare2.bat" ; output die we zijn in notepad++
notepad_plusplusEXE := "C:/Tools/Notepad++/notepad++.exe"
checklijst_bestand := "\\file01.letdeinze.lan\company\Letdata\data\02\0667\G\G03\G03020667N01_\algemeen.xlsx" ; win+c
fileserver_waterpas_folder := "T:\PRODUKTIE\SOFTWARE\Transfer\Electronische Waterpas\" ;clipelecwapas
outlookEXE := "C:\Program Files (x86)\Microsoft Office\Office16\outlook.exe" ; mail
algemeen_mtp_bestand := "C:\Users\vth\Desktop\template2018\bibliotheek\verpakking-letline.mtp" ; veel gebruikte template 
nrsEXE := "L:\Letdata\database\versie_H (Jorosoft)\NRS\VTH\LetP.accdb"
importsdBAT := "C:\Users\vth\Desktop\template2018\ahk\importSDcard.bat"
jefavorietebrowser := "C:\Users\VTH\Desktop\template2018\portableApps\FirefoxPortable\FirefoxPortable.exe"
;initiele welkom en infotexten

;MsgBox "includehier"


;openbare functies
 
 
 
wachtEenBeetje(x) {  
Tooltip ** ,,,18
Sleep x/6
Tooltip **** ,,,18
Sleep x/6
Tooltip ***** ,,,18
Sleep x/6
Tooltip ** ,,,18
Sleep x/6
Tooltip **** ,,,18
Sleep x/6
Tooltip ****** ,,,18
Sleep x/6   ; een animerende cursor  op TooltipNR18 die wacht , volgens de duurtijd vd ontvangen parameter
Tooltip ,,,18
  return  
}




SerialPrintln(x){
FileAppend, %x% `n, C:/Users/vth/Desktop/template2018/logfiles/serialprintahkDebug.txt ;save naar txt file concat
Sleep 900,
}


ActiveVensterNaam(){
;returns the active venster 
WinGetTitle, Title, A
return Title
}




ActiveVensterAHKspy(needle){
;returns the active venster
WinGetText, ahkspy_data, a ; check inhoud v huidig window , returne true of false
If InStr(ahkspy_data, Needle)
   { 
 Tooltip **ja*** ,,,18
   return true
   }
   else{
  Tooltip ***nee** ,,,18
  return false
}
}

bestaatHetVenster(vensternaam , zetvooraan){
;returns the active venster

WinGet, t3, ProcessName ; steek de procesnam in variabele t3

SetTitleMatchMode, 2
If WinExist(vensternaam) or t3 ==vensternaam
   { 

If  (zetvooraan)
   { 
WinActivate
return true
   }	     

   
   }   
   else
   {
  return false
}
}







ProcessExist(Name){
	Process,Exist,%Name%
	return Errorlevel
}




actiefvensterklasseproces(){
;aktieftitle=  %Active_Title%   `n classe= %Active_KLASSE%   `n procesname= %Active_Process% 
WinGetTitle, Active_Title, A
WinGetClass, Active_KLASSE, A
   WinGet, Active_ID, ID, A ;temp
    WinGet, Active_Process, ProcessName, ahk_id %Active_ID%  
	;actiefvenstertitelklasseprocesconcat :=    Active_Title 
	actiefvenstertitelklasseprocesconcat :=   Active_KLASSE 
	actiefvenstertitelklasseprocesconcat .=    Active_Process
	return actiefvenstertitelklasseprocesconcat
	}




FindAndClickButton() {
;https://www.autohotkey.com/boards/viewtopic.php?f=76&t=58324&sid=982c015ba6e662508c2ac1a81e9cff05&start=20
;If the function finds the button it tries to click it and returns True (1), otherwise False (0). You might want to try whether it does what you want.

   WinTitle := "Sage 50 Accounts Professional - GRP(UK)LTD"    ; the window's title
   BtnClass := "#SG32DTBUTTON"                                 ; the fix leading part (the class name) of the ClassNN
   BtnText  := "EMail"                                         ; the button's caption
   WinGet, CtrlList, ControlListHwnd, %WinTitle%
   Loop, Parse, CtrlList, `n
   {
      HWND := A_LoopField
      WinGetClass, CtlClass, ahk_id %HWND%
      If (CtlClass = BtnClass) {
         ControlGetText, CtlText, , ahk_id %HWND%
         If (CtlText == BtnText) {
            ControlClick, , ahk_id %HWND%
            Return True
         }
      }
   }
   Return False
}



