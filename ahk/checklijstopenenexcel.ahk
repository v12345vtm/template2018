;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
   Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
   scriptnaam :="checklijstopenenexcel"   
   FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
       Sleep 300,





ToolTip, "starting-"%scriptnaam%,170 , 950
Run \\file01.letdeinze.lan\company\Letdata\data\02\0667\G\G03\G03020667N01_\algemeen.xlsx
 
 
 
 
 
 
 
 
 
 
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