---
title: Value
description: Value
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 14569bdd-ebe0-496c-9b44-3092e0f3e90f
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Value


`Value` is used with the setting: [Key](microsoft-windows-setup-imageinstall-osimage-installfrom-metadata-key.md) to choose which Windows image to install from a Windows image file (.wim). Windows image files may contain multiple Windows images. The `Value` may identify a Windows image by its index number, its name, or its description.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Value</em></p></td>
<td><p>Specifies a value for the setting: [Key](microsoft-windows-setup-imageinstall-osimage-installfrom-metadata-key.md).</p>
<p><em>Value</em> is a string.</p></td>
</tr>
</tbody>
</table>

 

This string type does not support empty elements. Do not create an empty value for this setting.

## Valid Configuration Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | [ImageInstall](microsoft-windows-setup-imageinstall.md) | [OSImage](microsoft-windows-setup-imageinstall-osimage.md) | [InstallFrom](microsoft-windows-setup-imageinstall-osimage-installfrom.md) | [MetaData](microsoft-windows-setup-imageinstall-osimage-installfrom-metadata.md) | **Value**

## Applies To


For the list of Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

## XML Examples


The following XML output shows how to configure the `MetaData` setting to install a specific Windows image from a Windows image (.wim) file using the image index value.

``` syntax
            <MetaData wcm:action="add">
                <Key>/IMAGE/INDEX</Key>
                <Value>2</Value>
            </MetaData>
```

The following XML output shows how to configure the `MetaData` setting to install a specific Windows image from a custom Windows image (.wim) file using the image name.

``` syntax
            <MetaData wcm:action="add">
                <Key>/IMAGE/NAME</Key>
                <Value>Model FNB1</Value>
            </MetaData>
```

The following XML output shows how to configure the `MetaData` setting to install a specific Windows image from a custom Windows image (.wim) file using the image description.

``` syntax
            <MetaData wcm:action="add">
                <Key>/IMAGE/DESCRIPTION</Key>
                <Value>Model FNB1</Value>
            </MetaData>
```

## Related topics


[MetaData](microsoft-windows-setup-imageinstall-osimage-installfrom-metadata.md)

[Key](microsoft-windows-setup-imageinstall-osimage-installfrom-metadata-key.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Value%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





