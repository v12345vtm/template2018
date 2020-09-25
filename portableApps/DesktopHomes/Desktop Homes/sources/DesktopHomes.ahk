/*
	DesktopHomes.ahk
	Autohotkey script to change the desktop location (aka home), and the icons
	it contains, and save/restore the icons positions for each desktop home.
	Can be integrated with VirtuaWin.

	Developed by r0lZ with AutoHotkey_L v 1.1.00.00 unicode under Win7 X64
	between December 2010 and June 2011.

	AutoHotkey_L Unicode versions REQUIRED!  MUST be compiled with the 64bit
	version to run on X64 and with the 32bit version to run on X32 system!

	See this thread for more info on the development of the script:
	http://www.autohotkey.com/forum/viewtopic.php?t=65704e607

	TODO:
	- Test under WinXP and Vista, on other PCs, and on USB stick
	- Test with icons in common desktop
	- Test with VirtuaWin installed in Program Files (no rights to write in modules dir)
	- The 32bit version should run fine under X64.
	- Support for WebDAV (possible?)
	- Change QuickLaunch folder when Desktop folder changes?
      (FOLDERID_QuickLaunch GUID = {52a4f021-7b75-48a9-9f6b-4b87a210bc8f}, default path =
      "%APPDATA%\Microsoft\Internet Explorer\Quick Launch")

    BUGS:
	- Rarely, several icons are stacked on top of each other after desktop home change.
	- When the Windows option "Hide Extensions for known file types" is in effect, icons
      with exactly the same name and file type friendly name can be swapped. 
    - Icons of a particular file type may not be restored at the right position if you
      change the associated program for that file type. 
	- Changes of icon size is not supported.
	- Doesn't check if Window's option "Auto Arrange Icons" is on when saving icon positions.
	- After a desktop change, the icons of the executable files launched from the old desktops
	  are not displayed correctly in the Recently Used Programs part of the Windows Start Menu.
	- When VirtuaWin is already running when DesktopLocations starts,
	  it assumes wrongly that the current VirtuaWin desktop is desktop #1.
	- Wait for M$ to fix this bug: http://msdn.microsoft.com/en-us/library/ms724947%28v=vs.85%29.aspx#10
    - Under a 64-bit system, the X64 version must be used.
*/

version = 0.1
; msgbox %A_AHKVersion% ; initialisation
;#NoEnv
#UseHook off
;#SingleInstance IGNORE
#SingleInstance FORCE
#Persistent
codepage = 65001
FileEncoding, UTF-16    ; needed to save the icon positions to a file

WM_SETREDRAW := 0xB
A_Quotes = "

if A_OSVersion in WIN_XP,WIN_2000,WIN_NT4,WIN_95,WIN_98,WIN_ME
{
    MsgBox, 16, DesktopHomes v%version%, DesktopHomes requires Windows Vista`, Windows 7 or later.`nSorry.
    ExitApp
}


DesktopPaths := Object()
DesktopLabels := Object()
VW_ForcedAlways := Object()
VW_ForcedSession := Object()

LVM_SETVIEW := 0x108E
LVM_GETVIEW := 0x108F
LV_VIEW_ICON      := 0 ; default mode
LV_VIEW_DETAILS   := 1 ; wrong font, prob with columns
LV_VIEW_SMALLICON := 2 ; can be used
LV_VIEW_LIST      := 3 ; wrong font
LV_VIEW_TILE      := 4 ; wrong font

if (FileExist(A_ScriptDir . "\normal.ico"))
	Menu, Tray, Icon, %A_ScriptDir%\normal.ico

; determines if we're running a 32 or 64 bit system
; Checks if "Program Files (x86)" exists.  Any better way?
SplitPath, A_ProgramFiles, , basedir
checkdir := basedir . "\" . "Program Files (x86)"
ifExist, %checkdir%
{
	; We're running under a 64 bit system
	if (A_PtrSize == 4)
	{
		msgbox, 16, DesktopHomes, You must use the x64 version to run this program under a 64bit system.`nSorry.
		exitApp, 1
	}
}
else
{
	; We're running under a 32 bit system
	if (A_PtrSize == 8)
	{
		msgbox, 16, DesktopHomes, You must use the x32 version to run this program under a 32bit system.`nSorry.
		exitApp, 1
	}
}

SetDesktopClass()
DetectHiddenWindows, OFF
GroupAdd, ExplorerWindowsGroup, ahk_class CabinetWClass


setWorkingDir, %A_ScriptDir%
SplitPath, A_ScriptDir, , , , , InstallDrive
if (FileExist("Settings\DesktopHomes.ini")) {
	settingsdir = %A_ScriptDir%\Settings
	inifile := settingsdir . "\DesktopHomes.ini"
} else {
	settingsdir = %A_AppData%\DesktopHomes
	inifile := settingsdir . "\DesktopHomes.ini"
}

IfNotExist, %inifile%
{
	numdesktops = 1
	DesktopPaths[1] := A_Desktop
	SplitPath, A_Desktop, desktoplabel
	DesktopLabels[1] := desktoplabel
	msgbox, 292, DesktopHomes - First time setup, DesktopHomes can be installed in Portable mode.`n`nIn Portable mode, the settings are saved in the DesktopHomes's installation folder:`n"%A_ScriptDir%\Settings"`nYou need write permission to that folder to use the Portable mode.`nPortable mode is recommended for USB sticks or removable drives.`n`nIn normal mode, the settings are saved in your Application Data folder:`n"%A_AppData%\DesktopHomes"`n`nIn both modes, DesktopHomes doesn't use the registry.`nThe desktop home paths are always saved relatively to the installation folder.`n`nDo you want to use the Portable mode?
	ifMsgBox, yes
	{
		settingsdir = %A_ScriptDir%\Settings
		inifile := settingsdir . "\DesktopHomes.ini"
	}
	FileCreateDir, %settingsdir%
	IniWrite, 1, %inifile%, Settings, NumDesktops
	IniWrite, % DesktopLabels[1], %inifile%, Desktops, DesktopLabel_1
	IniWrite, % Abs2RelPath(A_Desktop), %inifile%, Desktops, Desktop_Path_1
	firstTimeRun = 1
} else {
	IniRead, numdesktops, %inifile%, Settings, NumDesktops, 0
	desktop_found := false
	loop, %numdesktops% {
		IniRead, loc, %inifile%, Desktops, Desktop_Path_%A_Index%
		loc := Rel2AbsPath(loc)
		DesktopPaths[A_Index] := loc
		if (loc == A_Desktop)
			desktop_found = 1
		IniRead, lab, %inifile%, Desktops, DesktopLabel_%A_Index%
		DesktopLabels[A_Index] := lab
	}
	; add current desktop if it is not in the list
	if (! desktop_found) {
		numdesktops += 1
		DesktopPaths[numdesktops]  := A_Desktop
		DesktopLabels[numdesktops] := GenerateUniqueDesktopLabel(A_Desktop)
	}
	desktopfound =
	desktoplabel =
	thislabel =
}

LastIconposPath := settingsdir

IniRead, lastdesktop, %inifile%, Settings, LastDesktop
if (lastdesktop == "ERROR")
	lastdesktop =
else {
	lastdesktop := Rel2AbsPath(lastdesktop)
	if (! IsDirectory(lastdesktop))
		lastdesktop =
}
IniRead, autosave, %inifile%, Settings, AutoSave, 0
IniRead, autosaveevery, %inifile%, Settings, AutoSaveEveryNMinutes, 15
IniRead, EnableHotkeys, %inifile%, Settings, EnableHotkeys, 1
IniRead, LMBdefault, %inifile%, Settings, LMBdefault, Select Desktop popup menu
IniRead, MMBdefault, %inifile%, Settings, MMBdefault, Save Icons Layout
IniRead, DesktopDefault, %inifile%, Settings, DesktopDefault, View popup menu
IniRead, UseTrayTips, %inifile%, Settings, UseTrayTips, 1
IniRead, LastViewMode, %inifile%, Settings, LastViewMode, 0
IniRead, AltViewMode, %inifile%, Settings, AltViewMode, %LV_VIEW_SMALLICON%
IniRead, WallpaperMode, %inifile%, Settings, WallpaperMode, 0
IniRead, SlideShowSecs, %inifile%, Settings, SlideShowSecs, 300
IniRead, HomeStartupControl, %inifile%, Settings, HomeStartupControl, 1

IniRead, VWIntegration, %inifile%, VirtuaWin, VWIntegration, 0
IniRead, VWLaunch, %inifile%, VirtuaWin, VWLaunch, 0
IniRead, VWNumDesktops, %inifile%, VirtuaWin, VWNumDesktops, 0
IniRead, VWPath, %inifile%, VirtuaWin, VWPath
if (VWPath == "ERROR")
	VWPath =
else
	VWPath := Rel2AbsPath(VWPath)
loop, %VWNumDesktops%
{
	VW_ForcedAlways[A_Index]  := ""
	VW_ForcedSession[A_Index] := ""
	IniRead, tmp, %inifile%, VirtuaWin, VW_Desktop_%A_Index%
	if (tmp != "ERROR" && tmp != "") {
		tmp := Rel2AbsPath(tmp)
		if (InStr(FileExist(tmp), "D")) {
			VW_ForcedAlways[A_Index]  := tmp
			VW_ForcedSession[A_Index] := tmp
		}
	}
}
; hotkeys not configurable via the GUI, triggered when the user middle or right-click on the Kvasdo Pager toolbar
; #^{Insert} and #^+{Insert} are good candidates
IniRead, VWKvasdoPagerMMBHotkey,    %inifile%, VWKvasdoPager, MMBHotkey,    <none>
IniRead, VWKvasdoPagerRMBHotkey,    %inifile%, VWKvasdoPager, RMBHotkey,    <none>
IniRead, VWKvasdoPagerX1MBHotkey,   %inifile%, VWKvasdoPager, X1MBHotkey,   <none>
IniRead, VWKvasdoPagerX2MBHotkey,   %inifile%, VWKvasdoPager, X2MBHotkey,   <none>
IniRead, VWKvasdoPagerMWUpHotkey,   %inifile%, VWKvasdoPager, MWUpHotkey,   <none>
IniRead, VWKvasdoPagerMWDownHotkey, %inifile%, VWKvasdoPager, MWDownHotkey, <none>

VW_CurDesktop = 1

cur_desktoplabel := GetLabelFromPath(A_Desktop)
GoSub, BuildTrayMenu

; monitors buttons clicks on tray icon
OnMessage(0x404, "OnWM_BUTTONUPMessage")   ; 0x404 = AHK_NOTIFYICON

; monitors desktop resolution changes
OnMessage(0x7E, "DesktopSizeChanged")   ; 0x7E = WM_DISPLAYCHANGE

; save current icons layout every 15 minutes
if (autosave) {
	timer_interval := autosaveevery * 60000
	SetTimer, AutoSaveTimer, %timer_interval%, -2147483648
	timer_interval =
}

if (VWIntegration) {
	if (! InitVirtuaWinModule(VWPath)) {
		VWIntegration = 0
		IniWrite, %VWIntegration%, %inifile%, VirtuaWin, VWIntegration
	}
}

if (GetCurrentViewMode() != LastViewMode) {
	ControlGet, hwWindow, HWND,, SysListView321, ahk_class %desktopclassname%
	SendMessage, %LVM_SETVIEW%, %LastViewMode%, 0, , ahk_id %hwWindow%
}

if (VWLaunch && VWPath != "") {
	process, exist, VirtuaWin.exe
	if (! ErrorLevel) {
		run, %VWPath%\VirtuaWin.exe, %VWPath%, UseErrorLevel
		if (ErrorLevel != "ERROR" && VW_ForcedSession[1] != "") {
			GoSub, VWDesktopChange
		}
	}
}
if (WallpaperMode == 1)
	SetWallpaper(GetDesktopNumFromPath(A_Desktop), 1)

OnExit, CleanExit
OnMessage(0x11, "WM_QUERYENDSESSION")

; first time setup
if (firstTimeRun)
	GoSub, GuiSetup

return


; *****************************************************************************
; Tray menu
; *****************************************************************************

BuildTrayMenu:
{
	menu, tray, nostandard

	menu, FolderOptionsMenu, Add
	menu, FolderOptionsMenu, DeleteAll
	menu, FolderOptionsMenu, Add, Hide Hidden Files, HideHiddenFiles
	menu, FolderOptionsMenu, Add, Show Hidden Files, ShowHiddenFiles
	menu, FolderOptionsMenu, Add, Show Hidden and System Files, ShowSystemFiles
	menu, FolderOptionsMenu, Add
	menu, FolderOptionsMenu, Add, Hide Extensions for known file types, HideFileExt
	menu, FolderOptionsMenu, Add, Use Check Boxes to select items, AutoCheckSelect
	menu, FolderOptionsMenu, Add
	menu, FolderOptionsMenu, Add, Folder Options Control Panel, FolderOptionsCpl
	menu, FolderOptionsMenu, Add
	menu, FolderOptionsMenu, Add, Refresh, RefreshExplorerWindows

	menu, ExploreMenu, Add
	menu, ExploreMenu, DeleteAll
	menu, ExploreMenu, Add

	menu, LayoutMenu, add, Save Icons Layout, SaveCurrentLayout
	menu, LayoutMenu, add, Save Icons Layout as..., SaveCurrentLayoutAs
	menu, LayoutMenu, add, Restore Icons Layout, RestoreCurrentLayout
	menu, LayoutMenu, add, Restore Auto-saved Layout, RestoreAutoSaveLayout
	menu, LayoutMenu, add, Load Icons Layout..., LoadCurrentLayout

	menu, NavMenu, add
	menu, NavMenu, DeleteAll
	menu, NavMenu, add, First Desktop home`tCtrl-Win-Home, UseDesktop1
	menu, NavMenu, add, Previous Desktop home`tCtrl-Win-PgDn, UsePrevDesktop
	menu, NavMenu, add, Next Desktop home`tCtrl-Win-PgUp, UseNextDesktop
	menu, NavMenu, add, Last Desktop home`tCtrl-Win-End, UseLastDesktop

	menu, VWMenu, Add
	menu, VWMenu, DeleteAll
	if (VWIntegration) {
		menu, VWMenu, Add, Force current home (always), VW_ForceCurrentPathAlways
		menu, VWMenu, Add, Force current home (session), VW_ForceCurrentPathSession
		menu, VWMenu, Add, Do not force home, VW_DoNotChangePath
		menu, VWMenu, Add
		menu, VWMenu, Add, Forced home Information, VW_ForcePathInfo
	}

	menu, tray, add
	menu, tray, DeleteAll
	menu, tray, add, Settings..., GuiSetup
	menu, tray, add, Enable Hotkeys?, ToggleHotkeys
	if (EnableHotkeys)
		Menu, Tray, Check, Enable Hotkeys?
	menu, tray, add, Exit, Quit
	menu, tray, add
	Menu, Tray, Add, Turn Monitor Off, TurnMonitorOff
	Menu, Tray, Add, Screen Resolution..., ScreenResolution
	Menu, Tray, Add, Next Wallpaper, SetWallpaperTimer
	menu, tray, add, Show Desktop Icons?, ToggleDesktopIcons
	menu, tray, add, Tiles View?, ToggleDesktopViewMode
	menu, tray, add, Folder Options..., :FolderOptionsMenu
	menu, tray, add, Icons Layout, :LayoutMenu
	menu, tray, add
	if (VWIntegration)
		menu, tray, Add, Set VirtuaWin desktop home, :VWMenu

	menu, tray, Add, Execute Home Startup items, HomeStartup

	menu, tray, add, Explore Desktop homes, :ExploreMenu
	menu, tray, add, Select Desktop home, :NavMenu
	menu, tray, add, Swap Desktop homes`tCtrl-Win-Backspace, swaplastdesktops
	if (fileExist("back.ico"))
    	menu, tray, Icon, Swap Desktop homes`tCtrl-Win-Backspace, back.ico

	if (LMBdefault != "Do nothing" && LMBdefault != "Select Desktop popup menu") {
		if (LMBdefault == "Swap Desktop homes")
			menu, tray, default, Swap Desktop homes`tCtrl-Win-Backspace
		else
			menu, tray, default, %LMBdefault%
		menu, tray, click, 1
	} else if (LMBdefault == "Select Desktop popup menu") {
		menu, tray, default, Swap Desktop homes`tCtrl-Win-Backspace
		menu, tray, click, 2
	} else if (LMBdefault == "View popup menu") {
		menu, tray, default, Show Desktop Icons?
		menu, tray, click, 2
	}

	if (lastdesktop == "" || ! IsDirectory(lastdesktop))
		menu, tray, disable, Swap Desktop homes`tCtrl-Win-Backspace
	menu, tray, add
	menu, ExploreMenu, deleteall

	loop, %numdesktops%
	{
		desktoppath  := DesktopPaths[A_Index]
		desktoplabel := DesktopLabels[A_Index]
		if (A_Index <= 12)
			desktoplabel1 = %desktoplabel%`tCtrl-Win-F%A_Index%
		else
			desktoplabel1 = %desktoplabel%
		menu, tray, add, %desktoplabel1%, selectdesktopfrommenu
		menu, ExploreMenu, add, %desktoplabel%, exploredesktop
		if (desktoppath == lastdesktop&& fileExist("back.ico")) {
			menu, tray, Icon, %desktoplabel1%, back.ico
			menu, ExploreMenu, Icon, %desktoplabel%, back.ico
		}
		if (desktoppath == A_Desktop) {
			menu, tray, Disable, %desktoplabel1%
			menu, tray, Icon, %desktoplabel1%, %A_WinDir%\System32\shell32.dll, 35
			menu, ExploreMenu, Default, %desktoplabel%
			menu, ExploreMenu, Icon, %desktoplabel%, %A_WinDir%\System32\shell32.dll, 35
		}
		if (! IsDirectory(desktoppath)) {
			menu, tray, Disable, %desktoplabel1%
			menu, ExploreMenu, Disable, %desktoplabel%
		}
	}
	menu, ExploreMenu, add
	menu, ExploreMenu, add, All Users Desktop, exploreallusersdesktop

	menu, ExploreMenu, add
	menu, ExploreMenu, add, Paste from other home`tCtrl-Win-C, pasteFromOtherHome
	menu, ExploreMenu, add, Cut and Paste from other home`tCtrl-Win-X, cutFromOtherHome

	cur_desktoplabel := GetLabelFromPath(A_Desktop)
	Menu, Tray, Tip, Current desktop home:`n"%cur_desktoplabel%"`n"%A_Desktop%"

	GoSub, UpdateVWMenu

	cur_desktoplabel =
	cur_filename =
	desktoplabel =
	desktoplabel1 =

	return
}

RefreshTrayMenu()
{
	critical, on
	global desktopclassname

	SetDesktopClass()
	ControlGet, icons_visible, Visible, , SysListView321, ahk_class %desktopclassname%
	if (icons_visible)
		menu, tray, Check, Show Desktop Icons?
	else
		menu, tray, UnCheck, Show Desktop Icons?

	if (GetCurrentViewMode()) {
		menu, tray, check, Tiles View?
		menu, tray, disable, Icons Layout
	} else {
		menu, tray, uncheck, Tiles View?
		menu, tray, enable, Icons Layout
	}

	RefreshFolderOptionsMenu()
	RefreshIconsLayoutMenu()

	critical, off
	return
}

RefreshFolderOptionsMenu()
{
	RegRead, ValorHidden,     HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden
	RegRead, ShowSuperHidden, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, ShowSuperHidden

	menu, FolderOptionsMenu, UnCheck, Hide Hidden Files
	menu, FolderOptionsMenu, UnCheck, Show Hidden Files
	menu, FolderOptionsMenu, UnCheck, Show Hidden and System Files
	if (ValorHidden == 2) {
		menu, FolderOptionsMenu, Check, Hide Hidden Files
	} else {
		if (ShowSuperHidden) {
			menu, FolderOptionsMenu, Check, Show Hidden and System Files
		} else {
			menu, FolderOptionsMenu, Check, Show Hidden Files
		}
	}

	RegRead, state, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt
	if (state)
		menu, FolderOptionsMenu, Check, Hide Extensions for known file types
	else
		menu, FolderOptionsMenu, UnCheck, Hide Extensions for known file types

	RegRead, state, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, AutoCheckSelect
	if (state)
		menu, FolderOptionsMenu, Check, Use Check Boxes to select items
	else
		menu, FolderOptionsMenu, UnCheck, Use Check Boxes to select items
}

RefreshIconsLayoutMenu()
{
	global settingsdir
	cur_desktoplabel := GetLabelFromPath(A_Desktop)
	cur_filename = %settingsdir%\%cur_desktoplabel%__(screen%A_ScreenWidth%x%A_ScreenHeight%).iconspos
	if (! FileExist(cur_filename))
		Menu, LayoutMenu, Disable, Restore Icons Layout
	cur_filename = %settingsdir%\%cur_desktoplabel%__(screen%A_ScreenWidth%x%A_ScreenHeight%)_autosave.iconspos
	if (! FileExist(cur_filename))
		Menu, LayoutMenu, Disable, Restore Auto-saved Layout
}

SelectDesktopPopup:
{
	menu, PopupMenu, Add
	menu, PopupMenu, DeleteAll
	menu, PopupMenu, add, Swap Desktop homes, swaplastdesktops
    if (FileExist("back.ico"))
	   menu, PopupMenu, Icon, Swap Desktop homes, back.ico
	menu, PopupMenu, Default, Swap Desktop homes
	if (lastdesktop == "" || ! IsDirectory(lastdesktop))
		menu, PopupMenu, Disable, Swap Desktop homes
	menu, PopupMenu, Add
	loop, %numdesktops%
	{
		desktoppath  := DesktopPaths[A_Index]
		desktoplabel := DesktopLabels[A_Index]
		menu, PopupMenu, add, %desktoplabel%, selectdesktopfrommenu
		if (desktoppath == lastdesktop && FileExist("back.ico"))
			menu, PopupMenu, Icon, %desktoplabel%, back.ico
		if (desktoppath == A_Desktop) {
			menu, PopupMenu, Disable, %desktoplabel%
			menu, PopupMenu, Icon, %desktoplabel%, %A_WinDir%\System32\shell32.dll, 35
		}
		if (! IsDirectory(desktoppath))
			menu, PopupMenu, Disable, %desktoplabel%
	}
	menu, PopupMenu, add
	menu, PopupMenu, add, Cancel, DoNothing
	menu, PopupMenu, Show
;	menu, PopupMenu, DeleteAll
	return
}

ViewPopup:
{
	menu, PopupMenu, Add
	menu, PopupMenu, DeleteAll
	Menu, PopupMenu, Add, Turn Monitor Off, TurnMonitorOff
	Menu, PopupMenu, Add, Screen Resolution..., ScreenResolution
	Menu, PopupMenu, Add, Next Wallpaper, SetWallpaperTimer
	menu, PopupMenu, add, Show Desktop Icons?, ToggleDesktopIcons
	menu, PopupMenu, add, Tiles View?, ToggleDesktopViewMode
	menu, PopupMenu, add, Folder Options..., :FolderOptionsMenu
	menu, PopupMenu, add, Icons Layout, :LayoutMenu
	menu, PopupMenu, add
	menu, PopupMenu, add, Explore Desktop homes, :ExploreMenu
	menu, PopupMenu, add
	menu, PopupMenu, add, Cancel, DoNothing

	if (! HasMultipleWallpapers)
		Menu, PopupMenu, Disable, Next Wallpaper

	ControlGet, icons_visible, Visible, , SysListView321, ahk_class %desktopclassname%
	if (icons_visible)
		menu, PopupMenu, Check, Show Desktop Icons?
	else
		menu, PopupMenu, UnCheck, Show Desktop Icons?

	if (GetCurrentViewMode())
		menu, PopupMenu, check, Tiles View?
	else
		menu, PopupMenu, uncheck, Tiles View?

	RefreshFolderOptionsMenu()
	RefreshIconsLayoutMenu()

	menu, PopupMenu, Show

;	menu, PopupMenu, DeleteAll
	return
}

IconsLayoutPopup:
{
	if (GetCurrentViewMode())
		GoSub, ToggleDesktopViewMode
	RefreshIconsLayoutMenu()
	menu, LayoutMenu, add
	menu, LayoutMenu, add, Cancel, DoNothing
	menu, LayoutMenu, Show
	return
}

DoNothing:
return

selectdesktopfrommenu:
{
	desktoplabel := A_ThisMenuItem
	menu, PopupMenu, Add
	menu, PopupMenu, DeleteAll
	pos := inStr(desktoplabel, A_Tab)
	if (pos) {
		desktoplabel := SubStr(desktoplabel, 1, pos-1)
	}
	GoSub, selectdesktop
	Return
}

; selects the desktop whose label is in global variable %desktoplabel%
; (indirectly called from tray menu or hotkeys)
selectdesktop:
{
	SetTimer, AutoSaveTimer, OFF

	GetKeyState, ControlKeyState, Control

	SetTrayIcon(1)
	old_tail := GetLabelFromPath(A_Desktop)
	last := A_Desktop
	rc = 1
	MenuIndex := GetDesktopNumFromLabel(desktoplabel)
	desktoppath := DesktopPaths[MenuIndex]
	if (WallpaperMode == 1)
		wallpaper := GetDesktopNumFromPath(desktoppath)
	else if (WallpaperMode == 2)
		wallpaper := VW_CurDesktop
	else
		wallpaper = 0
	if (desktoppath != "")
		rc := SwapDesktops(desktoppath, wallpaper)
	else if (WallpaperMode == 2)
		SetWallpaper(VW_CurDesktop)

	if (rc == 0) {
		lastdesktop := last
		IniWrite, % Abs2RelPath(lastdesktop), %inifile%, Settings, LastDesktop

		loop, %numdesktops%
		{
			tail := DesktopLabels[A_Index]
			desktoppath := DesktopPaths[A_Index]
			if (A_Index <= 12) {
				menu, tray, NoIcon, %tail%`tCtrl-Win-F%A_Index%
				menu, tray, Enable, %tail%`tCtrl-Win-F%A_Index%
			} else {
				menu, tray, NoIcon, %tail%
				menu, tray, Enable, %tail%
			}
			menu, ExploreMenu, NoIcon, %tail%

			if (tail == old_tail) {
                if (FileExist("back.ico")) {
    				if (A_Index <= 12)
    					menu, tray, Icon, %old_tail%`tCtrl-Win-F%A_Index%, back.ico
    				else
    					menu, tray, Icon, %old_tail%, back.ico
    			}
			}
			if (tail == desktoplabel) {
				if (MenuIndex <= 12) {
					Menu, Tray, Disable, %desktoplabel%`tCtrl-Win-F%MenuIndex%
					Menu, tray, Icon, %desktoplabel%`tCtrl-Win-F%MenuIndex%, %A_WinDir%\System32\shell32.dll, 35
				} else {
					Menu, Tray, Disable, %desktoplabel%
					Menu, tray, Icon, %desktoplabel%, %A_WinDir%\System32\shell32.dll, 35
				}
				Menu, ExploreMenu, Icon, %desktoplabel%, %A_WinDir%\System32\shell32.dll, 35
			}
		}
		Menu, ExploreMenu, Default, %desktoplabel%
		Menu, ExploreMenu, Icon, %desktoplabel%, %A_WinDir%\System32\shell32.dll, 35
        if (FileExist("back.ico"))
    		Menu, ExploreMenu, Icon, %old_tail%, back.ico
		Menu, Tray, Enable, Swap Desktop homes`tCtrl-Win-Backspace

		cur_filename = %settingsdir%\%desktoplabel%__(screen%A_ScreenWidth%x%A_ScreenHeight%).iconspos
		if (FileExist(cur_filename))
			Menu, LayoutMenu, Enable, Restore Icons Layout
		else
			Menu, LayoutMenu, Disable, Restore Icons Layout
		cur_filename = %settingsdir%\%desktoplabel%__(screen%A_ScreenWidth%x%A_ScreenHeight%)_autosave.iconspos
		if (FileExist(cur_filename))
			Menu, LayoutMenu, Enable, Restore Auto-saved Layout
		else
			Menu, LayoutMenu, Disable, Restore Auto-saved Layout
		cur_desktoplabel =
		cur_filename =

		; Start autostart programs (if any)
		if (ControlKeyState == "D") {
			if (HomeStartupControl == 1)
				HomeStartup(A_Desktop)
		} else {
			if (HomeStartupControl == 0)
				HomeStartup(A_Desktop)
		}
	}
	if (autosave) {
		timer_interval := autosaveevery * 60000
		SetTimer, AutoSaveTimer, %timer_interval%, -2147483648
		timer_interval =
	}
	SetTrayIcon()
	Return
}

SetTrayIcon(mode = 0)
{
	if (mode == 0) {
		iconname = %A_ScriptDir%\normal.ico
		if (! FileExist(iconname) && A_IsCompiled)
			iconname = %A_ScriptFullPath%
   } else
		iconname = %A_ScriptDir%\working.ico
	if (FileExist(iconname))
		Menu, Tray, Icon, %iconname%
}

HomeStartup:
{
	HomeStartup(A_Desktop)
	return
}
HomeStartup(desktoppath, test = 0)
{
	startupdir = %desktoppath%\Home Startup
	if (! IsDirectory(startupdir))
		return 0
	numfiles = 0
	Loop, %startupdir%\*.*, 0, 0
	{
		attributes := FileExist(A_LoopFileLongPath)
		if (InStr(attributes, "H"))
			Continue
		if (InStr(attributes, "S"))
			Continue
		if (test)
			return 1
		SplitPath, A_LoopFileName, , , Extension
		if (Extension == "lnk") {
			FileGetShortcut, %A_LoopFileLongPath%, OutTarget
			SplitPath, OutTarget, app
		} else {
			app = %A_LoopFileName%
		}
		if (app != "") {
			Process, Exist, %app%
			if (Errorlevel)
				Continue
		}
		TrayTip, DesktopHomes, Running "%A_LoopFileName%", 5, 1
		Run, %A_LoopFileLongPath%, %A_Desktop%, UseErrorLevel
		if (! ErrorLevel)
			numfiles += 1
	}
	TrayTip
	return %numfiles%
}

; *****************************************************************************
; Handles mouse buttons clicks on tray icon, desktop and KvasdoPager toolbar
; *****************************************************************************

~XButton1:: xbutton=1
~XButton2:: xbutton=2
OnWM_BUTTONUPMessage(wParam, lParam)
{
	global xbutton, LMBdefault, MMBdefault
	;refreshtraytip = 0
	if (lParam = 0x201) {  ; WM_LBUTTONUP
		if (LMBdefault == "Select Desktop popup menu")
			GoSub, SelectDesktopPopup
		else if LMBdefault == "View popup menu")
			GoSub, ViewPopup
		else if LMBdefault == "Icons Layout popup menu")
			GoSub, IconsLayoutPopup
	} else if (lParam = 0x204) {  ; WM_RBUTTONUP
		RefreshTrayMenu()
	} else if (lParam = 0x208) {  ; WM_MBUTTONUP
		DoDefaultAction(MMBdefault)
	} else if (lParam=524) { ; lParam = 524: Up message for XButton1 AND 2!
		if xbutton = 1
			GoSub, UsePrevDesktop
		else
			GoSub, UseNextDesktop
	}
	return
}

#if (MouseIsOverControl("ahk_class " . desktopclassname, ""))
MButton::
{
	DoDefaultAction(DesktopDefault)
	return
}
#if

#if (MouseIsOverControl("ahk_class Shell_TrayWnd", "vwBetterPagerCanvas1"))
MButton::
{
	if (VWKvasdoPagerMMBHotkey != "<none>")
	   Send, %VWKvasdoPagerMMBHotkey%
	return
}
RButton::
{
	if (VWKvasdoPagerRMBHotkey != "<none>")
		Send, %VWKvasdoPagerRMBHotkey%
	return
}
XButton1::
{
	if (VWKvasdoPagerX1MBHotkey != "<none>")
		Send, %VWKvasdoPagerX1MBHotkey%
	return
}
XButton2::
{
	if (VWKvasdoPagerX2MBHotkey != "<none>")
		Send, %VWKvasdoPagerX2MBHotkey%
	return
}
WheelUp::
{
	if (VWKvasdoPagerMWUpHotkey != "<none>")
		Send, %VWKvasdoPagerMWUpHotkey%
	return
}
WheelDown::
{
	if (VWKvasdoPagerMWDownHotkey != "<none>")
		Send, %VWKvasdoPagerMWDownHotkey%
	return
}
#if
#if (MouseIsOverControl("VirtuaWin Preview", ""))
MButton::
{
	WinClose, VirtuaWin Preview
	return
}
#if

DoDefaultAction(defaultstring) {
	if (defaultstring == "Select Desktop popup menu")
		GoSub, SelectDesktopPopup
	else if (defaultstring == "View popup menu")
		GoSub, ViewPopup
	else if (defaultstring == "Icons Layout popup menu")
		GoSub, IconsLayoutPopup
	else if (defaultstring == "Swap Desktop homes")
		GoSub, swaplastdesktops
	else if (defaultstring == "Show Desktop Icons?")
		GoSub, ToggleDesktopIcons
	else if (defaultstring == "Tiles View?")
		GoSub, ToggleDesktopViewMode
	else if (defaultstring == "Restore Icons Layout")
		GoSub, RestoreCurrentLayout
	else if (defaultstring == "Save Icons Layout")
		GoSub, SaveCurrentLayout
	else if (defaultstring == "Turn Monitor Off")
		GoSub, TurnMonitorOff
}

MouseIsOverControl(WinTitle, Control) {
	MouseGetPos,,, Win, Ctrl
	if (Control != "" && Ctrl != Control)
		return 0
	return WinExist(WinTitle . " ahk_id " . Win)
}

; *****************************************************************************
; Hotkeys
; *****************************************************************************

#if EnableHotkeys && WinActive("ahk_class " . desktopclassname)

^#F1::
^#Home::
UseDesktop1:
{
	SwapDesktopNum(1)
	return
}
^#F2:: SwapDesktopNum(2)
^#F3:: SwapDesktopNum(3)
^#F4:: SwapDesktopNum(4)
^#F5:: SwapDesktopNum(5)
^#F6:: SwapDesktopNum(6)
^#F7:: SwapDesktopNum(7)
^#F8:: SwapDesktopNum(8)
^#F9:: SwapDesktopNum(9)
^#F10:: SwapDesktopNum(10)
^#F11:: SwapDesktopNum(11)
^#F12:: SwapDesktopNum(12)
SwapDesktopNum(num)
{
	global numdesktops, desktopnum
	if (num > numdesktops) {
		;soundbeep
		return
	}
	desktopnum = %num%
	GoSub, SwapDesktopNum
	return
}
SwapDesktopNum:
{
	desktoplabel := DesktopLabels[desktopnum]
	GoSub, selectdesktop
	return
}


^#End::
UseLastDesktop:
{
	desktoplabel := DesktopLabels[numdesktops]
	GoSub, selectdesktop
	return
}

^#PgUp::
UsePrevDesktop:
{
	cur_desktop_num := GetDesktopNumFromPath(A_Desktop)
	if (cur_desktop_num == 1) {
		new_desktop_num := numdesktops
	} else {
		new_desktop_num := cur_desktop_num -1
	}
	if (new_desktop_num > 0) {
		desktoplabel := DesktopLabels[new_desktop_num]
		GoSub, selectdesktop
	}
	Return
}

^#PgDn::
UseNextDesktop:
{
	cur_desktop_num := GetDesktopNumFromPath(A_Desktop)
	if (cur_desktop_num >= numdesktops) {
		new_desktop_num := 1
	} else {
		new_desktop_num := cur_desktop_num +1
	}
	if (new_desktop_num > 0) {
		desktoplabel := DesktopLabels[new_desktop_num]
		GoSub, selectdesktop
	}
	Return
}

^#Backspace::
swaplastdesktops:
{
	if (lastdesktop == "")
		return
	desktoplabel := GetLabelFromPath(lastdesktop)
	GoSub, selectdesktop
	return
}

^#v::
pasteFromOtherHome:
	PasteFromOtherHome(0)
return
^#x::
cutFromOtherHome:
	PasteFromOtherHome(1)
return
PasteFromOtherHome(cutmode)
{
	if (clipboard == "") {
		TrayTip, DesktopHomes, Nothing in the clipboard!, 5, 2
		soundplay, *48
		return
	}
	numitems = 0
	loop, parse, clipboard, `n, % chr(13)
	{
		if (FileExist(A_LoopField))
			numitems += 1
	}
	if (numitems == 0) {
		TrayTip, DesktopHomes, No files or folders in the clipboard!, 5, 2
		soundplay, *48
		return
	}
	loop, parse, clipboard, `n, % chr(13)
	{
		SplitPath, A_LoopField, OutFileName, Outdir
		if (OutDir == A_Desktop) {
			TrayTip, DesktopHomes, Source and destination desktops are equal!, 8, 2
			soundplay, *48
			return
		}
		outfile = %A_Desktop%\%OutFileName%
		dir := IsDirectory(A_LoopField)
		if (FileExist(outfile)) {
			if (A_Index < numitems)
				option = 291
			else
				option = 292
			if (dir) {
				MsgBox, %option%, DesktopHomes, Folder "%OutFileName%" exists already on current Desktop!`nIf you continue, the files present in the source folder will replace the same files in the destination folder!`n`nContinue?
			} else {
				MsgBox, %option%, DesktopHomes, File "%OutFileName%" exists already on current Desktop!`n`nOverwrite?
			}
			ifMsgBox, No
				continue
			ifMsgBox, Cancel
				return
		}
		if (dir) {
			FileCopyDir, %A_LoopField%, %outfile%, 1
			if (ErrorLevel) {
				TrayTip, DesktopHomes, Cannot copy folder "%OutFileName%"!, 8, 3
				soundplay, *16
			} else if (cutmode) {
				FileRemoveDir, %A_LoopField%, 1
				if (ErrorLevel) {
					TrayTip, DesktopHomes, Cannot delete source folder`n"%A_LoopField%"!, 8, 3
					soundplay, *16
				}
			}
		} else if (FileExist(A_LoopField)) {
			FileCopy, %A_LoopField%, %outfile%, 1
			if (ErrorLevel) {
				TrayTip, DesktopHomes, Cannot copy file "%OutFileName%"!, 8, 3
				soundplay, *16
			} else if (cutmode) {
				FileDelete, %A_LoopField%
				if (ErrorLevel) {
					TrayTip, DesktopHomes, Cannot delete source file`n"%A_LoopField%"!, 8, 3
					soundplay, *16
				}
			}
		}
	}
	return
}

; *****************************************************************************
; DeskIcons: save and restore the desktop icon positions
; *****************************************************************************
/*
	Save and Load desktop icon positions, by Rapte_Of_Suzaku, modified by r0lZ.
	See: http://www.autohotkey.com/forum/viewtopic.php?t=65704
	based on save/load desktop icon positions by temp01 (http://www.autohotkey.com/forum/viewtopic.php?t=49714)

	Example:
		; save positions
		coords := DeskIcons()
		MsgBox now move the icons around yourself
		; load positions
		DeskIcons(coords)

	Plans:
		handle more settings (icon sizes, sort order, etc)
		 - http://msdn.microsoft.com/en-us/library/ff485961%28v=VS.85%29.aspx
*/
DeskIcons(coords="")
{
	Critical
	global desktopclassname, WM_SETREDRAW
	static MEM_COMMIT := 0x1000, PAGE_READWRITE := 0x04, MEM_RELEASE := 0x8000
	static LVM_GETITEMPOSITION := 0x00001010, LVM_SETITEMPOSITION := 0x0000100F

	if coords
		Ret := false
	else
		Ret =

	SetDesktopClass()
	ControlGet, hwWindow, HWND,, SysListView321, ahk_class %desktopclassname%
	IfWinExist ahk_id %hwWindow% ; last-found window set
		WinGet, iProcessID, PID
	else
		return %Ret%

	hProcess := DllCall("OpenProcess"   , "UInt",   0x438         ; PROCESS-OPERATION|READ|WRITE|QUERY_INFORMATION
						, "Int",   FALSE         ; inherit = false
						, "UInt",   iProcessID)
	if hwWindow and hProcess
	{
		ControlGet, list, list, Col1 ; file names
		ControlGet, list2, list, Col2 ; file types
		Loop, Parse, list2, `n
			filetype_%A_Index% := A_LoopField
		RegRead, CurHideExt, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt
		if !coords
		{
			; save desktop icon positions
			Ret = %CurHideExt%`n
			if (A_PtrSize == 8)
			{
				; we're running under a 64bit system
				VarSetCapacity(iCoord, 16)
				pItemCoord := DllCall("VirtualAllocEx", "UInt", hProcess, "UInt", 0, "UInt", 8, "UInt", MEM_COMMIT, "UInt", PAGE_READWRITE)
				Loop, Parse, list, `n
				{
					SendMessage, %LVM_GETITEMPOSITION%, % A_Index-1, %pItemCoord%
					DllCall("ReadProcessMemory", "UInt", hProcess, "UInt", pItemCoord, "UInt64", &iCoord, "UInt", 16, "UIntP", cbReadWritten)
					posx := NumGet(iCoord) & 0xFFFF
					posy := Numget(iCoord, 4) & 0xFFFF
					ret .= A_LoopField . ":" . filetype_%A_Index% ":" posx | (posy << 16) "`n"
				}
			}
			else
			{
				; we're running under a 32bit system
				VarSetCapacity(iCoord, 8)
				pItemCoord := DllCall("VirtualAllocEx", "UInt", hProcess, "UInt", 0, "UInt", 8, "UInt", MEM_COMMIT, "UInt", PAGE_READWRITE)
				Loop, Parse, list, `n
				{
					SendMessage, %LVM_GETITEMPOSITION%, % A_Index-1, %pItemCoord%
					DllCall("ReadProcessMemory", "UInt", hProcess, "UInt", pItemCoord, "UInt", &iCoord, "UInt", 8, "UIntP", cbReadWritten)
					posx := NumGet(iCoord) & 0xFFFF
					posy := Numget(iCoord, 4) & 0xFFFF
					ret .= A_LoopField . ":" . filetype_%A_Index% ":" posx | (posy << 16) "`n"
				}
			}
			DllCall("VirtualFreeEx", "UInt", hProcess, "UInt", pItemCoord, "UInt", 0, "UInt", MEM_RELEASE)
		}
		else
		{
			; restore icons positions
			Loop, Parse, coords, `n
			{
				if (A_Index == 1) {
					 OrigHideExt = %A_LoopField%
					 break
				}
			}
			if (CurHideExt == OrigHideExt)
				 HandleExt = 0
			else if (CurHideExt == 0)
				 HandleExt = 1
			else
				 HandleExt = -1
			ICoords =
			NumIcons = 0
			NumRestaured = 0
			Loop, Parse, list, `n
			{
				NumIcons += 1
				iconnum := A_Index
				iconid := A_LoopField . ":" . filetype_%iconnum%

				restored := 0
				Loop, Parse, coords, `n
				{
					if (A_Index == 1)
						continue
					already_restored := AlreadyRestored_%A_Index%
					if (! already_restored)
					{
						StringSplit, item, A_LoopField, :
						item = %item1%:%item2%
						If (item == iconid)
						{
							ICoords = %item3%
							restored := 1
							AlreadyRestored_%A_Index% := 1
							SendMessage, %LVM_SETITEMPOSITION%, % iconnum-1, %ICoords%
							NumRestaured += 1
							break
						}
					}
				}
				if (! restored && HandleExt == -1) {
					Loop, Parse, coords, `n
					{
						if (A_Index == 1)
							continue
						already_restored := AlreadyRestored_%A_Index%
						if (! already_restored)
						{
							StringSplit, item, A_LoopField, :
							SplitPath, item1, , , , item_no_ext
							item = %item_no_ext%:%item2%
							If (item == iconid)
							{
								ICoords = %item3%
								restored := 1
								AlreadyRestored_%A_Index% := 1
								SendMessage, %LVM_SETITEMPOSITION%, % iconnum-1, %ICoords%
								NumRestaured += 1
								break
							}
						}
					}
				}
				if (! restored && HandleExt == 1) {
					SplitPath, A_LoopField, , , , iconid
					iconid := iconid . ":" . filetype_%iconnum%
					Loop, Parse, coords, `n
					{
						if (A_Index == 1)
							continue
						already_restored := AlreadyRestored_%A_Index%
						if (! already_restored)
						{
							StringSplit, item, A_LoopField, :
							item = %item1%:%item2%
							If (item == iconid)
							{
								ICoords = %item3%
								AlreadyRestored_%A_Index% := 1
								SendMessage, %LVM_SETITEMPOSITION%, % iconnum-1, %ICoords%
								NumRestaured += 1
								break
							}
						}
					}
				}
			}
			; trick to force Windows to move the icons covered by restaured icons
			; to a visible location: create a temp icon on the desktop, wait intil
			; Windows shows it, delete the file and wait until Windows hides it.
			if (NumIcons > NumRestaured) {
				; TODO: Verify if there are overlapping icons.
				ControlGet, list, list, Col1, SysListView321, ahk_class %desktopclassname%
				overlapping := false
				all_coords = :
				if (A_PtrSize == 8)
				{
					; we're running under a 64bit system
					VarSetCapacity(iCoord, 16)
					pItemCoord := DllCall("VirtualAllocEx", "UInt", hProcess, "UInt", 0, "UInt", 8, "UInt", MEM_COMMIT, "UInt", PAGE_READWRITE)
					Loop, Parse, list, `n
					{
						SendMessage, %LVM_GETITEMPOSITION%, % A_Index-1, %pItemCoord%
						DllCall("ReadProcessMemory", "UInt", hProcess, "UInt", pItemCoord, "UInt64", &iCoord, "UInt", 16, "UIntP", cbReadWritten)
						coord := NumGet(iCoord)
						if (InStr(all_coords, ":" . coord . ":")) {
							overlapping := true
							break
						}
						all_coords = %all_coords%%coord%:
					}
				}
				else
				{
					; we're running under a 32bit system
					VarSetCapacity(iCoord, 8)
					pItemCoord := DllCall("VirtualAllocEx", "UInt", hProcess, "UInt", 0, "UInt", 8, "UInt", MEM_COMMIT, "UInt", PAGE_READWRITE)
					Loop, Parse, list, `n
					{
						SendMessage, %LVM_GETITEMPOSITION%, % A_Index-1, %pItemCoord%
						DllCall("ReadProcessMemory", "UInt", hProcess, "UInt", pItemCoord, "UInt", &iCoord, "UInt", 8, "UIntP", cbReadWritten)
						coord := NumGet(iCoord)
						if (InStr(all_coords, ":" . coord . ":")) {
							overlapping := true
							break
						}
						all_coords = %all_coords%%coord%:
					}
				}
				DllCall("VirtualFreeEx", "UInt", hProcess, "UInt", pItemCoord, "UInt", 0, "UInt", MEM_RELEASE)
				if (overlapping) {
; 					cur_win := WinExist("A")
					Control, Show,, SysListView321, ahk_class %desktopclassname%
					check_file = .                                          _~_temp_DesktopHomes_RefreshDesktop_~_
					FileAppend, , %A_Desktop%\%check_file%
					SendMessage, %WM_SETREDRAW%,1,0
					sleep, 10
					WinActivate, ahk_class %desktopclassname%
; 					ControlClick, SysListView321, ahk_class %desktopclassname%
; 					Send, {F5}
					refreshed := false
					loop, 50
					{
						ControlGet, list, list, Col1, SysListView321, ahk_class %desktopclassname%
						Loop, Parse, list, `n
						{
							if (A_LoopField == check_file) {
								refreshed := true
								break
							}
						}
						if (refreshed)
							break
						sleep, 50
					}
					FileDelete, %A_Desktop%\%check_file%
					loop, 50
					{
						ControlGet, list, list, Col1, SysListView321, ahk_class %desktopclassname%
						refreshed := true
						Loop, Parse, list, `n
						{
							if (A_LoopField == check_file) {
								refreshed = false
								break
							}
						}
						if (refreshed)
							break
						sleep, 50
					}
; 					if (cur_win != "" && cur_win != 0)
; 					   WinActivate, ahk_id %cur_win%
				}
			}
			ret := true
		}
	}
	if (hProcess)
		DllCall("CloseHandle", "UInt", hProcess)

	return %ret%
}

; get icons positions of the current desktop and save them to file
SaveDesktopIconsPositions(filename)
{
	if (GetCurrentViewMode())
		return 1

	coords := DeskIcons()
	if (coords != "")
	{
		FileDelete, %filename%
		FileAppend, %coords%, %filename%
		return 0
	} else
		return 1
}

GetCurrentViewMode()
{
	global LVM_GETVIEW, desktopclassname
	SetDesktopClass()
	SendMessage, %LVM_GETVIEW%, 0, 0, SysListView321, ahk_class %desktopclassname%
	return %ErrorLevel%
}

; load icons positions from file and apply them to the current desktop
RestoreDesktopIconsPositions(filename)
{
	if (GetCurrentViewMode())
		return 0

	FileRead, coords, %filename%
	if (coords != "")
		rc := DeskIcons(coords)
	return %rc%
}

; Load a desktop icons set and apply it to the current desktop
RestoreCurrentLayout(dialog, autosave)
{
	global settingsdir, WM_SETREDRAW, LastIconposPath, desktopclassname, WallpaperMode

	if (GetCurrentViewMode())
		return 1

	desktoplabel := GetLabelFromPath(A_Desktop)
	if (autosave)
		filename = %settingsdir%\%desktoplabel%__(screen%A_ScreenWidth%x%A_ScreenHeight%)_autosave.iconspos
	else
		filename = %settingsdir%\%desktoplabel%__(screen%A_ScreenWidth%x%A_ScreenHeight%).iconspos
	if (dialog) {
		filename = %LastIconposPath%\%desktoplabel%__(screen%A_ScreenWidth%x%A_ScreenHeight%).iconspos
		FileSelectFile, filename, 3, %filename%, Load icons layout and apply it to current desktop:, Icon Sets (*.iconspos)
		if (filename == "")
			return
		SplitPath, filename, , LastIconposPath
	}
	if (! FileExist(filename))
		return 1

	; restore icons positions
	ControlGet, icons_visible, Visible, , SysListView321, ahk_class %desktopclassname%
	SendMessage, %WM_SETREDRAW%,0,0
	Control, Hide,, SysListView321, ahk_class %desktopclassname%
	success := RestoreDesktopIconsPositions(filename)
	if (icons_visible)
		Control, Show,, SysListView321, ahk_class %desktopclassname%
	SendMessage, %WM_SETREDRAW%,1,0

	return %success%
}

; Called automatically after a desktop size change
DesktopSizeChanged()
{
	SetTrayIcon(1)
	RestoreCurrentLayout(false, false)
	SetTrayIcon()
	Return, 0
}

; Restore current desktop icons positions (called from tray menu)
LoadCurrentLayout:
{
	if (GetCurrentViewMode()) {
		soundbeep
		return
	}
	SetTrayIcon(1)
	RestoreCurrentLayout(true, false)
	SetTrayIcon()
	Return
}
RestoreCurrentLayout:
{
	if (GetCurrentViewMode()) {
		soundbeep
		return
	}
	SetTrayIcon(1)
	RestoreCurrentLayout(false, false)
	SetTrayIcon()
	Return
}
RestoreAutoSaveLayout:
{
	if (GetCurrentViewMode()) {
		soundbeep
		return
	}
	SetTrayIcon(1)
	RestoreCurrentLayout(false, true)
	SetTrayIcon()
	Return
}

SaveCurrentLayout:
{
	if (GetCurrentViewMode()) {
		soundbeep
		return
	}
	SetTrayIcon(1)
	SaveCurrentLayout(false)
	SetTrayIcon()
	Return
}
SaveCurrentLayoutAs:
{
	if (GetCurrentViewMode()) {
		soundbeep
		return
	}
	SetTrayIcon(1)
	SaveCurrentLayout(true)
	SetTrayIcon()
	Return
}
SaveCurrentLayout(dialog, traytip = 1)
{
	global settingsdir, LastIconposPath

	if (GetCurrentViewMode())
		return 1

	desktoplabel := GetLabelFromPath(A_Desktop)
	if (dialog) {
		filename = %LastIconposPath%\%desktoplabel%__(screen%A_ScreenWidth%x%A_ScreenHeight%).iconspos
		FileSelectFile, filename, S18, %filename%, Save current desktop icons layout as:, Icon Sets (*.iconspos)
		if (filename == "")
			return
		SplitPath, filename, , LastIconposPath, ext
		if (ext != "iconspos")
		   filename = %filename%.iconspos
	} else {
		filename = %settingsdir%\%desktoplabel%__(screen%A_ScreenWidth%x%A_ScreenHeight%).iconspos
	}
	rc := SaveDesktopIconsPositions(filename)
	if (rc == 0) {
		if (traytip) {
			SplitPath, filename, , , , filename
			TrayTip, DesktopHomes, Icons layout of desktop home "%desktoplabel%" saved to "%filename%", 5, 1
			Menu, LayoutMenu, Enable, Restore Icons Layout
		}
	} else {
		TrayTip, DesktopHomes, ERROR saving icons layout of desktop home "%desktoplabel%" to "%filename%", 10, 3
	}
	return %rc%
}

; Called automatically every N minutes when AutoSave option is on
AutoSaveTimer:
{
	if (GetCurrentViewMode())
		return
	curiconset := GetLabelFromPath(A_Desktop)
	filename = %settingsdir%\%curiconset%__(screen%A_ScreenWidth%x%A_ScreenHeight%)_autosave.iconspos
	SaveDesktopIconsPositions(filename)
	filename =
	curiconset =
	Menu, LayoutMenu, Enable, Restore Auto-saved Layout
	Return
}

; *****************************************************************************
; SwapDesktops: Save the current desktop icons positions, change the desktop path,
; and restore the new desktop icons positions
; *****************************************************************************

SwapDesktops(newpath, wallpaper = 0)
{
	Critical
	global settingsdir, WM_SETREDRAW, desktopclassname
	static working = 0

	if (working) {
		;soundbeep
		return, 1
	}

	if (A_Desktop == newpath) {
		;soundbeep
		Return, 1
	}

	if (! IsDirectory(newpath))
		Return, 1

	working = 1

	desktoplabel1 := GetLabelFromPath(A_Desktop)
	desktoplabel2 := GetLabelFromPath(newpath)
	curiconset := desktoplabel1
	newiconset := desktoplabel2

	Menu, Tray, Tip

	SendMessage, %WM_SETREDRAW%,0,0

	; Save current icons positions
	filename = %settingsdir%\%curiconset%__(screen%A_ScreenWidth%x%A_ScreenHeight%).iconspos
	SaveDesktopIconsPositions(filename)

	; Finds or save a test file on the desktop to restore to help identify when
	; Windows has finished populating the listview with the icons
	unique_icon := false
	Loop, %newpath%\*, 1
	{
		if (! Instr(FileExist(newpath . "\" . A_LoopFileName), "H")) {
			check_file_1 := A_LoopFileName
			SplitPath, check_file_1, , , ext
			if (ext == "lnk")
				SplitPath, check_file_1, , , , check_file_1
			ifNotExist, %A_Desktop%\%check_file_1%
			{
				SplitPath, check_file_1, , , , check_file_2
				ifNotExist, %A_Desktop%\%check_file_2%
				{
					unique_icon := true
					break
				}
			}
		}
	}

	; remember if the icons are currently visible
	SetDesktopClass()
	ControlGet, icons_visible, Visible, , SysListView321, ahk_class %desktopclassname%

	; swap the wallpaper
	if (wallpaper > 0)
		SetWallpaper(wallpaper)

	; hides the desktop icons during the change, so that the icons appear directly
	; at their right places (to avoid the flickering effect).
	Control, Hide,, SysListView321, ahk_class %desktopclassname%

	; creates an unique icon so that we can verify when the new desktop window has been populated by Windows
	if (! unique_icon)
	{
		check_file_1 = .                                          _~_temp_DesktopHomes_NewDesktop_~_
		FileAppend, , %newpath%\%check_file_1%
		check_file_2 = %check_file_1%
		;sleep, 5
	}

	; swap desktop folders (0x0000 = CSIDL_DESKTOP)
	DllCall("shell32\SHSetFolderPath", uint,0x0000, uint,0, uint,0, uint,&newpath)

	; notify Windows of the change (0x8000000 = SHCNE_ASSOCCHANGED, 0x1000 = SHCNF_FLUSH)
	DllCall("Shell32\SHChangeNotify", uint,0x8000000, uint,0x1000, uint,0, uint,0)

	; Waits until Windows has finished populating the listview with the icons of tne new desktop.
	WaitRefreshFinished(newpath, unique_icon, check_file_1, check_file_2)

	; restore old icons positions
	; (The first time the desktop is swapped, there is no iconpos file for the alt desktop yet,
	; so use the normal iconpos file instead.  It will at least restore the location of
	; the Recycle Bin and other special folders shown anyway by Windows.)
	filename = %settingsdir%\%newiconset%__(screen%A_ScreenWidth%x%A_ScreenHeight%).iconspos
	ICoords =
	ifExist, %filename%
		success := RestoreDesktopIconsPositions(filename)
	else
		success := false

	; Finally, show the icons again
	if (icons_visible)
		Control, Show,, SysListView321, ahk_class %desktopclassname%

	SendMessage, %WM_SETREDRAW%,1,0

	Menu, Tray, Tip, Current desktop home:`n"%desktoplabel2%"`n"%A_Desktop%"

	working = 0

	return 0
}

; Wait till Windows has finished refreshing the desktop listview
WaitRefreshFinished(newpath, unique_icon, check_file_1, check_file_2)
{
	global desktopclassname
	refreshed := false

	WinWait, ahk_class %desktopclassname%, , 10
	loop, 50
	{
		ControlGet, list, list, Col1, SysListView321, ahk_class %desktopclassname% ; file names
		Loop, Parse, list, `n
		{
			if (A_LoopField == check_file_1 || A_LoopField == check_file_2)
			{
				refreshed := true
				break
			}
		}
		if (refreshed)
			break
		sleep, 50
	}
	if (! unique_icon)
		FileDelete, %newpath%\%check_file_1%
}

; *****************************************************************************
; Utility functions:
; - convert desktop path <-> desktop label <-> desktop number
; - generate unique desktop label
; - convert absolute <-> relative path
; - ...
; *****************************************************************************

GetLabelFromPath(path)
{
	global numdesktops, DesktopLabels, DesktopPaths
	loop, %numdesktops%
	{
		if (DesktopPaths[A_Index] == path)
			return DesktopLabels[A_Index]
	}
	return
}

GetPathFromLabel(label, onlyifexist = false)
{
	global numdesktops, DesktopLabels, DesktopPaths
	loop, %numdesktops%
	{
		if (DesktopLabels[A_Index] == label) {
			path := DesktopPaths[A_Index]
			if (onlyifexist && ! IsDirectory(path))
				return
			return %path%
		}
	}
	return
}

GetDesktopNumFromPath(path)
{
	global numdesktops, DesktopPaths
	loop, %numdesktops%
	{
		if (DesktopPaths[A_Index] == path)
			return %A_Index%
	}
	return 0
}

GetDesktopNumFromLabel(label)
{
	global numdesktops, DesktopLabels
	loop, %numdesktops%
	{
		if (DesktopLabels[A_Index] == label)
			return %A_Index%
	}
	return 0
}

GenerateUniqueDesktopLabel(desktoppath)
{
	global numdesktops, DesktopLabels

	SplitPath, desktoppath, desktoplabel
	unique := IsUniqueDesktopLabel(desktoplabel)
	if (unique)
		return %desktoplabel%

	tmplabel = %desktoplabel%
	StringSplit, path_elements, desktoppath, \
	loop, %path_elements0%
	{
		itemnum := path_elements0 - A_Index
		if (itemnum == 0) {
			alt_num = 2
			While (! IsUniqueDesktopLabel(desktoplabel)) {
				desktoplabel = %tmplabel% [%alt_num%]
				alt_num += 1
			}
			return %desktoplabel%
		}
		item := path_elements%itemnum%
		desktoplabel = %tmplabel% [%item%]
		if (IsUniqueDesktopLabel(desktoplabel))
			return %desktoplabel%
	}
}

IsUniqueDesktopLabel(label)
{
	if (GetDesktopNumFromLabel(label))
		return 0
	else
		return 1
}

Abs2RelPath(path, pwd = "") {
	if (pwd == "")
		pwd := A_ScriptDir
	if (path == pwd)
		Return .
	SplitPath, path, Tail, Dir, , , Drive
	SplitPath, pwd, pwdTail, pwdDir, , , pwdDrive
	if (Drive == "" || Drive != pwdDrive)
		return %path%

	; build paths without drive letter
	Dir := SubStr(path, StrLen(Drive)+2)
	pwdDir := SubStr(pwd, StrLen(Drive)+2)

	if (InStr(Dir, pwdDir) == 1)
		return % SubStr(Dir, Strlen(pwdDir)+2)

	up =
	SplitPath, pwdDir, pwdTail, pwdDir
	While (pwdDir != "")
	{
		up = %up%..\
		if (InStr(Dir, pwdDir) == 1) {
			Dir := SubStr(Dir, Strlen(pwdDir)+2)
			if (Dir == "")
				Dir := RTrim(up, "\")
			else
				Dir = %up%%Dir%
			if (Dir == "")
				Dir = .
			Return %Dir%
		}
		SplitPath, pwdDir, pwdTail, pwdDir
	}
	up = %up%..\
	if (Dir == "")
		Dir := RTrim(up, "\")
	else
		Dir = %up%%Dir%
	if (Dir == "")
		Dir = .
	Return %Dir%
}

Rel2AbsPath(path, pwd = "") {
	if (pwd == "")
		pwd := A_ScriptDir
	if (path == ".")
		Return %pwd%
	SplitPath, path, Tail, Dir, , , Drive
	if (Drive != "")
		return %path%

	path = %path%\
	if (! InStr(path, "..\")) {
		path = %pwd%\%path%
		Return % Rtrim(path, "\")
	}

	pos := InStr(path, "..\")
	while (pos == 1) {
		SplitPath, pwd, , pwd
		path := SubStr(path, 4)
		pos := InStr(path, "..\")
	}
	path = %pwd%\%path%
	Return % RTrim(path, "\")
}

IsDirectory(path)
{
	if (InStr(FileExist(path), "D")) {
		return 1
	} else {
		return 0
	}
}

; It seems necessary to set DetectHiddenWindows ON or OFF to detect and act on
; the desktop window.  Also, the desktop window class is subject to change
; without notice at any time under Win7!
SetDesktopClass()
{
	global desktopclassname
	ControlGet, hwWindow, HWND,, SysListView321, ahk_class %desktopclassname%
	if (hwWindow)
		return %desktopclassname%
	if (%A_DetectHiddenWindows% == "ON")
		DetectHiddenWindows, OFF
	else
		DetectHiddenWindows, ON
	ControlGet, hwWindow, HWND,, SysListView321, ahk_class %desktopclassname%
	if (hwWindow)
		return %desktopclassname%

	if (desktopclassname == "Progman")
		desktopclassname = WorkerW
	else
		desktopclassname = Progman
	DetectHiddenWindows, OFF
	ControlGet, hwWindow, HWND,, SysListView321, ahk_class %desktopclassname%
	if (hwWindow)
		return %desktopclassname%
	DetectHiddenWindows, ON
	return %desktopclassname%
}

SetWallpaperTimer:
	SetWallpaper("")
return
SetWallpaper(wallpapernum, reset=0)
{
	global settingsdir, SlideShowSecs, HasMultipleWallpapers
	static lastwallpaper = -<none>-
	static lastwallpapernum = 0
	static WallpapersObj := Object()

	SPI_SETDESKWALLPAPER := 20
	SPIF_SENDCHANGE := 2

	VALID_EXTS = bmp,jpg,jpeg

	SetTimer, SetWallpaperTimer, OFF

	;TrayTip, Debug, Num: %wallpapernum%`nReset: %reset%, 5

	if (reset) {
		WallpapersObj := ""
		WallpapersObj := Object()
	}

	if (wallpapernum == "")
		wallpapernum = %lastwallpapernum%
	else
		lastwallpapernum = %wallpapernum%

	if (wallpapernum == 0 || ! FileExist(settingsdir . "\Wallpapers")) {
		HasMultipleWallpapers = 0
		Menu, tray, Disable, Next Wallpaper
		return 0
	}

	if (WallpapersObj[wallpapernum].NumWallpapers == "") {
		WallpapersObj[wallpapernum] := Object()
		dir = %settingsdir%\Wallpapers\%wallpapernum%
		if (! InStr(FileExist(dir), "D"))
			dir = %settingsdir%\Wallpapers\default
		if (InStr(FileExist(dir), "D")) {
			WallpapersObj[wallpapernum].Filenames := ""
			WallpapersObj[wallpapernum].Filenames := Object()
			Loop, %dir%\*.*
			{
				SplitPath, A_LoopFileName, , , ext
				target = %dir%\%A_LoopFileName%
        		if (ext == "lnk") {
					FileGetShortcut, %A_LoopFileLongPath%, target
					SplitPath, target, , , ext
				}
				if (FileExist(target)) {
					Loop, Parse, VALID_EXTS, CSV
					{
						if A_LoopField = %ext%
						{
							WallpapersObj[wallpapernum].Filenames.Insert(target)
							break
						}
					}
				}
			}
			num := WallpapersObj[wallpapernum].Filenames.MaxIndex()
			if num =
				num = 0
			WallpapersObj[wallpapernum].NumWallpapers := num
		} else
			WallpapersObj[wallpapernum].NumWallpapers := 0
	}


	if (WallpapersObj[wallpapernum].NumWallpapers == 0) {
		HasMultipleWallpapers = 0
		Menu, tray, Disable, Next Wallpaper
		return 0
	}

	if (WallpapersObj[wallpapernum].NumWallpapers == 1) {
		HasMultipleWallpapers = 0
		Menu, tray, Disable, Next Wallpaper
		filename := WallpapersObj[wallpapernum].Filenames[1]
	} else {
		HasMultipleWallpapers = 1
		Menu, tray, Enable, Next Wallpaper
		if (WallpapersObj[wallpapernum].SlideShow.MaxIndex() == "") {
			WallpapersObj[wallpapernum].SlideShow := ""
			WallpapersObj[wallpapernum].SlideShow := Object()
			loop, % WallpapersObj[wallpapernum].NumWallpapers
				WallpapersObj[wallpapernum].SlideShow.Insert(A_Index, A_Index)
		}
		Random, rand, 1, % WallpapersObj[wallpapernum].SlideShow.MaxIndex()
		imgnum := WallpapersObj[wallpapernum].SlideShow[rand]
		filename := WallpapersObj[wallpapernum].Filenames[imgnum]
		if (filename == lastwallpaper) {
			Random, rand, 1, % WallpapersObj[wallpapernum].SlideShow.MaxIndex()
			imgnum := WallpapersObj[wallpapernum].SlideShow[rand]
			filename := WallpapersObj[wallpapernum].Filenames[imgnum]
		}
		if (filename == lastwallpaper) {
			Random, rand, 1, % WallpapersObj[wallpapernum].SlideShow.MaxIndex()
			imgnum := WallpapersObj[wallpapernum].SlideShow[rand]
			filename := WallpapersObj[wallpapernum].Filenames[imgnum]
		}
		WallpapersObj[wallpapernum].SlideShow.Remove(rand)
		if (SlideShowSecs >= 5)
			SetTimer, SetWallpaperTimer,% SlideShowSecs * -1000, -2147483648
	}

	if (FileExist(filename))
		DllCall("SystemParametersInfo", UINT, SPI_SETDESKWALLPAPER, UINT, 0, STR, filename, UINT, SPIF_SENDCHANGE)
	else
		SetWallpaper(wallpapernum, 1)
	lastwallpaper = %filename%
	return 1
}

; *****************************************************************************
; Additional tray menu tools
; *****************************************************************************

exploredesktop:
{
	path := GetPathFromLabel(A_ThisMenuItem, true)
	if (path != "")
		run, %path%, , UseErrorLevel
	Return
}

exploreallusersdesktop:
{
	run, %A_DesktopCommon%, , UseErrorLevel
	return
}

ToggleHotkeys:
{
	EnableHotkeys := ! EnableHotkeys
	if (EnableHotkeys) {
		Menu, Tray, Check, Enable Hotkeys?
	} else {
		Menu, Tray, UnCheck, Enable Hotkeys?
	}
	IniWrite, %EnableHotkeys%, %inifile%, Settings, EnableHotkeys
	Return
}

HideHiddenFiles:
{
	ShowHiddenFiles(0)
	Return
}
ShowHiddenFiles:
{
	ShowHiddenFiles(1)
	Return
}
ShowSystemFiles:
{
	ShowHiddenFiles(2)
	Return
}
ShowHiddenFiles(mode) {
	if (mode == 0) {
		RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 2
	} else if (mode == 1) {
		RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 1
		RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, ShowSuperHidden, 0
	} else {
		RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 1
		RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, ShowSuperHidden, 1
	}
	RefreshExplorerWindows()
	return
}

HideFileExt:
{
	RegRead, HideFileExt, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt
	HideFileExt := (! HideFileExt)
	RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt, %HideFileExt%
	RefreshExplorerWindows()
	return
}

AutoCheckSelect:
{
	RegRead, AutoCheckSelect, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, AutoCheckSelect
	AutoCheckSelect := (! AutoCheckSelect)
	RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, AutoCheckSelect, %AutoCheckSelect%
	RefreshExplorerWindows()
	return
}

FolderOptionsCpl:
{
	run, %A_WinDir%\System32\rundll32.exe shell32.dll`,Options_RunDLL 7
	return
}

ToggleDesktopIcons:
{
	SetDesktopClass()
	ControlGet, icons_visible, Visible, , SysListView321, ahk_class %desktopclassname%
	if (icons_visible)
		Control, Hide,, SysListView321, ahk_class %desktopclassname%
	else
		Control, Show,, SysListView321, ahk_class %desktopclassname%
	return
}

ToggleDesktopViewMode:
{
	if (GetCurrentViewMode())
		GoSub, RestoreIconsViewMode
	else {
		ControlGet, hwWindow, HWND,, SysListView321, ahk_class %desktopclassname%
		SaveCurrentLayout(false, 0)
		SendMessage, %LVM_SETVIEW%, %AltViewMode%, 0, , ahk_id %hwWindow%
		IniWrite, %LV_VIEW_SMALLICON%, %inifile%, Settings, LastViewMode
	}
	return
}

RestoreIconsViewMode:
{
	Critical
	if (GetCurrentViewMode()) {
		ControlGet, hwWindow, HWND,, SysListView321, ahk_class %desktopclassname%
		SendMessage, %WM_SETREDRAW%,0,0
		SendMessage, %LVM_SETVIEW%, %LV_VIEW_ICON%, 0, , ahk_id %hwWindow%
		ControlGet, icons_visible, Visible, , SysListView321, ahk_class %desktopclassname%
		Control, Hide,, SysListView321, ahk_class %desktopclassname%
		RestoreCurrentLayout(false, false)
		if (icons_visible)
			Control, Show,, SysListView321, ahk_class %desktopclassname%
		SendMessage, %WM_SETREDRAW%,1,0
		IniWrite, %LV_VIEW_ICON%, %inifile%, Settings, LastViewMode
	}
	Critical, off
	return
}

TurnMonitorOff:
{
	TrayTip, Energy Saver, Turning monitor OFF..., 2, 1
	Sleep 3000
	SendMessage, 0x112, 0xF170, 2, , Program Manager
	TrayTip
	Return
}

ScreenResolution:
{
	curiconset := GetLabelFromPath(A_Desktop)
	filename = %settingsdir%\%curiconset%__(screen%A_ScreenWidth%x%A_ScreenHeight%).iconspos
	SaveDesktopIconsPositions(filename)
	run, desk.cpl
	filename =
	curiconset =
	return
}

RefreshExplorerWindows:
{
	RefreshExplorerWindows()
	Return
}
RefreshExplorerWindows()
{
	global desktopclassname, WM_SETREDRAW

	SendMessage, %WM_SETREDRAW%,1,0
	;sleep, 10

	; refresh Desktop
	SetDesktopClass()
	ControlSend, ahk_parent, {F5}, ahk_class %desktopclassname%

	; refresh all Explorer windows
	DetectHiddenWindows, off
	ControlSend, SysListView321, {F5}, ahk_group ExplorerWindowsGroup
	ControlSend, DirectUIHWND3,  {F5}, ahk_group ExplorerWindowsGroup

	RefreshTrayMenu()
	return
}

; *****************************************************************************
; Settings GUI
; *****************************************************************************

GuiSetup:
{
	if (Setup_running) {
		WinActivate, DesktopHomes v%version% by r0lZ - Freeware
		return
	}

	Setup_running = 1
	SetTimer, AutoSaveTimer, OFF
	SetTimer, SetWallpaperTimer, OFF
	Menu, Tray, Noicon

	DropDownOptions =
	options = Turn Monitor Off`,Show Desktop Icons?`,Tiles View?`,Save Icons Layout`,Restore Icons Layout`,Swap Desktop homes`,Select Desktop popup menu`,View popup menu`,Icons Layout popup menu`,Do nothing

	Loop, parse, options, CSV
	{
		DropDownOptions = %DropDownOptions%%A_LoopField%|
		if (A_LoopField == LMBdefault)
			LMBnum := A_Index
		if (A_LoopField == MMBdefault)
			MMBnum := A_Index
		if (A_LoopField == DesktopDefault)
			DeskMMBnum := A_Index
	}
	options =

	Gui, Font, S8, Tahoma
	Gui, Margin, 4, 6
	Gui, Add, Tab2, W402 H346 Section vSettingsTab, Desktop Homes|Wallpapers|Home Startup|Other Settings


	Gui, Tab, 1

	Gui, Add, Listview, Section Count%numdesktops% X10 Y34 r13 w363 -Multi NoSort NoSortHdr -ReadOnly, Home Label|Desktop Home path

	Gui, Add, Button, X376 Y34 W24 H24 gGuiUp,   ↑
	Gui, Add, Button, X376 Y62 W24 H24 gGuiDown, ↓

	Gui, Add, Button, W114 gGuiAdd XS Section, Add Home
	Gui, Add, Button, W114 gGuiRemove YS, Remove Home
	Gui, Add, Button, W154 gGuiRemoveDead YS, Remove Dead Homes
	Gui, Add, Text, W390 Section XS, Click a home label to edit it.  All labels must be uniques.`nUse only characters valids in file names! ( Prohibited: \ / | : * ? < > `` " )


	Gui, Tab, 2

	txt = To associate a wallpaper or a slideshow with a desktop home (or with a VirtuaWin desktop), just place some BMP or JPEG images (or shortcuts to BMP or JPEG images) in the "Wallpapers\#" folder (where "#" is the number of the desktop home).  If there are several images in the folder, the slide show will be automatically enabled.
	txt = %txt%  For example, to associate a slideshow with the desktop home number 2, create a new folder "2" in the "Wallpapers" folder, and place several JPEG or BMP images or shortcuts in that folder.`n`n
	txt = %txt%When there is no folder corresponding to the current desktop number, the folder "Wallpapers\default" is used.`n`n
	txt = %txt%Note:  Due to a bug in Windows7, changing the wallpapers disables the wallpaper slideshow of Windows 7.`n

	Gui, Add, Text, X10 Y34 W390 Section, %txt%

	if (WallpaperMode == 1)
		c = Checked
	else
		c =
	Gui, Add, Radio, vWallpaperMode Section %c%, Associate wallpapers with the desktop homes
	if (WallpaperMode == 2)
		c = Checked
	else
		c =
	Gui, Add, Radio, %c%, Associate wallpapers with the VirtuaWin virtual desktops
	if (WallpaperMode == 0)
		c = Checked
	else
		c =
	Gui, Add, Radio, %c%, Do not change the wallpaper (Recommended for portable mode)

	Gui, Add, Text, Section Y+15, Slideshow delay in seconds (0 or < 5 to disable)
	Gui, Add, Edit, W80 YS-3 Number
	Gui, Add, UpDown, vSlideShowSecs Range0-3600, %SlideShowSecs%

	Gui, Add, Button, X10 Y320 W390 gGUIOpenWallpapersFolder Section, Open the Wallpapers folder to configure your wallpapers


	Gui, Tab, 3

	txt = DesktopHomes can launch automatically shortcuts to programs or files when it selects a specific desktop home.`n`n
	txt = %txt%To use this feature, put shortcuts to the programs or files you want to launch in the folder named "Home Startup" on the desktop.  That folder is similar to the "Startup" folder of your Start menu.`n
	txt = %txt%The startup items can also be launched from the DesktopHomes tray menu.`n`n
	txt = %txt%To prevent launching several times the same programs, DesktopHomes checks if a program is already running, and doesn't launch it when it's the case.  However, that feature doesn't work with shortcuts to documents or files.`n`n
	txt = %txt%Note also that the Home Startup folder can be hidden, but the hidden files in that folder are never executed.`n`n
	txt = %txt%When a new home is selected, the Control key can be used to instruct DesktopHomes to execute the Home Startup items or to ignore them:
	Gui, Add, Text, X10 Y34 W390 Section, %txt%

	if (HomeStartupControl) {
		c1 = Checked
		c2 =
	} else {
		c1 =
		c2 = Checked
	}
	Gui, Add, Radio, vHomeStartupControl Section %c1%, Press the Control key to execute the Home Startup items
	Gui, Add, Radio, %c2%, Press the Control key to ignore the Home Startup items

	Gui, Add, Button, X10 Y320 W390 gGUICreateHomeStartupFolder Section %style%, Create or open the Home Startup folder of the current Desktop home


	Gui, Tab, 4

	Gui, Add, GroupBox, X10 Y32 W390 H42, Auto-save

	Gui, Add, Checkbox, X16 Y52 Section vautosave Checked%autosave%, Automatically save current icons positions every
	Gui, Add, Edit, YS-3 W50 Limit Number
	Gui, Add, UpDown, vautosaveevery Range1-360, %autosaveevery%
	Gui, Add, Text, YS, minutes ?


	Gui, Add, GroupBox, X10 Y83 W390 H112, Mouse shortcuts

	Gui, Add, Text, W186 XS Y107 Section, Left mouse button on tray icon:
	Gui, Add, DropDownList, W186 YS-4 vLMBdefault Choose%LMBnum%, %DropDownOptions%

	Gui, Add, Text, W186 Section XS, Middle mouse button on tray icon:
	Gui, Add, DropDownList, W186 YS-4 vMMBdefault Choose%MMBnum%, %DropDownOptions%

	Gui, Add, Text, W186 Section XS, Middle mouse button on Desktop:
	Gui, Add, DropDownList, W186 YS-4 vDesktopDefault Choose%DeskMMBnum%, %DropDownOptions%

	Gui, Add, Text, Section XS, X1 and X2 mouse buttons on tray icon:  Previous Desktop and Next Desktop


	Gui, Add, GroupBox, X10 Y203 W390 H140, Integration with VirtuaWin

	Gui, Add, Checkbox, XS Y227 Section vVWIntegration Checked%VWIntegration%, Integrate with
	Gui, Add, Button, YS-5 gVWWebSite, VirtuaWin Portable
	Gui, Add, Text, YS, ?
	Gui, Add, Button, YS-5 X250 W144 gGuiSetVWPath, Set VirtuaWin's path
	Gui, Add, Checkbox, XS Section vVWLaunch Checked%VWLaunch%, Launch VirtuaWin when DesktopHomes starts ?  (Highly recommended)
	Gui, Add, Checkbox, XS YS+24 Section vUseTrayTips Checked%UseTrayTips%, Tray icon notifications when forcing the VirtuaWin's desktop home?
	Gui, Add, Button, gGUIStartWirtuaWin W378 Section, Start or configure VirtuaWin now
	Gui, Add, Text, XS Section CRed, You MUST have write access to the VirtuaWin's installation directory!


	Gui, Tab

	Gui, Add, Button, W90 gGuiOK X222 Y364 Section, OK
	Gui, Add, Button, W90 gGuiClose YS, Cancel
	Gui, -MaximizeBox -MinimizeBox
	Gui, Add, StatusBar,,

	DropDownOptions =

	loop, %numdesktops%
		LV_Add("",DesktopLabels[A_Index],DesktopPaths[A_Index])
	LV_ModifyCol()
	LV_Modify(1, "Select")
	LV_Modify(1, "Focus")

	Gui, Show, , DesktopHomes v%version% by r0lZ - Freeware
	return
}

GuiOK:
{
	numitems := LV_GetCount()
	all_labels = ::
	renamed = 0
	loop, %numitems%
	{
		LV_GetText(itemlabel, A_Index, 1)
		LV_GetText(itempath,  A_Index, 2)
		if (InStr(all_labels, "::" . itemlabel . "::")) {
			soundbeep
			SB_SetText("Label " . A_Quotes . itemlabel . A_Quotes . " used twice!")
			GuiControl, Choose, SettingsTab, 1
			LV_Modify(A_Index, "Select")
			LV_Modify(A_Index, "Focus")
			all_labels =
			return
		}
		all_labels = %all_labels%%itemlabel%::
		if itemlabel contains :,\,/,?,*,<,>,|,``,"
		{
			soundbeep
			SB_SetText("Label " . A_Quotes . itemlabel . A_Quotes . " contains an illegal character!")
			GuiControl, Choose, SettingsTab, 1
			LV_Modify(A_Index, "Select")
			LV_Modify(A_Index, "Focus")
			all_labels =
			return
		}
		loop, %numitems%
		{
			if (DesktopPaths[A_Index] == itempath && DesktopLabels[A_Index] != itemlabel)
				renamed = 1
		}
	}
	all_labels =

	; Rename .iconspos files according to label changes
	if (renamed) {
		filenum = 0
		filesMoved := Object()
		loop, %numdesktops%
		{
			itemlabel := DesktopLabels[A_Index]
			loop, %settingsdir%\%itemlabel%__(screen*x*)*.iconspos
			{
				filenum += 1
				filesMoved[filenum] := A_LoopFileName
				FileMove, %settingsdir%\%A_LoopFileName%, %settingsdir%\___-%filenum%-___.tmpiconspos
				Sleep, 5  ; Win7 bug workaround
			}
		}
		loop, %filenum%
		{
			filename   = %settingsdir%\___-%A_Index%-___.tmpiconspos
			old_label := SubStr(filesMoved[A_Index], 1, InStr(filesMoved[A_Index], "__(screen")-1)
			old_tail  := SubStr(filesMoved[A_Index], InStr(filesMoved[A_Index], "__(screen"))
			loop, %numdesktops%
			{
				if (DesktopLabels[A_Index] == old_label) {
					 old_path := DesktopPaths[A_Index]
					 loop, %numitems%
					 {
						 LV_GetText(new_path,  A_Index, 2)
						 if (new_path == old_path) {
							 LV_GetText(new_label,  A_Index, 1)
							 FileRecycle, %settingsdir%\%new_label%%old_tail% ; just in case an old file exists
							 FileMove, %filename%, %settingsdir%\%new_label%%old_tail%
							 Sleep, 5  ; Win7 bug workaround
						 }
					 }
				}
			}
		}
		filesMoved =
	}

	IniDelete, %inifile%, Settings, NumDesktops
	IniDelete, %inifile%, Desktops
	loop, %numdesktops% {
		DesktopLabels[A_Index] =
		DesktopPaths[A_Index] =
	}

	IniWrite, %numitems%, %inifile%, Settings, NumDesktops
	last_desktop_found = 0
	loop, %numitems%
	{
		LV_GetText(itemlabel, A_Index, 1)
		LV_GetText(itempath, A_Index, 2)
		IniWrite, %itemlabel%, %inifile%, Desktops, DesktopLabel_%A_Index%
		IniWrite, % Abs2RelPath(itempath), %inifile%, Desktops, Desktop_Path_%A_Index%
		DesktopLabels[A_Index] := itemlabel
		DesktopPaths[A_Index] := itempath
		if (lastdesktop == itempath)
			last_desktop_found = 1
	}
	numdesktops = %numitems%
	itemrelpath =

	if (! last_desktop_found) {
		IniDelete, %inifile%, Settings, LastDesktop
		lastdesktop =
	}
	last_desktop_found =

	Gui, Submit, NoHide
	IniWrite, %LMBdefault%, %inifile%, Settings, LMBdefault
	IniWrite, %MMBdefault%, %inifile%, Settings, MMBdefault
	IniWrite, %DesktopDefault%, %inifile%, Settings, DesktopDefault
	IniWrite, %autosave%,   %inifile%, Settings, AutoSave
	IniWrite, %autosaveevery%, %inifile%, Settings, AutoSaveEveryNMinutes
	IniWrite, %UseTrayTips%, %inifile%, Settings, UseTrayTips
	IniWrite, %AltViewMode%, %inifile%, Settings, AltViewMode
	if (WallpaperMode == 3)
		WallpaperMode = 0
	IniWrite, %WallpaperMode%, %inifile%, Settings, WallpaperMode
	if SlideShowSecs is not integer
	   SlideShowSecs = 0
	IniWrite, %SlideShowSecs%, %inifile%, Settings, SlideShowSecs
	if (HomeStartupControl == 2)
		HomeStartupControl = 0
	IniWrite, %HomeStartupControl%, %inifile%, Settings, HomeStartupControl


	; VirtuaWin integration
	if (VWIntegration && (VWPath == "" || ! FileExist(VWPath . "\modules\VWDesktopHomes.exe")))
		GoSub, GuiSetVWPath
	IniWrite, %VWIntegration%, %inifile%, VirtuaWin, VWIntegration
	IniWrite, %VWLaunch%, %inifile%, VirtuaWin, VWLaunch

	IniWrite, %VWKvasdoPagerMMBHotkey%,    %inifile%, VWKvasdoPager, MMBHotkey
	IniWrite, %VWKvasdoPagerRMBHotkey%,    %inifile%, VWKvasdoPager, RMBHotkey
	IniWrite, %VWKvasdoPagerX1MBHotkey%,   %inifile%, VWKvasdoPager, X1MBHotkey
	IniWrite, %VWKvasdoPagerX2MBHotkey%,   %inifile%, VWKvasdoPager, X2MBHotkey
	IniWrite, %VWKvasdoPagerMWUpHotkey%,   %inifile%, VWKvasdoPager, MWUpHotkey
	IniWrite, %VWKvasdoPagerMWDownHotkey%, %inifile%, VWKvasdoPager, MWDownHotkey


	GoSub, BuildTrayMenu

	GoSub, GuiCancel    ; cleanup & destroy GUI window

	if (VWIntegration)
		InitVirtuaWinModule(VWPath)
	else if (VWPath != "")
		FileDelete, %VWPath%\modules\VWDesktopHomes.exe.hwnd

	Return
}

GuiCancel:
GuiEscape:
GuiClose:
{
	numitems =
	itempath =
	item =
	existing =
	existinglabel =
	Gui, Destroy
	Menu, Tray, Icon
	if (autosave) {
		timer_interval := autosaveevery * 60000
		SetTimer, AutoSaveTimer, %timer_interval%, -2147483648
		timer_interval =
	}
	if (WallpaperMode == 1)
		wallpaper := GetDesktopNumFromPath(desktoppath)
	else if (WallpaperMode == 2)
		wallpaper := VW_CurDesktop
	else
		wallpaper = 0
	SetWallpaper(wallpapernum, 1)
	Setup_running = 0
	Return
}

GuiDropFiles:
{
	Loop, parse, A_GuiEvent, `n
	{
		if (IsDirectory(A_LoopField)) {
			itempath = %A_LoopField%
			GoSub, GuiAddFolder
		} else {
			soundbeep
			SB_SetText("Drop only folders!")
			GuiControl, Choose, SettingsTab, 1
		}
		Break
	}
	Return
}

GuiAdd:
{
	item := LV_GetNext()
	if (item > 0)
		LV_GetText(itempath, item, 2)
	else
		itempath := %A_Desktop%
	SplitPath, itempath, , itempath
	if (! FileExist(itempath))
		itempath =
	FileSelectFolder, itempath, *%itempath%, 1, Select additional Desktop folder...`n(Use a new empty folder or a folder with a few files or shortcuts.)`nThe folder name MUST not be already present in the folders list.
	if (itempath == "") {
		SB_SetText("Cancelled by user.")
		Return
	}
	GoSub, GuiAddFolder
	Return
}

GuiAddFolder:
{
	if (itempath == A_DesktopCommon) {
		soundbeep
		SB_SetText("The All Users Desktop cannot be used!")
		Return
	}
	numitems := LV_GetCount()
	itemlabel := GenerateUniqueDesktopLabel(itempath)
	loop, %numitems%
	{
		LV_GetText(existing, A_Index, 2)
		if (existing == itempath) {
			soundbeep
			SB_SetText("Folder already exist: " . itempath)
			Return
		}
		SplitPath, existing, existinglabel
		if (itemlabel == existinglabel) {
			SB_SetText("Home label already exist: " . itemlabel . " Please modify it!")
			GuiControl, Choose, SettingsTab, 1
		}
	}
	LV_Add("", itemlabel, itempath)
	numitems += 1
	GuiControl, Choose, SettingsTab, 1
	LV_Modify(numitems, "Select")
	LV_Modify(numitems, "Focus")
	SB_SetText("Added: " . itempath)

	Return
}

GuiRemove:
{
	numitems := LV_GetCount()
	if (numitems == 1) {
		soundbeep
		SB_SetText("Cannot remove the last folder!")
		return
	}
	item := LV_GetNext()
	if (item == 0) {
		soundbeep
		SB_SetText("No item selected!")
		Return
	}
	LV_GetText(itempath, item, 2)
	if (itempath == A_Desktop) {
		soundbeep
		SB_SetText("Cannot remove the current desktop!")
		Return
	}

	LV_Delete(item)
	if (item == numitems)
		item -= 1
	LV_Modify(item, "Select")
	LV_Modify(item, "Focus")
	SB_SetText("Removed: " . itempath)

	Return
}

GuiRemoveDead:
{
	numitems := LV_GetCount()
	loop, %numitems%
	{
		item := numitems + 1 - A_Index
		LV_GetText(itempath, item, 2)
		if (! IsDirectory(itempath))
			LV_Delete(item)
	}
	Return
}

GuiUp:
{
	numitems := LV_GetCount()
	if (numitems == 1) {
		soundbeep
		SB_SetText("Cannot move the last folder!")
		return
	}
	item := LV_GetNext()
	if (item == 0) {
		soundbeep
		SB_SetText("No item selected!")
		Return
	}
	LV_GetText(itemlabel, item, 1)
	LV_GetText(itempath, item, 2)

	LV_Delete(item)
	item -= 1
	if (item < 1) {
		item := numitems
		LV_Add("", itemlabel, itempath)
	} else {
		LV_Insert(item, "", itemlabel, itempath)
	}

	LV_Modify(item, "Select")
	LV_Modify(item, "Focus")
	SB_SetText("")

	Return
}

GuiDown:
{
	numitems := LV_GetCount()
	if (numitems == 1) {
		soundbeep
		SB_SetText("Cannot move the last folder!")
		return
	}
	item := LV_GetNext()
	if (item == 0) {
		soundbeep
		SB_SetText("No item selected!")
		Return
	}
	LV_GetText(itemlabel, item, 1)
	LV_GetText(itempath, item, 2)

	LV_Delete(item)
	item += 1
	if (item > numitems)
		item := 1
	LV_Insert(item, "", itemlabel, itempath)

	LV_Modify(item, "Select")
	LV_Modify(item, "Focus")
	SB_SetText("")

	Return
}

VWWebSite:
{
	Run, http://virtuawin.sourceforge.net/
	return
}

GuiSetVWPath:
{
	init_ok = 1
	FileSelectFolder, tmp, *%VWPath%, 0, DesktopHomes's VirtuaWin integration configuration`nYou MUST have write access to the modules directory!`nSelect the VirtuaWin's installation directory:
	if (tmp == "" || ! InStr(FileExist(tmp), "D")) {
		init_ok = 0
	} else {
		VWPath := tmp
		IniWrite, % Abs2RelPath(VWPath), %inifile%, VirtuaWin, VWPath
		if (! FileExist(VWPath . "\modules\VWDesktopHomes.exe") && InStr(FileExist(VWPath . "\modules"), "D")) {
			FileCopy, %A_ScriptDir%\VWDesktopHomes.exe, %VWPath%\modules\VWDesktopHomes.exe
		}
		if (! FileExist(VWPath . "\modules\VWDesktopHomes.exe")) {
			MsgBox, 48, DesktopHomes's VirtuaWin integration, VWDesktopHomes.exe is not present in the VirtuaWin's Modules path.`nPlease copy it manually and relaunch DesktopHomes.
			init_ok = 0
		}
	}
	if (! init_ok) {
		GUI_VWIntegration = 0
		GuiControl, , GUI_VWIntegration, 0
	}
	return
}

GUIStartWirtuaWin:
{
	run, %VWPath%\VirtuaWin.exe, %VWPath%, UseErrorLevel
	return
}

GUIOpenWallpapersFolder:
{
	dir = %settingsdir%\Wallpapers
	if (! IsDirectory(dir)) {
		FileCreateDir, %dir%
		FileCreateDir, %dir%\default
		FileCreateDir, %dir%\1
		FileCreateDir, %dir%\2
	}
	Run, %dir%, %dir%, UseErrorLevel
	return
}

GUICreateHomeStartupFolder:
{
	FileCreateDir, %A_Desktop%\Home Startup
	Run, %A_Desktop%\Home Startup, , UseErrorLevel
	return
}

; *****************************************************************************
; ; VirtuaWin related stuff
; *****************************************************************************

; Init VirtuaWin module.  MUST be called when no GUI window or dialog is open or hidden!
InitVirtuaWinModule(VWPath) {
	if (VWPath == "")
		return false
	VWModulesPath = %VWPath%\modules
	if (! InStr(FileExist(VWModulesPath), "D")) {
		MsgBox, 48, DesktopLoactions - Integration with WirtuaWin, The VirtuaWin's Modules folder does not exist:`n"%VWModulesPath%"
		return false
	}
	if (! FileExist(VWModulesPath . "\VWDesktopHomes.exe")) {
		MsgBox, 48, DesktopLoactions - Integration with WirtuaWin, VWDesktopHomes.exe is not present in the VirtuaWin Modules folder.`nPlease copy it manually and relaunch VirtuaWin.
		return false
	}

	;FileDelete, %VWModulesPath%\VWDesktopHomes.exe.hwnd

	GENERIC_WRITE = 0x40000000  ; Open the file for writing rather than reading.
	CREATE_ALWAYS = 2  ; Create new file (overwriting any existing file).
	hFile := DllCall("CreateFile", "str", VWModulesPath . "\VWDesktopHomes.exe.hwnd", "Uint", GENERIC_WRITE, "Uint", 0, "UInt", 0, "UInt", CREATE_ALWAYS, "Uint", 0, "UInt", 0)
	if not hFile
	{
		MsgBox, 48, DesktopLoactions - Integration with WirtuaWin, Can't open the hwnd file for writing:`n"%VWModulesPath%\VWDesktopHomes.exe.hwnd"
		return false
	}
	pid:=DllCall("GetCurrentProcessId","Uint")
	DetectHiddenWindows, On
	hwnd:=WinExist("ahk_pid " . pid)		;Get the handle of AHK's window
	DetectHiddenWindows, Off

	hwnd+=0x1111<<32		;This is the message offset (can be zero)
							;Note that WM_USER is 0x400
							;The first module message: MOD_CHANGEDESK, is WM_USER+30
							;here offset to 0x1511+30

	DllCall("WriteFile", "UInt", hFile, "UIntP", hwnd, "UInt", 8, "UIntP", BytesActuallyWritten, "UInt", 0)
	DllCall("CloseHandle", "UInt", hFile)

	OnMessage(0x1511+30 , "VWDesktopChange")	;Change Desk
	OnMessage(0x1511+31 , "VWDesktopChange")	;Step Left
	OnMessage(0x1511+32 , "VWDesktopChange")	;Step Right
	OnMessage(0x1511+33 , "VWDesktopChange")	;Step Up
	OnMessage(0x1511+34 , "VWDesktopChange")	;Step Down
	;OnMessage(0x1511+36 , "VWDesktopQuit")  ; Module Quit <- message passthrough module doesn't send this?
	OnMessage(0x1511+37 , "VWConfigModule")	;Module Configuration

	return true
}

; VWDesktopQuit(wParam, lParam, msg, hwnd)
; {
;     MsgBox, VW Quits or reloads
; }

VWDesktopChange(wParam, lParam, msg, hwnd)
{
	Global VW_CurDesktop
	VW_CurDesktop := lParam
	GoSub, VWDesktopChange
}
VWDesktopChange:
{
	Critical
	SetTrayIcon(1)
	if (VWIntegration) {
		if (UseTrayTips)
			TrayTip
		if (VW_CurDesktop > VWNumDesktops) {
			VWNumDesktops = %VW_CurDesktop%
			VW_ForcedSession[VWNumDesktops] := ""
			IniWrite, %VWNumDesktops%, %inifile%, VirtuaWin, VWNumDesktops
			IniDelete, %inifile%, VirtuaWin, VW_Desktop_%VWNumDesktops%
		}

		newpath := VW_ForcedSession[VW_CurDesktop]
		wallpaper_restored = 0
		if (newpath != "" && InStr(FileExist(newpath), "D")) {
			desktoplabel := GetLabelFromPath(newpath)
			if (desktoplabel != "") {
				if (newpath != A_Desktop) {
					if (UseTrayTips)
						TrayTip, DesktopHomes, VirtuaWin desktop #%VW_CurDesktop%:`nForcing home "%desktoplabel%".
					GoSub, selectdesktop
					wallpaper_restored = 1
				} else {
					SetWallpaper(VW_CurDesktop)
					wallpaper_restored = 1
					SaveCurrentLayout(false, 0)
				}
			}
		}
		if (! wallpaper_restored && WallpaperMode == 2)
			SetWallpaper(VW_CurDesktop)
	}
	GoSub, UpdateVWMenu
	SetTrayIcon()
	Critical, OFF
	return
}

VW_ForceCurrentPathAlways:
{
	VW_ForcedAlways[VW_CurDesktop]  := A_Desktop
	VW_ForcedSession[VW_CurDesktop] := A_Desktop
	IniWrite, % Abs2RelPath(A_Desktop), %inifile%, VirtuaWin, VW_Desktop_%VW_CurDesktop%
	GoSub, UpdateVWMenu
	GoSub, VW_ForcePathInfo
	return
}
VW_ForceCurrentPathSession:
{
	VW_ForcedSession[VW_CurDesktop] := A_Desktop
	GoSub, UpdateVWMenu
	GoSub, VW_ForcePathInfo
	return
}
VW_DoNotChangePath:
{
	VW_ForcedAlways[VW_CurDesktop] := ""
	VW_ForcedSession[VW_CurDesktop] := ""
	IniDelete, %inifile%, VirtuaWin, VW_Desktop_%VW_CurDesktop%
	GoSub, UpdateVWMenu
	GoSub, VW_ForcePathInfo
	return
}
VW_ForcePathInfo:
{
	forced1 = No
	if (VW_ForcedAlways[VW_CurDesktop] != "") {
		forced1 := GetLabelFromPath(VW_ForcedAlways[VW_CurDesktop])
	}
	forced2 = No
	if (VW_ForcedSession[VW_CurDesktop] != "") {
		forced2 := GetLabelFromPath(VW_ForcedSession[VW_CurDesktop])
	}
	TrayTip, DesktopHomes, VirtuaWin Desktop #%VW_CurDesktop%`nAlways forced: %forced1%`nCurrently forced: %forced2%, 30, 1
	forced1 =
	forced2 =
	return
}

VWConfigModule(wParam, lParam, msg, hwnd)
{
	GoSub, GuiSetup
}

UpdateVWMenu:
{
	if (HomeStartup(A_Desktop, 1))
		menu, tray, enable,  Execute Home Startup items
	else
		menu, tray, disable, Execute Home Startup items

	if (VWIntegration) {
		if (VW_ForcedSession[VW_CurDesktop] != "" || VW_ForcedAlways[VW_CurDesktop] != "") {
			menu, tray, check, Set VirtuaWin desktop home
			if (VW_ForcedAlways[VW_CurDesktop] != "")
				menu, VWMenu, check, Force current home (always)
			else
				menu, VWMenu, uncheck, Force current home (always)
			if (VW_ForcedSession[VW_CurDesktop] != "" && VW_ForcedSession[VW_CurDesktop] != VW_ForcedAlways[VW_CurDesktop])
				menu, VWMenu, check, Force current home (session)
			else
				menu, VWMenu, uncheck, Force current home (session)
			menu, VWMenu, uncheck, Do not force home
		} else {
			menu, tray, uncheck, Set VirtuaWin desktop home
			menu, VWMenu, uncheck, Force current home (always)
			menu, VWMenu, uncheck, Force current home (session)
			menu, VWMenu, check, Do not force home
		}
;		menu, tray, enable, Set VirtuaWin desktop home
; 	} else {
; 		menu, tray, uncheck, Set VirtuaWin desktop home
; 		menu, tray, disable, Set VirtuaWin desktop home
	}
	return
}

; *****************************************************************************
; Clean exit stuff
; *****************************************************************************

Quit:
	SetTimer, AutoSaveTimer, OFF
	SetTimer, SetWallpaperTimer, OFF
	GoSub, RestoreIconsViewMode
ExitApp

WM_QUERYENDSESSION(wParam, lParam)
{
	if (VWPath != "")
		FileDelete, %VWPath%\modules\VWDesktopHomes.exe.hwnd
	return 1
}

cleanexit:
{
	SetTimer, AutoSaveTimer, OFF
	SetTimer, SetWallpaperTimer, OFF
	if (VWPath != "")
		FileDelete, %VWPath%\modules\VWDesktopHomes.exe.hwnd
	ExitApp
}
