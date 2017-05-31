@echo == ApplyRecovery.bat ==
@echo This script applies the Windows recovery environment (WinRE.wim).
@echo Prerequisite: apply the Windows image with ApplyImage.bat.
@echo  *********************************************************************
@echo  UPDATE (OCTOBER 2016):
@echo  This script now has an option to let you specify a recovery image.
@echo  Usage:
@echo    ApplyRecovery.bat D:\recoveryimages\WinRE-French.wim
@echo.  
@echo  By default, this script applies the recovery image that's built into
@echo  the Windows image (\Windows\System32\Recovery\Winre.wim).
@echo  *********************************************************************
@SET RECOVERYIMAGE="W:\Windows\System32\Recovery\Winre.wim"
@echo   Check to see if a custom recovery image was specified
@if %1.==.     echo Using the default recovery image (%RECOVERYIMAGE%)  
@if not %1.==. echo Using a custom recovery image: %1.
@if not %1.==. SET RECOVERYIMAGE=%1
@echo   Check to see if the image exists
@if not exist %RECOVERYIMAGE% echo ERROR: Recovery image: %RECOVERYIMAGE% not found.
@if not exist %RECOVERYIMAGE% goto END
@echo  == Copy the Windows RE image to the Windows RE Tools partition ==
@md R:\Recovery\WindowsRE
@xcopy /h %RECOVERYIMAGE% R:\Recovery\WindowsRE\
@echo  *********************************************************************
@echo  == Register the location of the recovery tools ==
W:\Windows\System32\Reagentc /Setreimage /Path R:\Recovery\WindowsRE /Target W:\Windows
@echo  *********************************************************************
@echo  == If Compact OS, single-instance the recovery provisioning package ==
@echo     Options: N: No
@echo              Y: Yes
@echo              D: Yes, but defer cleanup steps to first boot.
@echo                 Use this if the cleanup steps take more than 30 minutes.
@echo                 defer the cleanup steps to the first boot.
@SET /P COMPACTOS=Deploy as Compact OS? (Y, N, or D):
@if %COMPACTOS%.==y. set COMPACTOS=Y
@if %COMPACTOS%.==d. set COMPACTOS=D
if %COMPACTOS%.==Y. dism /Apply-CustomDataImage /CustomDataImage:W:\Recovery\Customizations\USMT.ppkg /ImagePath:W:\ /SingleInstance
if %COMPACTOS%.==D. dism /Apply-CustomDataImage /CustomDataImage:W:\Recovery\Customizations\USMT.ppkg /ImagePath:W:\ /SingleInstance /Defer
@rem *********************************************************************
@echo Checking to see if the PC is booted in BIOS or UEFI mode.
wpeutil UpdateBootInfo
for /f "tokens=2* delims=	 " %%A in ('reg query HKLM\System\CurrentControlSet\Control /v PEFirmwareType') DO SET Firmware=%%B
@echo            Note: delims is a TAB followed by a space.
@if x%Firmware%==x echo ERROR: Can't figure out which firmware we're on.
@if x%Firmware%==x echo        Common fix: In the command above:
@if x%Firmware%==x echo             for /f "tokens=2* delims=	 "
@if x%Firmware%==x echo        ...replace the spaces with a TAB character followed by a space.
@if x%Firmware%==x goto END
@if %Firmware%==0x1 echo The PC is booted in BIOS mode. 
@if %Firmware%==0x2 echo The PC is booted in UEFI mode. 
@echo  *********************************************************************
@echo == Hiding the recovery tools partition
if %Firmware%==0x1 diskpart /s %~dp0HideRecoveryPartitions-BIOS.txt
if %Firmware%==0x2 diskpart /s %~dp0HideRecoveryPartitions-UEFI.txt
@echo *********************************************************************
@echo == Verify the configuration status of the images. ==
W:\Windows\System32\Reagentc /Info /Target W:\Windows
@echo    (Note: Windows RE status may appear as Disabled, this is OK.)
@echo *********************************************************************
@echo      All done!
@echo      Disconnect the USB drive from the reference device.
@echo      Type exit to reboot.
@echo.
:END