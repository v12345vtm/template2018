${SegmentFile}

;=== START INTEGRITY CHECK 1.1 Var
	Var bolCustomIntegrityCheckStartUnsupported
	Var strCustomIntegrityCheckVersion
;=== END INTEGRITY CHECK

Var RegKeyFDFExists
Var RegKeyPDFExists
Var RegKeyPDFIsBlank
Var Usertype

${Segment.OnInit}
	;=== START INTEGRITY CHECK 1.1 OnInit
	;Check for improper install/upgrade without running the PA.c Installer which can cause issues
	;Designed to not require ReadINIStrWithDefault which is not included in the PA.c Launcher code
	
	${If} ${FileExists} "$EXEDIR\App\AppInfo\appinfo.ini"
		${If} ${FileExists} "$EXEDIR\App\AppInfo\pac_installer_log.ini"
			ReadINIStr $R0 "$EXEDIR\App\AppInfo\pac_installer_log.ini" "PortableApps.comInstaller" "Info2"
			${If} $R0 == "This file was generated by the PortableApps.com Installer wizard and modified by the official PortableApps.com Installer TM Rare Ideas, LLC as the app was installed."
				StrCpy $R1 "true"
			${Else}
				StrCpy $R1 "false"
			${EndIf}
		${Else}
			StrCpy $R1 "false"
		${EndIf}
	${Else}
		StrCpy $R1 "true"
	${EndIf}
	
	${If} $R1 == "false"
		;Upgrade or install sans the PortableApps.com Installer which can cause compatibility issues
		ClearErrors
		ReadINIStr $0 "$EXEDIR\App\AppInfo\appinfo.ini" "Version" "PackageVersion"
		${If} ${Errors}
		${OrIf} $0 == ""
			StrCpy $0 "0.0.0.1"
			ClearErrors
		${EndIf}

		ClearErrors
		ReadINIStr $1 "$EXEDIR\Data\settings\${AppID}Settings.ini" "${AppID}Settings" "InvalidPackageWarningShown"
		${If} ${Errors}
		${OrIf} $1 == ""
			StrCpy $1 "0.0.0.0"
			ClearErrors
		${EndIf}

		${VersionCompare} $0 $1 $2
		${If} $2 == 1		
			MessageBox MB_YESNO|MB_ICONQUESTION|MB_DEFBUTTON2 `Integrity Failure Warning: ${NamePortable} was installed or upgraded without using its installer and some critical files may have been modified.  This could cause data loss, personal data left behind on a shared PC, functionality issues, and/or may be a violation of the application's license. Neither the application publisher nor PortableApps.com will be responsible for any issues you encounter.$\r$\n$\r$\nWould you like to start ${NamePortable} in its current unsupported state?` IDYES CustomIntegrityCheckGotoStartAnyway IDNO CustomIntegrityCheckGotoDownloadQuestion
		
			CustomIntegrityCheckGotoDownloadQuestion:
			;Check to ensure we have a valid homepage before asking the user
			StrCpy $R0 ""
			${If} ${FileExists} "$EXEDIR\App\AppInfo\appinfo.ini"
				ReadINIStr $R0 "$EXEDIR\App\AppInfo\appinfo.ini" "Details" "Homepage"
			${EndIf}
			
			${If} $R0 == ""
				Abort
			${Else}
				StrCpy $R1 $R0 4
				${If} $R1 != "http"
				${AndIf} $R1 != "HTTP"
					StrCpy $R0 "http://$R0"
				${EndIf}
			${EndIf}
			
			MessageBox MB_YESNO|MB_ICONQUESTION|MB_DEFBUTTON1 `Would you like to visit the ${NamePortable} homepage to download the app and upgrade your current install?` IDYES CustomIntegrityCheckGotoURL IDNO CustomIntegrityCheckGotoAbort

			CustomIntegrityCheckGotoURL:		
			ExecShell "open" $R0
			Abort
						
			CustomIntegrityCheckGotoAbort:
			Abort
	
			CustomIntegrityCheckGotoStartAnyway:
			StrCpy $bolCustomIntegrityCheckStartUnsupported true
			StrCpy $strCustomIntegrityCheckVersion $0
		${EndIf}
	${EndIf}
	;=== END INTEGRITY CHECK
!macroend

${SegmentPrePrimary}
	;=== START INTEGRITY CHECK 1.1 PrePrimary
	${If} $bolCustomIntegrityCheckStartUnsupported == true
		WriteINIStr "$EXEDIR\Data\settings\${AppID}Settings.ini" "${AppID}Settings" "InvalidPackageWarningShown" $strCustomIntegrityCheckVersion
	${EndIf}	
	;=== END INTEGRITY CHECK
	
	UserInfo::GetAccountType
	Pop $Usertype
	${If} $Usertype == "admin"
		${If} ${RegistryKeyExists} "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.pdf"
			StrCpy $RegKeyPDFExists true
			${registry::Read} "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.pdf" "" $R0 $R1
			${If} $R0 == ""
				StrCpy $RegKeyPDFIsBlank true
			${EndIf}
		${EndIf}
		${If} ${RegistryKeyExists} "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.fdf"
			StrCpy $RegKeyFDFExists true
		${EndIf}
	${EndIf}
!macroend

${SegmentPostPrimary}
	UserInfo::GetAccountType
	Pop $Usertype
	${If} $Usertype == "admin"
		${If} $RegKeyPDFExists != true
			${registry::DeleteKey} "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.pdf" $R0
		${EndIf}
		${If} $RegKeyPDFIsBlank == true
			${registry::Read} "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.pdf" "" $R0 $R1
			${If} $R0 != ""
				${registry::DeleteValue} "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.pdf" "" $R0
			${EndIf}
		${EndIf}
		${If} $RegKeyFDFExists != true
			${registry::DeleteKey} "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.fdf" $R0
		${EndIf}
	${EndIf}
!macroend