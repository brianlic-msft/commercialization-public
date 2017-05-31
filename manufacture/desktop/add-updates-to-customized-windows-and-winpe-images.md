---
author: Justinha
Description: 'Microsoft will provide update packages to Windows 10 that need to be installed on your customized Windows images. Add the zero-day package (ZDP) to your existing Windows 10 images to provide your users with the latest updates.'
ms.assetid: 3273a638-d635-45e8-b418-ee9c5b06333e
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Add updates to customized Windows images
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Add updates to customized Windows images


Microsoft will provide update packages to Windows 10 that need to be installed on your customized Windows images. Add the zero-day package (ZDP) to your existing Windows 10 images to provide your users with the latest updates.

This topic describes how to install the ZDP to a Windows image, in addition to any other update that Microsoft releases for Windows 10.

The ZDP update is a rollup of all of the updates released between Windows 10 build 10240 and today.

**Note**  As of August 8th, 2015:
-   Use the Windows PE and Windows RE versions from the ADK build 10240. Don't update the version of Windows PE or Windows RE unless otherwise instructed.
-   Do not use **/ResetBase** (DISM /Cleanup-Image /ResetBase) after applying the ZDP offline. The ZDP has pending actions, which must be completed before running /ResetBase.
-   You can't just add the ZDP into an unattended setup answer file - you must update the entire image before installing it.

 

## <span id="_Start_with_your_customized_image"></span><span id="_start_with_your_customized_image"></span><span id="_START_WITH_YOUR_CUSTOMIZED_IMAGE"></span> Start with your customized image


Start with your existing customized Windows image with Windows 10 build 10240.

Consider adding language packs before you add the ZDP updates – it may save you time later. To learn more, see the notes at the end of this topic and [Add Language Packs to Windows](add-language-packs-to-windows.md).

## <span id="_Download_the_ZDP"></span><span id="_download_the_zdp"></span><span id="_DOWNLOAD_THE_ZDP"></span> Download the ZDP


Download the latest updates. Note, the ZDP is a cumulative update, so you'll only need to get the latest update package.

-   Windows 10 64-bit version: [http://catalog.update.microsoft.com/v7/site/Search.aspx?q=KB3122962](http://catalog.update.microsoft.com/v7/site/Search.aspx?q=KB3122962).
-   Windows 10 32-bit version: [http://catalog.update.microsoft.com/v7/site/Search.aspx?q=KB3122962](http://catalog.update.microsoft.com/v7/site/Search.aspx?q=KB3122962).

## <span id="Update_your_images"></span><span id="update_your_images"></span><span id="UPDATE_YOUR_IMAGES"></span>Update your images


1.  From your technician PC, click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.
2.  Create a mount directory for your Windows image (install.wim), and then mount the image.

    ``` syntax
    md C:\mount\Windows

    Dism /Mount-Image /ImageFile:"C:\Images\install.wim" /Index:1 /MountDir:C:\mount\Windows
    ```

3.  Update your Windows images with the latest ZDP. Example:

    ``` syntax
    Dism /Add-Package /Image:C:\mount\Windows /PackagePath:C:\MSU\Windows10-KBxxxxxxx-x64.msu /LogPath:AddPackage.log
    ```

    Where C:\\MSU\\Windows10-KBxxxxxxx-x64.msu is the most recent version of the ZDP available.

4.  Unmount the Windows image.

    ``` syntax
    Dism /Unmount-Image /MountDir:C:\mount\Windows /Commit
    ```

**Recommended: Boot the image to complete the update process, and then clean up the image**

1.  Boot a reference device to Windows PE.
2.  Press **Ctrl+Shift+F3** at the OOBE screens to enter audit mode.
3.  Open the Command Prompt as an administrator.
4.  Clean up the Windows image. (It's OK to use /ResetBase now that the PC has been booted into audit mode.)

    ``` syntax
    Dism /Cleanup-Image /Online /StartComponentCleanup /ResetBase
    ```

    **Note**  You won't be able to clean up your Windows image until after you've booted it.

     

5.  Use Sysprep to generalize and shut down the PC.

    ``` syntax
    C:\Windows\System32\Sysprep\sysprep /generalize /shutdown /oobe
    ```

6.  Boot the PC to Windows PE. If the PC starts rebooting to Windows, you'll need to let it finish booting and then use Sysprep to generalize and shut down the PC again.
7.  Create a temporary scratch directory for DISM on a physical drive, rather than the default Windows PE virtual drive, to avoid issues related to short file names. To prevent capturing the DISM logs in your image, choose a location that’s in your DISM Exclusion list, for example, inside C:\\Recycler. For more info, see [DISM Configuration List and WimScript.ini Files](dism-configuration-list-and-wimscriptini-files-winnext.md).

    ``` syntax
    md C:\Recycler\Scratch
    ```

8.  Recapture the Windows image. This captures the applied updates and removes any files that were marked as superseded during DISM /Cleanup-Image. Save the file to a location on a USB drive or a network (example: N:\\Images), and give the image a name (example: "Enterprise\_x64 with ZDP KBxxxxxxx").

    ``` syntax
    DISM /Capture-Image /ImageFile:"N:\Images\install_updated.wim" /CaptureDir:C: /Name: "Enterprise_x64 with ZDP KBxxxxxxx" /ScratchDir:C:\Recycler\Scratch
    ```

 **Update Windows Setup bootable media**

1.  Copy your bootable media (DVDs or other bootable media for Windows Setup, Windows Deployment Services (WDS), or System Center) to a writable folder on your PC.

    ``` syntax
    Xcopy D:\ C:\InstallMedia /s /h
    ```

2.  Mount the file: sources\\boot.wim.

    ``` syntax
    md C:\mount\boot
    Dism /Mount-Image /ImageFile:"C:\InstallMedia\sources\boot.wim" /Index:1 /MountDir:C:\mount\boot
    ```

3.  Add the ZDP.

    ``` syntax
    Dism /Add-Package /PackagePath:/PackagePath:C:\MSU\Windows10-KBxxxxxxx-x64.msu /Image:C:\mount\boot /LogPath:AddPackage.log
    ```

    Where C:\\MSU\\Windows10-KBxxxxxxx-x64.msu is the most recent version of the ZDP available.

4.  In Windows Explorer, navigate to the mounted image root folder and sort the list of files by Date modified. Copy everything that’s been recently modified (setup.exe, locale.nls, setupplatform.dll, setupplatform.exe, reagent.dll, and anything else that looks recently modified) to the root of the install media.
5.  Unmount the boot.wim file.

    ``` syntax
    Dism /Unmount-Image /MountDir:C:\mount\boot /Commit
    ```

6.  Create bootable media (DVDs or other bootable media for Windows Setup, Windows Deployment Services (WDS), or System Center) using the files. To learn more, see [Windows Setup Technical Reference](windows-setup-technical-reference.md).

## <span id="Adding_languages_after_adding_the_ZDP_or_other_rollup_packages"></span><span id="adding_languages_after_adding_the_zdp_or_other_rollup_packages"></span><span id="ADDING_LANGUAGES_AFTER_ADDING_THE_ZDP_OR_OTHER_ROLLUP_PACKAGES"></span>Adding languages after adding the ZDP or other rollup packages


Ideally, you'll want to add all of your language packs and components before adding any ZDPs or Windows rollup packages.

If you need to add language packs or language features on demand after installing the ZDP or other rollup package, you'll need to reapply the ZDP/rollup package afterwards. Otherwise, the Windows user experience might not be correctly localized, and users may be prompted to download the language resources from Windows Update.

## <span id="Sample_script"></span><span id="sample_script"></span><span id="SAMPLE_SCRIPT"></span>Sample script


The following sample script modifies a given Windows image by adding all of the updates in a specific folder into the image. After adding the image, it cleans up the image.

``` syntax
REM # InjectPackages.cmd: Adds packages (.cbs, .cab, .msu) to a Windows image
REM # Usage:   InjectPackages <.WIM file> <Index> <Folder with CBS packages>
REM # Example: InjectPackages C:\Images\install.wim 1 C:\Packages\ZDP
REM #
REM # Given a Windows image, an index, and a folder with packages (.cbs, .cab, or .msu),
REM # this injects the packages into the wim offline
REM #

@echo off
echo %date% - %time%:: starting ,,,

set _dism_log=%~dp0dism_add_packages.log
del %_dism_log%

set _input_wim=%1
echo %date% - %time%:: caller gave us a wim: [%_input_wim%]. dir it to verify ,,,
     dir %_input_wim%
if not exist %_input_wim% (
 echo fail!!! %_input_wim% not found
 exit /b 2
)

set _index=%2
echo %date% - %time%:: caller gave us index=[%_index%]. verify it,,,
echo %date% - %time%:: dism /logpath=%_dism_log% /get-imageinfo /imagefile=%_input_wim% /index=%_index%
     dism /logpath=%_dism_log% /get-imageinfo /imagefile=%_input_wim% /index=%_index%
if %errorlevel% neq 0 (
  echo dism failed!!! please verify index [%_index%] is correct.
  exit /b %errorlevel%
)


set _package_folder=%3
echo %date% - %time%:: caller gave us folder: [%_package_folder%]. dir it to verify ,,,
     dir %_package_folder%\
if not exist %_package_folder%\ (
 echo fail!!! %_package_folder%\ not found!
 exit /b 2
)

if not exist %~dp0mnt\ (
 mkdir %~dp0mnt\
)

echo %date% - %time%:: unmount to start clean. you can ignore if this fails.
echo %date% - %time%:: dism /logpath=%_dism_log% /unmount-image /mountdir=%~dp0mnt\ /discard
     dism /logpath=%_dism_log% /unmount-image /mountdir=%~dp0mnt\ /discard

echo %date% - %time%:: mount the input wim ,,,
echo dism /logpath=%_dism_log% /mount-image /imagefile=%_input_wim% /index=%_index% /mountdir=%~dp0mnt\ 
     dism /logpath=%_dism_log% /mount-image /imagefile=%_input_wim% /index=%_index% /mountdir=%~dp0mnt\ 
if %errorlevel% neq 0 (
  echo dism failed!!! 
  exit /b %errorlevel%
)
echo %date% - %time%:: good.

echo %date% - %time%:: look for *.msu files ,,,
echo dir %_package_folder%\*.msu
     dir %_package_folder%\*.msu
for /r %_package_folder% %%a in (*.msu) do (
  echo dism /logpath=%_dism_log% /image=%~dp0mnt\ /add-package=%%a
       dism /logpath=%_dism_log% /image=%~dp0mnt\ /add-package=%%a
  if %errorlevel% neq 0 (
    echo dism failed!!! 
    exit /b %errorlevel%
  )
)

echo %date% - %time%:: look for *.cab files ,,,
echo dir %_package_folder%\*.cab
     dir %_package_folder%\*.cab
for /r %_package_folder% %%a in (*.cab) do (
  echo dism /logpath=%_dism_log% /image=%~dp0mnt\ /add-package=%%a
       dism /logpath=%_dism_log% /image=%~dp0mnt\ /add-package=%%a
  if %errorlevel% neq 0 (
    echo dism failed!!! 
    exit /b %errorlevel%
  )
)

echo %date% - %time%:: DONE adding packages.

echo %date% - %time%:: run clean up ,,,
  echo dism /logpath=%_dism_log% /image=%~dp0mnt\ /cleanup-image /startcomponentcleanup
       dism /logpath=%_dism_log% /image=%~dp0mnt\ /cleanup-image /startcomponentcleanup
  REM ### Do not use /ResetBase. The ZDP has pending actions that must be completed first.##

  if %errorlevel% neq 0 (
    echo dism failed to clean up. we ignore this for now.
  )



echo %date% - %time%:: commiting the changes ,,,
echo dism /logpath=%_dism_log% /unmount-image /mountdir=%~dp0mnt\ /commit
     dism /logpath=%_dism_log% /unmount-image /mountdir=%~dp0mnt\ /commit
if %errorlevel% neq 0 (
  echo dism failed!!! 
  exit /b %errorlevel%
)


echo %date% - %time%:: exporting the wim to reduce size ,,,
echo dism /logpath=%_dism_log% /export-image /sourceimagefile=%_input_wim% /sourceindex=%_index% /destinationimagefile=%_input_wim%_exported.wim
     dism /logpath=%_dism_log% /export-image /sourceimagefile=%_input_wim% /sourceindex=%_index% /destinationimagefile=%_input_wim%_exported.wim
if %errorlevel% neq 0 (
  echo dism failed!!! 
  exit /b %errorlevel%
)

echo %date% - %time%:: ALL DONE.
dir %_input_wim% 
dir %_input_wim%_exported.wim
echo please use %_input_wim%_exported.wim for further testing.
```

 

 





