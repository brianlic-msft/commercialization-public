---
title: FM radio frequency band
description: OEMs can change the default setting for the FM radio receiver to use an appropriate frequency for the market in which the device will be sold.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 25166bab-307f-4207-9901-1300d8fbed09
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# FM radio frequency band


OEMs can change the default setting for the FM radio receiver to use an appropriate frequency for the market in which the device will be sold.

**Limitations and restrictions**:

-   Additional frequency bands cannot be added to the device.

-   The user can change the default setting.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="FMRadioRegion"  
                         Description="Use to change the default frequency band for the FM radio receiver."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="FmRadio">  
          <Setting Name="NotPresent" Value="0" />
          <Setting Name="RadioRegion" Value="" /> 
       </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Make sure that `NotPresent` is set to 0 to show the **radio** option in the UI. For more information, see [Showing the FM radio](showing-the-fm-radio.md).

4.  Set `RadioRegion` to specify the default region for the frequency band for the device’s FM radio. Set this to one of the following values:

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
    <td><p>1</p></td>
    <td><p>North America</p></td>
    </tr>
    <tr class="even">
    <td><p>2</p></td>
    <td><p>World</p></td>
    </tr>
    <tr class="odd">
    <td><p>3</p></td>
    <td><p>Japan</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a device.

2.  Open the **radio** app.

3.  In the radio application, verify that the selected region matches the one you specified in `RadioRegion`. To do this, show the context menu by tapping and holding anywhere on the radio screen. In the context menu, tap **settings** to show the settings page.

4.  In the **Settings** page, verify that **Region** is set to the default FM radio region that you selected.

## Related topics


[Showing the FM radio](showing-the-fm-radio.md)


 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20FM%20radio%20frequency%20band%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





