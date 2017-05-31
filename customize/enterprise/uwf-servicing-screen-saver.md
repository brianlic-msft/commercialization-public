---
title: UWF servicing screen saver
description: UWF servicing screen saver
MS-HAID:
- 'p\_embedded.uwf\_servicing\_screen\_saver\_blue'
- 'p\_enterprise\_customizations.uwf\_servicing\_screen\_saver'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 869ccd86-08db-44ec-ac8e-938476e3a1da
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# UWF servicing screen saver


The default settings for the Unified Write Filter (UWF) servicing screen saver can be changed through the Windows registry to use custom text, title, font, and color settings.

The UWF servicing screen saver (UwfServicingScr.scr) is located in the \\Windows\\System32 folder.

**Important**  
When UWF is installed on your device, when you right-click on the **Desktop**, and then click **Personalize** &gt; **Screen Saver**, the UWF servicing screen saver will appear in the list of available screen savers in the **Screen Saver Settings** dialog box.

Do not select **UwfServicingScr** as the screen saver and then click **Preview**, as you will not be able to exit the UWF servicing screen saver by moving the mouse or pressing a key. The only way to exit the UWF servicing screen saver in this case is by pressing the Ctrl+Alt+Delete keys.

 

## Modify the default registry settings for the UWF servicing screen saver


1.  To modify the default registry settings for the UWF servicing screen saver, from the example shown here, change the values in a text editor, and then save as a .reg file (for example, Overridescreensaver.reg).

    ``` syntax
    Windows Registry Editor Version 5.00
    [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows Embedded\ServicingScreenSaver]
    "ColorBackground"=dword:000000ff
    "ColorText"=dword:0000ff00
    "ColorProgress"=dword:00ff0000
    "ScreenSaverTitle"="Device"
    "ScreenSaverSubTitle"="Servicing device…"
    "HideScreenSaverText"=dword:00000000
    "HideScreenSaverProgress"=dword:00000000
    "Font"="Algerian"
    ```

2.  On the device, open a command prompt as an administrator. For Windows Shell, to open a command prompt, do the following:

    1.  In Windows Explorer, move to \\Windows\\System32, right-click **cmd.exe**, and then click **Run as Administrator**.

    2.  Accept the UAC prompt.

3.  To apply the custom registry settings for the screen saver to the device, type the following command:

    ``` syntax
    regedit.exe /s overridescreensaver.reg
    ```

    The next time the device enters UWF servicing mode, the UwfServicingScr.scr screen saver will use the custom settings.

## Related topics


[Service UWF-protected devices](service-uwf-protected-devices.md)

[Unified Write Filter](unified-write-filter.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_embedded%5D:%20UWF%20servicing%20screen%20saver%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





