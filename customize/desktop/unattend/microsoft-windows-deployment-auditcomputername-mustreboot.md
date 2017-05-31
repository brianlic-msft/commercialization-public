---
title: MustReboot
description: MustReboot
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b125b298-b51f-47e0-88be-922599b28cb7
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# MustReboot


`MustReboot` specifies whether to restart the computer immediately after setting it to audit mode [Name](microsoft-windows-deployment-auditcomputername-name.md).

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>true</strong></p></td>
<td><p>Immediately restarts the computer.</p></td>
</tr>
<tr class="even">
<td><p><strong>false</strong></p></td>
<td><p>Does not immediately restart the computer. The new computer name cannot take effect until the computer is rebooted. This is the default value.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


auditSystem

## Parent Hierarchy


[Microsoft-Windows-Deployment](microsoft-windows-deployment.md) | [AuditComputerName](microsoft-windows-deployment-auditcomputername.md) | **MustReboot**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-Deployment](microsoft-windows-deployment.md).

## XML Example


The following XML output shows a deployment with no asynchronous or synchronous commands.

``` syntax
<AuditComputerName>
   <MustReboot>true</MustReboot>
   <Name>MyComputer</Name>
</AuditComputerName>
<ExtendOSPartition>
   <Extend>true</Extend>
</ExtendOSPartition>
<Reseal>
   <ForceShutdownNow>true</ForceShutdownNow>
   <Mode>Audit</Mode>
</Reseal>
```

## Related topics


[AuditComputerName](microsoft-windows-deployment-auditcomputername.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20MustReboot%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





