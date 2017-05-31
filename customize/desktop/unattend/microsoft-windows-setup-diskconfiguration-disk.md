---
title: Disk
description: Disk
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: d4b94e3c-1ff8-4422-b607-c4bbff21dd37
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Disk


`Disk` specifies the disk settings to add or to edit on the destination computer. `Disk` is a list item type, and each instance of `Disk` in an unattended installation answer file applies to a single hard disk (specified by [DiskID](microsoft-windows-setup-diskconfiguration-disk-diskid.md)).

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[CreatePartitions](microsoft-windows-setup-diskconfiguration-disk-createpartitions.md)</p></td>
<td><p>Specifies a list of [CreatePartition](microsoft-windows-setup-diskconfiguration-disk-createpartitions-createpartition.md) items.</p></td>
</tr>
<tr class="even">
<td><p>[DiskID](microsoft-windows-setup-diskconfiguration-disk-diskid.md)</p></td>
<td><p>Specifies the identification number of the disk to edit.</p></td>
</tr>
<tr class="odd">
<td><p>[ModifyPartitions](microsoft-windows-setup-diskconfiguration-disk-modifypartitions.md)</p></td>
<td><p>Specifies a list of [ModifyPartition](microsoft-windows-setup-diskconfiguration-disk-modifypartitions-modifypartition.md) items.</p></td>
</tr>
<tr class="even">
<td><p>[WillWipeDisk](microsoft-windows-setup-diskconfiguration-disk-willwipedisk.md)</p></td>
<td><p>Specifies whether to reformat the disk.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | [DiskConfiguration](microsoft-windows-setup-diskconfiguration.md) | **Disk**

## Applies To


For a list of supported Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

## XML Examples


### BIOS-Based System with Two Hard Drives

The following XML output for the `DiskConfiguration` setting shows partition modifications for a BIOS-based computer with two hard drives.

``` syntax
<DiskConfiguration>

  <!-- First hard drive -->
  <Disk wcm:action="add">
    <DiskID>0</DiskID> 
    <WillWipeDisk>true</WillWipeDisk> 
    <CreatePartitions>

      <!-- System partition -->
      <CreatePartition wcm:action="add">
        <Order>1</Order> 
        <Type>Primary</Type> 
        <Size>300</Size> 
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
      <PartitionID>2</PartitionID> 
    </InstallTo>
  </OSImage>
</ImageInstall>
```

For full XML examples and recommended partition configurations, see [How to Configure UEFI/GPT-Based Hard Disk Partitions](http://go.microsoft.com/fwlink/?LinkId=214261) or [How to Configure BIOS/MBR-Based Hard Disk Partitions](http://go.microsoft.com/fwlink/?LinkId=214260).

## Related topics


[DiskConfiguration](microsoft-windows-setup-diskconfiguration.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Disk%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





