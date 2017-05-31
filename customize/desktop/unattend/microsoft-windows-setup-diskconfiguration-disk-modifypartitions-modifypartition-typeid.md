---
title: TypeID
description: TypeID
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: c5d85de0-a529-4ec2-bd0e-79ddee2e2851
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# TypeID


Use `TypeID` to manually specify a hard-drive partition type, such as a utility partition type.

-   Five partition types are already built in: primary, extensible firmware interface (EFI), extended, logical, and Microsoft Reserved (MSR). To use these built-in partition types, enter a value in the setting: microsoft-windows-setup-/DiskConfiguration/Disk/CreatePartitions/CreatePartition/[Type](microsoft-windows-setup-diskconfiguration-disk-createpartitions-createpartition-type.md).

-   Some partition types are not assigned a drive letter by default. Without a drive letter, these partitions do not appear in some common lists of devices, such as in Windows Explorer or in Open or Save file dialog boxes. If you assign a letter to the partition, the partition appears in these common lists of devices.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>TypeID</em></p></td>
<td><p>Specifies the partition type. See the Partition Types section later in this topic.</p>
<p><em>TypeID</em> is a string.</p></td>
</tr>
</tbody>
</table>

 

## Partition Types


The following tables describe how to set common partition types by using the microsoft-windows-setup-/DiskConfiguration/Disk settings:

### BIOS/MBR-Based Systems

<table>
<colgroup>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
</colgroup>
<thead>
<tr class="header">
<th>Partition type</th>
<th>How to set the value</th>
<th>Used for</th>
<th>Receives a drive letter by default?</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>System partition</p></td>
<td><p>Set CreatePartition\[Type](microsoft-windows-setup-diskconfiguration-disk-createpartitions-createpartition-type.md) to <strong>Primary</strong>, and then set ModifyPartition\[Active](microsoft-windows-setup-diskconfiguration-disk-modifypartition-smodifypartition-active.md) to <strong>true</strong>.</p></td>
<td><p>System boot information and Windows RE tools.</p></td>
<td><p>No</p></td>
</tr>
<tr class="even">
<td><p>OEM partition</p></td>
<td><p>Set CreatePartition\[Type](microsoft-windows-setup-diskconfiguration-disk-createpartitions-createpartition-type.md) to <strong>Primary</strong>, and then set ModifyPartition\<code>TypeID</code> to a recognized value.</p>
<p>Recognized values include: <code>0x12</code>, <code>0x84</code>, <code>0xDE</code>, <code>0xFE</code>, and <code>0xA0</code>.</p></td>
<td><p>OEM tools and other system utilities.</p></td>
<td><p>No</p></td>
</tr>
<tr class="odd">
<td><p>Windows data partition</p></td>
<td><p>Set CreatePartition\[Type](microsoft-windows-setup-diskconfiguration-disk-createpartitions-createpartition-type.md) to <strong>Primary</strong>.</p></td>
<td><p>Windows, applications, and data.</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p>Recovery/utility partition</p></td>
<td><p>Set CreatePartition\[Type](microsoft-windows-setup-diskconfiguration-disk-createpartitions-createpartition-type.md) to <strong>Primary</strong>, and then set ModifyPartition\<code>TypeID</code> to <strong>0x27</strong>.</p></td>
<td><p>Recovery files such as push-button recovery images and other system utilities.</p></td>
<td><p>No</p></td>
</tr>
</tbody>
</table>

 

For information about these and other partition types, see the MSDN topic, [Disk Partition Types](http://go.microsoft.com/fwlink/?LinkId=121505).

### UEFI/GPT-Based Systems

<table>
<colgroup>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
</colgroup>
<thead>
<tr class="header">
<th>Partition type</th>
<th>How to set the value</th>
<th>Used for</th>
<th>Receives a drive letter by default?</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>EFI system partition (ESP)</p></td>
<td><p>Set CreatePartition\[Type](microsoft-windows-setup-diskconfiguration-disk-createpartitions-createpartition-type.md) to <strong>EFI</strong>.</p></td>
<td><p>The system partition.</p></td>
<td><p>No</p></td>
</tr>
<tr class="even">
<td><p>Microsoft Reserved partition</p></td>
<td><p>Set CreatePartition\[Type](microsoft-windows-setup-diskconfiguration-disk-createpartitions-createpartition-type.md) to <strong>MSR</strong>.</p></td>
<td><p>Managing the other hard-drive partitions.</p></td>
<td><p>No</p></td>
</tr>
<tr class="odd">
<td><p>Windows data partition</p></td>
<td><p>Set CreatePartition\[Type](microsoft-windows-setup-diskconfiguration-disk-createpartitions-createpartition-type.md) to <strong>Primary</strong>.</p></td>
<td><p>Windows operating system, applications, and data.</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p>Recovery/utility partition</p></td>
<td><p>Set CreatePartition\[Type](microsoft-windows-setup-diskconfiguration-disk-createpartitions-createpartition-type.md) to <strong>Primary</strong>, and then set ModifyPartition\<code>TypeID</code> to <code>de94bba4-06d1-4d40-a16a-bfd50179d6ac</code>.</p></td>
<td><p>Recovery tools such as Windows RE, recovery files such as push-button reset images, and other system utilities.</p></td>
<td><p>No for Windows RE tools partitions.</p>
<p>Yes for push-button reset partitions and other utility partition types. For more information about hiding partitions, see [Walkthrough: Deploy Push-Button Reset Features](http://go.microsoft.com/fwlink/?LinkId=262006).</p></td>
</tr>
</tbody>
</table>

 

For information about these and other partition types, see the MSDN topic, [PARTITION\_INFORMATION\_GPT Structure](http://go.microsoft.com/fwlink/?LinkId=121504).

## Valid Configuration Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | [DiskConfiguration](microsoft-windows-setup-diskconfiguration.md) | [Disk](microsoft-windows-setup-diskconfiguration-disk.md) | [ModifyPartitions](microsoft-windows-setup-diskconfiguration-disk-modifypartitions.md) | [ModifyPartition](microsoft-windows-setup-diskconfiguration-disk-modifypartitions-modifypartition.md) | **TypeID**

## Applies To


For a list of Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

## XML Example


The following XML output for the `DiskConfiguration` setting shows partition modifications that set the recovery partition with the utility partition type. This partition does not appear with a drive letter in Windows.

``` syntax
      <ModifyPartition wcm:action="add">
        <Order>1</Order> 
        <PartitionID>1</PartitionID> 
        <Label>WinRE Tools</Label> 
        <Format>NTFS</Format> 
        <TypeID>de94bba4-06d1-4d40-a16a-bfd50179d6ac</TypeID>
      </ModifyPartition>
```

For full XML examples and recommended partition configurations, see [How to Configure UEFI/GPT-Based Hard Disk Partitions](http://go.microsoft.com/fwlink/?LinkId=214261) or [How to Configure BIOS/MBR-Based Hard Disk Partitions](http://go.microsoft.com/fwlink/?LinkId=214260).

## Related topics


[ModifyPartition](microsoft-windows-setup-diskconfiguration-disk-modifypartitions-modifypartition.md)

[Type](microsoft-windows-setup-diskconfiguration-disk-createpartitions-createpartition-type.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20TypeID%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





