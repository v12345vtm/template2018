;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
   Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
   scriptnaam :="msoftdocumenten2"   
   FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
       Sleep 300,









;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;MEMO;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;          mousemove moet je loggen in windowSpy ,x -5 en de y waarde -25 doen 110,130 word 105,105
;          Esc::ExitApp ;Escape key will exit... place this at the bottom of the script EMERGENCY STOP moet nog getest worden
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;INIT

;L:\Letdata\data\16\0142_01\D5\160142_01-D5N01_.docx

   
    
    BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen
  Sleep 1500,
   CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
  
  
	
	InputBox, UserInputpvlocatie, msoftdocumenten2.ahk, Please paste pv maplokatie en zorg dat je in verse artikelen staat,,%Clipboard%
if ErrorLevel
{
    MsgBox, CANCEL was pressed.
    exitapp
}
else
{
  ; MsgBox, You entered "%UserInputpvlocatie%"	

;MsgBox % "nu een loop van  " . StrLen(UserInputpvlocatie) 
   
  }
  
  
 ;L:\Letdata\data\04\0164_00\D5\040164_00-D5N01A.docx

;en de output is de letref met 6cijfers


 

; eerst op / splitten
TestString := "This is_a test."
TestString := "%UserInputpvlocatie%"
word_array := StrSplit(TestString, "\", ".")  ; Omits periods.
;MsgBox % "7e element:" word_array[7]


;dan op - splitten
TestString := word_array[7]
word_array := StrSplit(TestString, "-", ".")  ; Omits periods.
;MsgBox % "letref:" word_array[1]

letref := word_array[1]

;save letref in file
;FileAppend,%word_array[1]%`n,c:/aa/userinputletref.txt ;save naar txt file

 ;msgbox, %letref%
  
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;MAINLOOP














Sleep, 1000


;we gaan ons letref ingeven eerst
	Sleep, 400
Send , {TAB}
	Sleep, 400
	Send , {TAB}
	Sleep, 400
	Send , %letref%
		Sleep, 1000
	Send , {ENTER}
	Sleep, 400




Send, !{d}   ;presses ALT+d
		Sleep, 1000
		
		
;final check moet er pv gelinkt worden?
  		InputBox, UserInputcode, CODE,D05 referentie zeker weten pv koppelen?,,D05
if ErrorLevel
{
    MsgBox, canceled**
    exitapp
}
else
  ; MsgBox, we maken een pv link
  
 ;nieuw document maken

	Sleep, 400
Send , {TAB}
	Sleep, 400 
		Sleep, 400
Send , {TAB}
	Sleep, 400 
		Sleep, 400
Send , {TAB}
	Sleep, 400 
		Sleep, 400
Send , {TAB}
	Sleep, 400 
		Sleep, 400
Send , {TAB}
	Sleep, 400 
		
Send , {TAB}
	Sleep, 400 
	
	
	
	Send , {ENTER}
	Sleep, 400 
	
			
Send , {TAB}
	Sleep, 400 
	
	
	
;nu gaan we input geven om nieuw dockument te maken
Send , %UserInputcode%
	Sleep, 400 
Send , {TAB}
	Sleep, 400 
	
	
;nu klikken we op radiobutton	
MouseMove, 360,225 ; woordje koppeling erop staan
Sleep, 300
MouseClick, Left ; klik op radiobutton : 'koppelen'
Sleep, 300


;nu klikken we op de3puntjes	
MouseMove, 680,200 ; woordje koppeling erop staan
Sleep, 300
MouseClick, Left ; klik ...
Sleep, 300



		Sleep, 400
	Send , %UserInputpvlocatie%
		Sleep, 400
	
		Send , {ENTER}
	Sleep, 400 
	
	
	
;nu zettern we de muis op de ok knop klaar en stoppen we	
MouseMove, 440,355 ; woordje koppeling erop staan
Sleep, 300
	
	:postprocessing 
	
	  FileAppend,%UserInputpvlocatie%`n,C:\Users\vth\Desktop\template2018\logfiles\userinputpvlocatie.txt ;save naar txt file
	
 ; MsgBox, debug
	



ExitApp ; dit is onze laatste stap na de herhaalloop


ExitSub:
{BlockInput, MouseMoveOff

MsgBox "EXIT-"%scriptnaam%
ExitApp
return
}


 

ESC::Goto ExitSub






