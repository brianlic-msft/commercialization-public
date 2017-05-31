---
title: VisualEffects
description: VisualEffects
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 1bea22d2-6279-4d0f-8019-f8885cbdec72
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# VisualEffects


`VisualEffects` specifies additional display settings.

This setting has no effect on Server Core installations.

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[FontSmoothing](microsoft-windows-shell-setup-visualeffects-fontsmoothing.md)</p></td>
<td><p>Specifies whether font smoothing is enabled, and which type of font smoothing is enabled.</p></td>
</tr>
<tr class="even">
<td><p>[SystemDefaultBackgroundColor](microsoft-windows-shell-setup-visualeffects-systemdefaultbackgroundcolor.md)</p></td>
<td><p>Specifies the system default Windows background color scheme appearing on first boot, and on LogonUI if no user is selected.</p></td>
</tr>
</tbody>
</table>

 

## Valid Passes


oobeSystem

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | **VisualEffects**

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML output shows **ClearType** enabled for font smoothing.

``` syntax
<VisualEffects>
   <FontSmoothing>ClearType</FontSmoothing>
</VisualEffects>
```

## Related topics


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20VisualEffects%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





