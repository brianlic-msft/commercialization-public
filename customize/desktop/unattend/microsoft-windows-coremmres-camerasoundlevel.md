---
title: CameraSoundLevel
description: CameraSoundLevel
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: fcfe3b87-53bf-4edc-a5fa-9b324a7d498f
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# CameraSoundLevel


`CameraSoundLevel` specifies the sound volume that a camera will play when a photo is taken, when a series of photos are taken, or while a video is recorded.

As devices get smaller it is important that bystanders be aware that they are being recorded for privacy purposes. This feature will enable OEMs to set the device to a mode where the sound cannot be bypassed

You can use this setting to set the device to a mode where the sound is played when a camera is actively recording or taking a photo cannot be bypassed by a user or application.

This feature will make a best effort to provide the restrictions for the camera sound. This setting applies to all Modern video capture applications.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>0</p></td>
<td><p>No sound is played when a user starts a recording, stops a recording, takes a photo or starts a photo sequence.</p>
<p>This is the default value.</p></td>
</tr>
<tr class="even">
<td><p>1-100</p></td>
<td><p>Sets the volume of the sound played when a user starts a recording, stops a recording, takes a photo or starts a photo sequence.</p></td>
</tr>
</tbody>
</table>

 

## Parent Hierarchy


[Microsoft-Windows-CoreMmRes](microsoft-windows-coremmres.md) | **CameraSoundLevel**

## Valid Configuration Passes


auditSystem

auditUser

oobeSystem

generalize

specialize

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-CoreMmRes](microsoft-windows-coremmres.md).

## XML Example


The following XML output specifies that Windows will play a medium volume tone when a photo is taken.

``` syntax
<CameraSoundLevel>50</CameraSoundLevel>
```

## Related topics


[Microsoft-Windows-CoreMmRes](microsoft-windows-coremmres.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20CameraSoundLevel%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





