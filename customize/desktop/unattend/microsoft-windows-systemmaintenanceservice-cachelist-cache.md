---
title: Cache
description: Cache
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b620476f-db73-442c-ada6-74aceb5fa8cb
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Cache


`Cache` specifies settings for a Microsoft ReadyBoost™ flash-storage cache, to be used as a supplemental memory cache. This is typically used for devices that have been integrated with the computer, such as an internal flash device or solid-state drive (SSD).

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[CacheID](microsoft-windows-systemmaintenanceservice-cachelist-cache-cacheid.md)</p></td>
<td><p>Specifies a unique cache ID.</p></td>
</tr>
<tr class="even">
<td><p>[CacheSizeMB](microsoft-windows-systemmaintenanceservice-cachelist-cache-cachesizemb.md)</p></td>
<td><p>Specifies the size of the ReadyBoost cache in megabytes (MB).</p></td>
</tr>
<tr class="odd">
<td><p>[DiskID](microsoft-windows-systemmaintenanceservice-cachelist-cache-diskid.md)</p></td>
<td><p>Specifies the Disk ID that identifies the ReadyBoost device. Used with [PartitionID](microsoft-windows-systemmaintenanceservice-cachelist-cache-partitionid.md).</p></td>
</tr>
<tr class="even">
<td><p>[EnableCompression](microsoft-windows-systemmaintenanceservice-cachelist-cache-enablecompression.md)</p></td>
<td><p>Specifies whether the ReadyBoost cache uses compression.</p></td>
</tr>
<tr class="odd">
<td><p>[EnableEncryption](microsoft-windows-systemmaintenanceservice-cachelist-cache-enableencryption.md)</p></td>
<td><p>Specifies whether the ReadyBoost cache uses encryption.</p></td>
</tr>
<tr class="even">
<td><p>[PartitionID](microsoft-windows-systemmaintenanceservice-cachelist-cache-partitionid.md)</p></td>
<td><p>Specifies the Partition ID that identifies the ReadyBoost device. Used with [DiskID](microsoft-windows-systemmaintenanceservice-cachelist-cache-diskid.md).</p></td>
</tr>
</tbody>
</table>

 

## Parent Hierarchy


[microsoft-windows-systemmaintenanceservice](microsoft-windows-systemmaintenanceservice.md) | [CacheList](microsoft-windows-systemmaintenanceservice-cachelist.md) | **Cache**

## Valid Configuration Passes


specialize

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-systemmaintenanceservice](microsoft-windows-systemmaintenanceservice.md).

## XML Example


The following XML output example shows a configuration of two ReadyBoost devices. On this sample system, the primary hard drive is disk 0 (not shown in the XML example), and the two ReadyBoost devices are Disk 1 and 2. On the first device, a 500-megabyte ReadyBoost cache is created, leaving the remainder of the device space for storage. The second device is entirely used by the ReadyBoost cache.

``` syntax
<CacheList>
  <Cache>
    <CacheID>ReadyBoostCache1</CacheID>
    <DiskID>1</DiskID>
    <PartitionID>1</PartitionID>
    <CacheSizeMB>500</CacheSizeMB>
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


[CacheList](microsoft-windows-systemmaintenanceservice-cachelist.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Cache%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





