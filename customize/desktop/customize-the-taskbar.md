---
title: Customize the taskbar
description: Customize the taskbar
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 23839EDA-AB63-432A-AEC7-A9741AFB15E5
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Customize the taskbar


You can pin up to three additional apps to the taskbar by adding a taskbar layout modification file, for example, TaskbarLayoutModification.xml. You can specify different taskbar configurations based on SKU, device locale, or region.

**Note**  The file name “TaskbarLayoutModification.xml” is not required, you can choose any name you like. The important things are that the registry key is set to the path of mounted location of the xml file.

 

This file is similar to the file used to customize the Start menu, LayoutModification.xml.

There are two ways of adding pins:

-   Use a shortcut (.lnk) file. Example:
    ```
    DesktopApp 
    DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Accessories\Paint.lnk"
    ```

-   Use a UWA app user model ID. Example:
    ```
    UWA AppUserModelID="Microsoft.Windows.Photos_8wekyb3d8bbwe!App"
    ```
For left-to-right languages, the taskbar icons are ordered from left to right. For right-to-left languages, the taskbar icons are ordered from right to left (the rightmost element is **Start**).

-   **Start**
-   **Search**
-   **Task view**
-   **Mail**
-   Windows-provided pins
-   OEM pins

You cannot remove or replace the Windows-provided pins or **Start**, **Search**, **Task view**, or **Mail**. You are, however, able to add up to three additional pinned apps to the taskbar.

There are eight steps to customize the taskbar with up to three additional pinned apps:

1.  Create the shortcuts to your apps.

    We recommend storing the shortcut .lnk files in the All Users Start menu For example:

    %ALLUSERSPROFILE%\\Microsoft\\Windows\\Start Menu\\Programs\\Fabrikam\\Application.lnk

2.  Create a TaskbarLayoutModification.xml file that includes the pins. Here is an example of the xml you’d add to the TaskbarLayoutModification.xml to add three pinned apps.

    ```
    <?xml version="1.0" encoding="utf-8"?>
    <LayoutModificationTemplate
        xmlns="http://schemas.microsoft.com/Start/2014/LayoutModification"
        xmlns:defaultlayout="http://schemas.microsoft.com/Start/2014/FullDefaultLayout"
        xmlns:start="http://schemas.microsoft.com/Start/2014/StartLayout"
        xmlns:taskbar="http://schemas.microsoft.com/Start/2014/TaskbarLayout"
        Version="1">
        <CustomTaskbarLayoutCollection>
            <defaultlayout:TaskbarLayout>
                <taskbar:TaskbarPinList>
                    <taskbar:DesktopApp DesktopApplicationLinkPath="%APPDATA%\Microsoft\Windows\Start Menu\Programs\Accessories\Internet Explorer.lnk" />
                    <taskbar:DesktopApp DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Accessories\Paint.lnk" />
                    <taskbar:UWA AppUserModelID="Microsoft.Windows.Photos_8wekyb3d8bbwe!App" />
                </taskbar:TaskbarPinList>
            </defaultlayout:TaskbarLayout>
        </CustomTaskbarLayoutCollection>
    </LayoutModificationTemplate>
    ```

3.  Mount your Windows image, and add your TaskbarLayoutModification.xml file to the image. For example, add (or replace) the file:

    C:\\Mount\\Windows\\Users\\Default\\AppData\\Local\\Microsoft\\Windows\\Shell\\TaskbarLayoutModification.xml

4.  Create a registry key (.reg) file that includes the key:

    “HKEY\_LOCAL\_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\LayoutXMLPath”, and save it in the image.

    1.  Put the path of the mounted TaskbarLayoutModification.xml file as the registry key’s value, for example, %AppData%\\Local\\Microsoft\\Windows\\Shell\\TaskbarLayoutModification.xml.
    2.  Add this file to the image.

5.  Prepare to run this registry key by adding a [FirstLogonCommands](unattend/microsoft-windows-shell-setup-firstlogoncommands.md) in an Unattend file.
6.  Add the Unattend file to the image.
7.  Unmount the image.
8.  Apply and boot the image.

    TaskbarLayoutModification.xml is applied during [Sysprep](https://msdn.microsoft.com/windows/hardware/commercialize/manufacture/desktop/sysprep-process-overview). After Sysprep processes the file, it is moved to %AppData%\\Local\\Microsoft\\Windows\\Shell\\. During OOBE, the tray creates an instance of ITaskbarLayoutPolicyManager and determines whether the TaskbarLayoutModification.xml is present and is well formed. If not, Windows checks for pins in the Unattend setting:[TaskbarLinks](unattend/microsoft-windows-shell-setup-taskbarlinks.md). If neither exist, no new pins are added. If the TaskbarLayoutModification.xml is valid, Windows adds the pins to the taskbar.

**Note**  Note: If the taskbar detects registry keys that map to default pins (the pre-Windows 10, version 1607 method of pinning apps to the taskbar), and it also detects app pinning by using TaskbarLayoutModification.xml, only TaskbarLayoutModification.xml pinning will be applied. If, however, no TaskbarLayoutModification.xml file exists, the legacy method will be applied. **The legacy method is deprecated in Windows 10, version 1607, and may not be supported in future versions of Windows. We recommend this new approach, adding a TaskbarLayoutModification.xml file.**

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_customize_desktop\p_customize_desktop%5D:%20Customize%20the%20taskbar%20%20RELEASE:%20%2810/19/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




