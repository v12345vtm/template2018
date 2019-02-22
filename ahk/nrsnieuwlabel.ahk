
;windows r
{
MouseClick, Right
Sleep 100,
Send {Down 1}
Send {Enter}

;wacht tot venster open is en ga op de knop selecteer staan
Sleep 2000,
MouseMove, 760,590
Sleep 100,


;ingeven parameters
Send l
Send {Tab}

Send l1
Send {Tab}

Send n
Send {Tab}

Send Installatielabel : 





Return
}