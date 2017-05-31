---
author: Justinha
Description: Add Language Interface Packs to Windows
ms.assetid: 6acfeb8f-ce94-46e0-b679-1f58958fdd3e
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Add Language Interface Packs to Windows
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Add Language Interface Packs to Windows


Language Interface Packs (LIPs) include Windows user interface text for a region. LIPs must be used with a valid parent language.

For example, the Catalan (ca-ES) LIP can be installed only if one of the following languages is already installed: English US (en-US), Great Britain (en-GB), Spanish (es-ES), or French (fr-FR).

To add a LIP to an offline Windows image, you must verify that the supported parent language pack is installed to the Windows image first.

For a list of the LIPs and their parent languages, see [Available Language Packs for Windows](available-language-packs-for-windows.md).

The version of the LIP must match the version of Windows. For example, you can't add a Windows 10 LIP to a Windows 8 image, or a Windows 8 LIP to a Windows 10 image.

For Windows 10, language packs and LIPs are also available to download from Windows Update. You can add additional languages by using **Control Panel**. This process requires internet access and access to Windows Update. IT Professionals and end-users can use Windows Update to add additional languages to their Windows installations.

-   OEMs can view and download LIPs from the [Microsoft OEM site](http://go.microsoft.com/fwlink/?LinkId=131359).
-   System Builders can view and download LIPs from the [OEM Partner Center](http://go.microsoft.com/fwlink/?LinkId=131358).
-   Users can get languages or LIPs from Windows Update. Go to **Settings** &gt; **Time & language** &gt; **Region & language** &gt; **Add a language**. Select the language you want to use from the list, then choose which region's version you want to use. Your download will begin immediately.

## <span id="Install_LIPs"></span><span id="install_lips"></span><span id="INSTALL_LIPS"></span>Install LIPs

**To install a LIP using audit mode (used for manufacturing PCs)**

1.  Download the appropriate LIP (and if necessary, its base language), and save it to removable media.
2.  Boot the destination computer to audit mode. For example at the OOBE screen, press Ctrl+Shift+F3. To learn more, see [Boot Windows to Audit Mode or OOBE](boot-windows-to-audit-mode-or-oobe.md).
3.  Insert the removable media and copy the LIP (and base language, if necessary) to the destination computer.
4.  If the base language isn't already installed, install it: Navigate to the .cab file and double-click it. Follow the instructions to complete the installation.
5.  Install the LIP: Navigate to the .cab file and double-click it. Follow the instructions to complete the installation.
6.  Exit audit mode and prepare the PC for image capture or deployment, for example:

    Open a command prompt and run: 
    
    ``` syntax
    sysprep /oobe /generalize
    ``` 
    
    To learn more, see [Sysprep (Generalize) a Windows installation](sysprep--generalize--a-windows-installation.md).

**To install a LIP to an offline Windows image**

1.  Download the appropriate LIP (and if necessary, its base language).
2.  Open a command prompt with elevated permissions.
3.  Mount the Windows image that you want to install the LIP to.

    ``` syntax
    md "C:\mount\windows"

    Dism /Mount-Image /ImageFile:C:\images\Win10\sources\install.wim /Index:1 /MountDir:"C:\mount\windows"
    ```

4.  If the base LP isn't in the image already, add it.

    ``` syntax
    Dism /Image:C:\mount\windows /Add-Package /PackagePath:C:\Languages\x64\langpacks\Microsoft-Windows-Client-Language-Pack_x64_es-es.cab
    ```

5.  Add the LIP.

    ``` syntax
    Dism /Image:C:\mount\windows /Add-Package /PackagePath:C:\Languages\x64\langpacks\Microsoft-Windows-Client-Language-Interface-Pack_x64_ca-es.cab
    ```

6.  If you're creating Windows Setup media or using a distribution share, recreate the lang.ini file.

    ``` syntax
    Dism /Image:C:\mount\windows /Gen-LangIni 
           /Distribution:C:\images\Win10\sources
    ```

    The lang.ini file in C:\\images\\Win10\\sources should look similar to the following:

    ``` syntax
    [Available UI Languages]
    ca-ES = 2
    es-ES = 3
     
    [Fallback Languages]
    es-ES = en-us
    ```

7.  Optional: Change the default language, locale, and other international settings to the local language.

    ``` syntax
    Dism /image:C:\mount\windows /set-allIntl:ca-es
    ```

    Optional: Review the default international settings.

    ``` syntax
    Dism /image:C:\mount\windows /get-intl
    ```

    For example, you should see output similar to the following:

    ``` syntax
    Reporting offline international settings.
     
    Default system UI language : es-ES
    System locale : ca-ES
    Default time zone : Romance Standard Time
    User locale for default user : ca-ES
    Location : Spain (GEOID = 217)
    Active keyboard(s) : 0403:0000040a
    Keyboard layered driver : PC/AT Enhanced Keyboard (101/102-Key)
     
    Installed language(s): ca-ES
      Type : Partially localized language, LIP type.
    Installed language(s): es-ES
      Type : Fully localized language.
     
    Reporting distribution languages.
     
    The default language in the distribution is:
    es-ES
    ```

8.  Unmount the image, committing the changes.

    ``` syntax
    Dism /Unmount-Image /MountDir:C:\mount\windows /Commit
    ```

    Your Windows image is ready to be deployed.

## <span id="related_topics"></span>Related topics


[Add Language Packs to Windows](add-language-packs-to-windows.md)

[Available Language Packs for Windows](available-language-packs-for-windows.md)

[Language Pack Default Values](http://go.microsoft.com/fwlink/?LinkId=206622)

 

 






