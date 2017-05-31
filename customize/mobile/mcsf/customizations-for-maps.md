---
title: Customizations for maps
description: Describes the customizations that you can configure for maps on the mobile device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: fcb16b44-8000-4913-adec-c564975513ce
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Customizations for maps


Describes the customizations that you can configure for maps on the mobile device.

## In this section


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Topic</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>[Map data on an SD card and map preload](map-data-on-an-sd-card-and-map-preload.md)</p></td>
<td><p>Map data is used by the Maps application and the map control for third-party applications. OEMs can choose to store this data on an SD card, which provides the advantage of saving internal memory space for user data and allows the user to download more offline map data. Microsoft recommends enabling the <strong>UseExternalStorage</strong> setting on phones with less than 8 GB of user storage and has an SD card slot.</p></td>
</tr>
<tr class="even">
<td><p>[Maps for phones shipped in China](maps-for-phones-shipped-in-china.md)</p></td>
<td><p>Microsoft recommends using the new [ChinaVariantWin10](https://msdn.microsoft.com/library/windows/hardware/mt203640) setting instead of this legacy MCSF setting.</p>
<p>For a Windows mobile device shipping in China, partners must specify that the device is intended for that market by configuring <code>ChinaVariant</code> setting. When enabled, maps approved by the State Bureau of Surveying and Mapping in China are used and the maps are obtained from a server located in China.</p></td>
</tr>
<tr class="odd">
<td><p>[Preloaded map data in the user store](preloaded-map-data-in-the-user-store.md)</p></td>
<td><p>OEMs can choose a single map region to preload from the multiple regions that are available for OEMs to download from the Microsoft partner site(s) where the Kits are also available. OEMs can choose to store this data in the user store. Maps are grouped into regions, but there are some restrictions. For more information about these restrictions, see the accompanying instructions that are part of the map data download on the Microsoft partner site(s).</p></td>
</tr>
<tr class="even">
<td><p>[Temporary map data cache size](temporary-map-data-cache-size.md)</p></td>
<td><p>When a user attempts to view map data for a location that was not preloaded or is not already installed on the phone, map data will be downloaded to dynamically render a map. This data is stored in a temporary cache that the Maps application maintains for this purpose. By default this cache is allowed to use a maximum of 128 MB of storage. For phones with a limited amount of available storage, OEMs can specify that the cache only use a maximum of 64 MB of storage. Microsoft recommends that this customization only be used for phones with a limited amount of internal storage space. Reducing the size of the online cache for Map data does not affect the size of the installed (or offline) maps.</p></td>
</tr>
</tbody>
</table>

 

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Customizations%20for%20maps%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




