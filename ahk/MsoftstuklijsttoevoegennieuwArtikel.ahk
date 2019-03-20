 ; Deelfasen (Productiegegevens - Prod. schema)
  {
	  BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
Sleep 100,
SetTitleMatchMode 2
	 CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:  
	
;InputBox, uservariabele, goed voor ene keer,in principe zou het beter hardcoded zijn de parameter die we willen toevoegen,
;if ErrorLevel
;{
   ; MsgBox, CANCEL was pressed.
  ;  exitapp
;}
;else
;{
  ;  MsgBox, You want to unmount USB  "%uservariabele%"	OR press esc to escape (program breaks if path is not found)
;MsgBox % "nu een loop van  " . StrLen(uservariabele) 
;}  
	  
	  

 If WinExist("Deelfasen (Productiegegevens - Prod. schema)")
{
	;MsgBox, u venster is open	, en ik zal het vooraan zetten
	ToolTip, u programma Deelfasen (Productiegegevens - Prod. schema) is open   `n  en de pc gaat strax op nieuw drukken ,170 , 950
	WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
Sleep 200,
MouseClick, left,  95,  555 ; op knop nieuw gaan staan
Sleep 1500 ; Materiaal (Fases per Artikel - Materiaal) venster opent





 If WinExist("Materiaal (Fases per Artikel - Materiaal)")
{
WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben

; nu willen we op de 3puntjes drukken
MouseClick, left,  88, 50;  en dan opent AUTO - Artikelen  -  LET Automotive n.v.



 If WinExist("AUTO - Artikelen  -  LET Automotive n.v")
{
;WinActivate  ; venster aktief zetten artikelen maar tis nu een 2e instantie !!

;hier kunnen we ons artiken typen die we willen toevoegen

Send {Tab}
Send {Tab}

Send  NIPP-P07,0-MS-AFGEROND{Enter}
;Send %uservariabele%{Enter}
Sleep 1500 ; wacht tot db het vind
Send {Enter}



}

else

{
	MsgBox, exit AUTO - Artikelen  -  LET Automotive n.v niet gezien1
ExitApp

}






 




}
else

{
	MsgBox, exit venster niet gezien1
ExitApp
}




	
	
	
	
	
Sleep 2200,	
;ExitApp ; debug
	
}
else
{
	MsgBox, u venster Deelfasen (Productiegegevens - Prod. schema)  zie ik niet !! open het eerst zelf
ExitApp
} 
    






  



;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
MsgBox Deelfasen (Productiegegevens - Prod. schema) 
ExitApp
return
}
ESC::Goto ExitSub





}