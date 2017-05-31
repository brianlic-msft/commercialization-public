---
title: UnattendEnableRetailDemo
description: Use UnattendEnableRetailDemo to enable retail demo mode on the device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 1F546709-3662-4E15-8BD5-CF80E1761766
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# UnattendEnableRetailDemo


Use `UnattendEnableRetailDemo` to enable retail demo mode on the device. Retail demo mode is a special retail mode that can be activated in retail stores to run a demo on the device. The demo highlights key features of the OS and shows off the device user experience.

When `UnattendEnableRetailDemo` is used in combination with other Unattend settings for language, region, keyboard, and EULA agreement, the device boots directly into retail demo mode with a local user account, which is automatically upgraded to a Microsoft account. For more information about retail demo mode and what you need to do to take full advantage of this integrated feature, see the *User Experience Windows Engineering Guide (UX WEG) for Windows 10*.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>true</strong></p></td>
<td><p>Enables retail demo mode on the device.</p></td>
</tr>
<tr class="even">
<td><p><strong>false</strong></p></td>
<td><p>Disables retail demo mode on the device.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


oobeSystem

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | [OOBE](microsoft-windows-shell-setup-oobe.md) | **UnattendEnableRetailDemo**

## Applies To


Windows 10 for desktop editions (Home, Pro, Enterprise, and Education)

For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20UnattendEnableRetailDemo%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




