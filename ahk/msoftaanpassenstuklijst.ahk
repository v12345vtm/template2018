;comment AANPASSEN  = win+ S = msoft deelfases produktie; shiftF9 , 9keer tab , pijltje rechts
CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
ToolTip, aanpassenstuklijst-ahk = in Msoft artikelen,170 , 950
BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
Sleep 100,

SetTitleMatchMode 2
If WinExist("AUTO - Artikelen")
{
   ;MsgBox, u venster is open	, en ik zal het vooraan zetten
   ToolTip, u programma AUTO - Artikelen is open `n  	 en ik zal het vooraan zetten   `n   voila! ,170 , 950
   WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
   Sleep 100,  
   
   Send, +{F9}   ; venster openen
   Sleep 500, 
   
   Send,  {Tab 9} 
   Sleep 200,
   
   Send,  {Right}
   Sleep 500,
   
   ;>>>>>>>>>>( Window Title & Class )<<<<<<<<<<<
   ;AUTO - Artikelen  -  LET Automotive n.v. (AUTO - Artikelen  -  LET Automotive n.v.)
   ;ahk_class ProMainWin
   
   If WinExist("AUTO - Artikelen  -  LET Automotive n.v. (AUTO - Artikelen  -  LET Automotive n.v.)")
   {
      ;MsgBox, u venster is Deelfasen is open
      ToolTip, u venster is Deelfasen is open ,170 , 950
      ;MouseMove, 52, 150 ; op de lijn gaan staan  PROD productie
      ;Sleep 200, ;200ipv500
      ;MouseClick, left
      ;MouseClick, left
      
      Send,  {Enter}  ; we klikken op enter om PROD te openen
      Sleep 500,
      
      ;we klikken op rij produktie vbd tabel
      ;Send, {Tab 5}{Right}{Tab 4}{Right}{Tab 6}{Right}{Tab}
      Sleep 300,
      
      Send, {Tab 5} 
      Sleep 200,
      
      Send,  {Right} 
      Sleep 200,
      
      Send,  {Tab 4} 
      Sleep 200,
      
      Send,  {Right} 
      Sleep 20,
      
      Send,  {Tab 6} 
      Sleep 200,
      
      Send,  {Right} 
      Sleep 200,
      
      Send,  {Tab}
      Sleep 300,
      
      
      ToolTip, pas maar aan ,170 , 950
      Sleep 1000, ; 3000
      
      :Sleep 5000
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
   MsgBox emergencystop aanpassenstuklijst-ahk
   ExitApp
   return
}
ESC::Goto ExitSub              