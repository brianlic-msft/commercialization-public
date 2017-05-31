---
title: FontSmoothing
description: FontSmoothing
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 841603b8-abd8-48a3-8445-9ee27da1b254
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# FontSmoothing


`FontSmoothing` specifies whether font smoothing is enabled, and which type.

This setting has no effect on Server Core installations.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>Standard</strong></p></td>
<td><p>Specifies that the computer chooses the setting, based on a performance test.</p></td>
</tr>
<tr class="even">
<td><p><strong>On</strong></p></td>
<td><p>Specifies that font smoothing is turned on.</p></td>
</tr>
<tr class="odd">
<td><p><strong>Off</strong></p></td>
<td><p>Specifies that font smoothing is turned off.</p></td>
</tr>
<tr class="even">
<td><p><strong>ClearType</strong></p></td>
<td><p>Specifies that Clear Type is used for font smoothing.</p></td>
</tr>
</tbody>
</table>

 

This string type supports empty elements.

## Valid Passes


oobeSystem

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | [VisualEffects](microsoft-windows-shell-setup-visualeffects.md) | **FontSmoothing**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML output shows **ClearType** enabled for font smoothing.

``` syntax
<VisualEffects>
   <FontSmoothing>ClearType</FontSmoothing>
</VisualEffects>
```

## Related topics


[VisualEffects](microsoft-windows-shell-setup-visualeffects.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20FontSmoothing%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





