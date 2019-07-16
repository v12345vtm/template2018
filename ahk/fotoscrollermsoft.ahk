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
MsgBox emergencystop fotoscrolling
ExitApp
return
}



 

ESC::Goto ExitSub



