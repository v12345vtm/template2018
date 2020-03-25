;INIT ahk 	elke export zetten we in ons exportbestand , dat is een vaste output filename.
scriptnaam :="mail"  
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
	ToolTip,     %scriptnaam%  opstarten  ; ahk variabele oproepen moet met %% 
	Sleep, 1000
}

;;;START







SetTitleMatchMode, 2
If WinExist("Outlook")
		{	
		WinActivate
;MsgBox ja
			}
			
			
			else
			
			{
			;MsgBox nee
			Run, "C:\Program Files (x86)\Microsoft Office\Office16\outlook.exe"
Sleep, 500


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
ESC::Goto ExitSub
