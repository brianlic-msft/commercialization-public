---
title: MetaData
description: MetaData
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 6609701e-b394-4702-ab52-5cbaeb9d4c67
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# MetaData


`MetaData` specifies a Windows edition or image in a Windows image (.wim) file.

Use the [Key](microsoft-windows-setup-imageinstall-osimage-installfrom-metadata-key.md) and [Value](microsoft-windows-setup-imageinstall-osimage-installfrom-metadata-value.md) settings together to select a Windows edition or image based on the index, the name, or the description of the image.

Use the `DISM /Get-ImageInfo` command to determine which images and editions are included on your Windows DVD or Windows image (.wim) file. For instructions on how to select a Windows image using the `MetaData` setting, see the [Best Practices for Image Deployment](http://go.microsoft.com/fwlink/?LinkId=206672) topic in the Windows Assessment and Deployment Kit (Windows ADK) Technical Reference.

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[Key](microsoft-windows-setup-imageinstall-osimage-installfrom-metadata-key.md)</p></td>
<td><p>Specifies whether the image number, name, or description is used to select the image in a .wim file.</p></td>
</tr>
<tr class="even">
<td><p>[Value](microsoft-windows-setup-imageinstall-osimage-installfrom-metadata-value.md)</p></td>
<td><p>Specifies the value of the <code>Key</code> setting.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | [ImageInstall](microsoft-windows-setup-imageinstall.md) | [OSImage](microsoft-windows-setup-imageinstall-osimage.md) | [InstallFrom](microsoft-windows-setup-imageinstall-osimage-installfrom.md) | **MetaData**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

## XML Examples


The following XML output shows how to configure the `ImageInstall` setting to install a specific Windows image from the Windows DVD by using the image index value:

``` syntax
<ImageInstall>
    <OSImage>
        <InstallFrom>
            <MetaData wcm:action="add">
                <Key>/IMAGE/INDEX</Key>
                <Value>2</Value>
            </MetaData>
        </InstallFrom>
        <InstallTo>
            <DiskID>0</DiskID>
            <PartitionID>3</PartitionID>
        </InstallTo>
    </OSImage>
</ImageInstall>
```

The following XML output shows how to configure the `ImageInstall` setting to install a specific Windows image from a custom Windows image file (.wim) located on a network share. Windows Setup selects the image from the LaptopImages.wim file by referencing the image description of a fictional laptop model named "Model FNB1".

``` syntax
<ImageInstall>
    <OSImage>
        <InstallFrom>
            <Credentials>
                <Domain>FabrikamDomain</Domain>
                <Password>MyPassword</Password>
                <Username>MyUsername</Username>
            </Credentials>
            <Path>\\server\share\CustomWindowsImages\LaptopImages.wim</Path>
            <MetaData wcm:action="add">
                <Key>/IMAGE/DESCRIPTION</Key>
                <Value>Model FNB1</Value>
            </MetaData>
        </InstallFrom>
        <InstallTo>
            <DiskID>0</DiskID>
            <PartitionID>3</PartitionID>
        </InstallTo>
        <WillShowUI>OnError</WillShowUI>
        <InstallToAvailablePartition>false</InstallToAvailablePartition>
    </OSImage>
</ImageInstall>
```

## Related topics


[InstallFrom](microsoft-windows-setup-imageinstall-osimage-installfrom.md)

[Key](microsoft-windows-setup-imageinstall-osimage-installfrom-metadata-key.md)

[Value](microsoft-windows-setup-imageinstall-osimage-installfrom-metadata-value.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20MetaData%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





