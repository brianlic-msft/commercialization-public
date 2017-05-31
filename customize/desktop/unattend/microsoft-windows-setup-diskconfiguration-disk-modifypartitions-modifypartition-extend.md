---
title: Extend
description: Extend
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: fffd5120-39a6-4023-8ef7-94f465dc00ba
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Extend


`Extend` can be used to modify existing partitions. You can use `Extend` on BIOS/MBR-based systems to:

-   Specify a new or existing logical partition to fill the remainder of an extended partition.

-   Specify a partition within an existing partition structure to fill the remainder of the disk.

**Note**  
UEFI/GPT-based disks do not support the `Extend` setting.

 

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>true</strong></p></td>
<td><p>Specifies that the selected partition is extended to fill the remainder of the disk.</p></td>
</tr>
<tr class="even">
<td><p><strong>false</strong></p></td>
<td><p>Specifies that the selected partition is not extended to fill the remainder of the disk. This is the default value.</p></td>
</tr>
</tbody>
</table>

 

-   **To use extended and logical partitions**

    To create a logical partition that uses the remainder of the extended partition through Windows Setup, create a partition that has an initial fixed size. For example: `CreatePartition:Size=100`. Then, modify the partition by setting `ModifyPartition:Extend=true`.Do not set both `CreatePartition:Extend` and `ModifyPartition:Extend` to **true**. For more information, see [How to Configure More Than Four Partitions on a BIOS-Based Hard Disk](http://go.microsoft.com/fwlink/?LinkId=214072).

-   **To modify a partition within an existing partition structure to extend to the remainder of the disk**

    Set `ModifyPartitions:Extend` to `true`.

-   **To specify a newly-created partition to fill the remainder of the hard disk**

    Set `CreatePartitions:`[Extend](microsoft-windows-setup-diskconfiguration-disk-createpartitions-createpartition-extend.md) to `true`, and leave `ModifyPartitions:Extend` empty.

## Valid Configuration Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | [DiskConfiguration](microsoft-windows-setup-diskconfiguration.md) | [Disk](microsoft-windows-setup-diskconfiguration-disk.md) | [ModifyPartitions](microsoft-windows-setup-diskconfiguration-disk-modifypartitions.md) | [ModifyPartition](microsoft-windows-setup-diskconfiguration-disk-modifypartitions-modifypartition.md) | **Extend**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

## XML Example


### Specify a Logical Partition to Fill the Remainder of an Extended Partition

The following XML output for the `DiskConfiguration` setting shows partition modifications for a BIOS-based computer with two logical partitions. This XML example includes the creation of an extended partition that is set to extend to the end of the hard disk. The second logical partition, labeled **Logical2**, is set to extend to the end of the extended partition. 

``` syntax
<DiskConfiguration>

  <Disk wcm:action="add">
    <DiskID>0</DiskID> 
    <WillWipeDisk>true</WillWipeDisk> 
    <CreatePartitions>

      <!-- Recovery Tools partition -->
      <CreatePartition wcm:action="add">
        <Order>1</Order> 
        <Type>Primary</Type> 
        <Size>3000</Size> 
      </CreatePartition>

      <!-- Utility2 partition -->
      <CreatePartition wcm:action="add">
        <Order>2</Order> 
        <Type>Primary</Type> 
        <Size>250</Size> 
      </CreatePartition>

      <!-- System partition -->
      <CreatePartition wcm:action="add">
        <Order>3</Order> 
        <Type>Primary</Type> 
        <Size>100</Size> 
      </CreatePartition>

      <!-- Extended partition -->
      <CreatePartition wcm:action="add">
        <Order>4</Order> 
        <Type>Extended</Type> 
        <Extend>true</Extend> 
      </CreatePartition>

      <!-- Windows partition -->
      <CreatePartition wcm:action="add">
        <Order>5</Order> 
        <Type>Logical</Type> 
        <Size>15000</Size> 
      </CreatePartition>

      <!-- Recovery image partition -->
      <CreatePartition wcm:action="add">
        <Order>6</Order> 
        <Type>Logical2</Type> 
        <Size>100</Size> 
          <!-- Note: To create a logical partition that fills 
                     the rest of the extended partition, create the 
                     data partition with an initial size of 100.
                     This will be changed in the ModifyPartition section. -->
      </CreatePartition>

    </CreatePartitions>
    <ModifyPartitions>

      <!—Recovery Tools partition -->
      <ModifyPartition wcm:action="add">
        <Order>1</Order> 
        <PartitionID>1</PartitionID> 
        <Label>Recovery</Label> 
        <Letter>R</Letter> 
        <Format>NTFS</Format> 
        <TypeID>0x27</TypeID>
      </ModifyPartition>

      <!-- Utility partition -->
      <ModifyPartition wcm:action="add">
        <Order>2</Order> 
        <PartitionID>2</PartitionID> 
        <Label>Utility</Label> 
        <Letter>U</Letter> 
        <Format>NTFS</Format> 
        <TypeID>0x27</TypeID>
      </ModifyPartition>

      <!-- System partition -->
      <ModifyPartition wcm:action="add">
        <Order>3</Order> 
        <PartitionID>3</PartitionID> 
        <Label>System</Label>
        <Letter>S</Letter> 
        <Format>NTFS</Format> 
        <Active>true</Active> 
      </ModifyPartition>

      <!-- Extended partition:
           This partition does not need a partition number, 
           nor does it need to be modified. -->

      <!-- Windows partition -->
      <ModifyPartition wcm:action="add">
        <Order>4</Order>
        <PartitionID>4</PartitionID> 
        <Label>Windows</Label> 
        <Letter>C</Letter> 
        <Format>NTFS</Format> 
      </ModifyPartition>

      <!-- Recovery image partition -->
      <ModifyPartition wcm:action="add">
        <Order>5</Order> 
        <PartitionID>5</PartitionID> 
        <Label>Data</Label> 
        <Letter>D</Letter> 
        <Format>NTFS</Format> 
        <Extend>true</Extend>
          <!-- Note: When modifying a logical partition, setting
                     "ModifyPartition|Extend=true" sets the partition to  
                     fill the remainder of the extended partition.
                     This overrides the "CreatePartition|Size" value. -->
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

For more information, see [How to Configure More Than Four Partitions on a BIOS-Based Hard Disk](http://go.microsoft.com/fwlink/?LinkId=214072).

### Specifying an Existing Partition to Fill the Remainder of the Hard Drive

The following XML output for the `DiskConfiguration` setting shows how to modify an existing hard drive partition structure. In this example, the third partition is extended to fill the remainder of the drive.

``` syntax
<DiskConfiguration>
   <WillShowUI>OnError</WillShowUI>
   <Disk>
      <DiskID>0</DiskID>
      <WillWipeDisk>false</WillWipeDisk>

      <ModifyPartitions>

         <!-- Modify the existing Windows partition -->
         <ModifyPartition>
            <Order>1</Order>
            <PartitionID>3</PartitionID>
            <Format>NTFS</Format>
            <Extend>true</Extend>
            <Label>Windows</Label>
            <Letter>C</Letter>
         </ModifyPartition>
      </ModifyPartitions>
   </Disk>
</DiskConfiguration>
```

## Related topics


[ModifyPartition](microsoft-windows-setup-diskconfiguration-disk-modifypartitions-modifypartition.md)

[How to Configure More Than Four Partitions on a BIOS-Based Hard Disk](http://go.microsoft.com/fwlink/?LinkId=214072)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Extend%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





