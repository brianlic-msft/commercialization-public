---
title: UWF\_OverlayConfig.SetType
description: UWF\_OverlayConfig.SetType
MS-HAID:
- 'p\_embedded.uwf\_overlayconfigsettype\_blue'
- 'p\_enterprise\_customizations.uwf\_overlayconfigsettype'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b3818f69-ae4b-46fb-a5bc-81f7d46ad7ea
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# UWF\_OverlayConfig.SetType


Sets the type of the Unified Write Filter (UWF) overlay to either RAM-based or disk-based.

## Syntax


``` syntax
UInt32 SetType(
    UInt32 type
);
```

## Parameters


<a href="" id="type"></a>*type*  
The type of overlay. Set to **0** for a RAM-based overlay; set to **1** for a disk-based overlay.

## Return Value


Returns an HRESULT value that indicates [WMI status](http://go.microsoft.com/fwlink/p/?LinkID=208318) or a [WMI error](http://go.microsoft.com/fwlink/p/?LinkID=208317).

## Remarks


Changes to the overlay type take effect during the next device restart in which UWF is enabled.

When you change the overlay type from RAM-based to disk-based, UWF creates a file on the system volume. The file has a size equal to the **MaximumSize** property of [UWF\_OverlayConfig](uwf-overlayconfig.md).

Before you can change the overlay type to disk-based, your device must meet the following requirements.

-   UWF must be disabled in the current session.

-   The system volume on your device must have available free space greater than the maximum size of the overlay.

-   The maximum size of the overlay must be at least 1024 MB.

Before you can change the overlay type to RAM-based, your device must meet the following requirements.

-   UWF must be disabled in the current session.

## Requirements


|                       |           |
|-----------------------|-----------|
| Windows Edition       | Supported |
| Windows 10 Home       | No        |
| Windows 10 Pro        | No        |
| Windows 10 Enterprise | Yes       |
| Windows 10 Education  | Yes       |

 

## Related topics


[UWF\_OverlayConfig](uwf-overlayconfig.md)

[Overlay for Unified Write Filter (UWF)](uwfoverlay.md)

[Unified Write Filter](unified-write-filter.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20UWF_OverlayConfig.SetType%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





