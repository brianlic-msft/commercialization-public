---
title: SanPolicy
description: SanPolicy
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: f7e00d87-a91b-4b6f-986a-94620d597fd5
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# SanPolicy


`SanPolicy` specifies the type of Storage Area Network (SAN) policy to apply to the computer. A SAN enables a server to mount disks and other storage devices automatically from other computers.

By configuring the SAN policy on a Windows image, you can control whether disks are automatically mounted, which disks can be mounted, and you can disable disks from being mounted automatically.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>1</strong></p></td>
<td><p>Mounts all available storage devices. This is the default value.</p></td>
</tr>
<tr class="even">
<td><p><strong>2</strong></p></td>
<td><p>Mounts all storage devices except those on a shared bus.</p>
<p>Examples of shared buses are: SCSI, iSCSI, Fiber, and SAS.</p></td>
</tr>
<tr class="odd">
<td><p><strong>3</strong></p></td>
<td><p>Does not mount storage devices.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


offlineServicing

## Parent Hierarchy


[Microsoft-Windows-PartitionManager](microsoft-windows-partitionmanager.md) | **SanPolicy**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-PartitionManager](microsoft-windows-partitionmanager.md)

## XML Example


The following XML output shows how to configure the SAN policy to mount all available storage devices.

``` syntax
<SanPolicy>1</SanPolicy>
```

## Related topics


[Microsoft-Windows-PartitionManager](microsoft-windows-partitionmanager.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20SanPolicy%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





