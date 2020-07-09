#include C:\Users\VTH\Desktop\template2018\ahk\_include_variabelen.ahk  ; dit bestand staat op je lokale pc , maar de simultane copy runt vanaf fileserver , dus altijd direct adressering gebruiken

Timestamp := CurrentDateTime ; to start a new line. nieuwe regel 
scriptnaam :="pdmverkenner-incl"  
FileAppend, %Timestamp% - %scriptnaam%`n, %AhkLogbestand% ;save naar txt file concat
Sleep 300,

BlockInput, MouseMove ; als we mousemove doen , zal de pc de muis die beweegt door gebruiker niet in rekening nemen

CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates
SetKeyDelay, 500 ; hoe rap stuur je typcommandos  

Loop, 1
{
	ToolTip,     %scriptnaam%     ; ahk variabele oproepen moet met %% 
	Sleep, 10
}


; eerst de oude pdm sessies weg doen
	SetTitleMatchMode 2
		If WinExist(wachtenOPprogram)
		{

			 Loop, 9
{
	WinClose, ahk_class CabinetWClass  ;  closes any explorer window
	;MsgBox, Iteration number is %A_Index%.  ; A_Index will be 1, 2, then 3
	Sleep, 100
}
		
		}




run C:\Users\VTH\Desktop\pdmfilescopy
Sleep, 1000

Run %pdmstartmap% ;pdm met gele mapjes oproepen zonder inhoud wegens geen login


	
	
	
	Loop, 1
	{
		Sleep, 100
	}
	
	
	
	
	If WinExist(wachtenOPprogram)
{
	WinActivate, wachtenOPprogram
	WinWaitActive, ahk_class Chrome_WidgetWin1
	WinMaximize, ahk_class Chrome_WidgetWin1
	MsgBox, 48, we hebben zicht op pdmGUI , rt- `n`n This message will self-destruct in 2 seconds., 2
}
	
	
	
	
	
	MouseMove, %knopvergrootglasx%, %knopvergrootglasy%  ; eendagTerug positieknop
	ToolTip, klik op knopvergrootglas-xy
	Sleep, 150 ; check viuseel of je juist staat
	MouseClick, left
Sleep, 15 ; kort wachten we zetten eerst de muis op de volgende knop
	
	MouseMove, %zoekveldx%, %zoekveldy%  ; tiknr positieknop
	
		Loop, 3
	{
		 ToolTip, ff wachten.
		 Sleep, 200
		  ToolTip, ff wachten..
		 Sleep, 200
		  ToolTip, ff wachten....
		 Sleep, 200
		  ToolTip, ff wachten......
		 Sleep, 200
		  ToolTip, ff wachten.........
		 Sleep, 200
	 
	}
	ToolTip, klik op zoekveld
	Sleep, 1500 ; check viusee of je juist staat
	MouseClick, left
	 Sleep, 1500  
	


Exitapp



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