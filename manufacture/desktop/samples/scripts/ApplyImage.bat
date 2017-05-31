@echo Apply-Image.bat
@echo     Run from the reference device in the WinPE environment
@echo     This script erases the primary hard drive and applies a new image
@echo.
@echo     Note: This script uses separate scripts to configure the drive partions:
@echo     CreatePartitions-BIOS.txt or CreatePartitions-UEFI.txt
@echo     These scripts must be in the same folder as ApplyImage.bat.
@echo.
@echo UPDATE (NOVEMBER 2016):
@echo * This script now prompts for an image index number if one isn't given.
@echo.
@echo UPDATE (JULY 2016):
@echo * This script stops just after applying the image.
@echo   This gives you an opportunity to add siloed provisioning packages (SPPs)
@echo   so that you can include them in your recovery tools.
@echo.
@echo   After the script is complete, use apply-recovery.bat to finish
@echo   setting up the recovery tools.
@echo.
@echo * This script creates a now includes support for the /EA variables for quicker
@echo   image capture and recovery.
@echo.
@echo * This script now includes support for the /EA variables for quicker
@echo   image capture and recovery.
@echo.
@echo * This script now checks to see if you're booted into Windows PE.
@echo.
@if not exist X:\Windows\System32 echo ERROR: This script is built to run in Windows PE.
@if not exist X:\Windows\System32 goto END
@if %1.==. echo ERROR: To run this script, add a path to a Windows image file.
@if %1.==. echo Example: ApplyImage D:\WindowsWithFrench.wim
@if %1.==. goto END
@echo *********************************************************************
if not %2.==. goto INDEXSELECTED
:WHICHIMAGE
@echo Which Windows image should we apply?
@echo (Default is image index 1)
@SET /P INDEX=Type an image index number, or press L to list the images:
@if %INDEX%.==. set INDEX=1
@if %INDEX%==l set INDEX=L
@if %INDEX%==L Dism /Get-ImageInfo /ImageFile:%1
@if %INDEX%==L goto WHICHIMAGE
:INDEXSELECTED
@echo *********************************************************************
@echo Checking to see if the PC is booted in BIOS or UEFI mode.
wpeutil UpdateBootInfo
for /f "tokens=2* delims=	 " %%A in ('reg query HKLM\System\CurrentControlSet\Control /v PEFirmwareType') DO SET Firmware=%%B
@echo            Note: delims is a TAB followed by a space.
@if %Firmware%.==. echo ERROR: Can't figure out which firmware we're on.
@if %Firmware%.==. echo        Common fix: In the command above:
@if %Firmware%.==. echo             for /f "tokens=2* delims=	 "
@if %Firmware%.==. echo        ...replace the spaces with a TAB character followed by a space.
@if %Firmware%.== goto END
@if %Firmware%==0x1 echo The PC is booted in BIOS mode. 
@if %Firmware%==0x2 echo The PC is booted in UEFI mode. 
@echo *********************************************************************
@echo Formatting the primary disk...
@if %Firmware%==0x1 echo    ...using BIOS (MBR) format and partitions.
@if %Firmware%==0x2 echo    ...using UEFI (GPT) format and partitions. 
@echo CAUTION: All the data on the disk will be DELETED.
@SET /P READY=Erase all data and continue? (Y or N):
@if %READY%.==y. set READY=Y
@if not %READY%.==Y. goto END
if %Firmware%==0x1 diskpart /s %~dp0CreatePartitions-BIOS.txt
if %Firmware%==0x2 diskpart /s %~dp0CreatePartitions-UEFI.txt
@echo *********************************************************************
@echo  == Set high-performance power scheme to speed deployment ==
call powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
@echo *********************************************************************
@echo  == Apply the image to the Windows partition ==
@SET /P COMPACTOS=Deploy as Compact OS? (Y or N):
@if %COMPACTOS%.==y. set COMPACTOS=Y
if %COMPACTOS%.==Y.     dism /Apply-Image /ImageFile:%1 /Index:%INDEX% /ApplyDir:W:\ /Compact /EA
if not %COMPACTOS%.==Y. dism /Apply-Image /ImageFile:%1 /Index:%INDEX% /ApplyDir:W:\ /EA
@echo *********************************************************************
@echo == Copy boot files to the System partition ==
W:\Windows\System32\bcdboot W:\Windows /s S:
@echo *********************************************************************
@echo   Next steps:
@echo   * Add Windows desktop applications (optional):
@echo       DISM /Apply-SiloedPackage /ImagePath:W:\ 
@echo            /PackagePath:"D:\App1.spp" /PackagePath:"D:\App2.spp"  ...
@echo   * Add the recovery image:
@echo       ApplyRecovery.bat
@echo   * Reboot:
@echo       exit
:END
