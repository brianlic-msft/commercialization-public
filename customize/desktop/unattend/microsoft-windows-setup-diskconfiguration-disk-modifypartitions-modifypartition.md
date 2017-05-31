---
title: ModifyPartition
description: ModifyPartition
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 4d07bc63-36b4-4a9e-a2b5-1de83a383bf2
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# ModifyPartition


`ModifyPartition` specifies a single partition on a disk to be modified

One or more `ModifyPartition` list items can exist in the [ModifyPartitions](microsoft-windows-setup-diskconfiguration-disk-modifypartitions.md) parent list.

The following table shows the modifications that can be made to various partition types.

Partition Type
Active
Extend
Format
Letter
Label
TypeID
**Primary**

Yes

Yes

Yes

Yes

Yes

Yes

**Logical**

No

Yes

Yes

Yes

Yes

Yes

**EFI System (ESP)**

No

No

Yes

Yes

Yes

No

**Microsoft Reserved (MSR)**

MSR partitions cannot be modified.

**Extended**

Extended partitions cannot be modified.

 

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[Active](microsoft-windows-setup-diskconfiguration-disk-modifypartitions-modifypartition-active.md)</p></td>
<td><p>Specifies whether the partition is active.</p></td>
</tr>
<tr class="even">
<td><p>[Extend](microsoft-windows-setup-diskconfiguration-disk-modifypartitions-modifypartition-extend.md)</p></td>
<td><p>Specifies whether to extend the partition to use the remainder of the contiguous space on the hard disk.</p></td>
</tr>
<tr class="odd">
<td><p>[Format](microsoft-windows-setup-diskconfiguration-disk-modifypartitions-modifypartition-format.md)</p></td>
<td><p>Specifies the file-system format to apply to the partition.</p></td>
</tr>
<tr class="even">
<td><p>[Label](microsoft-windows-setup-diskconfiguration-disk-modifypartitions-modifypartition-label.md)</p></td>
<td><p>Specifies the name to apply to the partition.</p></td>
</tr>
<tr class="odd">
<td><p>[Letter](microsoft-windows-setup-diskconfiguration-disk-modifypartitions-modifypartition-letter.md)</p></td>
<td><p>Specifies the drive letter to assign to the partition.</p></td>
</tr>
<tr class="even">
<td><p>[Order](microsoft-windows-setup-diskconfiguration-disk-modifypartitions-modifypartition-order.md)</p></td>
<td><p>Specifies the order in which the partition will be modified.</p></td>
</tr>
<tr class="odd">
<td><p>[PartitionID](microsoft-windows-setup-diskconfiguration-disk-modifypartitions-modifypartition-partitionid.md)</p></td>
<td><p>Specifies the identification number of the partition to modify.</p></td>
</tr>
<tr class="even">
<td><p>[TypeID](microsoft-windows-setup-diskconfiguration-disk-modifypartitions-modifypartition-typeid.md)</p></td>
<td><p>Specifies the hard drive partition type.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | [DiskConfiguration](microsoft-windows-setup-diskconfiguration.md) | [Disk](microsoft-windows-setup-diskconfiguration-disk.md) | [ModifyPartitions](microsoft-windows-setup-diskconfiguration-disk-modifypartitions.md) | **ModifyPartition**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

## XML Example


The following XML output shows two partition modifications. The first modification formats the partition for the NTFS file system, marks the partition as active, and labels it "System". The second modification formats the second partition on the disk to NTFS, labels it "Windows", and extends the partition to fill the remainder of the disk.

``` syntax
<DiskConfiguration>

  <Disk wcm:action="add">
    <DiskID>0</DiskID> 
    <WillWipeDisk>true</WillWipeDisk> 
    <CreatePartitions>

      <!-- System partition -->
      <CreatePartition wcm:action="add">
        <Order>1</Order> 
        <Type>Primary</Type> 
        <Size>350</Size> 
      </CreatePartition>

      <!-- Windows partition -->
      <CreatePartition wcm:action="add">
        <Order>2</Order> 
        <Type>Primary</Type> 
        <Extend>true</Extend> 
      </CreatePartition>

    </CreatePartitions>
    <ModifyPartitions>

      <!-- System partition -->
      <ModifyPartition wcm:action="add">
        <Order>1</Order> 
        <PartitionID>1</PartitionID> 
        <Label>System</Label> 
        <Format>NTFS</Format> 
        <Active>true</Active> 
      </ModifyPartition>

      <!-- Windows partition -->
      <ModifyPartition wcm:action="add">
        <Order>2</Order> 
        <PartitionID>2</PartitionID> 
        <Label>Windows</Label> 

        <Format>NTFS</Format> 
      </ModifyPartition>
    </ModifyPartitions>
  </Disk>


  <WillShowUI>OnError</WillShowUI> 
</DiskConfiguration>


<ImageInstall>
  <OSImage>
    <InstallTo>
      <DiskID>0</DiskID> 
      <PartitionID>2</PartitionID> 
    </InstallTo>
  </OSImage>
</ImageInstall>
```

## Related topics


[ModifyPartitions](microsoft-windows-setup-diskconfiguration-disk-modifypartitions.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20ModifyPartition%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





