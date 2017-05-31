---
title: TileColor
description: TileColor
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 3f962288-76b3-4976-9b5a-29e19ebcf6a5
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# TileColor


**Note**  
In Windows 10, this setting and other [HelpAndSupport](microsoft-windows-helpandsupport-helpandsupport.md) settings are deprecated because the Help component that they impact is being retired. Existing information in this topic is provided for reference only.

For more information on how OEMs can include their customer support contact information in the Contact Support App or Support Web page, see [OEMInformation](microsoft-windows-shell-setup-oeminformation.md).

 

`TileColor` specifies the RGB background color of the tile for the Original Equipment Manufacturer (OEM) or organization on the **Help and Support** home page. The [Logo](microsoft-windows-helpandsupport-helpandsupport-logo.md) setting specifies the OEM tile.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>&lt;Integer&gt;</em></p></td>
<td><p>Specifies the integer representation of the background color of the OEM tile on the <strong>Help and Support</strong> home page by using the RGB color model.</p>
<p>The RGB color model is used for specifying colors. This model specifies the intensity of red, green, and blue on a scale of 0 to 255. A 0 indicates the minimum intensity. You can use this formula to convert the settings of the three colors to a single integer value:</p>
<p>RGB value = Red + (Green*256) + (Blue*256*256)</p>
<p>For more information and examples, see [RGB Color Model](http://go.microsoft.com/fwlink/?LinkId=140169).</p>
<p>For the background color to appear, you must also configure the TileColor setting, the [Logo](microsoft-windows-helpandsupport-helpandsupport-logo.md) setting, and the [Manufacturer](microsoft-windows-helpandsupport-helpandsupport-manufacturer.md) setting.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


oobeSystem

specialize

## Parent Hierarchy


[Microsoft-Windows-HelpAndSupport](microsoft-windows-helpandsupport.md) | [HelpAndSupport](microsoft-windows-helpandsupport-helpandsupport.md) | **TileColor**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-HelpAndSupport](microsoft-windows-helpandsupport.md).

## XML Example


The following example shows how to set the background color of the OEM tile on the **Help and Support** page to green.

``` syntax
<Manufacturer>Fabrikam</Manufacturer>
<Logo>C:\Windows\Fabrikam\FabrikamLogo.png</Logo>
<LogoURL>http://www.fabrikam.com/support</LogoURL>
<TileColor>65280</TileColor>
```

## Related topics


[Microsoft-Windows-HelpAndSupport](microsoft-windows-helpandsupport.md)

[Logo](microsoft-windows-helpandsupport-helpandsupport-logo.md)

[Manufacturer](microsoft-windows-helpandsupport-helpandsupport-manufacturer.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20TileColor%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





