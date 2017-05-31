---
title: RunSynchronousCommand
description: RunSynchronousCommand
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 3a4c07a3-b657-4dbc-a6dc-32ad33f447fb
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# RunSynchronousCommand


`RunSynchronousCommand` specifies a single command to run during the specified configuration pass.

To start a command that needs to finish before other commands can start, use synchronous commands. To run services or commands that can start at the same time, use [RunAsynchronous](microsoft-windows-deployment-runasynchronous.md) instead.

[RunSynchronous](microsoft-windows-deployment-runsynchronous.md) commands always run before commands in the same pass. `RunSynchronous` commands run in the user context in the auditUser configuration pass configuration pass and in the system context in the specialize configuration pass.

**Warning**  
Do not add commands that shut down or reboot the computer; instead, use the setting: Microsoft-Windows-Deployment\\RunSynchronous\\RunSynchronousCommand\\[WillReboot](microsoft-windows-deployment-runsynchronous-runsynchronouscommand-willreboot.md).

 

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[Credentials](microsoft-windows-deployment-runsynchronous-runsynchronouscommand-credentials.md)</p></td>
<td><p>Specifies the credentials to use when accessing paths.</p></td>
</tr>
<tr class="even">
<td><p>[Description](microsoft-windows-deployment-runsynchronous-runsynchronouscommand-description.md)</p></td>
<td><p>Specifies a description of the command to run.</p></td>
</tr>
<tr class="odd">
<td><p>[Order](microsoft-windows-deployment-runsynchronous-runsynchronouscommand-order.md)</p></td>
<td><p>Specifies the order of the command to run.</p></td>
</tr>
<tr class="even">
<td><p>[Path](microsoft-windows-deployment-runsynchronous-runsynchronouscommand-path.md)</p></td>
<td><p>Specifies the path to the command to run.</p></td>
</tr>
<tr class="odd">
<td><p>[WillReboot](microsoft-windows-deployment-runsynchronous-runsynchronouscommand-willreboot.md)</p></td>
<td><p>Specifies in what circumstances to restart the computer after running a synchronous command.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


auditUser

specialize

## Parent Hierarchy


[Microsoft-Windows-Deployment](microsoft-windows-deployment.md) | [RunSynchronous](microsoft-windows-deployment-runsynchronous.md) | **RunSynchronousCommand**

## Applies To


For the list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Deployment](microsoft-windows-deployment.md).

## XML Example


The following XML output shows how to set synchronous commands.

``` syntax
<RunSynchronous>
   <RunSynchronousCommand wcm:action="add">
      <Credentials>
         <Domain>MyDomain</Domain>
         <Password>MyPassword</Password>
         <Username>MyUsername</Username>
      </Credentials>
      <Description>MySynchCommand1</Description>
      <Order>1</Order>
      <Path>\\network\server\share\filename</Path>
      <WillReboot>OnRequest</WillReboot>
   </RunSynchronousCommand>
   <RunSynchronousCommand wcm:action="add">
      <Credentials>
         <Domain>MyDomain</Domain>
         <Password>MyPassword</Password>
         <Username>MyUsername</Username>
      </Credentials>
      <Description>MySynchCommand2</Description>
      <Order>2</Order>
      <Path>\\network\server\share\filename</Path>
      <WillReboot>OnRequest</WillReboot>
   </RunSynchronousCommand>
</RunSynchronous>
```

## Related topics


[RunSynchronous](microsoft-windows-deployment-runsynchronous.md)

[RunAsynchronous](microsoft-windows-deployment-runasynchronous.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20RunSynchronousCommand%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





