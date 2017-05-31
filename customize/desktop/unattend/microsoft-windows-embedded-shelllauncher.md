---
title: Microsoft-Windows-Embedded-ShellLauncher
description: You can use shell launcher to replace the default OS shell with a custom shell.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 659F8C88-7791-4431-BA1D-CFD93E7C1F2C
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Microsoft-Windows-Embedded-ShellLauncher


You can use shell launcher to replace the default OS shell with a custom shell. You can use any application or executable as your custom shell, such as a command window or a custom dedicated application.

**Important**  
-   You may specify any executable file to be the default shell except C:\\Windows\\System32\\Eshell.exe. Using Eshell.exe as the default shell will result in a blank screen after a user signs in.

    You can also configure shell launcher to launch different shell applications for different users or user groups.

-   You cannot use shell launcher to launch a Windows Store app as a custom shell. However, you can use the application launcher to launch a Windows Store app at startup.

 

Shell launcher processes the Run and RunOnce registry keys before starting the custom shell, so your custom shell doesn't need to handle the automatic startup of other applications or services. Shell launcher also handles the behavior of the system when your custom shell exits. You can configure the shell exit behavior if the default behavior does not meet your needs.

**Important**  
A custom shell is launched with the same level of user rights as the account that is signed in. This means that a user with administrator rights can perform any system action that requires administrator rights, including launching other applications with administrator rights, while a user without administrator rights cannot. If your shell application requires administrator rights and needs to be elevated, and User Account Control (UAC) is present on your device, you must disable UAC in order for shell launcher to launch the shell application.

 

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
<td><p>[DefaultReturnCodeAction](microsoft-windows-embedded-shelllauncher-defaultreturncodeaction.md)</p></td>
<td><p>Specifies what action to take, based on the return code.</p></td>
</tr>
<tr class="even">
<td><p>[Shell](microsoft-windows-embedded-shelllauncher-shell.md)</p></td>
<td><p>Specifies the application or executable to use as the default custom shell.</p></td>
</tr>
<tr class="odd">
<td><p>[UserSettings](microsoft-windows-embedded-shelllauncher-usersettings.md)</p></td>
<td><p>Use the <code>UserSettings</code> settings to specify what custom shell and what default return code action to use for specific users or user groups.</p></td>
</tr>
</tbody>
</table>

 

The default shell settings, [DefaultReturnCodeAction](microsoft-windows-embedded-shelllauncher-defaultreturncodeaction.md) and [Shell](microsoft-windows-embedded-shelllauncher-shell.md), are used when shell launcher is enabled but the security identifier (SID) of the user who is currently signed in does not match any custom defined shell launcher configurations.

Use the [UserSettings](microsoft-windows-embedded-shelllauncher-usersettings.md) settings to specify what custom shell and what default return code action to use for specific users or user groups.

## Applies to


To determine whether a component applies to the image you’re building, load your image into Windows SIM and search for the component or setting name. For information on how to view components and settings, see [Configure Components and Settings in an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915078).

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Microsoft-Windows-Embedded-ShellLauncher%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




