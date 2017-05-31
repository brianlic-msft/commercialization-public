---
title: ALRPoints
description: ALRPoints
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 21889fef-49ef-4b6d-bc07-2d698c72d789
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# ALRPoints


Specifies the ambient light response (ALR) curve data.

The curve is defined by the illuminance (lux) detected by an ambient light sensor, and the percentage of change in brightness.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>ALR_curve</em>.</p></td>
<td><p>The ambient light curve is a string value. For information on generating an <em>ALR_curve</em> string, see [Integrating Ambient Light Sensors with Computers Running Windows 8](http://go.microsoft.com/fwlink/p/?linkid=252655).</p></td>
</tr>
</tbody>
</table>

 

The *ALR\_curve* can be also generated manually, using the following format: 00+*Change\_in\_brightness\_1*,*Lux\_measurement\_1*,*Change\_in\_brightness\_2*,*Lux\_measurement\_2*,*Change\_in\_brightness\_3*,*Lux\_measurement\_3* … .

*Change\_in\_brightness* is the percentage of change in brightness based on the display brightness baseline. This is a 8-digit hexadecimal number. For example, 00000096 = 150% of the current brightness level.

*Lux\_measurement* is the illuminance (lux) detected by the ambient light sensor. For example, 000003E8 = 1000 lux.

## Valid Passes


specialize

## Parent Hierarchy


[microsoft-windows-mobilepc-sensors-api-](microsoft-windows-mobilepc-sensors-api.md) | [AdaptiveBrightness](microsoft-windows-mobilepc-sensors-api-adaptivebrightness.md) | **ALRPoints**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-mobilepc-sensors-api-](microsoft-windows-mobilepc-sensors-api.md).

## XML Example


The following sample XML output shows how to set the following ALR curve:

Adjust the screen to 10% of the baseline brightness level when the ambient light sensor detects 10 lux.

Adjust the screen to 40% of the baseline brightness level when the ambient light sensor detects 40 lux.

Adjust the screen to 80% of the baseline brightness level when the ambient light sensor detects 68 lux.

``` syntax
<ALRPoints>000000000a0000000a00000028000000280000005000000044</ALRPoints>
<DisplayResponseInterval>60000</DisplayResponseInterval>
<IlluminanceChangeSensitivity>20</IlluminanceChangeSensitivity>
```

## Related topics


[DisplayResponseInterval](microsoft-windows-mobilepc-sensors-api-adaptivebrightness-displayresponseinterval.md)

[IlluminanceChangeSensitivity](microsoft-windows-mobilepc-sensors-api-adaptivebrightness-illuminancechangesensitivity.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20ALRPoints%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





