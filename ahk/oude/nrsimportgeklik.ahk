;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
   Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
   scriptnaam :="nrsimportgeklik"   
   FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
       Sleep 300,





; win + num2
{

   BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  Sleep 500,
   CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
    
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
BlockInput, MouseMoveOff
MsgBox "EXIT-"%scriptnaam%
ExitApp
return
}


 

ESC::Goto ExitSub