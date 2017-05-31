---
title: Map data on an SD card and map preload
description: Map data is used by the Maps application and the map control for third-party applications.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 7b623446-6475-426a-9cf9-46ee48ef1103
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Map data on an SD card and map preload


Map data is used by the Maps application and the map control for third-party applications. OEMs can choose to store this data on an SD card, which provides the advantage of saving internal memory space for user data and allows the user to download more offline map data. Microsoft recommends enabling the **UseExternalStorage** setting on phones with less than 8 GB of user storage and has an SD card slot.

You can use **UseExternalStorage** whether or not you include an SD card with preloaded map data on the phone. If set to 1 (or Yes), the OS only allows the user to download offline maps when an SD card is present. If an SD card is not present, users can still view and cache maps, but they will not be able to download a region of offline maps until an SD card is inserted.

**Important**  
SD card performance can affect the quality of the Maps experience when maps are stored on the SD card. When an SD card is used, Microsoft recommends that OEMs test the Maps experience and the speed of map downloads with the specific SD card part that will be used on retail phones to determine if performance is satisfactory.

<a href="" id="constraints---firstvariationonly"></a>**Constraints:** FirstVariationOnly  
**UseExternalStorage** is a first boot configuration that can be set by the OEM. The OEM cannot change or use this setting after first boot.

<a href="" id="instructions-"></a>**Instructions:**  
Microsoft recommends enabling **UseExternalStorage** on phones with less than 8 GB of user storage and has an SD card slot.

1.  Create a customization answer file using the contents shown in the following code sample or use the sample UseExternalStorage.xml file.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="PreloadedMapData"  
                         Description="Use to preload map data on an SD card."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

      <!-- Enable external storage for map data on an SD card -->
      <Settings Path="Maps/Storage">  
        <Setting Name="UseExternalStorage" Value="" /> 
      </Settings>

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the `Value` to one of the following:

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
    <td><p>0 or No</p></td>
    <td><p>Map data will always be stored on the internal data partition of the device.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or Yes</p></td>
    <td><p>Map data will be stored on an SD card, if present. If an SD card is not present, map data will be stored on the internal data partition of the device. Map region download will also be blocked until an SD card is present.</p></td>
    </tr>
    </tbody>
    </table>

     

4.  If including an SD card with the device, add the preloaded map data to the SD card. Unzip the appropriate map variant data package and copy the “**diskcache**” folder onto the SD card under the `d:\MapData` directory.

    **Note**  
    When unzipping the appropriate map variant data package, you must use a file compression/decompression utility that preserves the file attributes and timestamps. If the utility does not preserve this information, the map(s) will be treated as invalid by the OS.

     

<a href="" id="testing-"></a>**Testing:**  
1.  Flash a build that contains this customization on a phone.

2.  Launch the Maps application and open Settings from the application bar.

3.  Click on the Download Maps button and verify that the expected region displays under downloaded maps.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Map%20data%20on%20an%20SD%20card%20and%20map%20preload%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




