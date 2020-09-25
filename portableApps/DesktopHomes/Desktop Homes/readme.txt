DesktopHomes Documentation
-------------------------------------------------------------------------------

CAUTION: Use this program at your own risk!
DesktopHomes must be run under Windows Vista or Win 7 (32 or 64-bit).  It has been developed under Windows 7 X64.  It doesn't work under XP or earlier systems.  The X64 version must be used under 64-bit sysems.

DesktopHomes allows you to define several "desktop homes" and switch between them with a few mouse clicks on the tray icon.  It is NOT a virtual desktop manager.

A "Desktop Home" is a folder containing the files and shortcuts shown on your desktop.  The default desktop home is "%userprofile%\Desktop" (usually "C:\Users\<you>\Desktop" under Win7).  With DesktopHomes, you can define several other folders and use them to store specific shortcuts or files.  For example, you can define a new desktop for your work, and another one for the games, and place shortcuts to your important programs or games in the relevant folders.  You can then switch to the right home when you want to work or play a game.

DesktopHomes uses the official Windows function SHSetFolderPath() to change the desktop location, and then restores the icons positions.

You can also save the current icon positions to a file, and restore them later.

Optionnally, it is also possible to assign a different wallpaper or slideshow to any desktop home.

DesktopHomes can be integrated with VirtuaWin (an excellent Virtual Desktop manager).  When it's the case, you can assign a different home to any virtual desktop.  When you will switch to another virtual desktop with VirtuaWin (or with any VirtuaWin extension), DesktopHomes will check if a specific home has been assigned to that virtal desktop, and if it's the case, it will change the desktop location to that home, restore the icon positions, and change the wallpaper.

In addition to the possibility to change the desktop location, DesktopHomes can also do some additional things:
- Show or hide the desktop icons
- Show the icons in "Tile View"
- Change some folder options (such as Show/Hide hidden files)
- Put the monitor in sleep mode immediately

-------------------------------------------------------------------------------
Settings
********

Portable Mode
-------------

When you run DesktopHomes for the first time, it will ask if you want to install it in portable mode, and then it will open its settings window.

The path to the desktops are always saved relatively to the installation path of DesktopHomes.  That means that you can install DesktopHomes on a USB stick and define one (or several) home(s) on the stick.  When you will plug the stick in another computer, you will be able to use your personal desktop home, even if the drive letter of your USB stick has changed.  (However, note that shortcuts created by Windows on your desktop contain absolute paths, and cannot be made portable.)

Note: In portable mode, the setting files are saved in "<DesktopHomes installation folder>\Settings".  In normal mode, they are saved in "%appdata%\DesktopHomes".  You can move the settings folder to the other location to change the installation mode.


The Settings window
*******************

First tab: Desktop Homes
------------------------

In this tab, you can add any number of desktop homes.  To do this, just click the "Add Home" button, and create a new folder somewhere (or select an existing one).  The selected folder will become your new desktop home.

You can rename any home by clicking its label in the first column of the listview.  Renaming a desktop home does not rename the folder.  It just changes the label displayed in the DesktopHomes GUI.  (The label must be unique, as it is also used to store the configuration for that specific home.)

Select any home and click "Remove Desktop" to remove that home.  The folder itself is not deleted.

"Remove Dead Desktops" can be used to automatically remove all desktop homes that do not have a valid folder associated with them.  (It's handy when you use DesktopHomes in portable mode on a USB stick.  Each time you launch it on another computer, the current desktop location will be automatically added to the list of homes, so that you can restore the original home easily before unplugging the USB stick.  After some times, your list of homes will contain "dead homes", and you may want to remove them using this button.)

The two arrow buttons can be used to change the order of the homes.

Second tab: Wallpapers
----------------------

To assign a different wallpaper to a specific home, click the "Open the Wallpapers folder" button, and copy a single BMP or JPEG image in the sub-folder corresponding to the home number.
To assign a slideshow to a specific home, place several BMP or JPEG images in the same folder, and set the delay between changes in the "Slideshow delay" field.
If there are no images in the folder corresponding to the current home number, the folder "default" is searched.  If there are no images in that folder, the current wallpaper is not changed.
To disable completely the wallpaper support, just delete the whole Wallpapers folder, or remove all images, or select the option "Do not change the wallpapers".

Note that it is possible to place several images in the folder corresponding to a specific home (or in the default folder) and disable the slideshow feature by setting the delay to 0.  In that case, a different wallpaper will be loaded each time you select the corresponding home, but there will be no automatic changes at regular intervals.

Use the "Associate wallpapers with the desktop homes" or "Do not change the wallpapers" to enable or disable the wallpaper changes.
The option "Associate wallpapers with the VirtuaWin Virtual Desktops" should be used only when the VirtuaWin integration is active and properly configured.  (See below for more info.)

WARNING: There is a bug in Windows 7 (and probably in Vista as well).  When a program requests to change the current wallpaper and then restores it, the SlideShow feature of Windows 7 is disabled.  The image that was displayed before the wallpaper change is restored, but a new theme is created with that image ONLY.  So, it is not recommended to use the Wallpaper/SlideShow options of DesktopHomes in portable mode, as you will have to restore the original theme configuerd by the owner of the PC manually.  More info on this bug: http://msdn.microsoft.com/en-us/library/ms724947%28v=vs.85%29.aspx#10


Third Tab: Home Startup
--------------------------

DesktopHomes can launch automatically one or several programs when you select a specific desktop home.  To use that feature, just create a "Home Startup" folder in the desktop home, and place shortcuts to programs or files in that folder.

DesktopHomes does its best to detect if a program is already running, and doesn't launch it if it's the case.

To launch the programs associated with a specific home when you switch to that home, press the Control key.  You can also invert this behaviour with the option in the "Home Startup" tab.  You can also use the tray menu to launch the startup items of the current home.


Fourth tab: Other Settings
--------------------------

AutoSave:

When the option "Automatically save current icons positions every N minutes" is enabled, DesktopHomes saves the current icon positions at regular intervals.  The file name used to store the icon positions is not the same than the file name used when you switch to another desktop.  This allows you to restore the automatically saved icon positions even of DesktopHomes has failed to save the right icon positions when switching to another home.  To restore an automatically saved icon position ,use the tray menu Icons Layout -> Restore Auto-Saved Layout.


Mouse Shortcuts:

You can right-click on the tray menu icon to open the full DesktopHomes menu.  That menu contains many items and can be somewhat difficult to use.  For that reason, it is possible to assign some functions or some parts of the main menu to mouse clicks on specific items.  You can select the action to do when clicking on the tray icon with the left and middle mouse buttons, and when clicking on the desktop background with the middle mouse button.


Integration with VirtuaWin:

When integrated with VirtuaWin, DesktopHomes can switch automatically to another home when another Virtual Desktop is selected with the VirtuaWin GUI.  More info on that feature below.

In this frame, you can configure DesktopHomes to take VirtuaWin into account.

Click the "VirtuaWin Portable" button to open the VirtuaWin site in your browser.

Click the "Set VirtuaWin's path" to tell DesktopHomes where VirtuaWin has been installed.

To use the WirtuaWin integration efficiently, it is recommended to remove VirtuaWin from your Startup menu, and tick the "Launch VirtuaWin when DeskthpHomes starts" option.  (This is necessary to know what virtual folder is currently active when DesktopHomes starts.)

The Tray Icon notification option allows you to display or hide the notifications when a specific home is selected due to a virtual desktop change in VirtuaWin.

The "Associate wallpapers with the VirtuaWin Virtual Desktops" optioin of the Wallpapers tab allows you to associate the wallpapers or slideshows with the current Virtual Desktop number instead of the number of the current desktop home.

-------------------------------------------------------------------------------

DesktopHomes Usage
******************

When properly configured, you should see the list of desktop homes in the tray menu of DesktopHomes.  To change your home to another desktop, just select it in the menu.

Note that the menu entry corresponding to the current home is disabled, and has a Desktop icon.  The previous home has a back arrow icon.  You can easily return to the previous home by selecting Swap Desktop Homes.

Most other options in the menu should be self explanatory.

Due to a problem with the way Windows handles the clipboard, it is not possible to copy or cut icons on a desktop home, then change to another home, and paste the icons.  (It's because Windows remembers that the icons are on the desktop, and since the desktop location has changed, when you want to paste them, Windows tries to find them on the current desktop, and fails.)  For that reason, the Explore Desktop Homes sub menu has been added.  With that menu, you can open any desktop home in Explorer, and cut/copy/paste the files or shortcuts you want to move to another desktop.  There are also two functions to copy or cut the icons previously copied to the clipboard from another desktop to the current desktop.  To use them, copy some icons, change to another desktop, and use Paste from other home (Win-Control-V) to copy them to the current desktop, or Cut and paste from other home (Win-Control-X) to copy them to the current desktop and delete them from the original home.

-------------------------------------------------------------------------------

Integration with VirtuaWin
**************************

To integrate DesktopHomes with VirtuaWin, download VirtuaWin (http://virtuawin.sourceforge.net/) and install it.  Note that VirtuaWin MUST be installed in a folder where you have write access.  Do NOT install it in Program Files, or DesktopHomes will not be able to communicate with it.  Finally, use the fourth tab of the Settings window of DesktopHomes to configure the integration.
VWDesktopHomes.exe will be automatically copied in the Modules folder of VirtuaWin.  (VWDesktopHomes.exe is a renamed version of the VirtuaWin module "Message Passthrough" written by Jonathan G. Rennison.  It is needed by VirtuaWin to communicate with DesktopHomes.  Unfortunately, the Message Passthrough modules reads a configuration file that must be written in the Modules folder.  It's why you need to install VirtuaWin in a folder where DesktopHomes can write without administrative privileges.)
To verify if VirtuaWin can communicate with DesktopHomes, launch DesktopHomes and VirtuaWin, then double-click on the VirtuaWin tray icon to open its Setup window.  In the Modules tab, you should see VWDesktopHomes.  Select it and click the Configure window.  DesktopHomes should open its settings window.
When properly configured, you should see a "Set VirtuaWin Desktop Home" sub menu in the tray menu of Desktop Homes.


Usage with VirtuaWin:

To associate a specific desktop home with a specific virtual desktop, select the right desktop home with DesktopHomes and the right vistual desktop with VirtuaWin, then use the function Set VirtuaWin Desktop Home -> Force Current Home (always) or (session).  (When you select Always, the association is permanent.  With Session, it is lost when you close DesktopHomes.)
Use Do Not Force Home to remove the current association (permanently).

When you will switch to a virtual desktop that has an associated home, that home will be automatically selected.  When you will switch to a virtual desktop that has no associated home, the current home will not be changed.

Of course, you can still change the current home in a virtual desktop that has an associated home with DesktopHomes, but when you will select that virtual desktop again, the associated home will be forced again.


Advanced options for VirtuaWin module "Kvasdo Pager":

Kvasdo Pager is an handy module for VirtuaWin that adds a toolbar in your taskbar, with small icons for each virtual desktops.  You can left-click the pager to jump to the specific desktop.  If you install the pager in the Modules folder of VirtuaWin, you can add the following section in DesktopHomes.ini:

[VWKvasdoPager]
# hotkey to send when Kvasdo Pager is middle-clicked
MMBHotkey=<hotkey>
# hotkey to send when Kvasdo Pager is right-clicked
RMBHotkey=<hotkey>
# hotkeys to send when Kvasdo Pager is clicked with the Previous/Next buttons
X1MBHotkey=<hotkey>
X2MBHotkey=<hotkey>
# hotkeys to send when using the mouse wheel on Kvasdo Pager
MWUpHotkey=<hotkey>
MWDownHotkey=<hotkey>

Where <hotkey> is any hotkey defined with the AutoHotkey syntax.  Leave blank to disable.  See http://www.autohotkey.com/docs/Hotkeys.htm for the hotkey syntax.

When there are hotkeys defined in the INI section [VWKvasdoPager], DesktopHomes will monitor your mouse clicks on the Kvasdo Pager toolbar, and send the hotkeys to the system.  You should define the same hotkeys in the main VirtuaWin settings or in the settings of another module.  When you will click the Pager with the middle, right, X1 or X2 button, or use the mouse wheel, DesktopHomes will send the corresponding hotkey.  The hotkey will be received by VirtuaWin (or its module), and VirtuaWin will trigger the action defined for the hotkey in its settings.

For example, I have installed the modules "Kvasdo Pager" and "VWPreview".  VWPreview is another handy and beautiful tool to select any virtual desktop, but it can be called only from the VirtuaWin tray menu (not really handy) or with two hotkeys.  I have configured it to show the full screen preview when Control+Shift+Insert is pressed, and the window preview when Control+Insert is pressed.  The following ini section defines the same hotkeys to send when the Kvasdo Pager is middle or right-clicked:

[VWKvasdoPager]
MMBHotkey=#^+{Insert}
RMBHotkey=#^{Insert}

Now, when I middle-click on the pager, the fullscreen preview is shown, and when I right-click, the window preview is shown.

-------------------------------------------------------------------------------

Known bugs and limitations
**************************

- Rarely, several icons are stacked on top of each other after a desktop home change.  To force Windows to rearrange the icons and show the covered icons, just move any icon by a few pixels.

- When the Windows option "Hide Extensions for known file types" is in effect, icons with exactly the same name and file type can be swapped.

- Icons of a particular file type may not be restored at the right position if you have changed the associated program for that file type. 

- Changes of icon size is not supported.  You should not change the desktop icons size.

- Doesn't work well when the Window's option "Auto Arrange Icons" is enabled.

- After a desktop change, the icons of the executable files launched from the old desktops are not displayed correctly in the Recently Used Programs part of the Windows Start Menu.  (This is a Windows bug/limitation.)

- When swapping to a desktop home that has only icons that are present also on the current desktop, a dummy white icon is visible during one or two seconds.

- The folder shared by all users (the "common desktop" folder) is not changed when the desktop home is swapped.  Therefore, the icons present in the All Users Desktop are visible in all homes. 

- When VirtuaWin is already running when DesktopLocations starts, it assumes wrongly that the current virtual desktop is desktop #1.  (This is why it is recommended to launch VirtuaWin from DesktopHomes.)

- The original wallpaper slideshow configured in the Windows control panel "Personalization" is not restored when DesktopHomes is not running.  (This is a Windows 7 bug: http://msdn.microsoft.com/en-us/library/ms724947%28v=vs.85%29.aspx#10 )

- The original desktop home is not restored when DesktopHomes is closed or during a system shutdown.  Therefore, in portable mode, be sure to restore the user desktop manually if you have changed the default home on another computer.

- Under a 64-bit system, the X64 version must be used.

- DesktopHomes doesn't work under Windows XP and earlier!  It has been tested under Win7 X64, Win7 X86 and Vista X86 only.

-------------------------------------------------------------------------------

Thanks
******

Thanks to Rapte_Of_Suzaku for the original idea and the code to Get/Set Desktop Icon Positions.

More information on the development of this script can be found here http://www.autohotkey.com/forum/viewtopic.php?t=65704e607 and here http://www.autohotkey.com/forum/viewtopic.php?t=64397


r0lZ
August 2011
