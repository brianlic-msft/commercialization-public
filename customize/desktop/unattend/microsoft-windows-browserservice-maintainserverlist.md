---
title: MaintainServerList
description: MaintainServerList
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 919872be-6475-4947-aa22-2bfc0f9ee26c
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# MaintainServerList


`MaintainServerList` specifies whether the computer can act as a master or backup browser on a subnet.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>Yes</strong></p></td>
<td><p>Specifies that the computer becomes a master or backup browser.</p></td>
</tr>
<tr class="even">
<td><p><strong>No</strong></p></td>
<td><p>Specifies that the computer cannot become a master or backup browser.</p></td>
</tr>
<tr class="odd">
<td><p><strong>Auto</strong></p></td>
<td><p>Specifies that the computer can become a master or backup browser if needed—that is, if there is no master browser on the subnet or there are not enough master browsers on the subnet. This is the default value.</p></td>
</tr>
</tbody>
</table>

 

## Parent Hierarchy


[Microsoft-Windows-BrowserService](microsoft-windows-browserservice.md) | **MaintainServerList**

## Valid Passes


generalize

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-BrowserService](microsoft-windows-browserservice.md).

## XML Example


The following XML output specifies that the computer cannot act as a master or backup browser.

``` syntax
<MaintainServerList>No</MaintainServerList>
```

## Related topics


[Microsoft-Windows-BrowserService](microsoft-windows-browserservice.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20MaintainServerList%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





