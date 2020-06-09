;INIT ahk 	elke export zetten we in ons exportbestand , dat is een vaste output filename.
scriptnaam :="Msoftpartartikel2a"  
BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

;; export to log
FormatTime, CurrentDateTime,, yyMMddHHmmss
timestampel:= CurrentDateTime  ; om een ahk property op te slaan naar ahk variabele geen %% nodig
FileAppend,  %timestampel% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
Sleep 300,


;;pre-start en variabelen
;artikelomschrijving

CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates
SetKeyDelay, 500 ; hoe rap stuur je typcommandos  
 
Loop, 1
{
	ToolTip,     %scriptnaam%  = in Msoft artikelen staan   ; ahk variabele oproepen moet met %% 
	Sleep, 1000
}

;;;START


If WinExist("AUTO - Artikelen  -  LET Automotive n.v.")
{
	WinActivate
	Sleep 200,
	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	
	Loop, 4
	{
		ToolTip, je bent wel in artikelen    %A_Index%  /... seconden    ; A_Index will be 1, 2, then 3
		Sleep, 10
	}
	
	
	;we gaan de omschrijving eerst inladen dor Alt+enter te doen en te kopieren wat de text is die te kopieren is
	
	Send, !{ENTER} 
	Sleep 1300,
	
	Send, ^{c}  ; control c ,kopier de omschrijving in klembord
	;Sleep 5000,  ; ALS JE TE KORT WACHT ZIT KLEMBORD ER NIET HELAMAAL IN
	Loop, 4
	{
		ToolTip, saving tabel to klembord...    nog  %A_Index%  //.2.. seconden    ; A_Index will be 1, 2, then 3
		Sleep, 500
	}
	
	
		artikelomschrijving := "file 2:" . clipboard ; stores the clipboard content into a variable
		
	
	clipboard := "***"
	
	Sleep, 500
	
	Send !{f4} ; Simulates the keypress alt+f4 sluit window  waar ons text artikelnaam stond
	
	;;;;;;;;;;;;;produktiegegevens openen 
	
	Send, +{F9}  ;shift f9
	Sleep 400
	Send,   ^{PgUp}  ; control pageUP
	Sleep 400,
	Send +{Tab 3}
	Sleep 300
	Send , {Enter}  ; hierdoor komt er window = "Detail Materiaalkosten"
	Loop, 6
	{
		ToolTip, wachten tot Detail Materiaalkosten    %A_Index%  /0.5 seconden   ; A_Index will be 1, 2, then 3
		Sleep, 200
	}
	
	
	;nu hebben we nu zicht op de partlijst tabel van msoft
	;nu willen we de tabel in klermbord
	
	;Detail Materiaalkosten , hier gaan we een 3e window binnen
	If WinExist("Detail Materiaalkosten")
	{
		WinActivate
		;Sleep, 500
		Loop, 2
		{
			ToolTip, inladen Detail Materiaalkosten    %A_Index%  /minstens 1.1 seconden anders lukt niet  ; A_Index will be 1, 2, then 3
			Sleep, 300
		}
		;Sleep 1300,			
		MouseMove, 100, 100 ;in de tabel ergens staan ongeveer 1e rij
		Sleep, 100
		
		
		MouseClick, right ; menuopvragen
		Sleep, 100
		Send, {Down 6} ;6keer pijltje omlaag
		Sleep, 100
		Send, {Enter} ; druk op enter
		
		
		;voila stuklijst in klembord!!
		Loop, 4
		{
			ToolTip, tabel naar klembord doen kost 2sec        %A_Index%  /2 seconden   ; A_Index will be 1, 2, then 3
			Sleep, 600
		}
		;ExitApp ; tot hier alles goed
		
		;sluit nu venster "Detail Materiaalkosten"
		Send !{f4} ; Simulates the keypress alt+f4 sluit window  waar ons text artikelnaam stond
		Sleep, 500
		
		
		
		;sluit nu venster "waar je knop deelfasen en zo in staan"
		Send !{f4} ; Simulates the keypress alt+f4 sluit window  waar ons text artikelnaam stond
		Sleep, 500
		
		Loop, 6
		{
			ToolTip, KLAAR met tonen    %A_Index%  /... seconden   ; A_Index will be 1, 2, then 3
			Sleep, 50
		}
		
		;;;;;;;;;;;;;;;;;;;;;;;;;vanaf hier zit de stuklijst in clipboard en variabele met artikelomschrijving
		
		    	ToolTip, writefile comparedottxt ;


   file := FileOpen("C:/Users/vth/Desktop/template2018/temp/compare2.txt", "w")
   TestString := ".`r`n"  ; to start a new line. nieuwe regel 
   file.Write(UserInput)
     file.Write(TestString)
      file.Write(artikelomschrijving)
   file.Write(TestString)
   file.Write()
 ; OnClipboardChange:
  file.Write(clipboard)
   file.Close()  
   
 		Loop, 3
		{
			ToolTip, KLAAR met wegschrijven file2    %A_Index%    ; A_Index will be 1, 2, then 3
			Sleep, 400
		}
  
  ;;;;;;;;;nu hebben we een bestand ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;  Run C:/Users/vth/Desktop/template2018/logfiles/compare2.txt
   	ToolTip, wiskolommen.bat aan het doen ;
	
	Run	C:\Users\vth\Desktop\template2018\ahk\wisKolommenVanCompare2.bat ; verwijder de rechtse kolommen uit de csv file
  while !WinExist("ahk_class ConsoleWindowClass")
    {
        
        ToolTip, eindeloos wachten tot cmd er is  %A_Index%
        Sleep, 100
    }
   
	;Sleep, 100 ;superbelangrijk dat cmd tijd heeft om in te laden
	
		 if	  WinExist("ahk_class ConsoleWindowClass") ;or WinExist("ahk_class" . ClassName)
	 {
	 
	  ToolTip,  cmd is ingeladen 
        Sleep, 1000
		
		
		  while WinExist("ahk_class ConsoleWindowClass")
    {
        
        ToolTip, eindeloos wachten tot cmd klaar en weg is normaal teller ongeveer aan 96  %A_Index%  
        Sleep, 100
		
    }
		
	 }
	 else 
	 {
	 
	  ToolTip,  cmd is niet ingeladen
        Sleep, 4000
	 }



 ToolTip, 


;;;;;;;;;;;;;;;;hier moeten we excel macro GREP.xlsm kunnen runnen


Run C:\Users\VTH\Desktop\template2018\macros\grep.xlsm

		Loop, 3
		{
			ToolTip, grep.xlsm inladen   %A_Index%    ; A_Index will be 1, 2, then 3
			Sleep, 400
		}

;WinWait,"grep.xlsm - Excel"
;WinMaximize ; use the window found above


 

If WinExist("grep.xlsm - Excel")
	{
	
	;MsgBox, 48, grep ja- , grep is er - `n`n This message will self-destruct in 3 seconds., 3
	  MouseMove,790 , 411 ; klik op de vba macro knop op te grep uit te voeren
  MouseClick, left
	Sleep 2300 ; vba is bezig
	
	
;;grep uitgevoerd we hebben nu 2 bestanden waar de dubbele items elk uit verdwenenn zijn

;excel sluiten

	Send !{f4} ; Simulates the keypress alt+f4 sluit window  waar ons text artikelnaam stond
		Sleep, 500
		
		;excel vraagt opslaan ?
			Send {Right} ; we gaan naar 'niet opslaan'
		Sleep, 500
				Send {Enter} ; we klikken naar 'niet opslaan'
		Sleep, 500
		
	
	
	
	
	}
	
	else
	{
	MsgBox, 48, grepnee- , geen grep.xlsm gezien `n`n This message will self-destruct in 3 seconds., 3
	Exitapp
	}



 



	
;;;;;;;;;;;;;;;;;;;;;;;;;	;we gaan notepadd++ openen , maar we gaan ale tabblaten sluiten  ahk_class Notepad++
	
	
Run C:/Tools/Notepad++/notepad++.exe
	Loop, 3
	{
			ToolTip, notepad++ opent nu    %A_Index%    ; A_Index will be 1, 2, then 3
			Sleep, 400
		}
	 
	 	If WinExist("ahk_class Notepad++")
		{WinActivate
		  Sleep 500,
		; MsgBox, je staat  notepad++  !
		  Send ^+{w} ; Simulates the keypress control shift w = close alle tabs
		    Sleep 1500,
			
			
	Send !{f4} ; Simulates the keypress alt+f4 , sluit notepad omdat soms je compare1.txt al kan ingeladen staan met oude info
	
	
			
			   Sleep 300,
  Run C:/Users/vth/Desktop/template2018/temp/compare1-split-grep.txt ;
   ;  Run C:/Users/vth/Desktop/template2018/logfiles/compare1.txt ; winaccount crach

	Loop, 4
	{
		ToolTip, 1 ste stuklijst komt binnen    %A_Index%    ; A_Index will be 1, 2, then 3
		Sleep, 100
	}


  Run C:/Users/vth/Desktop/template2018/temp/compare2-split-grep.txt ; 
   ;   Run C:/Users/vth/Desktop/template2018/logfiles/compare2.txt ; 

	Loop, 4
	{
		ToolTip, 2 ste stuklijst komt binnen    %A_Index%    ; A_Index will be 1, 2, then 3
		Sleep, 100
	}




   Send ^!{c} ; Simulates the keypress control alt c = plugin compare
		
		
			Loop, 4
	{
		ToolTip, compare is nu aan het lopen in notpad++    %A_Index%    ; A_Index will be 1, 2, then 3
		Sleep, 100
	}
			
			
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;echo van  = C:\Users\vth\Desktop\template2018\logfiles\compare1-split.txt
;echo van  = C:\Users\vth\Desktop\template2018\logfiles\compare2-split.txt
;echo output   = C:\Users\vth\Desktop\template2018\logfiles\uniek.txt			
;Run C:\Users\vth\Desktop\template2018\ahk\pythonUniques.bat		 ;ter info	
	ToolTip, we creerden ook deze file C:\Users\vth\Desktop\template2018\logfiles\uniek.txt	++		
			
			
			
		}
		else
		{
		 MsgBox, je staat niet notepad++  !
		}
	 

;;;;;;;;;;;;;;;;;;;	
	
	
	
	
	
	
	
;;;;;;;;;;;;;;;extra log
FileAppend,  %timestampel% - %scriptnaam% - %artikelomschrijving% -eind `n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file









;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

		Loop, 6
		{
			ToolTip, tis weer aan de mens die voor de pc zit /   %A_Index%     ; A_Index will be 1, 2, then 3
			Sleep, 500
			ToolTip, stuklijst van %artikelomschrijving% in   compare1-txt   ; A_Index will be 1, 2, then 3
			Sleep, 500
			;BlockInput, MouseMoveOff
		}
  
  
  
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
		
		}else  {
		Loop, 10
		{
			ToolTip, je bent niet in Detail Materiaalkosten    %A_Index%  /... seconden ,170 , 950  ; A_Index will be 1, 2, then 3
			Sleep, 10
		}}}else  {
	Loop, 4
	{
		ToolTip, je bent niet in artikelen    %A_Index%  /... seconden ,170 , 950  ; A_Index will be 1, 2, then 3
		Sleep, 500
	}
	
	}





;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
	BlockInput, MouseMoveOff
	MsgBox, 48, you pressed escape- , you pressed esc- `n`n This message will self-destruct in 1 seconds., 1
	ExitApp
	return
}

ESC::Goto ExitSub

 