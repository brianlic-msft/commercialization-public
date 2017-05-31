---
title: Path
description: Path
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: aa598368-b826-483d-9833-5dbaa6afd3f9
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Path


`Path` specifies the path to the data image to install. This can be either a local or a network path. If the path is local, no credentials are required.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Path_to_data_image</em></p></td>
<td><p>Specifies the path and the name of the data image to install. <em>Path_to_data_image</em> is a string.</p>
<p>Both local paths and Universal Naming Convention (UNC) paths are supported.</p>
<p>Relative paths are supported, but the name of the file must be specified. The path is relative to the path from where Windows Setup is run.</p>
<p>If the file path cannot be accessed because of an incorrect path or invalid credentials, installation is terminated.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | [ImageInstall](microsoft-windows-setup-imageinstall.md) | [DataImage](microsoft-windows-setup-imageinstall-dataimage.md) | [InstallFrom](microsoft-windows-setup-imageinstall-dataimage-installfrom.md) | **Path**

## Applies To


For a list of the Windows editions and architectures thatthis component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

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

**Relative paths:** In this XML example, the installer has the Windows installation programs, the unattend file, and the data image on a USB drive, which is currently assigned to the letter E. The technician changes the working directory to E: before running Windows Setup.

``` syntax
X:\Windows\System32> E:
E:\> setup.exe /installfrom:".\wims\32bitimage.wim" /unattend:".\autounattend_files\32bit_autounattend.xml"
```

``` syntax
<ImageInstall>
    <DataImage>
        <InstallFrom>
            <Path>.\wims\dataimage.wim</Path>            
            <MetaData wcm:action="add">
                <Key>/IMAGE/INDEX</Key>
                <Value>1</Value>
            </MetaData>
        </InstallFrom>
        <InstallTo>
            <DiskID>0</DiskID>
            <PartitionID>3</PartitionID>
        </InstallTo>
    </DataImage>
</ImageInstall>
```

## Related topics


[InstallFrom](microsoft-windows-setup-imageinstall-dataimage-installfrom.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Path%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





