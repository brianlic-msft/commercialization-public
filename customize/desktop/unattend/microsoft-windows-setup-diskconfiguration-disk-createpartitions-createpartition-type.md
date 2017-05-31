---
title: Type
description: Type
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 83d8831d-fd39-469c-b8dc-c00077a61086
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Type


`Type` specifies the type of partition to create.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>Primary</strong></p></td>
<td><p>Creates a primary partition type.</p>
<p>A standard master boot record (MBR)-based hard disk can contain up to four primary partitions or three primary partitions and one extended partition. The extended partition can include additional logical drives.</p>
<p>A GUID partition table (GPT)-based hard disk can contain up to 128 primary partitions.</p>
<p>Windows must be installed on either a primary or a logical partition.</p></td>
</tr>
<tr class="even">
<td><p><strong>EFI</strong></p></td>
<td><p>Creates an extensible firmware interface (EFI) partition type.</p>
<p>The EFI partition type configures the partition as an EFI system partition (ESP). This is a required partition for a GUID partition table (GPT)-based disk.</p>
<p>Only a single EFI system partition is required, regardless of how many GPT-based disks exist on a system. For unattended installations, it is possible to create more than one ESP on a hard disk. If there is already an ESP on the hard disk to which you are installing, and you create a new ESP in your answer file, two ESPs will be present on the computer. Two ESPs might be problematic for users, and they will consume additional disk space.</p>
<p>We recommend that you use the [WillWipeDisk](microsoft-windows-setup-diskconfiguration-disk-willwipedisk.md) setting to erase all partitions on the disk before performing an unattended installation.</p>
<p>In attended installations, Windows Setup warns you that an ESP already exists on the hard disk.</p>
<p>Installation will be terminated if you specify Type as EFI and the format of the disk is of type MBR. Only GPT disks can have an EFI System partition.</p></td>
</tr>
<tr class="odd">
<td><p><strong>Extended</strong></p></td>
<td><p>Specifies that the partition is an extended partition.</p>
<p>An extended partition can be created only on master boot record (MBR)-based disks.</p>
<p>Only one extended partition can exist on a single disk. If an extended partition already exists on the disk, a second extended partition is not created. If the value for the [WillShowUI](microsoft-windows-setup-diskconfiguration-willshowui.md) setting is set to <strong>Never</strong>, an error is logged, and installation is terminated.</p>
<p>Extended partitions are useful if you intend to create more than four volumes on a basic MBR disk. Unlike primary partitions, you do not format an extended partition with a file system. Instead, you create one or more logical drives within the extended partition.</p></td>
</tr>
<tr class="even">
<td><p><strong>Logical</strong></p></td>
<td><p>Specifies that the partition is a logical partition.</p>
<p>Windows 7 must be installed on either a primary or a logical partition.</p>
<p>A logical partition is a volume that is created inside an extended partition on a basic master boot record (MBR)-based disk.</p>
<p>Logical partitions are similar to primary partitions. However, while only four primary partitions can exist on a single disk, the number of logical partitions that can exist on a disk is unlimited. A logical partition can be formatted and assigned a drive letter.</p>
<p>A logical partition must be created inside an extended partition. If an extended partition does not already exist on the disk or the specified size of the logical drive exceeds the extended partition, no partition is created.</p>
<p>If [WillShowUI](microsoft-windows-setup-diskconfiguration-willshowui.md) is set to <strong>Never</strong>, an error is logged, and installation is terminated.</p></td>
</tr>
<tr class="odd">
<td><p><strong>MSR</strong></p></td>
<td><p>Specifies that the partition is a Microsoft reserved (MSR) partition.</p>
<p>The MSR partition type is a required partition for GUID partition table (GPT)-based disks.</p>
<p>The size of the MSR partition varies. For GPT disks that are smaller than 16 GB, the size of the MSR partition is 32 MB. For disks larger than 16 GB, the MSR partition is 128 MB.</p>
<p>If an MSR partition already exists on the same disk, or the format of the disk is MBR, no partition is created. If the value for [WillShowUI](microsoft-windows-setup-diskconfiguration-willshowui.md) is set to <strong>Never</strong>, an error is logged and the installation is terminated.</p>
<p>If an ESP is not detected or an MSR partition does not exist on each GPT disk in the system, no GPT-related disk configurations can be created.</p></td>
</tr>
</tbody>
</table>

 

**Note**  
For information about setting other types of partitions, such as utility and recovery partitions, see microsoft-windows-setup-/DiskConfiguration/Disk/ModifyPartitions/ModifyPartition/[TypeID](microsoft-windows-setup-diskconfiguration-disk-modifypartitions-modifypartition-typeid.md).

 

This string type does not support empty elements. Do not create an empty value for this setting.

## Valid Configuration Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | [DiskConfiguration](microsoft-windows-setup-diskconfiguration.md) | [Disk](microsoft-windows-setup-diskconfiguration-disk.md) | [CreatePartitions](microsoft-windows-setup-diskconfiguration-disk-createpartitions.md) | [CreatePartition](microsoft-windows-setup-diskconfiguration-disk-createpartitions-createpartition.md) | **Type**

## Applies To


For a list of Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

## XML Examples


### UEFI-Based Systems

The following XML output for the `DiskConfiguration` setting shows a configuration for a UEFI-based system with four partitions, including an EFI partition, an MSR partition, and two primary partitions.

``` syntax
<DiskConfiguration>

  <Disk wcm:action="add">
    <DiskID>0</DiskID> 
    <WillWipeDisk>true</WillWipeDisk> 
    <CreatePartitions>

      <!-- Recovery partition -->
      <CreatePartition wcm:action="add">
        <Order>1</Order> 
        <Type>Primary</Type> 
        <Size>250</Size> 
      </CreatePartition>

      <!-- EFI system partition (ESP) -->
      <CreatePartition wcm:action="add">
        <Order>2</Order> 
        <Type>EFI</Type> 
        <Size>100</Size> 
      </CreatePartition>

      <!-- Microsoft reserved partition (MSR) -->
      <CreatePartition wcm:action="add">
        <Order>3</Order> 
        <Type>MSR</Type> 
        <Size>128</Size> 
      </CreatePartition>

      <!-- Windows partition -->
      <CreatePartition wcm:action="add">
        <Order>4</Order> 
        <Type>Primary</Type> 
        <Extend>true</Extend> 
      </CreatePartition>

    </CreatePartitions>
    <ModifyPartitions>

      <!-- Recovery partition -->
      <ModifyPartition wcm:action="add">
        <Order>1</Order> 
        <PartitionID>1</PartitionID> 
        <Label>Recovery</Label> 
        <Format>NTFS</Format> 
        <TypeID>de94bba4-06d1-4d40-a16a-bfd50179d6ac</TypeID> 
      </ModifyPartition>
    </ModifyPartitions>

      <!-- EFI system partition (ESP) -->
      <ModifyPartition wcm:action="add">
        <Order>2</Order> 
        <PartitionID>2</PartitionID> 
        <Label>System</Label> 
        <Format>FAT32</Format> 
      </ModifyPartition>

      <!-- MSR partition does not need to be 
modified -->

      <!-- Windows partition -->
      <ModifyPartition wcm:action="add">
        <Order>3</Order> 
        <PartitionID>4</PartitionID> 
        <Label>Windows</Label> 
        <Letter>C</Letter> 
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
      <PartitionID>4</PartitionID> 
    </InstallTo>
  </OSImage>
</ImageInstall>
```

For full XML examples and recommended partition configurations, see [How to Configure UEFI/GPT-Based Hard Disk Partitions](http://go.microsoft.com/fwlink/?LinkId=214261) or [How to Configure BIOS/MBR-Based Hard Disk Partitions](http://go.microsoft.com/fwlink/?LinkId=214260).

## Related topics


[CreatePartition](microsoft-windows-setup-diskconfiguration-disk-createpartitions-createpartition.md)

[TypeID](microsoft-windows-setup-diskconfiguration-disk-modifypartitions-modifypartition-typeid.md)

[How to Configure More than Four Partitions on a BIOS-Based Hard Disk](http://go.microsoft.com/fwlink/?LinkId=214072)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Type%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





