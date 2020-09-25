#include C:\Users\VTH\Desktop\template2018\ahk\_include_variabelen.ahk  ; dit bestand staat op je lokale pc , maar de simultane copy runt vanaf fileserver , dus altijd direct adressering gebruiken
Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
scriptnaam :="nrsZoekeenNummer"   
;FileAppend, %Timestamp% - %scriptnaam%`n, %AhkLogbestand% ;save naar txt file concat
aantalkliksUitgespaart := 0   ; aantalkliksUitgespaart += 1  ; een klik is click of tab of enter of up of down of shiftF9 of ... 
Sleep 300 ; hoe rap stuur je typcommandos  

CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates

Loop, 1
{
	ToolTip,     %scriptnaam%  overal mag dit   ; ahk variabele oproepen moet met %% 
	Sleep, 1
}

ToolTip, 
;;;START
DetectHiddenWindows, On


#SingleInstance  Force
#WinActivateForce
aantalElementen := 0
    choices := "" ; if you leave this line out, it'll work too I guess, but you might get a warning if #warn was set so
    loop
    {
        FileReadLine, line, C:/Users/vth/Desktop/template2018/logfiles/nrshistoriek.txt, %A_Index%
        if ErrorLevel
            Break
        choices .= line "|"
		aantalElementen := aantalElementen +1
    }

 
 aantalElementen:= aantalElementen *0.5

 Gui,Add,Listbox,gLbox vIndex +AltSubmit r%aantalElementen% w600 ,%choices% 
Gui, Show, NoActivate,  %scriptnaam%
return

Lbox:
If (A_GuiEvent = "DoubleClick")
{
 	aantalkliksUitgespaart += 1
	Gui,Submit,Nohide
	 
	 
	 
	     loop %Index% 
    {
        FileReadLine, selectedlijn, C:/Users/vth/Desktop/template2018/logfiles/nrshistoriek.txt, %A_Index%
        if ErrorLevel
            Break
       
    }
	 
	 
	 			file := FileOpen("C:/Users/vth/Desktop/template2018/logfiles/virtklembord.txt", "w")
	;  TestString := ".`r`n"  ; to start a new line. nieuwe regel 
	file.Write(selectedlijn)
	;file.Write(ClipBoard)
	file.Close() 
	 
	 
	;MsgBox The index of the selected item is %Index%   en   is ... %selectedlijn%
	Gui, Destroy
	;;;;;;;hier doenwe ons nrs ding
selectedlijn := SubStr(selectedlijn, 1, 6)
	;191773_01PTK
Tooltip %selectedlijn%

;sleep 3000  ;debug
;Exitapp   ;debug




SetTitleMatchMode, 2
;If WinExist("ahk_class OMain")   and   WinExist("LET")   and ProcessExist ("MSACCESS.EXE")
	If (actiefvensterklasseproces() = "OMainMSACCESS.EXE")
	{
	
	 ;	MsgBox, 48,  %scriptnaam% , %selectedlijn%, 1
	 
		WinActivate   
		
	;	WinWait, "LET", , 3
		
		
	;	bestaatHetVenster("LET" , true)
		
		
		;wachtEenBeetje(400)
		;send !S ; alt + S = sluiten in nrs
		
	;	het kleur vd pixel in objectoverzicht is 1DB201 , dat veriferien we best ook
		
		
		
		
				MouseMove, %objectoverzichtx%, %objectoverzichty%  ;  
				CoordMode, pixel,screen
				PixelGetColor Color, %objectoverzichtx%, %objectoverzichty%, RGB
				 
ToolTip, %Color%  ; moet 1DB201 zijn in nrs

if Color = 0xFADCDD
{
;	BlockInput, MouseMoveOff
 ;	MsgBox, 48,  kleurnrs ok %scriptnaam% , ok, 1
	
	
	
		Sleep, 100
			aantalkliksUitgespaart += 1
		   MouseClick, left  ; niewe tabllat vers en boven al de oude
		   wachtEenBeetje(400)
		   	aantalkliksUitgespaart += 1
		   send !r ; alt + r = reset
		   wachtEenBeetje(400)
		  				MouseMove, %inputletrefx%, %inputletrefy%  ;  
	Sleep, 100
		aantalkliksUitgespaart += 1
		   MouseClick, left  ; niewe tabllat vers en boven al de oude
		   Sleep, 100
		   
		   
		    send %selectedlijn% 
			 ; Sleep, 100
			  wachtEenBeetje(1000)
			  	aantalkliksUitgespaart += 1
		   MouseMove, %bovenstelijnx%, %bovenstelijny%  ;  
		    ; MouseClick, left 
			 ;  MouseClick, left 
		   
		   	ClipBoard = %selectedlijn% 
			

			
			

}

else
{
	BlockInput, MouseMoveOff
 	MsgBox, 48,  geen nrs kleur  sluit Vault ff %scriptnaam% , nietOK, 3
	exitapp

}
				
				
				
				
			;	pause

		
		
	}
	else
	{	
	BlockInput, MouseMoveOff
 	MsgBox, 48,  geen nrs draaiende %scriptnaam% , %selectedlijn%, 1
	}

	
	
	
	;;;;hier stopt ons nrs ding
		FileAppend, %Timestamp% - %scriptnaam%  kliks : %aantalkliksUitgespaart%`n, %AhkLogbestand% ;save naar txt file concat
	
	exitapp
}
return
 
 
 
 
 
 GuiClose:
ExitApp
 
 

;;noodstop
ExitApp ; dit is onze laatste stap na de herhaalloop
ExitSub:
{
	BlockInput, MouseMoveOff
	;MsgBox "EXIT-"%scriptnaam%
		MsgBox, 48, you pressed escape- , %scriptnaam%, 1
	ExitApp
	return
}

ESC::Goto ExitSub



















	