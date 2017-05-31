---
title: InstallToAvailablePartition
description: InstallToAvailablePartition
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: a9f284f6-eb4c-4dde-9003-30ce86bade6b
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# InstallToAvailablePartition


`InstallToAvailablePartition` specifies whether to install the Windows operating system to the first available partition that has enough space and does not already contain an installation of Windows.

If you are installing Windows to a blank disk, you must create and format partitions with the [CreatePartitions](microsoft-windows-setup-diskconfiguration-disk-createpartitions.md) and [ModifyPartitions](microsoft-windows-setup-diskconfiguration-disk-modifypartitions.md) settings, and set one of the partitions as the active partition. After the partitions are created and formatted, using the **InstallToAvailablePartition** setting will select the first available partition with enough space to install Windows.

## Comparison of OSImage Settings: InstallTo and InstallToAvailablePartition


For unattended installations, you must specify either the [InstallTo](microsoft-windows-setup-imageinstall-osimage-installto.md) setting or the **InstallToAvailablePartition** setting.

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
<td><p>microsoft-windows-setup-\ImageInstall\OSImage\InstallToAvailablePartition</p></td>
<td><p>Installs Windows to the first available partition that has enough space and does not already contain an installation of Windows.</p></td>
</tr>
</tbody>
</table>

 

**Note**  
In the [OSImage](microsoft-windows-setup-imageinstall-osimage.md) setting, if you set the **InstallToAvailablePartition** setting to **true**, do not set the **InstallTo** setting.

If both **InstallToAvailablePartition** and **InstallTo** are set the installation will fail.

 

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>true</strong></p></td>
<td><p>Specifies that Windows be installed to the first available partition with enough space.</p>
<p>Windows Setup searches for available partitions starting with disk 0 and partition 1 on the first disk and continuing through all available disks.</p></td>
</tr>
<tr class="even">
<td><p><strong>false</strong></p></td>
<td><p>Specifies that the Windows partition will be specified, by using the Unattend setting: microsoft-windows-setup-\ImageInstall\OSImage\InstallTo.</p>
<p>This is the default value.</p></td>
</tr>
</tbody>
</table>

 

## Valid Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | [ImageInstall](microsoft-windows-setup-imageinstall.md) | [OSImage](microsoft-windows-setup-imageinstall-osimage.md) | InstallToAvailablePartition

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

## XML Example


The following XML output shows how to set the **InstallToAvailablePartition** setting.

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
        <InstallToAvailablePartition>true</InstallToAvailablePartition>
        <WillShowUI>OnError</WillShowUI>
    </OSImage>
</ImageInstall>
```

## Related topics


[OSImage](microsoft-windows-setup-imageinstall-osimage.md)

[InstallTo](microsoft-windows-setup-imageinstall-osimage-installto.md)

[CreatePartitions](microsoft-windows-setup-diskconfiguration-disk-createpartitions.md)

[ModifyPartitions](microsoft-windows-setup-diskconfiguration-disk-modifypartitions.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20InstallToAvailablePartition%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





