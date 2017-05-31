---
title: AdaptiveBrightness
description: AdaptiveBrightness
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: c60042e8-652f-4f9f-9cc0-2e93c17022a6
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# AdaptiveBrightness


`AdaptiveBrightness` contains settings related to adaptive brightness.

Adaptive brightness changes the brightness of a monitor or display based on the ambient light.

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[ALRPoints](microsoft-windows-mobilepc-sensors-api-adaptivebrightness-alrpoints.md)</p></td>
<td><p>Specifies the ambient light response (ALR) curve data.</p></td>
</tr>
<tr class="even">
<td><p>[DisplayResponseInterval](microsoft-windows-mobilepc-sensors-api-adaptivebrightness-displayresponseinterval.md)</p></td>
<td><p>Specifies the minimum time, in milliseconds, between changes in display brightness due to lighting conditions.</p></td>
</tr>
<tr class="odd">
<td><p>[IlluminanceChangeSensitivity](microsoft-windows-mobilepc-sensors-api-adaptivebrightness-illuminancechangesensitivity.md)</p></td>
<td><p>Specifies the percentage change in illuminance (lux) required to cause a change in display brightness. Specified in percentage change since the last change in display brightness.</p></td>
</tr>
</tbody>
</table>

 

## Valid Passes


specialize

## Parent Hierarchy


[microsoft-windows-mobilepc-sensors-api-](microsoft-windows-mobilepc-sensors-api.md) | **AdaptiveBrightness**

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-mobilepc-sensors-api-](microsoft-windows-mobilepc-sensors-api.md).

## XML Example


The following sample XML output shows how to set adaptive brightness:

``` syntax
<ALRPoints>000000000a0000000a00000028000000280000005000000044</ALRPoints>
<DisplayResponseInterval>60000</DisplayResponseInterval>
<IlluminanceChangeSensitivity>20</IlluminanceChangeSensitivity>
```

``` syntax
```

## Related topics


[microsoft-windows-mobilepc-sensors-api-](microsoft-windows-mobilepc-sensors-api.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20AdaptiveBrightness%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





