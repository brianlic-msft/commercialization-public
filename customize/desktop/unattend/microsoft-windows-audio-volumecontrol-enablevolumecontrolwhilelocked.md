---
title: EnableVolumeControlWhileLocked
description: EnableVolumeControlWhileLocked
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 2ac68bb8-da5b-48f5-8e7e-9d0a82db3458
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# EnableVolumeControlWhileLocked


**EnableVolumeControlWhileLocked** specifies whether volume controls appear when the computer is locked.

Example: While the computer is playing music, the user locks the computer. If **EnableVolumeControlWhileLocked** is enabled, then when the computer is locked, the user can adjust or mute the music's volume by using the keyboard or a connected device, without needing to unlock the computer.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>true</strong></p></td>
<td><p>When the computer is locked, volume can be changed.</p>
<p>This is the default value.</p></td>
</tr>
<tr class="even">
<td><p><strong>false</strong></p></td>
<td><p>When the computer is locked, volume cannot be changed.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-Audio-VolumeControl](microsoft-windows-audio-volumecontrol.md) | **EnableVolumeControlWhileLocked**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-Audio-VolumeControl](microsoft-windows-audio-volumecontrol.md).

## XML Example


The following XML output specifies that volume controls are not available when the computer is locked.

``` syntax
<EnableVolumeControlWhileLocked>false</EnableVolumeControlWhileLocked>
```

## Related topics


[Microsoft-Windows-Audio-VolumeControl](microsoft-windows-audio-volumecontrol.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20EnableVolumeControlWhileLocked%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





