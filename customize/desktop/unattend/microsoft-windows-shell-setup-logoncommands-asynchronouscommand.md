---
title: AsynchronousCommand
description: AsynchronousCommand
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: e49f1b29-9e65-42fa-95c2-50b35c9e2b94
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# AsynchronousCommand


`AsynchronousCommand` specifies a single command to run the first time that a user logs onto the computer.

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[CommandLine](microsoft-windows-shell-setup-logoncommands-asynchronouscommand-commandline.md)</p></td>
<td><p>Specifies the path to the asynchronous command to be run.</p></td>
</tr>
<tr class="even">
<td><p>[Description](microsoft-windows-shell-setup-logoncommands-asynchronouscommand-description.md)</p></td>
<td><p>Specifies a brief description of the asynchronous command to be run.</p></td>
</tr>
<tr class="odd">
<td><p>[Order](microsoft-windows-shell-setup-logoncommands-asynchronouscommand-order.md)</p></td>
<td><p>Specifies a unique value for each command.</p>
<div class="alert">
<strong>Important</strong>  
<p>The computer does not wait for one command to finish before it starts the next one.</p>
</div>
<div>
 
</div></td>
</tr>
<tr class="even">
<td><p>[RequiresUserInput](microsoft-windows-shell-setup-logoncommands-asynchronouscommand-requiresuserinput.md)</p></td>
<td><p>This setting is not used.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


oobeSystem

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | [LogonCommands](microsoft-windows-shell-setup-logoncommands.md) | **AsynchronousCommand**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML output shows how to set logon commands.

``` syntax
<LogonCommands>
   <AsynchronousCommand wcm:action="add">
      <CommandLine>c:asynccommands\command1.exe</CommandLine>
      <Description>Description_of_command1</Description>
      <Order>1</Order>
   </AsynchronousCommand>
   <AsynchronousCommand wcm:action="add">
      <CommandLine>c:asynccommands\command2.exe</CommandLine>
      <Description>Description_of_command2</Description>
      <Order>2</Order>
   </AsynchronousCommand>
</LogonCommands>
```

## Related topics


[LogonCommands](microsoft-windows-shell-setup-logoncommands.md)

[SynchronousCommand](microsoft-windows-shell-setup-firstlogoncommands-synchronouscommand.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20AsynchronousCommand%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





