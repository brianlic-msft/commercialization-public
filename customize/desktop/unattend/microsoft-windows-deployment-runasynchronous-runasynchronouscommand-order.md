---
title: Order
description: Order
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: cf3ff181-2dd9-4c5f-8568-168ff1936a83
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


`Order` specifies a unique value for each [RunAsynchronousCommand](microsoft-windows-deployment-runasynchronous-runasynchronouscommand.md).

To run services or commands that can start at the same time, use asynchronous commands. To run commands that need to finish before other commands can start, use [RunSynchronous](microsoft-windows-deployment-runsynchronous.md) instead.

[RunAsynchronous](microsoft-windows-deployment-runasynchronous.md) commands run in the user context in the auditUser configuration pass and in the system context in the specialize configuration pass.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Order</em></p></td>
<td><p>Specifies a unique integer between 1 and 500.</p>
<div class="alert">
<strong>Important</strong>  
<p>Unlike synchronous commands, the computer does not wait for one asynchronous command to finish before it starts the next command.</p>
</div>
<div>
 
</div></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


auditUser

specialize

## Parent Hierarchy


[Microsoft-Windows-Deployment](microsoft-windows-deployment.md) | [RunAsynchronous](microsoft-windows-deployment-runasynchronous.md) | [RunAsynchronousCommand](microsoft-windows-deployment-runasynchronous-runasynchronouscommand.md) | **Order**

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-Deployment](microsoft-windows-deployment.md).

## XML Example


The following XML output shows how to set asynchronous commands.

``` syntax
<RunAsynchronous>
   <RunAsynchronousCommand wcm:action="add">
      <Credentials>
         <Domain>MyDomain</Domain>
         <Password>MyPassword</Password>
         <Username>MyUsername</Username>
      </Credentials>
      <Description>AsynchCommand1</Description>
      <Order>1</Order>
      <Path>\\network\server\share\filename</Path>
   </RunAsynchronousCommand>
   <RunAsynchronousCommand wcm:action="add">
      <Credentials>
         <Domain>MyDomain</Domain>
         <Password>MyPassword</Password>
         <Username>MyUsername</Username>
      </Credentials>
      <Description>AsynchCommand2</Description>
      <Order>2</Order>
      <Path>\\network\server\share\filename</Path>
   </RunAsynchronousCommand>
</RunAsynchronous>
```

## Related topics


[RunAsynchronousCommand](microsoft-windows-deployment-runasynchronous-runasynchronouscommand.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Order%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





