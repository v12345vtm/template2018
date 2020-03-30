

;INIT ahk 	elke export zetten we in ons exportbestand , dat is een vaste output filename.
scriptnaam :="msoftaanpassenstuklijst"  
BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

;; export to log
FormatTime, CurrentDateTime,, yyMMddHHmmss
timestampel:= CurrentDateTime  ; om een ahk property op te slaan naar ahk variabele geen %% nodig
FileAppend,  %timestampel% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
Sleep 300,


;;pre-start en variabelen
;artikelomschrijving

CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates
SetKeyDelay, 50 ; hoe rap stuur je typcommandos  
 
Loop, 1
{
	ToolTip,     %scriptnaam%  = in Msoft artikelen staan   ; ahk variabele oproepen moet met %% 
	Sleep, 1000
}

;;;START

 

SetTitleMatchMode 2
If WinExist("AUTO - Artikelen")
{
   ;MsgBox, u venster is open	, en ik zal het vooraan zetten
   ToolTip, u programma AUTO - Artikelen is open `n  	 en ik zal het vooraan zetten   `n   voila! ,170 , 950
   WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
   Sleep 100,  
   
   Send, +{F9}   ; venster openen  - shift f9
   Sleep 500, 
   
   Send,  {Tab 9} 
   Sleep 200,
   
   Send,  {Right}
 
 
	Loop, 4
	
	{
		ToolTip, wachten op nieuw venster    %A_Index%  /1.6 seconden    ; A_Index will be 1, 2, then 3
		Sleep, 400
	}
   
   ;>>>>>>>>>>( Window Title & Class )<<<<<<<<<<<
   ;AUTO - Artikelen  -  LET Automotive n.v. (AUTO - Artikelen  -  LET Automotive n.v.)
   ;ahk_class ProMainWin
   
   If WinExist("AUTO - Artikelen  -  LET Automotive n.v. (AUTO - Artikelen  -  LET Automotive n.v.)")
   {
      ;MsgBox, u venster is Deelfasen is open
      ToolTip, u tabblad Deelfasen is voorraan ,170 , 950
      ;MouseMove, 52, 150 ; op de lijn gaan staan  PROD productie
      ;Sleep 200, ;200ipv500
      ;MouseClick, left
      ;MouseClick, left
      
      Send,  {Enter}  ; we klikken op enter om PROD te openen
      Sleep 1000,     ; wachten tot venster opent
	  
      ;we klikken op rij produktie vbd tabel
      ;Send, {Tab 5}{Right}{Tab 4}{Right}{Tab 6}{Right}{Tab}
     ; Sleep 300,
      
      Send, {Tab 5}  ; nu is tabblad algemeen van venster deelfasen vooraan
      Sleep 200,
      
      Send,  {Right}  ; tab vertaling
      Sleep 200,
      
      Send,  {Tab 4} 
      Sleep 200,
      
      Send,  {Right} ;tab personeel
      Sleep 20,
      
      Send,  {Tab 6} 
      Sleep 200,
      
      Send,  {Right}  ; tab matriaal
      Sleep 200,
      
      Send,  {Tab}
      Sleep 300,
      
      
      ToolTip, pas maar aan
      Sleep 1000, ; 3000
      
     ; Sleep 5000
      ExitApp ; debug
   }
   else
   {
      MsgBox, venster is er niet - oei oei wss is de pc te traag geweest druk ok om exitapp te doen
      ExitApp
   }
   }
   else 

   {
   MsgBox, u venster  AUTO - Artikelen  zie ik niet !! open het eerst zelf
   ExitApp
} 







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