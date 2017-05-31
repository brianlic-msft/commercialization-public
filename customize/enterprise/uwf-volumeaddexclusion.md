---
title: UWF\_Volume.AddExclusion
description: UWF\_Volume.AddExclusion
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 75c1cd6c-2101-499a-856e-66eadb43ec05
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# UWF\_Volume.AddExclusion


Adds a file or folder to the file exclusion list for a volume protected by Unified Write Filter (UWF).

## Syntax


``` syntax
UInt32 AddExclusion(
    string FileName
);
```

## Parameters


<a href="" id="filename"></a>*FileName*  
A string that contains the full path of the file or folder relative to the volume.

## Return Value


Returns an HRESULT value that indicates [WMI status](http://go.microsoft.com/fwlink/p/?LinkID=208318) or a [WMI error](http://go.microsoft.com/fwlink/p/?LinkID=208317).

## Remarks


You must use an administrator account to add or remove file or folder exclusions during run time, and you must restart the device for new exclusions to take effect.

**Important**  
You can’t add exclusions for the following items:

-   The volume root. For example, C: or D:.

-   The \\Windows folder on the system volume.

-   The \\Windows\\System32 folder on the system volume.

-   The \\Windows\\system32\\drivers folder on the system volume.

-   Paging files.

However, you can exclude subdirectories and files under these items.

 

## Requirements


|                       |           |
|-----------------------|-----------|
| Windows Edition       | Supported |
| Windows 10 Home       | No        |
| Windows 10 Pro        | No        |
| Windows 10 Enterprise | Yes       |
| Windows 10 Education  | Yes       |

 

## Related topics


[UWF\_Volume](uwf-volume.md)

[Unified Write Filter](unified-write-filter.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20UWF_Volume.AddExclusion%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





