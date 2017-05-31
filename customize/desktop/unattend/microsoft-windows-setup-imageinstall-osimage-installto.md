---
title: InstallTo
description: InstallTo
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 0c114602-099e-476d-971a-53cead3b51c0
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# InstallTo


`InstallTo` specifies the disk and partition where you install the Windows operating system image.

You must specify valid values for the [DiskID](microsoft-windows-setup-imageinstall-osimage-installto-diskid.md) and [PartitionID](microsoft-windows-setup-imageinstall-osimage-installto-partitionid.md) settings. If you are installing to a blank disk, you must create and format partitions with the [CreatePartitions](microsoft-windows-setup-diskconfiguration-disk-createpartitions.md) and [ModifyPartitions](microsoft-windows-setup-diskconfiguration-disk-modifypartitions.md) settings.

## Comparison of OSImage Settings: InstallTo and InstallToAvailablePartition


For unattended installations, you must specify either the **InstallTo** or the [InstallToAvailablePartition](microsoft-windows-setup-imageinstall-osimage-installto-availablepartition.md) setting.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>microsoft-windows-setup-\ImageInstall\OSImage\InstallTo</p></td>
<td><p>Installs Windows to a specified disk and partition.</p></td>
</tr>
<tr class="even">
<td><p>microsoft-windows-setup-\ImageInstall\OSImage\[InstallToAvailablePartition](microsoft-windows-setup-imageinstall-osimage-installto-availablepartition.md)</p></td>
<td><p>Installs Windows to the first available partition that has enough space and does not already contain an installation of Windows.</p></td>
</tr>
</tbody>
</table>

 

**Note**  
In the **OSImage** setting, if you set the **InstallToAvailablePartition** setting to **true**, do not set the **InstallTo** setting.

If both **InstallToAvailablePartition** and **InstallTo** are set the installation will fail.

 

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[DiskID](microsoft-windows-setup-imageinstall-osimage-installto-diskid.md)</p></td>
<td><p>Specifies the disk identifier of the hard disk on which to install Windows.</p></td>
</tr>
<tr class="even">
<td><p>[PartitionID](microsoft-windows-setup-imageinstall-osimage-installto-partitionid.md)</p></td>
<td><p>Specifies the partition identifier of the partition on which to install Windows.</p></td>
</tr>
</tbody>
</table>

 

## Valid Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | [ImageInstall](microsoft-windows-setup-imageinstall.md) | [OSImage](microsoft-windows-setup-imageinstall-osimage.md) | InstallTo

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

## XML Example


The following XML output shows how to set the **ImageInstall** setting to install both an operating-system image and a data image.

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


[OSImage](microsoft-windows-setup-imageinstall-osimage.md)

[InstallToAvailablePartition](microsoft-windows-setup-imageinstall-osimage-installto-availablepartition.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20InstallTo%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





