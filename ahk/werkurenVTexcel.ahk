;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
   Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
   scriptnaam :="werkurenVTexcel"   
   FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
       Sleep 300,





ToolTip, "starting-"%scriptnaam%,170 , 950
Run C:\Users\VTH\Desktop\VT.xlsx
Sleep 300
Run https://utime.cosmotime.be/login.php?action=session
 
 
 
 
 
 
 
 
 
 
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