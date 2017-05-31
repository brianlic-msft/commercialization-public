---
title: PartitionID
description: PartitionID
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: dd43f6a0-83ab-428e-83b4-8772e9731239
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# PartitionID


`PartitionID` specifies the identification number of the partition to modify. The first partition on a disk has the value of 1, the second, 2, and so on.

**Note**  
**BIOS-Based Systems: using an extended partition**

-   Only primary and logical partitions receive a partition ID. Extended partitions are ignored.

    For example:

    <table>
    <colgroup>
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    </colgroup>
    <tbody>
    <tr class="odd">
    <td><p>Primary (1)</p></td>
    <td><p>Extended</p></td>
    <td><p>Primary (2)</p></td>
    <td><p>Primary (3)</p></td>
    </tr>
    </tbody>
    </table>

     

-   We recommend placing the extended partition after all other primary partitions. Otherwise, when you create logical partitions, the partition ID for the primary partitions may change. For example, if you create a partition structure with an extended partition in the middle of your primary partitions, and then add two logical partitions, the partition ID of the last partition will change from 3 to 5:

    **Before:**

    <table>
    <colgroup>
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    </colgroup>
    <tbody>
    <tr class="odd">
    <td><p>Primary (1)</p></td>
    <td><p>Extended</p></td>
    <td><p>Primary (2)</p></td>
    <td><p>Primary (3)</p></td>
    </tr>
    </tbody>
    </table>

     

    **After adding two logical partitions:**

    <table>
    <colgroup>
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    </colgroup>
    <tbody>
    <tr class="odd">
    <td><p>Primary (1)</p></td>
    <td><p>Extended</p>
    <p>Logical (2)</p>
    <p>Logical (3)</p></td>
    <td><p>Primary (4)</p></td>
    <td><p>Primary (5)</p></td>
    </tr>
    </tbody>
    </table>

     

 

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>partition_identification_number</em></p></td>
<td><p>Specifies the identification number of the partition that you modify.</p>
<p>If [WillShowUI](microsoft-windows-setup-diskconfiguration-willshowui.md) is set to <strong>Never</strong> and an invalid <code>PartitionID</code> setting is specified, an error is logged and installation terminates.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | [DiskConfiguration](microsoft-windows-setup-diskconfiguration.md) | [Disk](microsoft-windows-setup-diskconfiguration-disk.md) | [ModifyPartitions](microsoft-windows-setup-diskconfiguration-disk-modifypartitions.md) | [ModifyPartition](microsoft-windows-setup-diskconfiguration-disk-modifypartitions-modifypartition.md) | **PartitionID**

## Applies To


For a list of the supported Microsoft Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

## XML Example


### BIOS-Based System with Two Partitions

The following XML output for the `DiskConfiguration` setting shows two partition modifications. In the `CreatePartition` section, the system partition is created first, and receives a partition ID of 1. The Windows partition is created second, and receives a partition ID of 2.

When modifying the partitions, the first modification (ordered 1) affects the partition with the ID of 1, which is the System partition. The second modification affects the partition with the ID of 2, which is the Windows partition.

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

### <a href="" id="bios-based-system-with-an-extended-partition-"></a>BIOS-Based System With an Extended Partition

In this example, an extended partition is created after all the primary partitions. In this case, the PartitionIDs are assigned in the order in that the partitions are created.

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
           nor does it need to be modified -->

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

### BIOS-Based System with an Extended Partition Located Before a Primary Partition

In this example, the extended partition is located first, before the primary partitions. Note that even though the logical partitions are created last, they receive the first partition numbers.

``` syntax
<DiskConfiguration>

  <Disk wcm:action="add">
    <DiskID>0</DiskID> 
    <WillWipeDisk>true</WillWipeDisk> 
    <CreatePartitions>

      <!-- Extended partition -->
      <CreatePartition wcm:action="add">
        <Order>1</Order> 
        <Type>Extended</Type> 
        <Size>20000</Size> 
      </CreatePartition>

      <!-- Recovery partition -->
      <CreatePartition wcm:action="add">
        <Order>2</Order> 
        <Type>Primary</Type> 
        <Size>3000</Size> 
      </CreatePartition>

      <!-- System partition -->
      <CreatePartition wcm:action="add">
        <Order>4</Order> 
        <Type>Primary</Type> 
        <Size>100</Size> 
      </CreatePartition>

      <!-- Utility2 partition -->
      <CreatePartition wcm:action="add">
        <Order>3</Order> 
        <Type>Primary</Type> 
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
        <Size>4980</Size> 

      </CreatePartition>

    </CreatePartitions>
    <ModifyPartitions>

      <!-- Extended partition:
           This partition does not need receive a partition number, 
           nor does it need to be modified -->

      <!-- Windows partition -->
      <ModifyPartition wcm:action="add">
        <Order>1</Order>
        <PartitionID>1</PartitionID> 
        <Label>Windows</Label> 
        <Letter>C</Letter> 
        <Format>NTFS</Format> 
      </ModifyPartition>

      <!-- Logical2 partition -->
      <ModifyPartition wcm:action="add">
        <Order>2</Order> 
        <PartitionID>2</PartitionID> 
        <Label>Logical2</Label> 
        <Letter>L</Letter> 
        <Format>NTFS</Format> 
      </ModifyPartition>

      <!-- Recovery partition -->
      <ModifyPartition wcm:action="add">
        <Order>3</Order> 
        <PartitionID>3</PartitionID> 
        <Label>Recovery</Label> 
        <Format>NTFS</Format> 
        <TypeID>0x27</TypeID>
      </ModifyPartition>


      <!-- System partition -->
      <ModifyPartition wcm:action="add">
        <Order>4</Order> 
        <PartitionID>4</PartitionID> 
        <Label>System</Label>
        <Format>NTFS</Format> 
        <Active>true</Active> 
      </ModifyPartition>

      <!-- Utility2 partition -->
      <ModifyPartition wcm:action="add">
        <Order>5</Order> 
        <PartitionID>5</PartitionID> 
        <Label>Utility2</Label> 
        <Letter>U</Letter> 
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
      <PartitionID>1</PartitionID> 
    </InstallTo>
  </OSImage>
</ImageInstall>
```

For full XML examples and recommended partition configurations, see [How to Configure UEFI/GPT-Based Hard Disk Partitions](http://go.microsoft.com/fwlink/?LinkId=214261) or [How to Configure BIOS/MBR-Based Hard Disk Partitions](http://go.microsoft.com/fwlink/?LinkId=214260).

## Related topics


[ModifyPartition](microsoft-windows-setup-diskconfiguration-disk-modifypartitions-modifypartition.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20PartitionID%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





