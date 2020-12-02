
;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
   Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
   scriptnaam :="Msoftcomparebestand2"   
   FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
       Sleep 300,
	   
	   



ToolTip, MsoftCompare export een tabel of stuklijst naar bestand2TXT file,170 , 950
SetKeyDelay, 200 ; hoe rap stuur je typcommandos 
CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
  
if ErrorLevel
; MsgBox, CANCEL was pressed.
ExitApp
 
else
 
If WinExist("Detail Materiaalkosten")
{
  ; MsgBox ja in msoft-stuklijst bezig
    InputBox, UserInput, msoftSTUKLIJSTTabel2bestand2, ik zie dat je in stuklijsten staat  en je wil dus de stuklijst exporteren naar exportlijst., , 640, 480
  
	if ErrorLevel
{
    MsgBox, CANCEL was pressed.
   exitapp
}else  {
   
    BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
	ToolTip, MsoftCompare export een tabel of stuklijst naar bestand2TXT file,170 , 950
      
   MouseClick, Right
   Sleep 100,
    
   Send, {Up}
   Sleep 100,
    
   Send, {Up}
   Sleep 100,
    
    
   Send, {Enter}
   Sleep 1400,
    
   ;eerst je lijn met je commentaar wegschrijven    
   file := FileOpen("C:/Users/vth/Desktop/template2018/logfiles/compare2.txt", "w")
   TestString := ".`r`n"  ; to start a new line. nieuwe regel 
   file.Write(UserInput)
   file.Write(TestString)
   file.Write()
   OnClipboardChange:
   file.Write(clipboard)
   file.Close() 
    
   Sleep 100,
   Run C:/Users/vth/Desktop/template2018/logfiles/compare1.txt
   
      Sleep 100,
   Run C:/Users/vth/Desktop/template2018/logfiles/compare2.txt
   
   
}
}


else  {
   MsgBox oei NIET in msoftstuklijst bezig Ge moet stuklijst hebben
}   
 
 
 
 
 
 
 
 
 
 
;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
   BlockInput, MouseMoveOff
	MsgBox, 48, you pressed escape- , %scriptnaam%, 1
   ExitApp
   return
}
#::Goto ExitSub