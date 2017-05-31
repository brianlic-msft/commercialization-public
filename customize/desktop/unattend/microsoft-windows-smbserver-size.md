---
title: Size
description: Size
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 2ccf08d0-7b88-42b6-b519-4ceb3175557a
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Size


`Size` specifies the size of the cache.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>1</strong></p></td>
<td><p>Specifies that memory use is minimized.</p></td>
</tr>
<tr class="even">
<td><p><strong>2</strong></p></td>
<td><p>Specifies that the computer balances memory usage with network performance.</p></td>
</tr>
<tr class="odd">
<td><p><strong>3</strong></p></td>
<td><p>Specifies that memory use is maximized for file sharing and throughput of network applications. This is the default value.</p></td>
</tr>
</tbody>
</table>

 

**Note**  
In earlier releases, the default was **1** for clients and **3** for servers.

 

## Parent Hierarchy


[Microsoft-Windows-SMBServer](microsoft-windows-smbserver.md) | **Size**

## Valid Configuration Passes


generalize

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-SMBServer](microsoft-windows-smbserver.md).

## XML Example


The following XML output shows how to specify that the computer balances memory usage with network performance.

``` syntax
<LmAnnounce>true</LmAnnounce>
<Size>2</Size>
```

## Related topics


[Microsoft-Windows-SMBServer](microsoft-windows-smbserver.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Size%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





