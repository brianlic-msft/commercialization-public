---
title: Display location icon
description: Partners can hide the location icon in the system tray if they choose.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: e14197b8-43b1-40c5-824d-b648e6bf0406
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Display location icon


Partners can hide the location icon in the system tray if they choose.

By default, the location icon in the system tray is displayed whenever an app requests the user's location. Users may override the setting in the **Location** settings screen.

<a href="" id="constraints---firstvariationonly"></a>**Constraints:** FirstVariationOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="LocationIcon"  
                         Description="Use to configure the display of the location icon in the system tray."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="Shell/SystemTray/Location">  
          <Setting Name="LocationIcon" Value="" />    
       </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the value of `LocationIcon` to one of the following:

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
    <td><p>1 or 'Enabled'</p></td>
    <td><p>Displays the location icon in the system tray. This is the default.</p></td>
    </tr>
    <tr class="even">
    <td><p>0 or 'Disabled'</p></td>
    <td><p>Hides the location icon in the system tray.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash a build containing this customization to a device.

2.  Depending on the value you set for `LocationIcon`, verify if the location icon is displayed or is hidden in the system tray if an app that requests the user's location is launched.

3.  Go to the **Settings** &gt; **Location** screen. Change the value of the **Show icon** option and verify if the location icon is displayed or is hidden from the system tray based on the setting you chose.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Display%20location%20icon%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




