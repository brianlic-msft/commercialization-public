---
title: SynchronousCommand
description: SynchronousCommand
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 1771c6ae-910a-4a48-baa6-713fb22609e0
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# SynchronousCommand


`SynchronousCommand` specifies a single command to run the first time a user logs on to the computer. `FirstLogonCommands` are run after logon but before the user sees the desktop.

If you create a user account that does not include administrative privileges, the following commands may not run:

-   If User Account Control is enabled, then when that user logs in for the first time, a dialog box appears, prompting the user with an option to allow an administrator to apply the commands. If the user selects **Cancel**, these commands don’t run.

-   If User Account Control is disabled, these commands don’t run.

When you add a script using FirstLogonCommands, it will be triggered on the next boot, even if you boot into audit mode using Ctrl+Shift+F3. If you plan to use audit mode later, add the following setting to skip this script automatically: Microsoft-Windows-Deployment\\Reseal\\[Mode](microsoft-windows-deployment-reseal-mode.md) = Audit.

**Note**  This command now works like Microsoft-Windows-Shell-Setup\\LogonCommands\\[AsynchronousCommand](microsoft-windows-shell-setup-logoncommands.md): all commands using these unattend settings are now started at the same time, and no longer wait for the previous command to finish. 

 

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[CommandLine](microsoft-windows-shell-setup-firstlogoncommands-synchronouscommand-commandline.md)</p></td>
<td><p>Specifies the path to the command to run.</p></td>
</tr>
<tr class="even">
<td><p>[Description](microsoft-windows-shell-setup-firstlogoncommands-synchronouscommand-description.md)</p></td>
<td><p>Describes the command to run.</p></td>
</tr>
<tr class="odd">
<td><p>[Order](microsoft-windows-shell-setup-firstlogoncommands-synchronouscommand-order.md)</p></td>
<td><p>Specifies the order in which the command is run.</p></td>
</tr>
<tr class="even">
<td><p>[RequiresUserInput](microsoft-windows-shell-setup-firstlogoncommands-synchronouscommand-requiresuserinput.md)</p></td>
<td><p>Specifies whether the first logon command launches a dialog box that requires input from the user. This can reduce the delay of the &quot;Preparing Your Desktop&quot; screen.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


oobeSystem

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | [FirstLogonCommands](microsoft-windows-shell-setup-firstlogoncommands.md) | **SynchronousCommand**

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML output shows how to set first logon commands.

``` syntax
<FirstLogonCommands>
   <SynchronousCommand wcm:action="add">
      <CommandLine>c:\synccommands\command1.exe</CommandLine>
      <Description>Description_of_command1</Description>
      <Order>1</Order>
   </SynchronousCommand>
   <SynchronousCommand wcm:action="add">
      <CommandLine>c:\synccommands\command2.exe</CommandLine>
      <Description>Description_of_command2</Description>
      <Order>2</Order>
   </SynchronousCommand>
</FirstLogonCommands>
```

## Related topics


[FirstLogonCommands](microsoft-windows-shell-setup-firstlogoncommands.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20SynchronousCommand%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





