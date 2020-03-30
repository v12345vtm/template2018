;INIT ahk 	elke export zetten we in ons exportbestand , dat is een vaste output filename.
scriptnaam :="Clipprojectopenen"  
BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

;; export to log
FormatTime, CurrentDateTime,, yyMMddHHmmss
timestampel:= CurrentDateTime  ; om een ahk property op te slaan naar ahk variabele geen %% nodig
FileAppend,  %timestampel% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
Sleep 300,


;;pre-start en variabelen
;artikelomschrijving


CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
;  SetKeyDelay, 500 ; hoe rap stuur je typcommandos   
Loop, 1
{
	ToolTip,     %scriptnaam%  = in Msoft artikelen staan   ; ahk variabele oproepen moet met %% 
	Sleep, 1000
}

;;;START



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
	BlockInput, MouseMoveOff
	
	Loop, 10
	{
		ToolTip, wacht   om alles in te laden    %A_Index%  /10 seconden ,170 , 950  ; A_Index will be 1, 2, then 3
		;Sleep, 1000
	}

 BlockInput, MouseMove 
	  
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
BlockInput, MouseMoveOff
MsgBox "EXIT-"%scriptnaam%
ExitApp
return
}
ESC::Goto ExitSub





}