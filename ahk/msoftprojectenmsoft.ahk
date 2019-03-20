;win+g

    
    BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  Sleep 1500,
   CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
  


ToolTip, projecten in msoft om info voor serienrs te maken  `n   vraagt de gebruiker om prod.fiche inte geven en de pc opent de juiste excelmacro ,244,101
Sleep, 1500



   SetTitleMatchMode 2
 If WinExist("AUTO - Projecten")
{
	;MsgBox, u venster is open	, en ik zal het vooraan zetten
	ToolTip, u programma AUTO - Projecten is open `n  	 en ik zal het vooraan zetten   `n   voila! MAAR hopelijk heb je een maagdelik nieuwe lijst en stond er niks ingevuld ,170 , 950
	WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
;ExitApp ; debug
	
}
else
{
	MsgBox, u venster  AUTO - Projecten  zie ik niet !! open het eerst zelf
ExitApp
} 
    
Sleep 1500,  









	InputBox, kbepnummer, welke produktie fische wil je opvragen? ,zorg dat je een maagdelijk nieuwe tabel hebt 
if ErrorLevel
{
    MsgBox, CANCEL was pressed.
    exitapp
}
else
   ; MsgBox, You entered "%kbepnummer%"


	
;%MyInput%	
Send %kbepnummer% ; vul het in , en door toeval is ons textvak al aktief in msoft , we gebruiken dat in ons voordeel nu hier
Sleep, 500
Send {ENTER} ; enteren kb ep nummer
Sleep, 500	  ; de kans is dat het een oud nummer is en je nu geen resultaat ziet op je lijst op scherm

;activeren oude dosiers 
Send {ALT}
Sleep, 500	
Send o
Sleep, 500	
Send {DOWN 12}
Sleep, 500	
Send {ENTER}
Sleep, 500	 ; oude dossiers worden weergegeven

; soms kan het zijn dat een kb nog niet is vertoond in de lijst , dan moet je alle statuten selecteren met shift+f8 te duwen
Send, +{F8} 
Sleep, 1500	 ; alle statuten ook getoond nu


	
	

ToolTip, de 1e lijn is hier - ja he we gaan de tabel copieren! ?,244,101
Sleep, 500
MouseMove, 244,101 ; op 1e regel gaan staan en dan tabel kopieren
Sleep, 1500
ToolTip, rechterklik
MouseClick, Right
Sleep, 1500

 ;ExitApp ; debug

Send {UP 2}
Sleep, 500
Send {ENTER}
Sleep, 500	 ; de lijst in klembord gezet




;we willen weten welke excel we moeten openen , adhv de nr die we intypten , zijn eerste 2 letters , vb kb of ep
;normaal ist altijd serienummers , behalve als het kb is.

 
;MsgBox % SubStr(kbepnummer, 1, 2)  ; toon de 1e 2 letters van je dossiernr

if (SubStr(kbepnummer, 1, 2) = "kb")
{
   ; MsgBox tis ne klaarzetbon we open ons excel file direct
   ToolTip, tis ne klaarzetbon we open ons excel file direct,244,101
	;Send, #k
Run C:\Users\vth\Desktop\template2018\macros\kzb.xlsm
	Sleep, 6000
	
    ExitApp
}
else
{
 ; MsgBox tis ne ep hf epvk enz we open ons excel file direct
     ToolTip, tis ne ep hf epvk enz we open ons excel file direct,244,101
  Run C:\Users\vth\Desktop\template2018\macros\serieverpak5.xlsm
  ;Send, #t
  Sleep, 6000
    ExitApp
}




;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
MsgBox emergencystop projecten openen v msoft
ExitApp
return
}
ESC::Goto ExitSub



