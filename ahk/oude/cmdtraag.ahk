  ;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
   Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
   scriptnaam :="testen-cmd"   
   FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
       Sleep 300,






  
  ;  BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  Sleep  500,
 CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:




	ToolTip, cmd starten , 170,950
Run C:\WINDOWS\SYSTEM32\cmd.exe ;soms duurt dat lang




	ToolTip, cmd starten normaal , 170,950
Sleep 900


  
  

 SetTitleMatchMode 2 ; parameter die nodig is voor winexist 
 If WinExist("C:\WINDOWS\SYSTEM32\cmd.exe")
  ;If WinExist("Opdrachtprompt")
{
	MsgBox, u venster is open	  en ik zal het vooraan zetten
	


;Run  C:\Users\vth\Desktop\template2018\macros\octopiinstaller.xlsm





	
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



