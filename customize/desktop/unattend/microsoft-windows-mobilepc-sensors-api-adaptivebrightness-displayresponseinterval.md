---
title: DisplayResponseInterval
description: DisplayResponseInterval
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: ea943baf-331b-41f4-b64f-e2808f432a1d
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DisplayResponseInterval


The `DisplayResponseInterval` setting specifies the minimum time between changes in display brightness due to changes in lighting conditions.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>time_in_milliseconds</em></p></td>
<td><p>Specifies the minimum time, in milliseconds, between changes in display brightness due to changes in lighting conditions.</p>
<p><em>time_in_milliseconds</em> is an integer between 100 (0.1 seconds) and 36000000 (1 hour). The default value is 2000 (2 seconds).</p></td>
</tr>
</tbody>
</table>

 

## Valid Passes


specialize

## Parent Hierarchy


[microsoft-windows-mobilepc-sensors-api-](microsoft-windows-mobilepc-sensors-api.md)| [AdaptiveBrightness](microsoft-windows-mobilepc-sensors-api-adaptivebrightness.md) | **DisplayResponseInterval**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-mobilepc-sensors-api-](microsoft-windows-mobilepc-sensors-api.md).

## XML Example


This XML example shows how to set the minimum time between changes in display brightness due to changes in lighting conditions to one minute.

``` syntax
<ALRPoints>000000000a0000000a00000028000000280000005000000044</ALRPoints>
<DisplayResponseInterval>60000</DisplayResponseInterval>
<IlluminanceChangeSensitivity>20</IlluminanceChangeSensitivity>
```

## Related topics


[microsoft-windows-mobilepc-sensors-api-](microsoft-windows-mobilepc-sensors-api.md)

[IlluminanceChangeSensitivity](microsoft-windows-mobilepc-sensors-api-adaptivebrightness-illuminancechangesensitivity.md)

[ALRPoints](microsoft-windows-mobilepc-sensors-api-adaptivebrightness-alrpoints.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20DisplayResponseInterval%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





