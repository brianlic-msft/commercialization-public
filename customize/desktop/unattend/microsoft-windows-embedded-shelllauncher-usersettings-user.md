---
title: User
description: Use the User settings to specify what custom shell and what default return code action to use for specific users or user groups.
MS-HAID:
- 'p\_unattend.microsoft-windows-embedded-shelllauncher\_user'
- 'p\_unattend.microsoft-windows-embedded-shelllauncher\_usersettings\_user'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: B53B5A1F-6742-435E-8FA7-3EC6902BFC8B
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# User


Use the `User` settings to specify what custom shell and what default return code action to use for specific users or user groups.

## Child elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Topic</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>[AccountName](microsoft-windows-embedded-shelllauncher-usersettings-user-accountname.md)</p></td>
<td><p>Specifies the user or group account name the custom shell will be used for.</p></td>
</tr>
<tr class="even">
<td><p>[CustomReturnCodeAction](microsoft-windows-embedded-shelllauncher-usersettings-user-customreturncodeaction.md)</p></td>
<td><p>Contains the settings to map an exit code from a custom shell to a shell exit action. If the exit code does not match a defined value, Shell Launcher performs the default return action code.</p></td>
</tr>
<tr class="odd">
<td><p>[DefaultReturnCodeAction](microsoft-windows-embedded-shelllauncher-usersettings-user-defaultreturncodeaction.md)</p></td>
<td><p>Specifies what action to take based on the return code.</p></td>
</tr>
<tr class="even">
<td><p>[Domain](microsoft-windows-embedded-shelllauncher-usersettings-user-domain.md)</p></td>
<td><p>Specifies account name's domain.</p></td>
</tr>
<tr class="odd">
<td><p>[Key](microsoft-windows-embedded-shelllauncher-usersettings-user-key.md)</p></td>
<td><p>Index key for this setting in the setting list.</p></td>
</tr>
<tr class="even">
<td><p>[Shell](microsoft-windows-embedded-shelllauncher-usersettings-user-shell.md)</p></td>
<td><p>Specifies the application or executable to use as the default custom shell.</p></td>
</tr>
</tbody>
</table>

 

## Parent Hierarchy


[Microsoft-Windows-Embedded-ShellLauncher](microsoft-windows-embedded-shelllauncher.md) | [UserSettings](microsoft-windows-embedded-shelllauncher-usersettings.md) | **User**

## Applies to


This component applies to the following Windows editions and architectures.

<table>
<colgroup>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
</colgroup>
<thead>
<tr class="header">
<th>Windows Edition</th>
<th>x86-based processors</th>
<th>x64-based processors</th>
<th>ARM-based processors</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Windows 10 Enterprise</p></td>
<td><p>x86</p></td>
<td><p>amd64</p></td>
<td><p>Not available</p></td>
</tr>
</tbody>
</table>

 

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20User%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




