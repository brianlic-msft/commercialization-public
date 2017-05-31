---
title: Apply Windows updates to UWF-protected devices
description: Apply Windows updates to UWF-protected devices
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 050d1202-0b38-4f9d-a85b-27b070098ae4
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Apply Windows updates to UWF-protected devices


When a device is protected with Unified Write Filter (UWF), you must use UWF servicing mode commands to service the device and apply updates to an image.

UWF servicing mode uses the following files to when it applies Windows updates to your device:

-   UWFMgr.exe command-line tool

-   UwfServicingScr.scr screen saver

-   UwfServicingMasterScript.cmd script

**Note**  
The master servicing script can be modified to service third-party applications, service custom OEM applications, or call custom OEM servicing scripts.

 

UWF servicing supports the following types of Windows updates:

-   Critical updates

-   Security updates

-   Driver updates

You can follow these steps to apply Windows updates to your device.

**To apply Windows updates to UWF-protected devices**

1.  To apply Windows updates to your device, at an administrator command prompt, type the following command:

    ``` syntax
    uwfmgr.exe servicing enable
    ```

2.  Restart the device. Use either command.

    ``` syntax
    uwfmgr.exe filter restart
    ```

    ``` syntax
    shutdown /r /t 0
    ```

    On restart, the device will automatically sign in to the servicing account and servicing will start.

    **Important**  
    The default servicing account that is automatically created and used for servicing is named **UWF-Servicing**. It is important that you do not have a user account that has that same name on a device before starting UWF servicing.

     

    Once servicing has started, no user interaction is required. The system may restart if it is required by the Windows updates that are installing. If a restart is required, the system will re-enter servicing mode on restart and continue until all updates have been installed.

    While servicing is underway, the UwfServicingScr.scr screen saver displays on the device.

    **Note**  
    The UwfServicingScr.scr screen saver that is included with Windows 10 Enterprise is a standard Windows screen saver and can be replaced by a custom OEM screen saver if required.

     

    When Windows update servicing is finished, the system will disable UWF servicing and restart the system with UWF-protection enabled and all file and registry exclusions restored to their original pre-servicing state.

    **Note**  
    Be aware that during UWF servicing in Windows 10 Enterprise, Windows Update automatically accepts all Microsoft Software License Terms.

     

**Note**  
If Windows updates cannot be installed or return an error, servicing will be disabled and the system will restart with UWF-protection re-enabled and all file and registry exclusions restored to their original pre-servicing state.

 

## Related topics


[Unified Write Filter](unified-write-filter.md)

[UWF master servicing script](uwf-master-servicing-script.md)

[UWF servicing screen saver](uwf-servicing-screen-saver.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_embedded%5D:%20Apply%20Windows%20updates%20to%20UWF-protected%20devices%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





