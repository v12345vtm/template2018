
; win + num2
{


 
;nieuw artikel toevoegen mousemove moet je loggen in windowSpy ,x -5 en de y waarde -25 doen 110,130 word 105,105
Sleep 300,
 
MouseClick, left, 1879, 197 ,1
Sleep 2300,

MouseClick, left, 145, 105 ,1
Sleep 2300,

MouseClick, left, 837, 650 ,1
Sleep 2300,

MouseClick, left, 1879, 172 ,1
Sleep 3500,

MouseClick, left, 236, 105 ,1
Sleep 3500,

MouseClick, left, 1870, 975 ,1
Sleep 2300,




 
ExitApp
Return
}


ExitSub:
{
MsgBox emergencystop
ExitApp
return
}


 

ESC::Goto ExitSub