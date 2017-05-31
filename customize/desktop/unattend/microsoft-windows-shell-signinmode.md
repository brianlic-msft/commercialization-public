---
title: SignInMode
description: Use SignInMode to specify whether users switch to tablet mode by default after signing in.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 8DB24A68-7F22-4863-9A32-294A52C7BE53
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# SignInMode


Use `SignInMode` to specify whether users switch to tablet mode by default after signing in.

OEMs can configure this setting to support Continuum, which is a new, adaptive user experience in Windows 10 that optimizes the look and behavior of apps and the Windows UI for a given physical form factor and the customer's usage preferences. OEMs can also configure their devices to turn the hardware-based prompt on or off using [ConvertibleSlateModePromptPreference](microsoft-windows-shell-convertibleslatemodepromptpreference.md). In addition, OEMs may also specify the device form factor by setting [DeviceForm](microsoft-windows-deployment-deviceform.md). For more information about Continuum, partners can download the "Windows 10 Continuum whitepaper" through the Microsoft Connect site.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>0</p></td>
<td><p>Tablet mode</p></td>
</tr>
<tr class="even">
<td><p>1</p></td>
<td><p>Desktop</p></td>
</tr>
<tr class="odd">
<td><p>2</p></td>
<td><p>Last used</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


windowsPE

offlineServicing

generalize

specialize

auditSystem

oobeSystem

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | **SignInMode**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20SignInMode%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




