;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
   Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
   scriptnaam :="msoft1elijntabelcopieren"   
   FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
       Sleep 300,



	   
    BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  Sleep 300,
   CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
  

   SetTitleMatchMode 2
 If WinExist("AUTO - Projecten")
{
	;MsgBox, u venster is open	, en ik zal het vooraan zetten
	ToolTip, u programma AUTO - Projecten is open `n tja staat  `n   voila! ,170 , 950
	WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
	
	Sleep 600,  



;Send {ENTER} ;wegens msoft strontprogramma mag je niet consequent zijn

;WinWaitActive, AUTO - Projecten  -  LET Automotive n.v.

ToolTip, msoft de tabel de 1e regel in klembord zetten,170 , 950

Sleep, 200

MouseMove, 110,100 ; op 1e regel gaan staan en dan tabel kopieren


Sleep, 50
MouseClick, Right
Sleep, 50
Send {UP 2}
Sleep, 50
Sleep, 2
Send {ENTER}
Sleep, 500

; als serieverpak2019 open is , activeer het en klik erin


;aan de hand van wat nu in ons clipboard zit ( namelijk de tabel die we uit msoft kopieren ) 
;daarin zien we of het kb-nummer is of een groene prod fiche vr serienrs

Needle := RegExMatch(Clipboard, "KB\d{6}" , SubPat)  ; Shows getal, which is the position where the match was found.
;Msgbox %Needle% ; getal met waar de KB-nummer staat  in de clipbord
; debug die niet werkt nog Msgbox % SubPat.Count()

if Needle > 1 
{
;BlockInput, MouseMoveOff
ToolTip tis kb KZB
Sleep, 500
;BlockInput, MouseMove

 SetTitleMatchMode 2
 If WinExist("kzb.xlsm - Excel")
{
WinActivate  ; venster aktief zetten
Sleep, 500
MouseClick, Left , 624 , 437 ; aktief zetten labeltool
Sleep, 200
MouseClick, Left , 624 , 437  ; klik op : analuseer en genreer

}
else
{
;BlockInput, MouseMoveOff
ToolTip kzbtool is er niet 
Sleep, 2000
}




}
else
{
;BlockInput, MouseMoveOff
ToolTip tis serieprintnr
Sleep, 500
;BlockInput, MouseMove


  SetTitleMatchMode 2
 If WinExist("serieverpak2020.xlsm - Excel")
{
WinActivate  ; venster aktief zetten
Sleep, 500
MouseClick, Left , 100 , 400 ; aktief zetten labeltool
Sleep, 200
MouseClick, Left , 100 , 400  ; klik op plak

}
else
{
;BlockInput, MouseMoveOff
ToolTip labeltool is er niet 
Sleep, 2000
}



}





 


;ExitApp ; debug
	
}
else
{
BlockInput, MouseMoveOff
	MsgBox, u venster  AUTO - Projecten  zie ik niet !! open het eerst zelf
ExitApp
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