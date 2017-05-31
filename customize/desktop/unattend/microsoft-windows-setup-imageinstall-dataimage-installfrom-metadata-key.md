---
title: Key
description: Key
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 59b2d974-083f-4e99-b0d6-a7ae2f8d838e
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Key


`Key` specifies whether the image index, name, or description is used to specify the metadata for an image in a Windows image (.wim) file. For information about using this setting, see [MetaData](microsoft-windows-setup-imageinstall-dataimage-installfrom-metadata.md).

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Values for <code>Key</code></th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>/IMAGE/INDEX</p></td>
<td><p>Uses the index number to select the image to install.</p></td>
</tr>
<tr class="even">
<td><p>/IMAGE/NAME</p></td>
<td><p>Uses the index name to select the image to install.</p></td>
</tr>
<tr class="odd">
<td><p>/IMAGE/DESCRIPTION</p></td>
<td><p>Uses the index description to select the image to install.</p></td>
</tr>
</tbody>
</table>

 

This string type does not support empty elements. Do not create an empty value for this setting.

## Valid Configuration Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | [ImageInstall](microsoft-windows-setup-imageinstall.md) | [DataImage](microsoft-windows-setup-imageinstall-dataimage.md) | [InstallFrom](microsoft-windows-setup-imageinstall-dataimage-installfrom.md) | [MetaData](microsoft-windows-setup-imageinstall-dataimage-installfrom-metadata.md) | **Key**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

## XML Examples


The following XML output shows how to configure the `MetaData` setting to install a specific data image by using the image index value.

``` syntax
            <MetaData wcm:action="add">
                <Key>/IMAGE/INDEX</Key>
                <Value>1</Value>
            </MetaData>
```

The following XML output shows how to configure the `MetaData` setting to install a specific data image using the image name.

``` syntax
            <MetaData wcm:action="add">
                <Key>/IMAGE/NAME</Key>
                <Value>FNB2Drivers</Value>
            </MetaData>

```

The following XML output shows how to configure the `MetaData` setting to install a specific data image by using the image description.

``` syntax
            <MetaData wcm:action="add">
                <Key>/IMAGE/DESCRIPTION</Key>
                <Value>FabriKam Model FNB3 Drivers</Value>
            </MetaData>
```

## Related topics


[MetaData](microsoft-windows-setup-imageinstall-dataimage-installfrom-metadata.md)

[Value](microsoft-windows-setup-imageinstall-dataimage-installfrom-metadata-value.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Key%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





