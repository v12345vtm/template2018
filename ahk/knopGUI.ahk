;Gui, Add, Text, x6 y7 w360 h30 +Center, If you 10 cows all had 10 black spot's`, how many spots are there in total?
;Gui, Add, Radio,  x126 y47  w100 h30 vcheese1, 100 spots
;Gui, Add, Radio,  x126 y87  w100 h30 vcheese2, 200 spots
Gui, Add, Button, x5  y5 w40 h40 gdonkey,VTH
Gui, Show, x5 y50 h50 w50, New GUI Window
Return

donkey:
  gui, submit, NoHide                        ; gather all the data from the GUI
 ;  Msgbox, byebye 
  
     Gui Destroy  
	 Gui Cancel
	 ExitApp
	 
	 
	 

		; 
 ; if (cheese1==0 && cheese2==0)              ; check if BOTH radios are unchecked
 ; {                                          ; ...
 ;   Msgbox, Please choose an answer.         ; ...
 ;   return                                   ; stop the code from going further.
 ; }                                          ; 
 ;                                            ; 
 ; if (cheese1==1)                            ; if the first radio is checked ...
 ;   MsgBox Yes, you have the correct answer  ; show the YES message
 ;                                            ; 
 ; if (cheese2==1)                            ; if the second is checked ...
 ;   MsgBox Sorry, you need to try again      ; show the SORRY message.
    
Return



GuiClose:
ExitApp