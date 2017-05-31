---
title: OSImage
description: OSImage
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 4450e367-9f46-4f5e-92bd-ba7ceb08df7e
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# OSImage


`OSImage` specifies the path and the destination of a Windows image (.wim) file that contains the image to install.

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>

<tr class="even">
<td><p>[InstallFrom](microsoft-windows-setup-imageinstall-osimage-installfrom.md)</p></td>
<td><p>Specifies the path of the .wim file.</p></td>
</tr>
<tr class="odd">
<td><p>[InstallTo](microsoft-windows-setup-imageinstall-osimage-installto.md)</p></td>
<td><p>Specifies the disk and the partition to install the image to.</p></td>
</tr>
<tr class="even">
<td><p>[InstallToAvailablePartition](microsoft-windows-setup-imageinstall-osimage-installto-availablepartition.md)</p></td>
<td><p>Specifies whether to install to the first available bootable partition on a computer that does not already have an installation of Windows.</p></td>
</tr>
<tr class="odd">
<td><p>[WillShowUI](microsoft-windows-setup-imageinstall-osimage-willshowui.md)</p></td>
<td><p>Specifies in what circumstances to show the user interface (UI).</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | [ImageInstall](microsoft-windows-setup-imageinstall.md) | **OSImage**

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


[ImageInstall](microsoft-windows-setup-imageinstall.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20OSImage%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





