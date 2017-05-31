---
title: Link0
description: Link0
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: fcc8e564-9572-40d4-b491-38cf4a429d59
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Link0


`Link0` specifies the path to the first available program shortcut on the taskbar.

**Note**  
Any item that is pinned to the taskbar will not appear in the **Start** menu list of most frequently used programs.

 

We recommend that you add shortcut files to the All Users **Start** menu, for example: `%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Fabrikam\Application.lnk`.

We do not recommend adding the shortcut by using the environment variable: `%USERPROFILE%`. Shortcuts added by using `%USERPROFILE%` are applied only to the profile of the next user to log on to the computer. Also, if the setting is applied during the **auditUser** configuration pass, the shortcut is applied only to the temporary administrator account, which is removed after exiting audit mode.

This setting has no effect on Server Core installations.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Path_to_first_link</em></p></td>
<td><p>Specifies the path to the first shortcut on the taskbar. <em>Path_to_first_link</em> is a string with a maximum length of 259 characters.</p>
<p><em></em>Path_to_first_link specifies the complete path and the file name of a shortcut file with an .lnk file name extension. The path to the shortcut file must refer to a location on the destination computer.</p>
<p>The shortcut file must include the complete path and file name of a corresponding program file with an .exe file name extension. The path to the program file must refer to a location on the destination computer.</p></td>
</tr>
</tbody>
</table>

 

This string type does not support empty elements. Do not create an empty value for this setting.

## Valid Configuration Passes


auditUser

oobeSystem

specialize

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | [TaskbarLinks](microsoft-windows-shell-setup-taskbarlinks.md) | **Link0**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML output shows how to add shortcuts for Remote Desktop Connection, Sound Recorder in the desktop, and the calculator in the desktop.

``` syntax
<TaskbarLinks>
   <Link0>%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Accessories\Remote Desktop Connection.lnk</Link0>
   <Link1>%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Accessories\Sound Recorder.lnk</Link1>
   <Link2>%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Accessories\Calculator.lnk</Link2>
</TaskbarLinks>
```

## Related topics


[TaskbarLinks](microsoft-windows-shell-setup-taskbarlinks.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Link0%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





