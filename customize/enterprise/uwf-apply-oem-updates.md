---
title: Apply OEM updates to UWF-protected devices
description: Apply OEM updates to UWF-protected devices
MS-HAID:
- 'p\_embedded.apply\_oem\_updates\_to\_uwf\_protected\_devices\_blue'
- 'p\_enterprise\_customizations.apply\_oem\_updates\_to\_uwf\_protected\_devices'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: cc94c9ec-406d-494b-bc7a-ab8af320f835
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Apply OEM updates to UWF-protected devices


To apply OEM updates on a Unified Write Filter (UWF)-protected Windows 10 device, you can modify the UPDATE\_SUCCESS block of UWF master servicing script (UwfServicingMasterScript.cmd) to call a custom OEM script that applies any required OEM updates. The OEM script should return control back to the UWF Master Servicing Script when finished.

The UWF Master Servicing Script (UwfServicingMasterScript.cmd) is located in the \\Windows\\System32 folder.

## <a href="" id="update-success--uwfservicingmasterscript-cmd-"></a>UPDATE\_SUCCESS (UwfServicingMasterScript.cmd)


The UPDATE\_SUCCESS block of the UWF master servicing script follows:

``` syntax
:UPDATE_SUCCESS
echo UpdateAgent returned success.
REM
REM echo UpdateAgent executing OEM script
REM OEM can call their custom scripts
REM at this point through a "call".
REM
REM The OEM script should hand control
REM back to this script once it’s done.
REM
REM Any error recovery for OEM script
REM should be handled outside of this script
REM post a reboot.
REM
uwfmgr servicing disable
echo Restarting system
goto UPDATE_EXIT
```

## Related topics


[Service UWF-protected devices](service-uwf-protected-devices.md)

[UWF master servicing script](uwf-master-servicing-script.md)

[Unified Write Filter](unified-write-filter.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_embedded%5D:%20Apply%20OEM%20updates%20to%20UWF-protected%20devices%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





