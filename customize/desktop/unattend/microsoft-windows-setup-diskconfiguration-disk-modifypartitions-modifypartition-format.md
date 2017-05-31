---
title: Format
description: Format
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 480f29e2-5f4d-4249-a038-8fa214310d41
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Format


`Format` specifies whether to erase the partition, and which file system to apply to the partition.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>NTFS</strong></p></td>
<td><p>Formats the partition for the NTFS file system.</p>
<p>When CreatePartition\[Type](microsoft-windows-setup-diskconfiguration-disk-createpartitions-createpartition-type.md) is set to <strong>Primary</strong> or <strong>Logical</strong>, this is the default file format.</p></td>
</tr>
<tr class="even">
<td><p><strong>FAT32</strong></p></td>
<td><p>Formats the partition for the File Allocation Table (FAT) file system.</p>
<p>When CreatePartition\[Type](microsoft-windows-setup-diskconfiguration-disk-createpartitions-createpartition-type.md) is set to <strong>EFI</strong>, this is the default file format.</p></td>
</tr>
</tbody>
</table>

 

When CreatePartition\\[Type](microsoft-windows-setup-diskconfiguration-disk-createpartitions-createpartition-type.md) is set to **Extended** or **MSR**, the partition does not receive a file format.

When using a disk that already contains an existing partition structure, `Format` can be used to erase and reformat an existing partition. By default, if an existing partition structure is used, the existing partition is not erased or reformatted.

## Valid Configuration Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | [DiskConfiguration](microsoft-windows-setup-diskconfiguration.md) | [Disk](microsoft-windows-setup-diskconfiguration-disk.md) | [ModifyPartitions](microsoft-windows-setup-diskconfiguration-disk-modifypartitions.md) | [ModifyPartition](microsoft-windows-setup-diskconfiguration-disk-modifypartitions-modifypartition.md) | **Format**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

## XML Examples


The following XML output for the `DiskConfiguration` settings shows how to erase and reformat the second partition of a disk.

``` syntax
<DiskConfiguration>

  <Disk wcm:action="add">
    <DiskID>0</DiskID> 

      <ModifyPartition wcm:action="add">
        <Order>1</Order> 
        <PartitionID>2</PartitionID> 
        <Format>NTFS</Format> 
      </ModifyPartition>
    </ModifyPartitions>

</DiskConfiguration>
```

For full XML examples and recommended partition configurations, see [How to Configure UEFI/GPT-Based Hard Disk Partitions](http://go.microsoft.com/fwlink/?LinkId=214261) or [How to Configure BIOS/MBR-Based Hard Disk Partitions](http://go.microsoft.com/fwlink/?LinkId=214260).

## Related topics


[ModifyPartition](microsoft-windows-setup-diskconfiguration-disk-modifypartitions-modifypartition.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Format%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





