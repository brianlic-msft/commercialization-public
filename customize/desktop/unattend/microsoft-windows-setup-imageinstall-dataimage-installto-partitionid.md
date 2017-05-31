---
title: PartitionID
description: PartitionID
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 01bf5811-296b-4644-8d6b-a45a6ea87b3b
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


`PartitionID` specifies the identification number of the partition on which to install a data image. Partition indexes are relative 1-based. The first partition on a disk has the value of 1, the second, 2, and so on.

**Note**  
Only primary and logical partitions are used to define the partition ID. Extended partitions are ignored.

 

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

 

Because the partition structure on a disk can change during installation, it is important to be aware of the changes to the partitions on a disk as you are creating your unattended installation answer file.

If you create additional partitions during Windows Setup, `PartitionID` must exactly match the partition that you want to modify. For example, if you add two logical partitions to your disk configuration and then want to modify the last partition, the partition ID of the last partition will have changed from 3 to 5:

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
<td><p><em>Partition_identification_number</em></p></td>
<td><p>Specifies the identification number of the partition on which to install a data image. <em>Partition_identification_number</em> is an integer.</p>
<p>Partition numbering starts with 1 and includes primary and logical partitions but not extended partitions. By default, the first partition on a disk has the value of 1, the second, 2, and so on. If an extended partition is created before a primary partition and then modified to include several logical partitions, this value for primary partitions created later than the extended partition can change, unless these values are set explicitly.</p></td>
</tr>
</tbody>
</table>

 

## Valid Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | [ImageInstall](microsoft-windows-setup-imageinstall.md) | [DataImage](microsoft-windows-setup-imageinstall-dataimage.md) | [InstallTo](microsoft-windows-setup-imageinstall-dataimage-installto.md) | **PartitionID**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

## XML Example


The following XML output shows how to set the `ImageInstall` setting to install both an operating system image and a data image.

``` syntax
<ImageInstall>
    <OSImage>
        <InstallFrom>
            <Credentials>
                <Domain>FabrikamDomain</Domain>
                <Password>MyPassword</Password>
                <Username>MyUsername</Username>
            </Credentials>
            <Path>\\networkshare\share\install.wim</Path>
            <MetaData wcm:action="add">
                <Key>/IMAGE/NAME</Key>
                <Value>FabrikamCustomOSImage</Value>
            </MetaData>
        </InstallFrom>
        <InstallTo>
            <DiskID>0</DiskID>
            <PartitionID>1</PartitionID>
        </InstallTo>
        <WillShowUI>OnError</WillShowUI>
        <InstallToAvailablePartition>false</InstallToAvailablePartition>
    </OSImage>
    <DataImage wcm:action="add">
        <InstallTo>
            <DiskID>0</DiskID>
            <PartitionID>2</PartitionID>
        </InstallTo>
        <InstallFrom>
            <Credentials>
                <Domain>FabrikamDomain</Domain>
                <Password>MyPassword</Password>
                <Username>MyUsername</Username>
            </Credentials>
            <Path>\\networkshare\share\data.wim</Path>
            <MetaData wcm:action="add">
                <Key>/IMAGE/NAME</Key>
                <Value>FabrikamData</Value>
            </MetaData>
        </InstallFrom>
        <Order>1</Order>
    </DataImage>
</ImageInstall>
```

## Related topics


[InstallTo](microsoft-windows-setup-imageinstall-dataimage-installto.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20PartitionID%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





