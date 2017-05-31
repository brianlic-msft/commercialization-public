---
title: Extend
description: Extend
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: ea9ad4b7-f3e1-4375-bf9c-3120d76b9389
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


`Extend` specifies whether a newly-created primary partition is extended to fill the remainder of the hard disk.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>true</strong></p></td>
<td><p>Specifies that the newly-created primary partition is extended to fill the remainder of the disk.</p></td>
</tr>
<tr class="even">
<td><p><strong>false</strong></p></td>
<td><p>Specifies that the newly-created partition is a fixed size, as specified by <code>CreatePartition:</code>[Size](microsoft-windows-setup-diskconfiguration-disk-createpartitions-createpartition-size.md). This is the default value.</p></td>
</tr>
</tbody>
</table>

 

When creating a new partition, you must either use `CreatePartition:`[Size](microsoft-windows-setup-diskconfiguration-disk-createpartitions-createpartition-size.md), or set `CreatePartition:Extend` to true.

**Note**  
**To use extended and logical partitions:**

To create a logical partition that uses the remainder of the extended partition through Windows Setup, create a partition that has an initial fixed size. For example: `CreatePartition:Size=100`. Then, modify the partition by setting `ModifyPartition:Extend=true`.

Do not set both `CreatePartition:Extend` and `ModifyPartition:Extend` to **true**. For more information, see [How to Configure More Than Four Partitions on a BIOS-Based Hard Disk](http://go.microsoft.com/fwlink/?LinkId=214072).

 

## Valid Configuration Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | [DiskConfiguration](microsoft-windows-setup-diskconfiguration.md) | [Disk](microsoft-windows-setup-diskconfiguration-disk.md) | [CreatePartitions](microsoft-windows-setup-diskconfiguration-disk-createpartitions.md) | [CreatePartition](microsoft-windows-setup-diskconfiguration-disk-createpartitions-createpartition.md) | **Extend**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

## XML Example


The following XML output for the `DiskConfiguration` setting shows how to create two partitions on a hard drive. The first partition has a fixed size of 100 megabytes (MB). The second partition is extended to fill the remainder of the hard disk.

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


[Extend](microsoft-windows-setup-diskconfiguration-disk-modifypartitions-modifypartition-extend.md)

[CreatePartition](microsoft-windows-setup-diskconfiguration-disk-createpartitions-createpartition.md)

[How to Configure BIOS/MBR-Based Hard Disk Partitions](http://go.microsoft.com/fwlink/?LinkId=214260)

[How to Configure More Than Four Partitions on a BIOS-Based Hard Disk](http://go.microsoft.com/fwlink/?LinkId=214072)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Extend%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





