---
title: RunSynchronousCommand
description: RunSynchronousCommand
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 21af3c4a-4432-4c88-97c3-2c282bdefc26
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


`RunSynchronousCommand` specifies a single command to run during the windowsPE configuration pass.

To start a command that needs to finish before other commands can start, use synchronous commands. To run services or commands that can start at the same time, use [RunAsynchronousCommand](microsoft-windows-setup-runasynchronous-runasynchronouscommand.md) instead.

All `RunSynchronous` commands run in the system context.

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[Credentials](microsoft-windows-setup-runsynchronous-runsynchronouscommand-credentials.md)</p></td>
<td><p>Specifies the credentials used to access the command if the command is on a network share.</p></td>
</tr>
<tr class="even">
<td><p>[Order](microsoft-windows-setup-runsynchronous-runsynchronouscommand-order.md)</p></td>
<td><p>Specifies the order of the command to run.</p></td>
</tr>
<tr class="odd">
<td><p>[Path](microsoft-windows-setup-runsynchronous-runsynchronouscommand-path.md)</p></td>
<td><p>Specifies the path to the command to run.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | [RunSynchronous](microsoft-windows-setup-runsynchronous.md) | **RunSynchronousCommand**

## Applies To


For the list of the Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

## XML Example


The following XML output shows how to set synchronous commands.

``` syntax
<RunSynchronous>
   <!-- First synchronous command to run -->
   <RunSynchronousCommand>
      <Order>1</Order>
      <Path>\\MyNetworkShare\MyApplication.exe</Path>
      <Description>DescriptionOfMyApplication</Description>
      <Credentials>
         <Domain>FabrikamDomain</Domain>
         <UserName>MyUserName</UserName>
         <Password>MyPassword</Password>
      </Credentials>
   </RunSynchronousCommand>
<!-- Second synchronous command to run -->
   <RunSynchronousCommand>
      <Order>2</Order>
      <Path>C:\AnotherApplication.exe</Path>
      <Description>DescriptionOfMyApplication</Description>
   </RunSynchronousCommand>
</RunSynchronous>
```

## Related topics


[RunSynchronous](microsoft-windows-setup-runsynchronous.md)

[RunAsynchronousCommand](microsoft-windows-setup-runasynchronous-runasynchronouscommand.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20RunSynchronousCommand%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





