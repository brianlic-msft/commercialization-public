---
author: themar
Description: Multilingual Windows Image Creation
ms.assetid: 5bec65d1-44b0-484c-a5b6-959f221a4290
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Multilingual Windows Image Creation
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Multilingual Windows Image Creation


This walkthrough describes how to use the Windows Assessment and Deployment Kit (Windows ADK) to create and deploy multilingual versions of Windows 10. It describes how to create a multilingual Windows image to help reduce the number of Windows images that need to be maintained for different regions. You can deploy images that are created by using this process from a network share, from a server, or from media.

This walkthrough describes how to add language packs and other update packages to an offline Windows image and Windows recovery image. You then boot Windows to audit mode and add applications and drivers. You then capture the installation to an image and use the newly captured master image for testing purposes. After you test the image, you use it to create regional images by removing unnecessary language resources. You can then deploy these regional images.

The process described in this walkthrough is primarily intended for OEMs who want to reduce the number of Windows images that they maintain. By adding language packs to an offline image, you can decrease Windows installation time and reduce the number of images that you maintain. However, because multiple language packs are added to a single image, the size of the Windows image is increased.

IT Professionals who want to reduce the size of their overall image should instead use the process described in [Add Multilingual Support to a Windows Distribution](add-multilingual-support-to-a-windows-distribution.md). This process describes how to copy the lp.cab file to the Windows distribution, reducing the overall image size.


## <span id="requirements"></span>Requirements


To complete this walkthrough, you should have a working knowledge of common desktop deployment technologies and processes. You should also have a basic understanding of the Windows Imaging (.wim) file format. The steps in this guide assume that you use a single Windows image within the .wim file. If you want to reduce the number of images you maintain, you can use the lowest edition of Windows available in your .wim file, and then use DISM to upgrade to a higher edition of Windows. If you want to maintain multiple images, you can repeat the steps in this guide for each Windows image in the .wim file, to create multiple editions of the regional Windows image.

Before you begin, make sure you have the following items:

-   Windows installation media (DVD or Windows installation files) for multiple languages. This guide uses EN-US, De-DE and FR-FR media.

-   One or more language packs.

-   A technician computer that has the Windows Assessment and Deployment Kit (Windows ADK) installed.

-   A test computer that you can use to install and test Windows.

-   A USB drive that will be formatted during this walkthrough.

## <span id="addlang"></span>Step 1: Add language packs to a Windows image


In this step, you will use Deployment Image Servicing and Management (DISM) to add language packs to a Windows image. After you add language packs, you can add update packages. The Windows image that you start with can be in any language. For example, you can start with an English (en-US) image, and add support for French (fr-FR) and German (de-DE).

When you add language packs to the Windows image, the user is presented with a dialog box to choose their preferred language during Out-Of-Box Experience (OOBE).

By using this method, the sizes of the Windows images are larger; however, installation time is faster, and you can ensure that any updates you add to the Windows image apply to the languages installed to that image. Use this method if you want to install Windows as quickly as possible.

**Important**  
The Windows image must be a recently installed and captured image. This ensures that the Windows image does not have any pending online actions.

Always install language packs before you install updates. If you install an update (hotfix, general distribution release \[GDR\], limited distribution release \[LDR\], or service pack \[SP\]) that contains language-dependent resources before you install a language pack, the language-specific changes contained in the update are not applied. Packages that have language pack dependencies can be identified by using the `Dism /Get-PackageInfo` command. In the “Custom Properties” section of the report, look for the Dependency = “Language Pack” key/value pair. If language packs are installed after an LDR or GDR package that has this attribute, the update must be reinstalled.

 

**To add language packs to a Windows image**

1.  Open an elevated Deployment and Imaging Tools Environment command prompt.

2.  Type the following commands to create the following folders:

    ``` syntax
    Mkdir C:\mount\windows
    Mkdir C:\mount\winre 
    Mkdir C:\mount\boot
    Mkdir C:\LanguagePack
    Mkdir C:\my_Distribution 
    ```

3.  Copy the entire contents of the en-US Windows DVD to C:\\my\_Distribution. For example:

    ``` syntax
    xcopy e:\windows C:\my_distribution /s /e
    ```

4.  Copy each language pack to the technician computer. For example:

    ``` syntax
    xcopy H:\LPs\Microsoft-Windows-Client-Language-Pack_x64_fr-fr.cab C:\LanguagePack
    xcopy H:\LPs\Microsoft-Windows-Client-Language-Pack_x64_de-de.cab C:\LanguagePack
    ```

5.  Type the following command to retrieve the name or index number for the image that you want to modify:

    ``` syntax
    Dism /Get-ImageInfo /ImageFile:C:\my_distribution\sources\install.wim
    ```

    Note the index or name value of the image that you want to modify.

6.  Use DISM to mount the Windows image. For example:

    ``` syntax
    Dism /Mount-Image /ImageFile:C:\my_distribution\sources\install.wim /Index:1 /MountDir:C:\mount\windows
    ```

7.  Use DISM to mount the Windows recovery environment image that exists in the Windows image. For example:

    ``` syntax
    Dism /Mount-Image /ImageFile:C:\mount\windows\Windows\System32\recovery\winre.wim /Index:1 /MountDir:C:\mount\winre
    ```

8.  Add language packs to the mounted offline Windows image. You can add multiple packages on one command line.

    ``` syntax
    Dism /Add-Package /image:C:/mount/windows /PackagePath:C:\LanguagePack\Microsoft-Windows-Client-Language-Pack_x64_de-de.cab /PackagePath:C:\LanguagePack\Microsoft-Windows-Client-Language-Pack_x64_fr-fr.cab 
    ```

9.  Add language packs to the mounted offline Windows recovery image. The language packs that are used for the Windows recovery image are the same lp.cab files used with Windows PE. Use the language packs for Windows PE that are installed with the Windows ADK. For example:

    ``` syntax
    Dism /image:C:/mount/winre /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\de-de\lp.cab"

    Dism /image:C:/mount/winre /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\lp.cab"
    ```

    This process can take several minutes.

10. (Optional) Add additional optional components and language packs to the Windows recovery image. If you want to install additional optional components to the recovery image, you must install the language-neutral cab file first, and then add the language specific cab files. For example, run the following command to add the WinPE-WinReCfg.cab optional component:

    ``` syntax
    Dism /image:C:/mount/winre /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-WinReCfg.cab"

    Dism /image:C:/mount/winre /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\de-de\WinPE-WinReCfg_de-de.cab" 

    Dism /image:C:/mount/winre /Add-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-WinReCfg_fr-fr.cab"
    ```

    We recommend adding language packs for the following optional components that are included with Windows recovery image:

    -   WinPE-WinReCfg

    -   WinPE-Rejuv

    -   WinPE-EnhancedStorage

    -   WinPE-Scripting

    -   WinPE-SecureStartup

    -   WinPE-SRT

    -   WinPE-WDS-Tools

    -   WinPE-WMI

    -   WinPE-HTA

11. Configure the default language settings to use in the Windows image.

    ``` syntax
    Dism /image:C:\mount\windows /set-allIntl:fr-fr
    ```

12. Configure the default language settings to use in the Windows recovery image.

    ``` syntax
    Dism /image:C:\mount\winre /set-allIntl:fr-fr
    ```

13. Recreate the lang.ini file.

    ``` syntax
    Dism /image:C:\mount\windows /gen-langini /distribution:C:\my_distribution
    ```

14. Verify that the languages are installed and the correct language is configured as the default.

    ``` syntax
    Dism /image:C:\mount\windows /get-intl /distribution:C:\my_distribution 
    Dism /image:C:\mount\winre /get-intl
    ```

    The output for the Windows image should be similar to the following:

    ``` syntax
    Reporting offline international settings.

    Default system UI language : fr-FR
    System locale : fr-FR
    Default time zone : Pacific Standard Time
    User locale for default user : fr-FR
    Location : France (GEOID = 84)
    Active keyboard(s) : 040c:0000040c
    Keyboard layered driver : PC/AT Enhanced Keyboard (101/102-Key)

    Installed language(s): de-DE
      Type : Fully localized language.
    Installed language(s): en-US
      Type : Fully localized language.
    Installed language(s): fr-FR
      Type : Fully localized language.

    Reporting distribution languages.

    The default language in the distribution is:
    en-US

    The other available languages in the distribution are:
    No languages found

    The operation completed successfully.
    ```

    The output for the Windows recovery image should be similar to the following:

    ``` syntax
    Reporting offline international settings.

    Default system UI language : fr-FR
    System locale : fr-FR
    Default time zone : Pacific Standard Time
    User locale for default user : fr-FR
    Location : France (GEOID = 84)
    Active keyboard(s) : 040c:0000040c
    Keyboard layered driver : PC/AT Enhanced Keyboard (101/102-Key)

    Installed language(s): de-DE
      Type : Fully localized language.
    Installed language(s): en-US
      Type : Fully localized language.
    Installed language(s): fr-FR
      Type : Fully localized language.

    The operation completed successfully.
    ```

15. Unmount the images, committing the changes. Note that you must unmount the Windows recovery image before you unmounts and commit the Windows image.

    ``` syntax
    DISM /unmount-image /mountdir:C:\mount\winre /commit
    DISM /unmount-image /mountdir:C:\mount\windows /commit
    ```

## <span id="optlang"></span>Step 2 (optional): Add language packs to Windows Setup


In this step, you add multiple language support to Windows Setup. This allows an end user to run Windows Setup and select a specific language that you install. You add language packs to the default boot.wim file, and then copy language resources into your Windows distribution.

**Note**  
This step is optional. If you complete this step, you can run Windows Setup in a language other than the language that you choose for the operating system. However, this does not cover adding font support for all languages.

 

**To add language packs to the default boot image**

1.  Open a Deployment Tools command prompt with elevated permissions.

2.  Use DISM to mount index 2 of the Boot.wim file. For example,

    ``` syntax
    Dism /Mount-Image /ImageFile:C:\my_distribution\sources\boot.wim /Index:2 /MountDir:C:\mount\boot
    ```

3.  Add Windows PE language packs and Windows Setup optional components to the mounted image for each language you want to support. For example:

    ``` syntax
    DISM /add-package /image:C:\mount\boot /packagepath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\lp.cab" 

    DISM /add-package /image:C:\mount\boot /packagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\de-de\lp.cab"
    ```

4.  Add the Windows PE Setup optional components. For example:

    ``` syntax
    DISM /add-package /image:C:\mount\boot /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-Setup.cab" 

    DISM /add-package /image:C:\mount\boot /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-Setup-client.cab"
    ```

    **Note**  
    These Windows Setup language packs are for the client editions of Windows only. For Windows Server, you must use winpe-setup-server .cab files.

     

5.  Add the Windows PE language specific optional components. For example:

    ``` syntax
    DISM /add-package /image:C:\mount\boot /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-Setup_fr-fr.cab"

    DISM /add-package /image:C:\mount\boot /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-Setup-client_fr-fr.cab"

    DISM /add-package /image:C:\mount\boot /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\de-de\WinPE-Setup_de-de.cab"

    DISM /add-package /image:C:\mount\boot /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\de-de\WinPE-Setup-client_de-de.cab"
    ```

6.  In your Windows distribution, copy the language-specific Setup resources from each language specific Windows distribution to the Sources folder in your distribution share. For example, insert the Windows DVD for Fr-FR in your DVD drive (E:) and copy the Fr-FR sources folder to your Windows distribution.

    ``` syntax
    Mkdir C:\my_distribution\sources\fr-fr 
    Mkdir C:\my_distribution\sources\de-de

    xcopy E:\sources\fr-fr C:\my_distribution\sources\fr-fr /cherkyi 
    xcopy E:\sources\de-de C:\my_distribution\sources\de-de /cherkyi
    ```

7.  Use DISM to mount the Windows image. For example:

    ``` syntax
    Dism /Mount-Image /ImageFile:C:\my_distribution\sources\install.wim /Index:1 /MountDir:C:\mount\windows
    ```

8.  Get the language settings that are configured in the Windows image by using the /Get-Intl parameter. For example

    ``` syntax
    Dism /image:C:\mount\windows /Get-Intl
    Dism /image:C:\mount\winre /Get-Intl
    ```

9.  Change the default language, locale, and other international settings by using the /set-allInlt parameter.

    ``` syntax
    Dism /image:C:\mount\boot /set-allIntl:fr-fr
    ```

10. Recreate the lang.ini file. The Lang.ini file must be re-created each time you add or remove language resources from your distribution, and when you add or remove language packs from your Windows image.

    ``` syntax
    Dism /image:C:\mount\windows /Gen-Langini /distribution:C:\my_distribution
    ```

11. Copy the lang.ini file from the Windows distribution to the boot.wim file. The Lang.ini file used in the Boot.wim file must match the Lang.ini file for the operating-system image.

    ``` syntax
    Xcopy C:\my_distribution\sources\lang.ini C:\mount\winre\sources\lang.ini
    ```

12. Use DISM to unmount the Windows boot image and commit the changes. You must also unmount the Windows image. Because none of the files have changed in the Windows image, you can discard the changes. For example,

    ``` syntax
    Dism /Unmount-image /MountDir:C:\mount\boot /Commit 
    Dism /Unmount-image /MountDir:C:\mount\Windows /Discard
    ```

## <span id="test"></span>Step 3: Test the Windows Installation


In this step, you install Windows, selecting a language during Windows Setup, and verifying that multiple languages are installed.

To boot a computer without an operating system, you must create bootable Windows PE media. This walkthrough provides instructions on creating Windows PE on a bootable USB drive. For additional options, see [WinPE: Create USB Bootable drive](winpe-create-usb-bootable-drive.md).

**To install Windows**

**Note:** Beginning with Windows 10, Version 1703, you can create a USB drive that has multiple partitions. To format a USB key so it has one FAT32 and one NTFS partition, see [WinPE: Create USB Bootable drive](winpe-create-usb-bootable-drive.md).

1.  Create a Windows PE image on your technician computer. For example:

    ``` syntax
    Copype amd64 C:\winpe_amd64
    ```

    The following directories are created:

    -   C:\\winpe\_amd64\\media

    -   C:\\winpe\_amd64\\mount

    If you need to add boot-critical drivers or other optional components to Windows PE, see [WinPE: Add packages (Optional Components Reference)](winpe-add-packages--optional-components-reference.md).

2.  Insert a USB drive into the technician computer and run the following command:

    ``` syntax
    Makewinpemedia /ufd C:\winpe_amd64 F:
    ```

    Where *F* is the drive letter of the USB drive. If you have multiple partitions on the USB drive, choose the drive letter of the FAT32 partition. 
    
    Makewinpemedia will format the selected partition and copy WinPE to it.

3.  Copy the contents of the Windows distribution to a USB drive or partition that has sufficient free space. If your install.wim file is larger than 4GB, you'll need to use an NTFS-formatted partition. 

    For example,

    ``` syntax
    Xcopy C:\my_distribution G:\my_distribution /cherkyi
    ```

    Where *G* is the letter of a second USB drive or the NTFS partition on your dual-partitioned USB drive.

4.  Insert the Windows PE USB drive into your test computer. Boot the test computer, ensuring that the Windows PE USB drive is configured to boot first. You might need to change the boot options of the computer in the firmware.

5.  After the Windows PE command line prompt appears, insert the USB drive that contains your Windows distribution on the test computer.

6.  Identify the drives, volumes, and drive letters on the test computer. From the Windows PE command prompt, type:

    ``` syntax
    Diskpart 
    List volume 
    ```

    Identify the drive letter of the USB drive that contains your Windows distribution. This example uses “F:\\”. Exit diskpart.

    ``` syntax
    exit
    ```

7.  Install Windows by running Windows Setup.

    ``` syntax
    F:\my_distribution\setup.exe
    ```

    Windows Setup starts and you are prompted to select your language (French, German, or English). Select one of the languages and proceed with the installation. Verify that the correct language appears during installation.

## <span id="bootaudit"></span>Step 4: Boot to audit mode, add applications and run sysprep


In this step, you install your Windows image on a test computer and boot it to audit mode. While the computer is running in audit mode, you add applications that must be installed online, and test the operating system. After applications are added and the computer is tested, you run the sysprep tool to prepare the image to be deployed to a computer that will ship to an end user.

**To boot to audit mode**

1.  Do one of the following to boot a test computer to audit mode:

    -   For an attended installation, at the OOBE screen, press **Ctrl+Shift+F3**.

    -   In an unattended installation, use an answer file with the Microsoft-Windows-Deployment\\Reseal\\Mode configured to **Audit**. This setting should appear in the **oobeSystem** configuration pass.

    -   Run the **sysprep /audit** command in a Command Prompt window.

    For more information, see [Understanding Audit Mode](http://go.microsoft.com/fwlink/?LinkId=148031).

2.  Install Microsoft Office or other applications, and test the computer. For more information, see [Customize Windows in Audit Mode](http://go.microsoft.com/fwlink/?LinkId=148032).

3.  Prepare the computer for deployment by doing one of the following:

    -   From audit mode, run the **Sysprep** command with the **/oobe /shutdown /generalize** options.

    -   In unattended installations, configure the Microsoft-Windows-Deployment\\Reseal\\Mode setting to **oobe**. For more information on this setting, see the Windows Unattended Setup Reference (Unattend.chm).

    For more information, see [Sysprep Technical Reference](http://go.microsoft.com/fwlink/?LinkId=148028).

    After Sysprep is finished, the test computer shuts down.

## <span id="imagex"></span>Step 5: Capture the Windows installation


In this step, you capture your Windows image from the test computer and store it for use as your master image.

**To capture the image**

1.  Start your test computer by booting to Windows PE.

2.  Identify the drives, volumes, and drive letters on the test computer. From the Windows PE command prompt, type:

    ``` syntax
    Diskpart 
    List volume 
    ```

    Identify the drive letter of the USB drive that contains your Windows distribution. Exit diskpart.

    ``` syntax
    exit
    ```

3.  At the Windows PE command prompt, capture the Windows image. This example uses E:\\ as the location of the Windows installation. For example:

    ``` syntax
    dism /Capture-Image /CaptureDir:E:\ /ImageFile:E:\MyInstall.wim /Name:"Fabrikam"
    ```

4.  Copy the image to a USB drive or to a network share. For example:

    ``` syntax
    xcopy E:\MyInstall.wim G:\MyInstall.wim
    ```

    Where *G* is the letter of the USB drive.

## <span id="removepacks"></span>Step 6: Create regional images by removing language packs


In this step, you create a regional Windows image by removing language packs from your image while it is offline. This image contains only the languages that are necessary for deployment in a certain region.

**Important**  
You should not remove a language pack from an offline Windows image if there are pending online actions. The Windows image should be a recently installed and captured image. This will ensure that the Windows image does not have any pending online actions that require a reboot.

 

**To remove a language pack**

1.  Locate the Windows image that you intend to remove languages from, and copy it to your technician computer. For example:

    ``` syntax
    xcopy F:\sources\MyInstall.wim C:\my_images\MyInstall.wim
    ```

2.  Open the Deployment Tools command prompt with elevated permissions.

3.  Type the following command to mount the Windows image.

    ``` syntax
    Dism /mount-image /ImageFile:C:\my_images\MyInstall.wim /Name:"Fabrikam" /MountDir:C:\mount\windows 
    Dism /Mount-Image /ImageFile:C:\mount\windows\Windows\System32\recovery\winre.wim /Index:1 /MountDir:C:\mount\winre
    ```

4.  Optional: Type the following command to list the packages that are installed in the offline image.

    ``` syntax
    Dism /Image:C:\mount\windows /Get-Packages 
    Dism /Image:C:\mount\winre /Get-Packages
    ```

    You can use `> packagelist.txt` to output the list to a text file named PackageList. Note the package identity of the language pack you want to remove.

5.  Remove a language pack from the image. You can remove multiple .cab files using one command-line statement.

    **Note**  
    You can specify the package identity using the **/PackageName** option, or you can point to the original source of the package using the **/PackagePath** option. For example:

    ``` syntax
    Dism /Image:C:\mount\windows /Remove-Package /PackagePath:C:\LanguagePack\Microsoft-Windows-Client-Language-Pack_x64_fr-fr.cab 
    Dism /Image:C:\mount\winre /Remove-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\lp.cab"
    ```

    For more information, see [DISM Operating System Package Servicing Command-Line Options](dism-operating-system-package-servicing-command-line-options.md).

6.  If you added additional optional components to the Recovery image, remove the language-specific optional components and change the default language settings. For example:

    ``` syntax
    Dism /image:C:/mount/winre /Remove-Package /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-WinReCfg_fr-fr.cab"
    ```

7.  Optional. If you added additional language support to the boot.wim file, remove the language specific resources and optional components from the boot.wim file. For example:

    ``` syntax
    Dism /mount-image /ImageFile:C:\my_distribution\boot.wim /index:2 /MountDir:C:\mount\boot  

    Dism /remove-package /image:C:\mount\boot /packagepath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\lp.cab" 

    Dism /remove-package /image:C:\mount\boot /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-Setup_fr-fr.cab"

    Dism /remove-package /image:C:\mount\boot /PackagePath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-Setup-client_fr-fr.cab" 

    Dism /image:C:\mount\boot /set-allIntl:de-de

    rmdir C:\my_distribution\sources\fr-fr /s

    ```

8.  Recreate the lang.ini file and change the default language settings by running the following command:

    ``` syntax
    Dism /image:C:\mount\winre /Set-AllIntl:de-de
    Dism /image:C:\mount/windows /Gen-LangINI /distribution:C:\my_distribution /Set-AllIntl:de-DE
    ```

9.  Optional. If you removed languages from the boot.wim file, copy the updated lang.ini file to the boot image. After you have updated the lang.ini file in the boot.wim, unmounts the boot.wim file.

    ``` syntax
    Dism /unmount-image /MountDir:C:\mount\boot /Commit
    ```

10. Type the following command to commit the changes and unmount the images.

    ``` syntax
    Dism /unmount-image /MountDir:C:\mount\winre /Commit 
    Dism /unmount-image /MountDir:C:\mount\windows /Commit
    ```

 