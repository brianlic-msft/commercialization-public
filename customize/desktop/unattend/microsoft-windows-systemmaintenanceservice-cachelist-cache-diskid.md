---
title: DiskID
description: DiskID
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: f2b71dd3-cd71-403a-a9c3-4bc4faa6349b
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DiskID


`DiskID` specifies the Disk ID that identifies the Microsoft ReadyBoost™ device. This value is used with [PartitionID](microsoft-windows-systemmaintenanceservice-cachelist-cache-partitionid.md).

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>ID</em></p></td>
<td><p>Specifies the disk ID of the ReadyBoost device.</p></td>
</tr>
</tbody>
</table>

 

## Parent Hierarchy


[microsoft-windows-systemmaintenanceservice-](microsoft-windows-systemmaintenanceservice.md) | [CacheList](microsoft-windows-systemmaintenanceservice-cachelist.md) | [Cache](microsoft-windows-systemmaintenanceservice-cachelist-cache.md) | **DiskID**

## Valid Configuration Passes


specialize

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-systemmaintenanceservice-](microsoft-windows-systemmaintenanceservice.md).

## XML Example


The following example XML output shows a configuration of two ReadyBoost devices. On this sample system, the primary hard drive is disk 0 (which is not listed in the XML example), and the two ReadyBoost devices are on Disk 1, Partition 1, and Disk 2, Partition 1.

``` syntax
<CacheList>
  <Cache>
    <CacheID>ReadyBoostCache1</CacheID>
    <DiskID>1</DiskID>
    <PartitionID>1</PartitionID>
    <CacheSizeMB>1024</CacheSizeMB>
    <EnableCompression>false</EnableCompression>
    <EnableEncryption>true</EnableEncryption>
  </Cache>
  <Cache>
    <CacheID>ReadyBoostCache2</CacheID>
    <DiskID>2</DiskID>
    <PartitionID>1</PartitionID>
    <EnableCompression>true</EnableCompression>
    <EnableEncryption>true</EnableEncryption>
  </Cache>
</CacheList>
```

## Related topics


[PartitionID](microsoft-windows-systemmaintenanceservice-cachelist-cache-partitionid.md)

[Cache](microsoft-windows-systemmaintenanceservice-cachelist-cache.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20DiskID%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





