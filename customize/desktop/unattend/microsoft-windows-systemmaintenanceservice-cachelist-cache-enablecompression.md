---
title: EnableCompression
description: EnableCompression
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 070202ea-8b9b-4c5f-8e29-46ab0c608af0
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# EnableCompression


`EnableCompression` specifies whether the Microsoft ReadyBoost™ cache uses compression.

Disabling compression can improve CPU usage and decrease battery consumption.

Enabling compression may be necessary for systems with a low amount of RAM or cache space, to ensure that the necessary pages can be stored.

-   For a portable computer with 1 gigabyte (GB) of RAM, we recommend using a fast internal flash device with a cache size of at least 4 GB, to avoid the need for cache compression.

-   For a portable computer with 2 GB or more of RAM, we recommend using a fast internal flash device with a cache size of at least 8 GB, to avoid the need for cache compression.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>true</strong></p></td>
<td><p>Specifies that the ReadyBoost cache uses compression.</p>
<p>This is the default value.</p></td>
</tr>
<tr class="even">
<td><p><strong>false</strong></p></td>
<td><p>Specifies that the ReadyBoost cache does not use compression.</p></td>
</tr>
</tbody>
</table>

 

## Parent Hierarchy


[microsoft-windows-systemmaintenanceservice-](microsoft-windows-systemmaintenanceservice.md) | [CacheList](microsoft-windows-systemmaintenanceservice-cachelist.md) | [Cache](microsoft-windows-systemmaintenanceservice-cachelist-cache.md) | **EnableCompression**

## Valid Configuration Passes


specialize

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-systemmaintenanceservice-](microsoft-windows-systemmaintenanceservice.md).

## XML Example


The following XML output example shows a configuration of two ReadyBoost devices. On this sample system, the first device does not use compression, while the second device uses compression.

``` syntax
<CacheList>
  <Cache>
    <CacheID>ReadyBoostCache1</CacheID>
    <DiskID>1</DiskID>
    <PartitionID>1</PartitionID>
    <CacheSizeMB>1024</CacheSizeMB>
    <EnableCompression>false</EnableCompression>
    <EnableEncryption>false</EnableEncryption>
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


[Cache](microsoft-windows-systemmaintenanceservice-cachelist-cache.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20EnableCompression%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





