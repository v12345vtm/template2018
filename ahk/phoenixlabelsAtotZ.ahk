SetTitleMatchMode, 2
WinActivate, CLIP PROJECT
WinWaitActive, CLIP PROJECT

MouseClick, left,  1077,  16
Sleep, 200
MouseClick, left,  1042,  229
Sleep, 200

Send, {CTRLDOWN}a{CTRLUP}
;op knop A-z drukken
MouseClick, left,  680,  76
Sleep, 100

SetTitleMatchMode, 2
WinActivate, CLIP PROJECT
WinWaitActive, CLIP PROJECT


; op lege labels wissen drukken
MouseClick, left,  605,  45
Sleep, 100