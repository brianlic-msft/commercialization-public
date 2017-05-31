---
title: UWF\_OverlayFile
description: UWF\_OverlayFile
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 8b258f33-2cf9-46c8-8a66-efa567d63899
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# UWF\_OverlayFile


Contains a file that is currently in the overlay for a volume protected by Unified Write Filter (UWF).

## Syntax


``` syntax
class UWF_OverlayFile {
    [read] string FileName;
    [read] UInt64 FileSize;
};
```

## Members


The following table lists any properties that belong to this class.

### <a href="" id="pro"></a>Properties

<table>
<colgroup>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
</colgroup>
<thead>
<tr class="header">
<th>Property</th>
<th>Data type</th>
<th>Qualifier</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>FileName</strong></p></td>
<td><p>string</p></td>
<td><p>[read]</p></td>
<td><p>The name of the file in the file overlay.</p></td>
</tr>
<tr class="even">
<td><p><strong>FileSize</strong></p></td>
<td><p>UInt64</p></td>
<td><p>[read]</p></td>
<td><p>The size of the file in the file overlay.</p></td>
</tr>
</tbody>
</table>

 

### Remarks

You cannot use the **UWF\_ OverlayFile** class directly to get overlay files. You must use the **UWF\_Overlay.GetOverlayFiles** method to retrieve **UWF\_ OverlayFile** objects.

For more information about specific limitations and conditions when using the **GetOverlayFiles** method, see the **Remarks** section in the [UWF\_Overlay.GetOverlayFiles](uwf-overlaygetoverlayfiles.md) topic in the UWF WMI provider technical reference.

## Requirements


|                       |           |
|-----------------------|-----------|
| Windows Edition       | Supported |
| Windows 10 Home       | No        |
| Windows 10 Pro        | No        |
| Windows 10 Enterprise | Yes       |
| Windows 10 Education  | Yes       |

 

## Related topics


[Unified Write Filter WMI provider reference](uwf-wmi-provider-reference.md)

[Unified Write Filter](unified-write-filter.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20UWF_OverlayFile%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





