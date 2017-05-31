---
author: Justinha
Description: Add Multilingual Support to Windows Setup
ms.assetid: 242b963c-79fc-450b-90d7-c736965797b7
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Add Multilingual Support to Windows Setup
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Add multilingual support to Windows Setup

Windows Setup multilingual support allows you to choose different languages for Windows Setup and Windows installation. This scenario allows for a technician to run Windows setup in one language, and install Windows in a different language. 

This walkthrough provides steps for creating Windows installation media with multilingual support. 

## Prerequisites


To complete this walkthrough, you need the following:

-   A technician computer that has the Windows Assessment and Deployment Kit (Windows ADK) installed

-   Windows installation media for all languages that you are creating media

-   The Windows language pack ISO


## Step 1. Prepare your environment 

To get started, copy Windows installation files from media to a local directory. If you are creating media for use with a customized image, you must use the Windows media that corresponds to the version of your customized image. For example, if you are building a custom Windows 10 setup image, you must use the original Windows 10 product media.

-   On your technician computer, create a new directory for your Windows distribution and copy the Windows media content to that directory. For example:

    ``` syntax
    md C:\my_distribution
    xcopy /E D: C:\my_distribution
    md C:\mount\boot 
    md C:\mount\windows
    ```

    Where *D:* is the location of the Windows product media.

## Step 2. Customize languages available for Windows setup
This section shows how to customize the languages that are available for a technician when performing a Windows installation.

### Add Windows PE Setup Language Packs to the Default Boot Image

In this step, you add language support and the Windows Setup optional components to the second image (index 2) in the default Boot.wim.

1.  On your technician PC: Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.

2.  Mount the second image (index 2) in Boot.wim to a local mount directory using **Dism /Mount-Image**. For example:

    ``` syntax
    Dism /mount-image /imagefile:C:\my_distribution\sources\boot.wim /index:2 /mountdir:C:\Mount\boot
    ```

3.  Add Windows PE Setup optional component and language packs into your mounted image using **Dism /Add-Package** for each language you want to support. Add *lp.cab*, *WinPE-setup_\<language>.cab*, and *WinPE-Setup-client_\<language>.cab* for each language you are adding.

    Windows PE language packs are available in the Windows ADK.

    For example:

    ``` syntax
    Dism /image:C:\mount\boot /add-package /packagepath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\lp.cab"

    Dism /image:C:\mount\boot /add-package /packagepath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-Setup_fr-fr.cab"

    Dism /image:C:\mount\boot /add-package /packagepath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\fr-fr\WinPE-Setup-Client_fr-fr.cab"
    ```

    **Important**  
    For Windows Server 2016, you must use the WinPE-Setup-Server optional components instead of the WinPE-Setup-Client optional components.

     
4.  For Japanese (ja-JP), Korean (ko-KR), and Chinese (zh-HK, zh-CN, zh-TW), you have to add additional font support to your image. For example, to add Japanese font support:

    ``` syntax
    Dism /image:C:\mount\boot /add-package /packagepath:"C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-FontSupport-JA-JP.cab"
    ```


## Step 3. Customize the languages available in Windows

### Add Language Packs to the Windows Image

**You must add the same language support to your Windows image file, install.wim, as you did for the boot.wim file.** The setup process requires that both images contain the same set of language packs. For more information, see [Add and Remove Language Packs Offline Using DISM](add-and-remove-language-packs-offline-using-dism.md).

1.   Mount the Windows image with DISM

        ``` syntax
        Dism /mount-image /imagefile:C:\my_distribution\sources\install.wim /index:1 /mountdir:C:\mount\windows    
        ```
        Where *1* is the index of the image that you want to mount.

2.   Add one or more language packs to the Windows image.

        ``` syntax
        Dism /image:C:\mount\windows /add-package /packagepath:F:\x64\langpacks\Microsoft-Windows-Client-Language-Pack_x64_fr-fr.cab 
        ```

        Where *F:* is the location of the language pack ISO.

The same set of languages must also be added to the Windows Recovery Environment image (winre.wim). For more information, see [Customize Windows RE](customize-windows-re.md).

## Step 4: Add Localized Windows Setup Resources to the Windows Distribution


In this step you copy the language-specific Setup resources from each language specific Windows distribution to the Sources folder in your Windows distribution. For example, insert the Windows DVD for Fr-FR in your DVD drive (E:) and copy the Fr-FR sources folder to your Windows distribution.

-   Copy the localized Windows setup files to your Windows distribution.

    ``` syntax
    xcopy E:\sources\fr-fr C:\my_distribution\sources\fr-fr /cherkyi 
    ```

    Where *E:* is the location of the Windows installation media that contains the localized Windows Setup resources.

## Step 5: Recreate the Lang.ini

In this step you recreate the Lang.ini file and specify the default language settings.

1.  Recreate the Lang.ini file to reflect the additional languages using *Dism /Gen-LangINI*.

    ``` syntax
    Dism /image:C:\mount\windows /gen-langINI /distribution:C:\my_distribution
    ```

2.  Change the Windows Setup default language with DISM. For example:

    ``` syntax
    Dism /image:C:\mount\windows /Set-SetupUILang:fr-FR /distribution:C:\my_distribution
    ```

    For more information about specifying different international settings for input locale, and other items see [DISM Languages and International Servicing Command-Line Options](dism-languages-and-international-servicing-command-line-options.md).

3.  Copy the lang.ini file in the Windows distribution to the boot.wim file.

    ``` syntax
    Xcopy C:\my_distribution\sources\lang.ini C:\mount\boot\sources\lang.ini
    ```

## Step 6: Commit the Changes to the Windows Images


In this step you commit the changes to all of the images you have updated

-   Use DISM to unmount and commit the changes to the Windows and boot images.

    ``` syntax
    Dism /unmount-image /mountdir:C:\mount\boot /commit 
    Dism /unmount-image /mountdir:C:\mount\windows /commit
    ```

## Step 7: Create a Boot Order File (Optional)


In this step, you create a boot order file. Due to the size of the image, you must do so before you create an .iso file.

-   Create a boot order file (bootorder.txt). For example:

    ``` syntax
    Oscdimg -m -n -yo C:\temp\bootOrder.txt -bC:\winpe_amd64\Efisys.bin C:\winpe_amd64\winpeamd64.iso
    ```

    where Bootorder.txt contains the following list of files:

    ``` syntax
    boot\bcd
    boot\boot.sdi
    boot\bootfix.bin
    boot\bootsect.exe
    boot\etfsboot.com
    boot\memtest.efi
    boot\memtest.exe
    boot\en-us\bootsect.exe.mui
    boot\fonts\chs_boot.ttf
    boot\fonts\cht_boot.ttf
    boot\fonts\jpn_boot.ttf
    boot\fonts\kor_boot.ttf
    boot\fonts\wgl4_boot.ttf
    sources\boot.wim
    ```

## Next Steps


You can now use the multilingual image to create media for distribution. To create bootable media such as a USB flash drive, see [WinPE: Create USB Bootable drive](winpe-create-usb-bootable-drive.md). You can also create a bootable CD or DVD. However, due to the size of a multilingual image, you must first create a boot order file before you create a bootable image (.iso) file on CD or DVD. For more information, see [Oscdimg Command-Line Options](oscdimg-command-line-options.md).

## Related topics


[Windows Setup Technical Reference](windows-setup-technical-reference.md)

[DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md)

[DISM Windows PE Servicing Command-Line Options](dism-windows-pe-servicing-command-line-options.md)

[Oscdimg Command-Line Options](oscdimg-command-line-options.md)

[WinPE: Mount and Customize](winpe-mount-and-customize.md)

[WinPE: Install on a Hard Drive (Flat Boot or Non-RAM)](winpe-install-on-a-hard-drive--flat-boot-or-non-ram.md)

 

 






