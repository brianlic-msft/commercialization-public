---
title: Defining capacitive button behavior
description: For mobile devices that use capacitive buttons, OEMs must add registry values that specify the number of capacitive buttons, the button locations, the button names, and the values to send to the OS when the button is pressed.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 79a26b42-4647-46e3-9b12-ac444091d953
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Defining capacitive button behavior


For mobile devices that use capacitive buttons, OEMs must add registry values that specify the number of capacitive buttons, the button locations, the button names, and the values to send to the OS when the button is pressed. This information enables the OS to treat the capacitive buttons below the screen as touchable targets.

**Note**  
Although OEMs typically configure this behavior by adding a registry value in an INF file that is included in a driver package, this behavior can also be configured via the customization process described below. By using both options, OEMs can define the default behavior in the driver for a specific hardware component, and modify this behavior as necessary in images for different device models that use the same driver.

 

<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="CapButtons"  
                         Description="Use to describe the capacitive button area, names, and behavior."  
                         Owner=""  
                         OwnerType="OEM"> 

      <Static>  

        <Settings Path="Input/Touch/CapButtons">  

          <Setting Name="ButtonCount" Value="" />   
          <Setting Name="ButtonAreaTotal" Value="" />   

          <Setting Name="Name0" Value="" />   
          <Setting Name="VKey0" Value="" />
          <Setting Name="Area0" Value="" />   

          <Setting Name="Name1" Value="" />   
          <Setting Name="VKey1" Value="" />   
          <Setting Name="Area1" Value="" />   

          <Setting Name="Name2" Value="" />   
          <Setting Name="VKey2" Value="" />   
          <Setting Name="Area2" Value="" />   

          <Setting Name="VibrateSupport" Value="" />   
          <Setting Name="VibrateDuration" Value="" />   
          <Setting Name="VibrateIntensity" Value="" />   

        </Settings>  
      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner` value in the customization answer file.

3.  For the `ButtonCount` setting, set the `Value` to the number of capacitive buttons. This must be a value less than or equal to 3. If the device has a combination of capacitive buttons and hardware buttons, this entry should only specify the number of capacitive buttons.

4.  For the `ButtonAreaTotal` setting, set the `Value` to a string that defines the overall capacitive button area beyond the LCD. The string must have the format *ul.x,ul.y lr.x,lr.y*, where *ul* = upper left and *lr* = lower right. For example, `Value="0,1280 768,1390"`.

5.  For each capacitive button, the customization answer file must include a set of `Area`*n*, `Name`*n*, and `VKey`*n* settings, where *n* starts with 0. Configure these settings as described below.

    -   For the `Name`*n* setting, set the `Value` to a string that identifies the current button. The only allowed strings are "Back", "Start", or "Search".

    -   For the `VKey`*n* setting, set the `Value` to the value that is sent to the input pipeline when the current button is pressed. This must be one of the following values.

        <table>
        <colgroup>
        <col width="50%" />
        <col width="50%" />
        </colgroup>
        <thead>
        <tr class="header">
        <th>Button</th>
        <th>Value</th>
        </tr>
        </thead>
        <tbody>
        <tr class="odd">
        <td><p>Back</p></td>
        <td><p>0x1B</p></td>
        </tr>
        <tr class="even">
        <td><p>Start</p></td>
        <td><p>0x71</p></td>
        </tr>
        <tr class="odd">
        <td><p>Search</p></td>
        <td><p>0x72</p></td>
        </tr>
        </tbody>
        </table>

         

    -   For the `Area`*n* setting, set the `Value` to a string that marks the position of the current button. The string must have the format *ul.x,ul.y lr.x,lr.y*, where *ul* = upper left and *lr* = lower right. For example, `Value=" 0,1295 236,1390"`.

6.  If you want to enable the built-in vibration feedback mechanism for the capacitive buttons in the OS, include the `VibrateSupport`, `VibrateDuration`, and `VibrateIntensity` settings and configure them as described below. If you do not want to enable vibration feedback, you can omit these settings from the customization answer file. 

    -   For the `VibrateSupport` setting, set `Value` to one of the following values.

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
        <td><p>Disable vibration feedback. This is the default value.</p></td>
        </tr>
        <tr class="even">
        <td><p>1</p></td>
        <td><p>Enable vibration feedback.</p></td>
        </tr>
        </tbody>
        </table>

         

    -   For the `VibrateDuration` setting, set `Value` to a hexadecimal value between 0 and 1000 in decimal (or 0x0 and 0x3E8 in hexadecimal) that specifies the duration for a vibration, in milliseconds. The following example sets this value to 100.

        ``` syntax
        <Setting Name="VibrateDuration" Value="0x64" />
        ```

    -   For the `VibrateIntensity` setting, set `Value` to a value between 0 and 100 in decimal (or 0x0 and 0x64 in hexadecimal) that specifies the intensity of the vibration. The following example sets this value to 50.

        ``` syntax
        <Setting Name="VibrateIntensity" Value="0x32" />
        ```

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Defining%20capacitive%20button%20behavior%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




