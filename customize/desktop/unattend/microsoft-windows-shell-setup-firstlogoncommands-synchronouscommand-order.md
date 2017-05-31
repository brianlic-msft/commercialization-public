---
title: Order
description: Order
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: f1c6b0da-7d2e-47ce-abca-6980b65617b1
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Order


`Order` specifies the order in which the [SynchronousCommand](microsoft-windows-shell-setup-firstlogoncommands-synchronouscommand.md) is to be run at first logon.

**Note**  This command now works like Microsoft-Windows-Shell-Setup\\LogonCommands\\[AsynchronousCommand](microsoft-windows-shell-setup-logoncommands.md): all commands using these unattend settings are now started at the same time, and no longer wait for the previous command to finish. 
 

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Synchronous_command_order</em></p></td>
<td><p>Specifies the order in which commands are to be run at first logon. <em>Synchronous_command_order</em> is an integer from 1 through 500.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


oobeSystem

## Parent Hierarchy


[Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md) | [FirstLogonCommands](microsoft-windows-shell-setup-firstlogoncommands.md) | [SynchronousCommand](microsoft-windows-shell-setup-firstlogoncommands-synchronouscommand.md) | **Order**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-Shell-Setup](microsoft-windows-shell-setup.md).

## XML Example


The following XML output shows how to set first logon commands.

``` syntax
<FirstLogonCommands>
   <SynchronousCommand wcm:action="add">
      <CommandLine>c:synccommands\command1.exe</CommandLine>
      <Description>Description_of_command1</Description>
      <Order>1</Order>
   </SynchronousCommand>
   <SynchronousCommand wcm:action="add">
      <CommandLine>c:synccommands\command2.exe</CommandLine>
      <Description>Description_of_command2</Description>
      <Order>2</Order>
   </SynchronousCommand>
</FirstLogonCommands>
```

## Related topics


[SynchronousCommand](microsoft-windows-shell-setup-firstlogoncommands-synchronouscommand.md)

[AsynchronousCommand](microsoft-windows-shell-setup-logoncommands-asynchronouscommand.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Order%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





