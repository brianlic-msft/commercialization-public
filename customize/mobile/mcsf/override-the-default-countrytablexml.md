---
title: Override the default CountryTable.xml
description: The mobile runtime configuration package includes a built-in XML file (CountryTable.xml) for mapping between GeoIDs, iso3166 country/region codes, and MCCs.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: e5d9f6f4-846f-4bde-a33f-fb98b573bc18
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Override the default CountryTable.xml


The mobile runtime configuration package includes a built-in XML file (CountryTable.xml) for mapping between GeoIDs, iso3166 country/region codes, and MCCs. Windows uses this table to assist in validating 3-digit MNCs for specific countries/regions, which is done by including an MNC list for that country/region. Otherwise, the OS assumes that MNCs are valid if they are 2 digits.

OEMs can override the default country/region lookup table and instruct the runtime configuration engine to use an OEM-provided mapping table instead.

<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="OverrideDefaultCountryLookup"  
                         Description="Use to override the default country/region lookup table (CountryTable.xml) with the OEM mapping table."
                         Owner=""  
                         OwnerType="OEM"> 

       <Static>

          <Settings Path="Multivariant"> 
             <Setting Name="OverrideDefaultCountryLookup" Value="" /> 
          </Settings>  

       </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the value for `OverrideDefaultCountryLookup` to one of the following values:

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Value</th>
    <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p>0</p></td>
    <td><p>Use the default country/region lookup table, CountryTable.xml, used by the OS.</p></td>
    </tr>
    <tr class="even">
    <td><p>1</p></td>
    <td><p>Override the default country/region lookup table and use an OEM provided mapping table.</p></td>
    </tr>
    </tbody>
    </table>

     

4.  If the value for `OverrideDefaultCountryLookup` is set to 1, the OEM must include their custom countrytable.xml file in a package and place this file in the %systemdrive%\\programs\\commonfiles\\adc\\OEM directory.

    OEMs who provide their own country/region lookup table must use the following format for the XML file:

    ``` syntax
    <countrytable>
       <country mcc="202" iso3166="GR" GeoID="98"/>        <!-- Greece -->
       <country mcc="204" iso3166="NL" GeoID="176"/>       <!-- Netherlands -->
       <!-- And so on -->
       <country mcc="316" iso3166="US" GeoID="244">        <!-- United States-->
          <mnclist>
             <mnc id="010"/>
             <mnc id="011"/>
          </mnclist>
       </country>
       <!-- And so on -->
    </countrytable>
    ```

<a href="" id="testing-"></a>**Testing:**  
Work with your mobile operator partners to test this customization on their networks.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Override%20the%20default%20CountryTable.xml%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




