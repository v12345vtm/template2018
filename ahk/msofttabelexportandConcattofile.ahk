
;	elke export zetten we in ons exportbestand , dat is een vaste output filename



 
;INIT ahk 	elke export zetten we in ons exportbestand , dat is een vaste output filename.

scriptnaam :="msofttabelexportandConcattofile win+END klembord1"  
;BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

;; export to log
FormatTime, CurrentDateTime,, yyMMddHHmmss
timestampel:= CurrentDateTime  ; om een ahk property op te slaan naar ahk variabele geen %% nodig
FileAppend,  %timestampel% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
Sleep 300,

 

;;pre-start en variabelen
 

CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates
SetKeyDelay, 500 ; hoe rap stuur je typcommandos  
 
Loop, 3
{
	ToolTip,     %scriptnaam%  enkel in/op msoft tabel doen  (vb partlist)  %A_Index%    ; ahk variabele oproepen moet met %% 
	
	 Sleep, 100
}



;;;START

 
 
 ;msoft is ahk_class ProMainWin
 
 
 If WinExist("ahk_class ProMainWin")
{
	;WinActivate
	;Sleep 200,
	
	Loop, 6
{
	ToolTip,     %scriptnaam% we staan in msoft  %A_Index%    ; ahk variabele oproepen moet met %% 
	 Sleep, 50
}



;if Detail Materiaalkosten 2x up







MouseClick, Right
Sleep 100,

Send, {Up}
Sleep 100,

Send, {Up}
Sleep 100,


Send, {Enter}
Sleep 1400,


	Loop, 6
{
	ToolTip,     %scriptnaam% saving tabel in klembord...  %A_Index%  /3sec  ; ahk variabele oproepen moet met %% 
	 Sleep, 500
}
	
	;OnClipboardChange:
FileAppend, `n%clipboard%`n,  C:/Users/vth/Desktop/template2018/logfiles/klembord1.txt ;save naar txt file

Sleep 100,
Run  C:/Users/vth/Desktop/template2018/logfiles/klembord1.txt 
	
	
	}
	
	else
	
	{
	
	
	Loop, 6
	{
	ToolTip,     %scriptnaam% geen msoft gezien %A_Index%    ; ahk variabele oproepen moet met %% 
	 Sleep, 500
}
	}
 


 


;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
BlockInput, MouseMoveOff
MsgBox "EXIT-"%scriptnaam%
ExitApp
return
}
#::Goto ExitSub
