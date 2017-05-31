---
title: Preloaded map data in the user store
description: OEMs can choose a single map region to preload from the multiple regions that are available for OEMs to download from the Microsoft partner site(s) where the Kits are also available.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 86cf1d88-52f0-4f97-8349-b1d95e070848
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Preloaded map data in the user store


Microsoft provides a set of free map data that OEMs can preload on the phone. This data is used by the Maps application and the map control for third-party applications. Microsoft recommends that OEMs make use of this customization, because it greatly improves the performance of the map experience by reducing the requirement for the dynamic download of map data. When a map is preloaded, the phone consumes less cellular data using maps, connectivity is also not required for map browsing, searching, or routing, and users do not have to download the map themselves.

OEMs can choose a single map region to preload from the multiple regions that are available for OEMs to download from the Microsoft partner site(s) where the Kits are also available. OEMs can choose to store this data in the user store. Maps are grouped into regions, but there are some restrictions. For more information about these restrictions, see the accompanying instructions that are part of the map data download on the Microsoft partner site(s).

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample or use the sample PreloadedMapData.xml file.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="PreloadedMapData"  
                         Description="Use to preload map data in the user data store."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

      <!-- Specify map regions to preload in the user data store by setting Source to the 
           source directory location of the map region you want to preload. -->
      <DataAssets Type="MapData">  
        <DataAsset Source="C:\Path\Maps\Europe" />  
        <DataAsset Source="C:\Path\Maps\Asia" />  
        <!-- Add additional DataAsset elements for each map region you want to preload -->
      </DataAssets>

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the **MapData** asset `Source` to the source directory location of the map region you want to include. For example, if *C:\\Path\\Maps\\Europe* contains the downloaded map data that you want to preload, set `Source` to that directory.

    To add additional maps, add a new **DataAsset** setting and set the source to the directory location of the map region you want to include.

**Tip**  
You can avoid wiping preloaded maps off the internal store on the factory line using the [ResetPhoneEx] API. For more information, see [Resetting a phone during manufacturing](https://msdn.microsoft.com/en-us/windows/hardware/commercialize/service/mobile/resetting-the-phone).

 

<a href="" id="testing-"></a>**Testing:**  
1.  Flash a build that contains this customization on a phone.

2.  Launch the Maps application and open Settings from the application bar.

3.  Click on the Download Maps button and verify that the expected region displays under downloaded maps.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Preloaded%20map%20data%20in%20the%20user%20store%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




