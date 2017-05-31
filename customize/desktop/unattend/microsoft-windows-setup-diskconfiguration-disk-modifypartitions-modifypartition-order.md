---
title: Order
description: Order
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: e96797ae-c4ee-4dcc-890a-943d0d12d2b9
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Order


`Order` specifies the order in which the partition is modified when more than one partition is scheduled to be modified. This setting is required even if you modify only one partition.

When modifying any number of partitions, for each drive, use the partition order starting with 1 and increasing: 1, 2, 3, and so on.

When you are adding multiple partitions, to keep track of the partitions easier, you can use the same values for `Order` and `PartitionID`. To do this, add a **ModifyPartition** component for each partition, including those partitions that will not be modified, such as MSR and Extended partitions.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Order_number</em></p></td>
<td><p>Specifies the order in which the partition is modified. <em>Order_number</em> is an integer.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | [DiskConfiguration](microsoft-windows-setup-diskconfiguration.md) | [Disk](microsoft-windows-setup-diskconfiguration-disk.md) | [ModifyPartitions](microsoft-windows-setup-diskconfiguration-disk-modifypartitions.md) | [ModifyPartition](microsoft-windows-setup-diskconfiguration-disk-modifypartitions-modifypartition.md) | **Order**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

## XML Examples


### BIOS-Based System with Two Hard Drives

The following XML output for the `DiskConfiguration` setting shows partition modifications for a BIOS-based computer with two hard drives. The first hard drive includes three partitions, including three modifications configured, that are ordered 1, 2, and 3. The second hard drive includes a single partition, with a single modification configured, that is ordered 1.

``` syntax
<DiskConfiguration>

  <!-- First hard drive -->
  <Disk wcm:action="add">
    <DiskID>0</DiskID> 
    <WillWipeDisk>true</WillWipeDisk> 
    <CreatePartitions>

      <!-- Recovery partition -->
      <CreatePartition wcm:action="add">
        <Order>1</Order> 
        <Type>Primary</Type> 
        <Size>3000</Size> 
      </CreatePartition>

      <!-- System partition -->
      <CreatePartition wcm:action="add">
        <Order>2</Order> 
        <Type>Primary</Type> 
        <Size>300</Size> 
      </CreatePartition>

      <!-- Windows partition -->
      <CreatePartition wcm:action="add">
        <Order>3</Order> 
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
        <TypeID>0x27</TypeID>
      </ModifyPartition>

      <!-- System partition -->
      <ModifyPartition wcm:action="add">
        <Order>2</Order> 
        <PartitionID>2</PartitionID> 
        <Label>System</Label> 
        <Format>NTFS</Format> 
        <Active>true</Active> 
      </ModifyPartition>

      <!-- Windows partition -->
      <ModifyPartition wcm:action="add">
        <Order>3</Order> 
        <PartitionID>3</PartitionID> 
        <Label>Windows</Label> 
        <Letter>C</Letter> 
        <Format>NTFS</Format> 
      </ModifyPartition>
    </ModifyPartitions>
  </Disk>

  <!-- Second hard drive -->
  <Disk wcm:action="add">
    <DiskID>1</DiskID> 
    <WillWipeDisk>true</WillWipeDisk> 
    <CreatePartitions>

      <!-- Data partition -->
      <CreatePartition wcm:action="add">
        <Order>1</Order> 
        <Type>Primary</Type> 
        <Extend>true</Extend> 
      </CreatePartition>

    </CreatePartitions>
    <ModifyPartitions>

      <!-- Data partition -->
      <ModifyPartition wcm:action="add">
        <Order>1</Order> 
        <PartitionID>1</PartitionID> 
        <Label>Data</Label> 
        <Letter>D</Letter> 
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
      <PartitionID>3</PartitionID> 
    </InstallTo>
  </OSImage>
</ImageInstall>
```

### BIOS-Based System with an Extended Partition

The following XML output for the `DiskConfiguration` setting shows partition modifications for a BIOS-based computer with six partitions: three primary partitions, an extended partition, and two logical partitions. There are five modifications configured, ordered 1, 2, 3, 4, and 5. The extended partition does not require modification.

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

      <!-- Logical2 partition -->
      <CreatePartition wcm:action="add">
        <Order>6</Order> 
        <Type>Logical</Type> 
        <Size>100</Size> 
          <!-- Note: To create a logical partition that fills 
                     the rest of the extended partition, create the 
                     data partition with an initial size of 100 MB.
                     This will be changed in the ModifyPartition section. -->
      </CreatePartition>

    </CreatePartitions>
    <ModifyPartitions>

      <!-- Recovery partition -->
      <ModifyPartition wcm:action="add">
        <Order>1</Order> 
        <PartitionID>1</PartitionID> 
        <Label>Recovery</Label> 
        <Format>NTFS</Format> 
        <TypeID>0x27</TypeID>
      </ModifyPartition>

      <!-- Utility2 partition -->
      <ModifyPartition wcm:action="add">
        <Order>2</Order> 
        <PartitionID>2</PartitionID> 
        <Label>Utility2</Label> 
        <Letter>U</Letter> 
        <Format>NTFS</Format> 
      </ModifyPartition>

      <!-- System partition -->
      <ModifyPartition wcm:action="add">
        <Order>3</Order> 
        <PartitionID>3</PartitionID> 
        <Label>System</Label>
        <Format>NTFS</Format> 
        <Active>true</Active> 
      </ModifyPartition>

      <!-- Extended partition:
           This partition does not need receive a partition number, 
           nor does it need to be modified. -->

      <!-- Windows partition -->
      <ModifyPartition wcm:action="add">
        <Order>4</Order>
        <PartitionID>4</PartitionID> 
        <Label>Windows</Label> 
        <Letter>C</Letter> 
        <Format>NTFS</Format> 
      </ModifyPartition>

      <!-- Logical2 partition -->
      <ModifyPartition wcm:action="add">
        <Order>5</Order> 
        <PartitionID>5</PartitionID> 
        <Label>Logical2</Label> 
        <Letter>L</Letter> 
        <Format>NTFS</Format> 
        <Extend>true</Extend>
          <!-- Note: When modifying a logical partition, setting
                     "ModifyPartition|Extend=true" instructs the partition to  
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

### UEFI-Based System with One Hard Drive

The following XML output for the `DiskConfiguration` setting shows partition modifications for a UEFI-based computer. The hard drive includes three partitions: an EFI system partition, a Microsoft Reserved (MSR) partition, and a primary Windows partition. There are two modifications configured, ordered 1 and 2. The MSR extended partition does not require modification.

``` syntax
<DiskConfiguration>

  <Disk wcm:action="add">
    <DiskID>0</DiskID> 
    <WillWipeDisk>true</WillWipeDisk> 
    <CreatePartitions>

      <!-- EFI system partition (ESP) -->
      <CreatePartition wcm:action="add">
        <Order>1</Order> 
        <Type>EFI</Type> 
        <Size>100</Size> 
      </CreatePartition>

      <!-- Microsoft reserved partition (MSR) -->
      <CreatePartition wcm:action="add">
        <Order>2</Order> 
        <Type>MSR</Type> 
        <Size>128</Size> 
      </CreatePartition>

      <!-- Windows partition -->
      <CreatePartition wcm:action="add">
        <Order>3</Order> 
        <Type>Primary</Type> 
        <Extend>true</Extend> 
      </CreatePartition>

    </CreatePartitions>
    <ModifyPartitions>

      <!-- EFI system partition (ESP) -->
      <ModifyPartition wcm:action="add">
        <Order>1</Order> 
        <PartitionID>1</PartitionID> 
        <Label>System</Label> 
        <Format>FAT32</Format> 
      </ModifyPartition>

      <!-- MSR partition does not need to be modified -->

      <!-- Windows partition -->
      <ModifyPartition wcm:action="add">
        <Order>2</Order> 
        <PartitionID>3</PartitionID> 
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
      <PartitionID>3</PartitionID> 
    </InstallTo>
  </OSImage>
</ImageInstall>
```

For full XML examples and recommended partition configurations, see [How to Configure UEFI/GPT-Based Hard Disk Partitions](http://go.microsoft.com/fwlink/?LinkId=214261) or [How to Configure BIOS/MBR-Based Hard Disk Partitions](http://go.microsoft.com/fwlink/?LinkId=214260).

## Related topics


[ModifyPartition](microsoft-windows-setup-diskconfiguration-disk-modifypartitions-modifypartition.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Order%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





