---
title: TaskbarLinks
description: TaskbarLinks
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 17a5ff39-bed8-4ffa-9f61-0e9a78671b55
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# TaskbarLinks


`TaskbarLinks` specifies shortcuts to display on the taskbar. Up to six shortcuts to programs, Windows Store apps or website links can be specified.

**Note**  
Any item that is pinned to the taskbar will not appear in the **Start** menu list of most frequently used programs.

 

Each of the settings under `TaskbarLinks` specifies:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Taskbar Link Type</th>
<th>Format</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Shortcut to programs</p></td>
<td><p>The complete path and the file name of a shortcut file with a .lnk file name extension. The path to the shortcut file must refer to a location on the destination computer.</p></td>
</tr>
<tr class="even">
<td><p>Shortcut to website link</p></td>
<td><p>The complete path and website name of the shortcut file with a .website file name extension. The path to the shortcut file must refer to a location on the destination computer. </p></td>
</tr>
<tr class="odd">
<td><p>Shortcut to a Windows Store app</p></td>
<td><p>Use the Application User Model ID (AUMID).</p></td>
</tr>
</tbody>
</table>

 

For shortcuts to programs, each shortcut file must include the complete path and file name of a corresponding program file with an .exe file name extension. The path to the program file must refer to a location on the destination computer.

We recommend that you add shortcut files to the All Users **Start** menu, for example: `%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Fabrikam\Application.lnk`.

We do not recommend adding the shortcut by using the environment variable: `%USERPROFILE%`. Shortcuts added by using `%USERPROFILE%` are applied only to the profile of the next user to log on to the computer. Also, if the setting is applied during the **auditUser** configuration pass, the shortcut is applied only to the temporary administrator account, which is removed after exiting audit mode.

This setting has no effect on Server Core installations.

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[Link0](microsoft-windows-shell-setup-taskbarlinks-link0.md)</p></td>
<td><p>Specifies the path to the first shortcut.</p></td>
</tr>
<tr class="even">
<td><p>[Link1](microsoft-windows-shell-setup-taskbarlinks-link1.md)</p></td>
<td><p>Specifies the path to the second shortcut.</p></td>
</tr>
<tr class="odd">
<td><p>[Link2](microsoft-windows-shell-setup-taskbarlinks-link2.md)</p></td>
<td><p>Specifies the path to the third shortcut.</p></td>
</tr>
<tr class="even">
<td><p>[Link3](microsoft-windows-shell-setup-taskbarlinks-link3.md)</p></td>
<td><p>Specifies the path to the fourth shortcut.</p></td>
</tr>
<tr class="odd">
<td><p>[Link4](microsoft-windows-shell-setup-taskbarlinks-link4.md)</p></td>
<td><p>Specifies the path to the fifth shortcut.</p></td>
</tr>
<tr class="even">
<td><p>[Link5](microsoft-windows-shell-setup-taskbarlinks-link5.md)</p></td>
<td><p>Specifies the path to the sixth shortcut.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


auditUser

oobeSystem

specialize

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | **TaskbarLinks**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML output shows how to set a shortcut for Wordpad, a shortcut to Sound Recorder, a shortcut to a Windows Store app with an AUMID of AppID1 and a shortcut to the Bing website.

``` syntax
<TaskbarLinks>
   <Link0>%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Accessories\Wordpad.lnk</Link0>
   <Link1>%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Accessories\Sound Recorder.lnk</Link1>
   <Link2>AppID1</Link2>
   <Link3>%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Websites\Bing.website</Link3>
</TaskbarLinks>
```

## Related topics


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20TaskbarLinks%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





