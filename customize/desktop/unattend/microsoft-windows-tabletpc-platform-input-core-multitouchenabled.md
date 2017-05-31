---
title: MultiTouchEnabled
description: MultiTouchEnabled
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: f1bb3799-b225-4bc5-a200-426a82f43d14
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# MultiTouchEnabled


`MultiTouchEnabled` specifies whether multi-touch is enabled. With multi-touch, the computer can receive input from the touch surface from multiple points at the same time.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>true</strong></p></td>
<td><p>Enables multi-touch. This is the default value.</p></td>
</tr>
<tr class="even">
<td><p><strong>false</strong></p></td>
<td><p>Disables multi-touch.</p></td>
</tr>
</tbody>
</table>

 

## Parent Hierarchy


[Microsoft-Windows-TabletPC-Platform-Input-Core](microsoft-windows-tabletpc-platform-input-core.md) | **MultiTouchEnabled**

## Valid Passes


offlineServicing

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-TabletPC-Platform-Input-Core](microsoft-windows-tabletpc-platform-input-core.md).

## XML Example


The following XML output shows how to disable multi-touch on a Tablet PC.

``` syntax
<MultiTouchEnabled>false</MultiTouchEnabled>
```

## Related topics


[Microsoft-Windows-TabletPC-Platform-Input-Core](microsoft-windows-tabletpc-platform-input-core.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20MultiTouchEnabled%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





