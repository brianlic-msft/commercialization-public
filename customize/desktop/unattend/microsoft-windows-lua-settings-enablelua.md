---
title: EnableLUA
description: EnableLUA
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 85ac1c3e-eb4d-40e5-b7a1-12447203bc51
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# EnableLUA


`EnableLUA` specifies whether Windows User Account Controls (UAC) notifies the user when programs try to make changes to the computer. UAC was formerly known as Limited User Account (LUA).

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>true</strong></p></td>
<td><p>Windows notifies the user when programs try to make changes to the computer.</p>
<p>This is the default value.</p></td>
</tr>
<tr class="even">
<td><p><strong>false</strong></p></td>
<td><p>Windows does not notify the user when programs try to install software or make changes to the computer.</p>
<p>We do not recommend using this setting, but it can be selected for systems that use programs that are not certified for Windows 8, Windows Server 2012, Windows 7 or Windows Server 2008 R2 because they do not support UAC.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


offlineServicing

## Parent Hierarchy


[Microsoft-Windows-LUA-Settings](microsoft-windows-lua-settings.md) | **EnableLUA**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-LUA-Settings](microsoft-windows-lua-settings.md).

## XML Example


The following XML output specifies that Windows does not notify the user when programs try to install software or make changes to the computer.

``` syntax
<EnableLUA>false</EnableLUA>
```

## Related topics


[Microsoft-Windows-LUA-Settings](microsoft-windows-lua-settings.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20EnableLUA%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





