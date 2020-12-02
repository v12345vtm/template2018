;	elke export zetten we in ons exportbestand , dat is een vaste output filename
FormatTime, CurrentDateTime,, yyMMddHHmmss
   Timestamp := "%CurrentDateTime%"  ; to start a new line. nieuwe regel 
   scriptnaam :="stringdecoder"   
   FileAppend, %Timestamp% - %scriptnaam%`n, C:/Users/vth/Desktop/template2018/logfiles/welkeAHKgebruikenweWelDegelijk.txt ;save naar txt file
       Sleep 300,



;L:\Letdata\data\04\0164_00\D5\040164_00-D5N01A.docx

;en de output is de letref met 6cijfers


klipbord := "L:\Letdnata\data\04\0164_00\D5\040164aa_00-D5N01A.docx"
 msgbox, %klipbord%

; eerst op / splitten
TestString := "This is_a test."
TestString := "%klipbord%"
word_array := StrSplit(TestString, "\", ".")  ; Omits periods.
;MsgBox % "7e element:" word_array[7]


;dan op _ splitten
TestString := word_array[7]
word_array := StrSplit(TestString, "_", ".")  ; Omits periods.
;MsgBox % "letref:" word_array[1]

letref := word_array[1]

;save letref in file
FileAppend,%word_array[1]%`n,c:/aa/userinputletref.txt ;save naar txt file

 msgbox, %letref%