  ;INIT ahk 	elke export zetten we in ons exportbestand , dat is een vaste output filename.
scriptnaam :="msoft1elijntabelcopieren -kzbvooraanzetten lukt niet"  
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
	ToolTip,     %scriptnaam%  = in Msoft artikelen staan   ; ahk variabele oproepen moet met %% 
	Sleep, 1000
}

;;;START





SetTitleMatchMode 2
If WinExist("AUTO - Projecten")
{
	;MsgBox, u venster is open	, en ik zal het vooraan zetten
	ToolTip, u programma AUTO - Projecten is open `n tja staat  `n   voila! ,170 , 950
	WinActivate  ; venster aktief zetten die we net gezocht en gevonden hebben
	
	Sleep 600,  
	
	
	
	;Send {ENTER} ;wegens msoft strontprogramma mag je niet consequent zijn
	
	;WinWaitActive, AUTO - Projecten  -  LET Automotive n.v.
	
	ToolTip, msoft de tabel de 1e regel in klembord zetten en de juiste excel initialieseren,170 , 950
	
	Sleep, 200
	
	MouseMove, 110,150 ; in active window mode staan we op 1e regel gaan staan en dan tabel kopieren
		Sleep, 100
	MouseClick, Right
	Sleep, 100
	Send {UP 2}
	Sleep, 100	
	Send {ENTER}
	Sleep, 500
	
	

	
	
	; als serieverpak2019 open is , activeer het en klik erin
	
	
	;aan de hand van wat nu in ons clipboard zit ( namelijk de tabel die we uit msoft kopieren ) 
	;daarin zien we of het kb-nummer is of een groene prod fiche vr serienrs
	
	;Needle := RegExMatch(Clipboard, "KB\d{6}" , SubPat)  ; Shows getal, which is the position where the match was found.
	;Msgbox %Needle% ; getal met waar de KB-nummer staat  in de clipbord
	; debug die niet werkt nog Msgbox % SubPat.Count()
	
	
	;teststring := "Project	Klant	Leveradres	Alternatiefnummer project	Besteldatum	Leverdatum	Startdatum	Einddatum	Onzereferentie	Referentieklant	OrderSrt	Afdeling	Transport	Krachtterm	Vertegenwoordiger	Status	Klassementsnr.	Aantalkrachtterm	Enhkrachtterm	Prijskrachtterm	PrsEnhkrachtterm	Aantal geproduceerdKrachtterm	Valuta	Projectverantw.	Projectgroep	UniekVolgnummer	Soortklant	Klantbestelling	Totale waardein bedrijfsmunt	Levernota	Extra infokrachtterm	Afgesloten	Vrijgegevenvoor productie	Herberekeningnodig?	Link documentcenter	IN	Part	Off	Ram	VS	AantalRestpallet	Weeknummer	Contactpersoon	Afsluitdatum	Besteld aantal	Allergeen	Werkelijkeleverdatum	Alternatiefartikelnummer	`nOA190078	AUTOMOTIVE			29/11/2019	29/12/2019	29/11/2019	29/12/2019	B.W.Z.		OA	P	ONB	Lensfront LM35 GOCA Rev. A	DELFORCHEPIETER	In productie		150,00	ST	259,5000	ST	0,00	EUR	SPIESSENSPETER		0000036530	NVT	00000000	38925,00	00000000	HF-170038A01OPT	0	1	0	0	0	0	0	0	0	0	52		31/12/9999	0,00	0		=0000000449236	"
teststring := Clipboard
	
	
	regexfilter := RegExMatch(teststring, "\D{2}\d{6}", SubPatje)  ; Shows 1 and stores "ordernummer" in SubPat1.
;Msgbox %SubPatje.Value()% ; 0e element in ons object/tabel

ordernummer := Trim(SubPatje.Value())
;Msgbox %ordernummer% ordernrtrimmed; 0e element in ons object/tabel	
Needle := RegExMatch(ordernummer, "KB" , SubPat)  ; Shows getal, which is the position where the match was found.
	
	
;Msgbox %Needle% needle op KB; 0e element in ons object/tabel
	
	
	
	
	if Needle > 0 
	{
		;tis kzb ! als de kzbexceltool draait , zullen we alle info daar al in gaan zetten , indien de kzbexceltool niet draait zullen we dat gewoon zeggen
		;BlockInput, MouseMoveOff
		ToolTip tis kb KZB
		;Msgbox tis kb KZB ; 0e element in ons object/tabel
		Sleep, 500
		;BlockInput, MouseMove
		
		SetTitleMatchMode 2
		If WinExist("kzb.xlsm - Excel")
		{
			WinActivate  ; venster aktief zetten
			Loop, 2
{
	ToolTip,     kzb.xlsm bestaat   ; ahk variabele oproepen moet met %% 
	Sleep, 100
}
			MouseClick, Left , 624 , 437 ; aktief zetten labeltool
			Sleep, 200
			MouseClick, Left , 624 , 437  ; klik op : analuseer en genreer
		;	Msgbox kzbexist
			;ExitApp
		}else  {
			;BlockInput, MouseMoveOff
			ToolTip kzbtool is er niet voor %ordernummer%
			Sleep, 2000
			;Msgbox kzbexistNIET
			;ExitApp
		}
		
		}
		else

		{
		;tis serienummer ! als de serienrexceltool draait , zullen we alle info daar al in gaan zetten , indien de serienrexceltool niet draait zullen we dat gewoon zeggen
		;BlockInput, MouseMoveOff
		ToolTip tis serieprintnr : %ordernummer%
		;Msgbox tis serieprintnr : %ordernummer%
		Sleep, 500
		;BlockInput, MouseMove
		
		
		SetTitleMatchMode 2
		If WinExist("serieverpak2020.xlsm - Excel")
		{
			WinActivate  ; venster aktief zetten
			Sleep, 500
			MouseClick, Left , 100 , 350 ; aktief zetten labeltool
			Sleep, 200
			MouseClick, Left , 100 , 350  ; klik op plak
			;Msgbox serieverpakExist
			
		}else  {
			;BlockInput, MouseMoveOff
			ToolTip labeltool is er niet  voor %ordernummer%
			;Msgbox serieverpakExistNIET
			Sleep, 2000
			
		}}
	
	
	
	
	
	
	
	
	;ExitApp ; debug
}else  {
	BlockInput, MouseMoveOff
	MsgBox, u venster  AUTO - Projecten  zie ik niet !! open het eerst zelf
	;ExitApp
} 


Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel   
FileAppend, %Timestamp% - %scriptnaam% - %ordernummer%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
Sleep 300,


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