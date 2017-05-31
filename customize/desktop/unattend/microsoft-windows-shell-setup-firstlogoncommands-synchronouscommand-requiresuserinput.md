---
title: RequiresUserInput
description: RequiresUserInput
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b086d8e4-8b34-4493-bc81-215bd758bd9b
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# RequiresUserInput


`RequiresUserInput` specifies whether the first logon command launches a dialog that requires input from the user.

After the Windows Out of Box Experience (OOBE), the "Preparing Your Desktop" screen appears. This screen prevents users from interacting with the first logon commands, and is intended to efficiently run the logon commands that do not require user input.

If a first logon command requires user input, end users may be forced to wait up to two minutes before they can see the desktop. After this delay, they can interact with the user interface that requires their input. You can use the `RequiresUserInput` setting to reduce this delay.

**Note**  
-   If the command that requires user input is not dependent on other commands, consider using an asynchronous command instead. Unlike synchronous commands, asynchronous commands may start and finish in any order. Asynchronous commands cannot delay the appearance of the Windows desktop, even if the asynchronous command requires user input. If an asynchronous command requires user input, the end user will see the input window after the desktop appears. For information about asynchronous commands, see [AsynchronousCommand](microsoft-windows-shell-setup-logoncommands-asynchronouscommand.md).

-   If you have multiple first logon commands, we recommend that you set the command that requires user input last in the order of first logon commands. This will help to prevent users from interfering with the other first logon commands.

 

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>true</strong></p></td>
<td><p>Specifies that the first logon command requires user input.</p>
<p>The &quot;Preparing Your Desktop&quot; screen is removed, allowing users to reach the desktop more quickly and provide input.</p></td>
</tr>
<tr class="even">
<td><p><strong>false</strong></p></td>
<td><p>Specifies that the first logon command does not require user input.</p>
<p>The desktop does not appear until first logon command is complete, or until two minutes pass.</p>
<p>This is the default value.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


oobeSystem

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | [FirstLogonCommands](microsoft-windows-shell-setup-firstlogoncommands.md) | [SynchronousCommand](microsoft-windows-shell-setup-firstlogoncommands-synchronouscommand.md) | **RequiresUserInput**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML output shows how to specify that one of the first logon commands requires user input.

``` syntax
<FirstLogonCommands>
   <SynchronousCommand wcm:action="add">
      <CommandLine>c:\synccommands\command1.exe</CommandLine>
      <Description>Description of command 1</Description>
      <Order>1</Order>
   </SynchronousCommand>
   <SynchronousCommand wcm:action="add">
      <CommandLine>c:\synccommands\command2.exe</CommandLine>
      <Description>Description of command 2 - This command requires user input</Description>
      <Order>2</Order>
      <RequiresUserInput>true</RequiresUserInput>
   </SynchronousCommand>
</FirstLogonCommands>
```

## Related topics


[SynchronousCommand](microsoft-windows-shell-setup-firstlogoncommands-synchronouscommand.md)

[AsynchronousCommand](microsoft-windows-shell-setup-logoncommands-asynchronouscommand.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20RequiresUserInput%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





