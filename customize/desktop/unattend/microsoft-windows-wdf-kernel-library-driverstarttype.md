---
title: DriverStartType
description: DriverStartType
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: cd91a4e0-82d6-486d-ac29-fc93531d89b7
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DriverStartType


`DriverStartType` specifies whether the Kernel-Mode Driver Framework (KMDF) service is started at boot or on demand.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>0</strong></p></td>
<td><p>Specifies that the service starts immediately when the computer is started. This is the default value.</p></td>
</tr>
<tr class="even">
<td><p><strong>3</strong></p></td>
<td><p>Specifies that the service can start on demand. This applies only if there are no boot-start KMDF drivers on the system. Otherwise, the system can be rendered unbootable.</p></td>
</tr>
</tbody>
</table>

 

## Parent Hierarchy


[Microsoft-Windows-WDF-Kernel Library](microsoft-windows-wdf-kernel-library.md) | **DriverStartType**

## Valid Configuration Passes


offlineServicing

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-WDF-Kernel Library](microsoft-windows-wdf-kernel-library.md).

## XML Example


The following XML output shows how to set the service to start on demand.

``` syntax
<DriverStartType>3</DriverStartType>
```

## Related topics


[Microsoft-Windows-WDF-Kernel Library](microsoft-windows-wdf-kernel-library.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20DriverStartType%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





