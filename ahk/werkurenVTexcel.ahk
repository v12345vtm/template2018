#include C:\Users\VTH\Desktop\template2018\ahk\_include_variabelen.ahk  ; dit bestand staat op je lokale pc , maar de simultane copy runt vanaf fileserver , dus altijd direct adressering gebruiken


;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
   Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
   scriptnaam :="werkurenVTexcel"   
   FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
       Sleep 300,





ToolTip, "starting-"%scriptnaam%,170 , 950
Run C:\Users\VTH\Desktop\VT.xlsx
Sleep 100
Run %jefavorietebrowser% https://utime.cosmotime.be/login.php?action=session  ;C:\Users\VTH\Desktop\template2018\portableApps\FoxitReaderPortable\




	Loop, 7
	{
		ToolTip, wacht   om alles in te laden    %A_Index%  /7 seconden ,170 , 950  ; A_Index will be 1, 2, then 3
		Sleep, 1000
	}



If WinExist("U-Time Login - Mozilla Firefox")
	{
		ToolTip, verkleining U-Time Login - Mozilla Firefox!!  `n   voila! ,170 , 950
		
		WinActivate  ; venster aktief  mozilla
		
		Sleep 500
		WinGetPos,,, Width, Height, %WinTitle%	
		WinMove, %WinTitle%,, 0, 0 ,1000,1024   ; msoft naar left1280 top570  width620  height440	
		Sleep 100, 
		
		}
 
 ; VT.xlsx - Excel
 
 If WinExist("VT.xlsx")
	{
		ToolTip, verkleining VT.excel!!  `n   voila! ,170 , 950
		
		WinActivate  ; venster aktief VT.xlsx - Excel
		
		Sleep 500
		WinGetPos,,, Width, Height, %WinTitle%	
		WinMove, %WinTitle%,, 1000,  0 ,900,1024  ; msoft naar left1280 top 0  width620  height440	
		Sleep 1000, 
		
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