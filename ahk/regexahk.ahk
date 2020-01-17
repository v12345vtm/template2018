;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
   Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
   scriptnaam :="regexahk"   
   FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
       Sleep 300,




;MsgBox % RegExMatch(Clipboard, "KB\d{6}" , SubPat)  ; Shows getal, which is the position where the match was found.


Needle := RegExMatch(Clipboard, "KB\d{6}" , SubPat)  ; Shows getal, which is the position where the match was found.
;Msgbox %Needle% ; getal met waar de KB-nummer staat  in de clipbord
; debug die niet werkt nog Msgbox % SubPat.Count()

if Needle > 1 
{
Msgbox tis kb KZB

}
else
{
Msgbox tis serieprintnr
}