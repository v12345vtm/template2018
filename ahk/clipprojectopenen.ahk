{
 
    BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  Sleep 100, ;1500
   CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
  


   SetTitleMatchMode 2
 If WinExist("CLIP PROJECT")
{
	;MsgBox, u venster is open	, en ik zal het vooraan zetten
	ToolTip, u programma CLIP PROJECT  is open `n  	 en ik zal het vooraan zetten   `n   voila! ,900 , 500
	 WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
	 Sleep 200,  ; 2000
; ExitApp ; debug
	
}
else
{
	;MsgBox, u venster  zie ik niet	, maar ik ga het openen voor u
	
	  
ToolTip, clipproject openen-ahk  `n   starting  : programma CLIP PROJECT  ,900 , 500
Sleep 100,
Run C:\Users\vth\Desktop\template2018\bibliotheek\verpakking-letline.mtp ; we starten een label op , werkt perfect om zo clip project te starten ;met de pause toets labeling prog starten
Sleep 6000,
ToolTip, clip project gestart,900 , 500
Sleep 100, ; 2000

 
	
	
ExitApp
} 
    
Sleep 100, 






;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
MsgBox emergencystop clipproject openen-ahk
ExitApp
return
}
ESC::Goto ExitSub





}