---
title: Brightness tuning
description: When the Brightness screen in Settings is not set to automatically adjust, this customization enables the user to select low, medium, and high intensities for the screen brightness.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: eee065a5-4123-4e1e-88cf-f6d04293758e
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Brightness tuning


When the **Brightness** screen in **Settings** is not set to automatically adjust, this customization enables the user to select low, medium, and high intensities for the screen brightness. By default these values are 33%, 66%, and 100% of maximum brightness respectively. OEMS can tune these values so that low intensity is as close to 35 LUX as possible and medium is as close to 200 LUX as possible. High intensity should be the screen's maximum supported brightness.

**Limitations and restrictions:**

-   When the **Brightness** setting is set to automatically adjust, partners must ensure that the brightness table (sometimes called curve) provided for automatic brightness setting contains at least one entry that is less than 33% of the maximum brightness. If this requirement is not met, the behavior of the device when switching to low brightness settings is undefined.

<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="BrightnessTuning"  
                         Description="Use to tune the phone's low, medium, and high brightness settings when 
                                      the brightness is not set to automatically adjust."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="Brightness">  
          <Setting Name="LowBrightnessValue" Value="" /> 
          <Setting Name="MediumBrightnessValue" Value="" />
          <Setting Name="HighBrightnessValue" Value="" />
       </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the brightness percentages. Note that you will have to convert the decimal percentage to hexadecimal and then prepend 0x to the hexadecimal value. For example, if the value is 200 (decimal), the final hexadecimal value must be set to 0xC8.

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Setting</th>
    <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p><code>LowBrightnessValue</code></p></td>
    <td><p>Use to set the low brightness percentage. Low intensity should be as close to 35 LUX as possible.</p></td>
    </tr>
    <tr class="even">
    <td><p><code>MediumBrightnessValue</code></p></td>
    <td><p>Use to set the medium brightness percentage. Medium intensity should be as close to 200 LUX as possible.</p></td>
    </tr>
    <tr class="odd">
    <td><p><code>HighBrightnessValue</code></p></td>
    <td><p>Use to set the high brightness percentage. High intensity should remain 0x64 (100 in decimal) to use the screen's maximum supported brightness.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a phone.

2.  Go to the **theme** screen in **Settings**, and select the **light** background.

3.  Go to the **Brightness** screen in **Settings**, and turn off the **Automatically adjust** option.

4.  Select **low** level, then use a light meter placed over the bottom half of the screen (which is all white) to test the output in LUX. For best results the light sensor should be surrounded by a shroud to block out incidental light. Low should be approximately equivalent to 35 LUX.

5.  Repeat the test by selecting the **medium** level. This should be approximately equivalent to 200 LUX.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Brightness%20tuning%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




