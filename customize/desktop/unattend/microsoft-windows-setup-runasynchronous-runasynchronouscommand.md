---
title: RunAsynchronousCommand
description: RunAsynchronousCommand
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 36251bed-ee50-4d2e-ab3a-93c064fdb3f3
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# RunAsynchronousCommand


`RunAsynchronousCommand` specifies a single command to run during the windowsPE configuration pass.

To run services or commands that can start at the same time, use asynchronous commands. To run commands that need to finish before other commands can start, use [RunSynchronousCommand](microsoft-windows-setup-runsynchronous-runsynchronouscommand.md) instead.

All `RunAsynchronous` commands run in the system context.

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[Credentials](microsoft-windows-setup-runasynchronous-runasynchronouscommand-credentials.md)</p></td>
<td><p>Specifies the credentials used to access the command if the command is on a network share.</p></td>
</tr>
<tr class="even">
<td><p>[Description](microsoft-windows-setup-runasynchronous-runasynchronouscommand-description.md)</p></td>
<td><p>Specifies a description of the command to execute.</p></td>
</tr>
<tr class="odd">
<td><p>[Order](microsoft-windows-setup-runasynchronous-runasynchronouscommand-order.md)</p></td>
<td><p>Specifies a unique value for each command.</p>
<div class="alert">
<strong>Important</strong>  
<p>The computer does not wait for one command to finish before it starts the next command.</p>
</div>
<div>
 
</div></td>
</tr>
<tr class="even">
<td><p>[Path](microsoft-windows-setup-runasynchronous-runasynchronouscommand-path.md)</p></td>
<td><p>Specifies the path to the command to execute.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | [RunAsynchronous](microsoft-windows-setup-runasynchronous.md) | **RunAsynchronousCommand**

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

## XML Example


The following XML output shows how to configure asynchronous commands.

``` syntax
<RunAsynchronous>
   <RunAsynchronousCommand>
      <Order>1</Order>
      <Path>\\MyNetworkShare\MyApplication.exe</Path>
      <Description>DescriptionOfMyApplication</Description>
      <Credentials>
         <Domain>FabrikamDomain</Domain>
         <UserName>MyUserName</UserName>
         <Password>MyPassword</Password>
      </Credentials>
   </RunAsynchronousCommand>
   <RunAsynchronousCommand>
      <Order>2</Order>
      <Path>C:\AnotherApplication.exe</Path>
      <Description>DescriptionOfMyApplication</Description>
   </RunAsynchronousCommand>
</RunAsynchronous>
```

## Related topics


[RunAsynchronous](microsoft-windows-setup-runasynchronous.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20RunAsynchronousCommand%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





