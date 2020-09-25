Gui, Add, Text, x6 y7 w360 h30 +Center, If you 10 cows all had 10 black spot's`, how many spots are there in total?
Gui, Add, Radio,  x126 y47  w100 h30 vcheese1 gKnopeen, 100 spots
Gui, Add, Radio,  x126 y87  w100 h30 vcheese2 gknoptwee, 200 spots
Gui, Add, Button, x66  y127 w240 h60 gdonkey,Answer.
Gui, Show, x375 y245 h197 w377, New GUI Window
Return


Knopeen:
  
  Msgbox, klik1  
Return



Knoptwee:
  
  Msgbox, klik2 
Return


donkey:
  gui, submit, NoHide                        ; gather all the data from the GUI
                                             ; 
  if (cheese1==0 && cheese2==0)              ; check if BOTH radios are unchecked
  {                                          ; ...
    Msgbox, Please choose an answer.         ; ...
    return                                   ; stop the code from going further.
  }                                          ; 
                                             ; 
  if (cheese1==1)                            ; if the first radio is checked ...
    MsgBox Yes, you have the correct answer  ; show the YES message
                                             ; 
  if (cheese2==1)                            ; if the second is checked ...
    MsgBox Sorry, you need to try again      ; show the SORRY message.
	cheese2=0
    
Return

GuiClose:
ExitApp