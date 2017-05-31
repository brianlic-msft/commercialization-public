---
title: ChinaVariantWin10
description: Use ChinaVariantWin10 to specify that the Windows device is intended to ship in China. When enabled, maps approved by the State Bureau of Surveying and Mapping in China are used, which are obtained from a server located in China.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: A15AA62C-9A5A-490E-A5CD-D0A435232664
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# ChinaVariantWin10


Use `ChinaVariantWin10` to specify that the Windows device is intended to ship in China. When enabled, maps approved by the State Bureau of Surveying and Mapping in China are used, which are obtained from a server located in China.

This customization may result in different maps, servers, or other configuration changes on the device.

**Note**  If partners do not set the `ChinaVariantWin10` setting to 1, partners may not ship the device in China.

 

## Values


Set `ChinaVariantWin10` to one of the following values:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>1</p></td>
<td><p>Maps approved by the State Bureau of Surveying and Mapping in China are used and the maps are obtained from a server located in China.</p></td>
</tr>
<tr class="even">
<td><p>0</p></td>
<td><p>Disables the feature.</p>
<p>This is the default OS value.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


specialize

oobeSystem

## Parent Hierarchy


[Microsoft-Windows-MapControl-Desktop](microsoft-windows-mapcontrol.md) | **ChinaVariantWin10**

## Applies to


For the list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-MapControl-Desktop](microsoft-windows-mapcontrol.md).

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20ChinaVariantWin10%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




