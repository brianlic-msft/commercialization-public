---
title: Size
description: Size
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: bc3a26af-dfa1-41d0-8510-cc03990db90a
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Size


`Size` specifies the size of the extension. If `Size` and [Extend](microsoft-windows-deployment-extendospartition-extend.md) are present in the same configuration pass, an error is logged, and installation terminates.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Size</em></p></td>
<td><p>An integer that indicates the size of the extension, in megabytes. If the total value of the current size of the partition plus this setting exceeds the available space, then the partition is not extended.</p></td>
</tr>
</tbody>
</table>

 

**Note**  
You can extend only NTFS file system partitions.

The partition that you plan on extending must have unpartitioned space available following it.

 

## Valid Passes


auditSystem

generalize

oobeSystem

specialize

## Parent Hierarchy


[Microsoft-Windows-Deployment](microsoft-windows-deployment.md) | [ExtendOSPartition](microsoft-windows-deployment-extendospartition.md) | **Size**

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-Deployment](microsoft-windows-deployment.md).

## XML Example


The following XML output shows a deployment with no asynchronous or synchronous commands.

``` syntax
<AuditComputerName>
   <MustReboot>true</MustReboot>
   <Name>MyComputer</Name>
</AuditComputerName>
<ExtendOSPartition>
   <Size>200</Size>
</ExtendOSPartition>
<Reseal>
   <ForceShutdownNow>true</ForceShutdownNow>
   <Mode>Audit</Mode>
</Reseal>
```

## Related topics


[ExtendOSPartition](microsoft-windows-deployment-extendospartition.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Size%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





