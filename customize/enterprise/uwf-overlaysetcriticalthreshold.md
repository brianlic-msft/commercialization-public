---
title: UWF\_Overlay.SetCriticalThreshold
description: UWF\_Overlay.SetCriticalThreshold
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 970dd0a5-ce9c-40d1-b6f5-772c9992f62a
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# UWF\_Overlay.SetCriticalThreshold


Sets the critical threshold for monitoring the size of the Unified Write Filter (UWF) overlay.

## Syntax


``` syntax
UInt32 SetCriticalThreshold(
    UInt32 size
);
```

## Parameters


<a href="" id="size"></a>*size*  
An integer that represents the size, in megabytes, of the critical threshold level for the overlay. If *size* is 0 (zero), UWF does not raise critical threshold events.

## Return Value


Returns an HRESULT value that indicates [WMI status](http://go.microsoft.com/fwlink/p/?LinkID=208318) or a [WMI error](http://go.microsoft.com/fwlink/p/?LinkID=208317).

## Remarks


When the size of the overlay reaches or exceeds the *size* threshold value, UWF writes the following notification event to the event log.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Message ID</th>
<th>Event code</th>
<th>Message text</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>UWF_OVERLAY_REACHED_CRITICAL_LEVEL</p></td>
<td><p>0x80010002L</p></td>
<td><p>The UWF overlay size has reached CRITICAL level.</p></td>
</tr>
</tbody>
</table>

 

The critical threshold must be higher than the warning threshold.

## Requirements


|                       |           |
|-----------------------|-----------|
| Windows Edition       | Supported |
| Windows 10 Home       | No        |
| Windows 10 Pro        | No        |
| Windows 10 Enterprise | Yes       |
| Windows 10 Education  | Yes       |

 

## Related topics


[UWF\_Overlay](uwf-overlay.md)

[Unified Write Filter](unified-write-filter.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20UWF_Overlay.SetCriticalThreshold%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





