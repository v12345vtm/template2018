{


    
    BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  Sleep 1500,
  
  


   SetTitleMatchMode 2
 If WinExist("CLIP PROJECT")
{
	;MsgBox, u venster is open	, en ik zal het vooraan zetten
	ToolTip, u programma CLIP PROJECT  is open `n  	 en ik zal het vooraan zetten   `n   voila! ,303,750
	 WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
	 Sleep 2000,
; ExitApp ; debug
	
}
else
{
	;MsgBox, u venster  zie ik niet	, maar ik ga het openen voor u
	
	  
ToolTip, clipproject openen-ahk  `n   starting  : programma CLIP PROJECT  ,303,750
Sleep 100,
Run C:\a\verpakking-letline.mtp ; we starten een label op , werkt perfect om zo clip project te starten ;met de pause toets labeling prog starten
Sleep 6000,
ToolTip, clip project gestart,116,230
Sleep 2000,

 
	
	
ExitApp
} 
    
Sleep 1500, 






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