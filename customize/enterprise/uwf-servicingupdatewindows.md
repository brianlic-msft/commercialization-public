---
title: UWF\_Servicing.UpdateWindows
description: UWF\_Servicing.UpdateWindows
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 578ee0ac-fcc9-4021-9967-7b3f20eaadee
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# UWF\_Servicing.UpdateWindows


Calls Windows Update to download and install critical and security updates for your device running Windows 10 Enterprise.

## Syntax


``` syntax
UInt32 UpdateWindows(
    [out] UInt32 UpdateStatus
);
```

## Parameters


<a href="" id="updatestatus"></a>*UpdateStatus*  
\[out\] An integer that contains the status of the Windows Update operation, according to the following table:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>UpdateStatus</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0</p></td>
<td><p>Success.</p></td>
</tr>
<tr class="even">
<td><p>3010</p></td>
<td><p>Restart required.</p></td>
</tr>
<tr class="odd">
<td><p>Any other value.</p></td>
<td><p>Generic error.</p></td>
</tr>
</tbody>
</table>

 

## Return Value


Returns an HRESULT value that indicates [WMI status](http://go.microsoft.com/fwlink/p/?LinkID=208318) or a [WMI error](http://go.microsoft.com/fwlink/p/?LinkID=208317).

## Remarks


This method is meant to be used as part of a servicing script. For more information, see [Service UWF-protected devices](service-uwf-protected-devices.md).

This method does not disable or enable Unified Write Filter (UWF). If you call this method while UWF is enabled, updates may be lost when the device restarts.

## Requirements


|                       |           |
|-----------------------|-----------|
| Windows Edition       | Supported |
| Windows 10 Home       | No        |
| Windows 10 Pro        | No        |
| Windows 10 Enterprise | Yes       |
| Windows 10 Education  | Yes       |

 

## Related topics


[UWF\_Servicing](uwf-servicing.md)

[Unified Write Filter](unified-write-filter.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20UWF_Servicing.UpdateWindows%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





