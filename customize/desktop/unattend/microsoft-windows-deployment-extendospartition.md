---
title: ExtendOSPartition
description: ExtendOSPartition
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 40b1e3fa-b695-40ed-8da1-75283d0c1c57
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# ExtendOSPartition


`ExtendOSPartition` specifies whether to extend the partition on which you are installing Windows. This setting is required for scenarios in which a customer has installed the Windows image by using a sector-based imaging solution and now plans on extending the partition.

These settings are valid only for NTFS file-system partitions.

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[Extend](microsoft-windows-deployment-extendospartition-extend.md)</p></td>
<td><p>Specifies whether to extend the partition to fill the entire hard disk.</p></td>
</tr>
<tr class="even">
<td><p>[Size](microsoft-windows-deployment-extendospartition-size.md)</p></td>
<td><p>Specifies the size of the extension in megabytes. If the total value of the current size of the partition plus this setting exceeds the available space, then the partition is not extended.</p></td>
</tr>
</tbody>
</table>

 

**Note**  
If both of these are set, an error is logged, and installation is terminated.

 

## Valid Passes


auditSystem

generalize

oobeSystem

specialize

## Parent Hierarchy


[Microsoft-Windows-Deployment](microsoft-windows-deployment.md) | **ExtendOSPartition**

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


[Microsoft-Windows-Deployment](microsoft-windows-deployment.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20ExtendOSPartition%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





