---
title: TimeoutPeriodInMinutes
description: TimeoutPeriodInMinutes
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: ef1c71ca-cc4b-4ec9-b8b4-e946f0ff4005
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# TimeoutPeriodInMinutes


`TimeoutPeriodInMinutes` specifies the number of minutes that Windows will wait while attempting to join the computer to the domain before timing out.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Number of minutes</em></p></td>
<td><p>Specifies the number of minutes that Windows will wait before timing out when Windows tries to join a domain. <em>Number of minutes</em> must be between 5 and 60.</p></td>
</tr>
</tbody>
</table>

 

If no value is entered, or if an invalid value is entered, Windows will use 15 minutes as the default value.

## Valid Configuration Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-UnattendedJoin](microsoft-windows-unattendedjoin.md) | [Identification](microsoft-windows-unattendedjoin-identification.md) | **TimeoutPeriodInMinutes**

## Applies To


Windows 8 and Windows Server 2012 only.

For the list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-UnattendedJoin](microsoft-windows-unattendedjoin.md).

## XML Example


The following XML output shows how to set the default timeout period to 5 minutes.

``` syntax
<TimeoutPeriodInMinutes>5</TimeoutPeriodInMinutes>
```

## Related topics


[Identification](microsoft-windows-unattendedjoin-identification.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20TimeoutPeriodInMinutes%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





