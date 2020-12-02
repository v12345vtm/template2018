
;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
   Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
   scriptnaam :="fotoscrollermsoft"   
   FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
       Sleep 300,



 CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates: 

Loop, 100
{
   ; MsgBox, Iteration number is %A_Index%.  ; A_Index will be 1, 2, then 3
   Send,  {DOWN}
    Sleep, 100
	 Send,  {DOWN}
    Sleep, 100
	 Send,  {DOWN}
    Sleep, 700
	ToolTip, FOTOSCROLLING pijltje omlaag elke seconde ESCAPE om te stoppen,170 , 950
}

MsgBox, Iteration number is %A_Index%.  ; A_Index will be 1, 2, then 3


ExitApp ; dit is onze laatste stap na de herhaalloop


ExitSub:
{
BlockInput, MouseMoveOff
MsgBox "EXIT-"%scriptnaam%
ExitApp
return
}



 

ESC::Goto ExitSub



