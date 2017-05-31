---
title: NoPhysicalCameraLED
description: NoPhysicalCameraLED
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 9bd9c1a1-b9d6-474b-a22d-cf428c90a731
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# NoPhysicalCameraLED


`NoPhysicalCameraLED` indicates that there is no physical LED for the device’s camera. An example of a physical LED for a camera is the small blue light that turns on whenever the camera is streaming video. This setting is used to indicate to the shell component that it will need to provide a small indicator in the user interface (UI) to show when video frames are streaming or not streaming to replace the notification by physical LED.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>0</p></td>
<td><p>Does not draw an indicator in the UI to show when the camera is on or off. Instead, a physical LED exists to show when video frames are streaming or not streaming.</p>
<p>This is the default value.</p></td>
</tr>
<tr class="even">
<td><p>1</p></td>
<td><p>Draws an indicator in the UI to show when video frames are streaming or not streaming.</p></td>
</tr>
</tbody>
</table>

 

## Parent Hierarchy


[Microsoft-Windows-CoreMmRes](microsoft-windows-coremmres.md) | **NoPhysicalCameraLED**

## Valid Configuration Passes


auditSystem

auditUser

oobeSystem

generalize

specialize

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-CoreMmRes](microsoft-windows-coremmres.md).

## XML Example


The following XML output specifies that no physical camera LED exists for the device.

``` syntax
< NoPhysicalCameraLED >1</ NoPhysicalCameraLED >
```

## Related topics


[Microsoft-Windows-CoreMmRes](microsoft-windows-coremmres.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20NoPhysicalCameraLED%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





