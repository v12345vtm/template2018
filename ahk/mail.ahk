 ;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
   Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
   scriptnaam :="mail.."   
   FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
       Sleep 300,
 
 
 
 
 
 CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
  ToolTip, mail-ahk = mail openen,170 , 950

  ; BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
 ; Sleep 200,

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
