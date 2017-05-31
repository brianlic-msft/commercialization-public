---
title: Customizations for device management
description: This section provides more information about device management settings that OEMs can change.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 8389d4a3-04b8-4bd5-9079-d6f47d4bc60b
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Customizations for device management


This section provides more information about device management settings that OEMs can change.

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
<td><p>[Enabling runtime configuration](enabling-runtime-configuration.md)</p></td>
<td><p>Runtime configuration, or multivariant, provides a generic mechanism for creating a single image that can work for multiple markets and reduce the number of images that OEMs need to create, manage, and test. By default, runtime configuration is enabled and ADC is turned off. Only one or the other must be turned on. So, if an OEM wants to disable runtime configuration, they must enable ADC.</p>
<p>The OS will handle different scenarios depending on whether runtime configuration has been enabled so OEMs should take into consideration the scenarios they are trying to enable.</p></td>
</tr>
<tr class="even">
<td><p>[Managing runtime configuration data](managing-runtime-configuration-data.md)</p></td>
<td><p>OEMs can configure the following settings to manage the cleanup of runtime configuration data on the mobile device.</p></td>
</tr>
<tr class="odd">
<td><p>[Override the default CountryTable.xml](override-the-default-countrytablexml.md)</p></td>
<td><p>The mobile runtime configuration package includes a built-in XML file (CountryTable.xml) for mapping between GeoIDs, iso3166 country/region codes, and MCCs. Windows uses this table to assist in validating 3-digit MNCs for specific countries/regions, which is done by including an MNC list for that country/region. Otherwise, the OS assumes that MNCs are valid if they are 2 digits.</p>
<p>OEMs can override the default country/region lookup table and instruct the runtime configuration engine to use an OEM-provided mapping table instead.</p></td>
</tr>
<tr class="even">
<td><p>[Setting the UICC slot for branding configuration](setting-the-uicc-slot-for-branding-configuration.md)</p></td>
<td><p>OEMs can specify which UICC slot will be used for branding configuration.</p></td>
</tr>
</tbody>
</table>

 

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Customizations%20for%20device%20management%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




