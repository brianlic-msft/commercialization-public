---
title: IlluminanceChangeSensitivity
description: IlluminanceChangeSensitivity
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 9b1eeef3-a892-43c1-92eb-7e16af786fa5
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# IlluminanceChangeSensitivity


The `IlluminanceChangeSensitivity` specifies the percentage change in illuminance (lux) required to cause a change in display brightness. This is specified in percentage change since the last change in display brightness.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>percent_of_change_in_lux_detected</em></p></td>
<td><p>Specifies the minimum percentage change in lux required to cause a change in display brightness.</p>
<p><em>percent_of_change_in_lux_detected</em> is an integer between 1 and 100. The default value is 10 (10% change in lux).</p></td>
</tr>
</tbody>
</table>

 

## Valid Passes


specialize

## Parent Hierarchy


[microsoft-windows-mobilepc-sensors-api-](microsoft-windows-mobilepc-sensors-api.md)| [AdaptiveBrightness](microsoft-windows-mobilepc-sensors-api-adaptivebrightness.md) | **IlluminanceChangeSensitivity**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-mobilepc-sensors-api-](microsoft-windows-mobilepc-sensors-api.md).

## XML Example


The following sample XML output shows how to specify that a minimum of a 20% change in lux is required to cause a change in display brightness.

``` syntax
<ALRPoints>000000000a0000000a00000028000000280000005000000044</ALRPoints>
<DisplayResponseInterval>60000</DisplayResponseInterval>
<IlluminanceChangeSensitivity>20</IlluminanceChangeSensitivity>
```

## Related topics


[microsoft-windows-mobilepc-sensors-api-](microsoft-windows-mobilepc-sensors-api.md)

[DisplayResponseInterval](microsoft-windows-mobilepc-sensors-api-adaptivebrightness-displayresponseinterval.md)

[ALRPoints](microsoft-windows-mobilepc-sensors-api-adaptivebrightness-alrpoints.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20IlluminanceChangeSensitivity%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





