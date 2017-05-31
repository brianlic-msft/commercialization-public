---
title: CacheLimit
description: CacheLimit
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 715cebfd-5a1e-40ac-81e0-2c05e4d0fd56
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# CacheLimit


`CacheLimit` specifies the amount of disk space to use for storing temporary Internet files.

**Note**  
We recommend setting this value to at least 51200 (50 MB), because lower values may negatively affect browsing performance. For computers with limited drive space, lower values may be used.

 

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Size_in_kilobytes</em></p></td>
<td><p>Specifies the amount of disk space to use for storing temporary Internet files.</p>
<p><em>Size_in_kilobytes</em> is an integer. The allowed values are from 8192 (= 8 MB) to 1048576 (= 1 GB). If <em>Size_in_kilobytes</em> is set to a value smaller than 8192, then 8192 will be used.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


oobeSystem

## Parent Hierarchy


[microsoft-windows-ie-clientnetworkprotocolimplementation-](microsoft-windows-ie-clientnetworkprotocolimplementation.md) | **CacheLimit**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [microsoft-windows-ie-clientnetworkprotocolimplementation-](microsoft-windows-ie-clientnetworkprotocolimplementation.md).

## XML Example


The following XML output shows how to reserve 100 MB of disk space for storing temporary Internet files.

``` syntax
<CacheLimit>102400</CacheLimit>
```

## Related topics


[microsoft-windows-ie-clientnetworkprotocolimplementation-](microsoft-windows-ie-clientnetworkprotocolimplementation.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20CacheLimit%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





