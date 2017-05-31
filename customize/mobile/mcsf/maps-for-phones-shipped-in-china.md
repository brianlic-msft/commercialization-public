---
title: Maps for phones shipped in China
description: Microsoft recommends using the new ChinaVariantWin10 setting instead of this legacy MCSF setting.For a Windows mobile device shipping in China, partners must specify that the device is intended for that market by configuring ChinaVariant setting.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: d3723ee6-3615-4ebd-bc34-274fe5c2e452
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Maps for phones shipped in China


Microsoft recommends using the new [ChinaVariantWin10](https://msdn.microsoft.com/library/windows/hardware/mt203640) setting instead of this legacy MCSF setting.

For a Windows mobile device shipping in China, partners must specify that the device is intended for that market by configuring `ChinaVariant` setting. When enabled, maps approved by the State Bureau of Surveying and Mapping in China are used and the maps are obtained from a server located in China.

This customization may result in different maps, servers, or other configuration changes on the device.

**Note**  
If partners do not set the `ChinaVariant` setting to 1, partners may not ship the device in China.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample or use the sample MapsForChina.xml file.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="MapsForChina"  
                         Description="Use to specify that the device is instended for shipping in China. When enabled, maps approved by the State Burue of Surveying and Mapping
                                      and mapping in China are used and the maps are obtained froma  server located in China."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  
        <Settings Path="Maps">  

          <!-- Set to 0 or 'No' (to disable), or set to 1 or 'Yes' (to enable maps for China) -->
          <Setting Name="ChinaVariant" Value="" />  

        </Settings>  
      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set `ChinaVariant` to one of the following values:

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
    <td><p>1 or Yes</p></td>
    <td><p>Maps approved by the State Bureau of Surveying and Mapping in China are used and the maps are obtained from a server located in China.</p></td>
    </tr>
    <tr class="even">
    <td><p>0 or No</p></td>
    <td><p>Disables the feature.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a phone with a UICC.

2.  Launch the maps application and verify that the maps used are the same as those approved by the State Bureau of Surveying and Mapping in China.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Maps%20for%20phones%20shipped%20in%20China%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




