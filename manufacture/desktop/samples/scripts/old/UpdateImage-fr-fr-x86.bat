@echo Lab 2b: Add a language, driver, and package to an image using a script
@echo x86 fr-fr version
@echo.
@echo NOTE: Run this script as an administrator: 
@echo       (In File Explorer:
@echo        Right-click UpdateImage-x86.bat, Run as administrator.)
@echo.
@echo This script relies on the following files:
@echo  * C:\Images\Win10 x86\                (Installation files for Windows 10)
@echo  * C:\Languages\fr-FR x86\        (Matching language files for Windows 10)
@echo       lp.cab
@echo       Microsoft-Windows-LanguageFeatures-Basic-fr-fr-Package.cab
@echo       Microsoft-Windows-LanguageFeatures-Speech-fr-fr-Package.cab
@echo       Language components (French) matching the Windows 10 build
@echo  * C:\Samples\Drivers\PnP.Media.V1\                        (Sample driver)
@echo  * C:\Samples\Package\Clock.cab                           (Sample package)
@echo  You'll also need the Windows ADK:
@echo  * C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit
@echo.
@echo  When you're ready to go, press a key. To cancel, press Ctrl+C
@pause
@echo.
@echo     Creating a copy of the image which can be used for offline servicing
@pause
md C:\Images\
copy "C:\Images\Win10 x86\sources\install.wim" C:\Images\WindowsWithFrench.wim
@echo. 
@echo.
@echo **********************************************************************
@echo.
@echo     Mounting the Windows image file
@pause
md C:\mount\windows
Dism /Mount-Image /ImageFile:"C:\Images\WindowsWithFrench.wim" /Index:1 /MountDir:"C:\mount\windows" /Optimize
@echo     Note: If DISM mount operation fails:
@echo           Press Ctrl+C to exit this script.
@echo           Disconnect from the network, disable any antivirus tools,
@echo           then retry the script.
@pause
@echo. 
@echo. 
@echo **********************************************************************
@echo.
@echo     Mounting the Windows Recovery Environment (WinRE) file
@pause
md C:\mount\winre
Dism /Mount-Image /ImageFile:"C:\mount\windows\Windows\System32\Recovery\winre.wim" /index:1 /MountDir:"C:\mount\winre"
@echo. 
@echo. 
@echo **********************************************************************
@echo.
@echo     Adding a language pack to the Windows image file
@pause
Dism /Add-Package /Image:"C:\mount\windows" /PackagePath="C:\Languages\fr-FR x86\lp.cab"
@echo. 
@echo. 
@echo **********************************************************************
@echo.
@echo     Adding language components to the Windows image file.
@echo     Note: Add full language pack and the base language component 
@echo           before adding other components.
@pause
Dism /Add-Package /Image:"C:\mount\windows" /PackagePath="C:\Languages\fr-FR x86\Microsoft-Windows-LanguageFeatures-Basic-fr-fr-Package.cab"
Dism /Add-Package /Image:"C:\mount\windows" /PackagePath="C:\Languages\fr-FR x86\Microsoft-Windows-LanguageFeatures-Speech-fr-fr-Package.cab"
@echo. 
@echo. 
@echo **********************************************************************
@echo.
@echo     Verifying that the language pack and components were added
@pause
dism /Get-Packages /Image:"C:\mount\windows" 
@echo.
@echo Scroll up and check for the lines: 
@echo     "Package Identity : Microsoft-Windows-Client-LanguagePack-...fr-FR~10.0.9926.0
@echo      State : Installed"
@pause
dism /Get-Capabilities /Image:"C:\mount\windows" 
@echo.
@echo Scroll up and check for the lines: 
@echo     "Capability Identity : Language.Basic~~~fr-FR~0.0.1.0
@echo      State : Installed"
@pause
@echo. 
@echo **********************************************************************
@echo.
@echo     List the Optional Components (OC) in WinRE
@pause
Dism /Get-Packages /Image:C:\mount\winre
@echo. 
@echo. 
@echo *********************************************************************************
@echo.
@echo     Adding fr-FR LP and corresponding OCs. Typically you'd repeat these steps for each language you add to Windows.
@pause
Dism /Add-Package /Image:C:\mount\winre /packagepath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\fr-fr\lp.cab"
Dism /Add-Package /Image:C:\mount\winre /packagepath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\fr-fr\WinPE-Rejuv_fr-fr.cab"
Dism /Add-Package /Image:C:\mount\winre /packagepath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\fr-fr\WinPE-EnhancedStorage_fr-fr.cab"
Dism /Add-Package /Image:C:\mount\winre /packagepath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\fr-fr\WinPE-Scripting_fr-fr.cab"
Dism /Add-Package /Image:C:\mount\winre /packagepath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\fr-fr\WinPE-SecureStartup_fr-fr.cab"
Dism /Add-Package /Image:C:\mount\winre /packagepath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\fr-fr\WinPE-SRT_fr-fr.cab"
Dism /Add-Package /Image:C:\mount\winre /packagepath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\fr-fr\WinPE-WDS-Tools_fr-fr.cab"
Dism /Add-Package /Image:C:\mount\winre /packagepath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\fr-fr\WinPE-WMI_fr-fr.cab"
Dism /Add-Package /Image:C:\mount\winre /packagepath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\fr-fr\WinPE-StorageWMI_fr-fr.cab"
Dism /Add-Package /Image:C:\mount\winre /packagepath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\fr-fr\WinPE-HTA_fr-fr.cab"
@echo.
@echo **********************************************************************
@echo.
@echo     NOTE: To add Japanese to WinRE, in addition to adding JA-JP 
@echo           into WinRE using the commands above, add this command too:
@echo.
@echo           Dism /Image:C:\mount\winre /Add-Package /packagepath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs\WinPE-Font Support-JA-JP.cab"
@echo. 
@echo. 
@pause
@echo **********************************************************************
@echo.
@echo     Adding driver packages (INF based) to the Windows image
@pause
Dism /Add-Driver /Image:"C:\mount\windows" /Driver:"C:\Samples\Drivers\PnP.Media.V1\media1.inf"
@echo. 
@echo. 
@echo **********************************************************************
@echo.
@echo     Adding driver packages (INF based) to WinRe
@pause
Dism /Add-Driver /Image:"C:\mount\winre" /Driver:"C:\Samples\Drivers\PnP.Media.V1\media1.inf"
@echo. 
@echo.
@echo **********************************************************************
@echo.
@echo     Verifying that the driver was added to the Windows image
@pause
Dism /Get-Drivers /Image:"C:\mount\windows" 
@echo. 
@echo. 
@echo **********************************************************************
@echo.
@echo     Verifying that the driver was added to the WinRE image
@pause
Dism /Get-Drivers /Image:"C:\mount\winre" 
@echo. 
@echo. 
@echo **********************************************************************
@echo.
@echo     Unmounting the WinRE image (committing changes)
@pause
Dism /Unmount-Image /MountDir:"C:\mount\winre" /Commit
@echo. 
@echo. 
@echo **********************************************************************
@echo.
@echo     Making a backup copy of the updated WinRE image
@echo     When prompted, specify F for file.
@pause
xcopy C:\mount\windows\Windows\System32\Recovery\winre.wim C:\Images\WinRE-ModelSpecific-Backup.wim /ah
@echo. 
@echo. 
@echo **********************************************************************
@echo.
@echo     Checking the size of the updated WinRE image
@pause
Dir "C:\mount\windows\Windows\System32\Recovery\winre.wim"
@echo NOTE:Is winre.wim more than 524,288,000 bytes?
@echo      If so, update CreatePartitions-(firmware).txt.
@echo.
@echo. 
@echo. 
@echo **********************************************************************
@echo.
@echo     Unmounting the Windows image (committing changes)
@pause
Dism /Unmount-Image /MountDir:"C:\mount\windows" /Commit
@echo. 
@echo. 
@echo **********************************************************************
@echo 
@echo Script complete! Press any key to close.
pause