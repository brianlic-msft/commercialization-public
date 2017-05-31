---
title: Temporary map data cache size
description: When a user attempts to view map data for a location that was not preloaded or is not already installed on the phone, map data will be downloaded to dynamically render a map.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 275fcc7e-257f-4c88-9b52-37e924ab6f64
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Temporary map data cache size


When a user attempts to view map data for a location that was not preloaded or is not already installed on the phone, map data will be downloaded to dynamically render a map. This data is stored in a temporary cache that the Maps application maintains for this purpose. By default this cache is allowed to use a maximum of 128 MB of storage. For phones with a limited amount of available storage, OEMs can specify that the cache only use a maximum of 64 MB of storage. Microsoft recommends that this customization only be used for phones with a limited amount of internal storage space. Reducing the size of the online cache for Map data does not affect the size of the installed (or offline) maps.

<a href="" id="constraints---firstvariationonly"></a>**Constraints:** FirstVariationOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample or use the sample UseSmallerCache.xml file.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  

    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="UseSmallerCache"  
                         Description="Use to reduce the size of the online cache for Map data to a maximum of 64 MB of storage."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  
        <Settings Path="Maps/Storage">  
          <Setting Name="UseSmallerCache" Value="" />  
        </Settings>  
      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set `UseSmallerCache` to one of the following values:

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
    <td><p>Reduces the size of the online cache for Map data to a maximum of 64 MB. This does not affect installed (offline) maps.</p></td>
    </tr>
    <tr class="even">
    <td><p>0 or No</p></td>
    <td><p>Reverts the size of the online cache for Map data to the default maximum of 128 MB.</p></td>
    </tr>
    </tbody>
    </table>

     

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Temporary%20map%20data%20cache%20size%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




