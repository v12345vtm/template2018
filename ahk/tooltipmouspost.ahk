;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
   Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
   scriptnaam :="tooltipmouspost"   
   FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
       Sleep 300,





 CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:



;MsgBox, The cursor is at X%xpos% Y%ypos%. 

; This function allows you to move the mouse around to see
; the title of the window currently under the cursor:
#Persistent
SetTimer, WatchCursor, 100
return




WatchCursor:
MouseGetPos, xpos, ypos  ; default lezen we de mousepos op active window
WinGetTitle, Title, A


CoordMode, Mouse, Screen ; zet de muispositie op de funtcie scherm ipv op activewindow
MouseGetPos, xtemp, ytemp 


ToolTip, The cursor ifv aktieve window :is at X%xpos% Y%ypos% `n aktiefVenster=  %Title%   `n    scherm positie= op X%xtemp% Y%ytemp% 
return





CoordMode, Mouse, Screen
MouseGetPos, xtemp, ytemp 
MouseMove, 600, 70, 0
Sleep, 1000
MouseMove, % xtemp, % ytemp , 0












ExitSub:
{
BlockInput, MouseMoveOff
MsgBox "EXIT-"%scriptnaam%
ExitApp
return
}


 

ESC::Goto ExitSub