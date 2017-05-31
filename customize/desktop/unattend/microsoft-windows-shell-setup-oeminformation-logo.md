---
title: Logo
description: Logo
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: a2c55d15-94f5-4b43-a3b9-e3c5453ebf41
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Logo


In Windows 10, version 1607, the Logo setting is deprecated.

`Logo` specifies the path to the .bmp file of the manufacturer's logo. This logo appears in the **Performance Information and Tools** Control Panel, but is not used in the **Settings** app. In the **Settings** app, no logo displays.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Path_to_logo</em></p></td>
<td><p>Specifies the path to the manufacturer's logo. The logo must be located on the destination computer, and it must be a .bmp file. <em>Path_to_logo</em> is a string that has a maximum length of 259 characters.</p>
<div class="alert">
<strong>Note</strong>  
<p>The logo must be in 32-bit color. Logos that are larger than 120x120 pixels are scaled to 120x120.</p>
<p></p>
</div>
<div>
 
</div></td>
</tr>
</tbody>
</table>

 

This string type supports empty elements.

## Valid Configuration Passes


auditUser

generalize

offlineServicing

oobeSystem

specialize

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | [OEMInformation](microsoft-windows-shell-setup-oeminformation.md) | **Logo**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## Related topics


[OEMInformation](microsoft-windows-shell-setup-oeminformation.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Logo%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





