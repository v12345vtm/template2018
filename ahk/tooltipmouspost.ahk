#include C:\Users\VTH\Desktop\template2018\ahk\_include_variabelen.ahk  ; dit bestand staat op je lokale pc , maar de simultane copy runt vanaf fileserver , dus altijd direct adressering gebruiken
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
 

test := actiefvenstertitelklasseproces()



MouseGetPos, xpos, ypos  ; default lezen we de mousepos op active window

;aktieftitle=  %Active_Title%   `n classe= %Active_KLASSE%   `n procesname= %Active_Process% 
WinGetTitle, Active_Title, A
WinGetClass, Active_KLASSE, A
   WinGet, Active_ID, ID, A ;temp
    WinGet, Active_Process, ProcessName, ahk_id %Active_ID%  
	
	
	MouseGetPos,,,  id , NN
ControlGetText, Text, %NN% , ahk_id %id%  ; de text uitlezen vd knop als je boven een knop hangt
 
 
    MouseGetPos, , , WhichWindow, WhichControl
    ControlGetPos, x, y, w, h, %WhichControl%, ahk_id %WhichWindow%
  ;  ToolTip, %WhichControl%`nX%X%`tY%Y%`nW%W%`t%H%
	
CoordMode, Mouse, Screen ; zet de muispositie op de funtcie scherm ipv op activewindow
CoordMode, pixel,screen
MouseGetPos, xtemp, ytemp 
PixelGetColor Color, %xtemp%, %ytemp%, RGB
 

ToolTip, waar is de positie van een veld-knop %WhichControl%`nX%X%`tY%Y%`nW%W%`t%H%      `n text opde knop : %Text%  `n    alles= %test%  `n The cursor ifv aktieve window :is at X%xpos% Y%ypos% `n aktieftitle=  %Active_Title%   `n classe= %Active_KLASSE%   `n procesname= %Active_Process%  `n scherm positie= op X%xtemp% Y%ytemp%  kleur is %Color%
return





CoordMode, Mouse, Screen
MouseGetPos, xtemp, ytemp 
MouseMove, 600, 70, 0
Sleep, 1000
MouseMove, % xtemp, % ytemp , 0











;;noodstop
;ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
	BlockInput, MouseMoveOff ; muis los laten voor gebruiker
	
	MsgBox, 48, you pressed escape- , you pressed esc- `n`n "EXIT-"%scriptnaam% This message will self-destruct in 1 seconds., 1
	ExitApp
	return
}
ESC::Goto ExitSub              