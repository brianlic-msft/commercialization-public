---
title: Auto brightness
description: This customization allows partners to customize the brightness by specifying The value of brightness when dimming the screen.The ABS millilux range mapping.The ABS intensity percent mapping.The brightness state transition delay (in seconds).
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 022e4dfe-8aed-4aa1-8969-f5812e60ba1b
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Auto brightness


The brightness of a mobile device display changes depending on the level of ambient light. For example, if you are using the device in a darkened movie theater, then walk into the medium light of the theater lobby, and then walk outside into bright sunshine, the brightness adjusts to the different light levels. The transition can be smooth or coarse depending on the capabilities of the brightness hardware. You can specify the light levels at which the brightness changes, the brightness for each of the levels, and the length of the transition period.

By design, the brightness is initially set when the brightness transitions from the OFF to ON state. From this initial setting, the brightness can be increased depending on the level of ambient light, but cannot be decreased. This helps to avoid the perceived flickering on the device as it moves through regions of both high and low ambient light levels. Brightness is reset at the next brightness OFF to ON transition.

The adaptive brightness service monitors ambient light levels by reading the ambient light sensor (ALS). Based on the user’s configuration for manual or automatic brightness settings, adaptive brightness adjusts the display brightness as needed. Adaptive brightness is disabled when the service is idle, by reaching maximum brightness, or by being in manual brightness mode.

The device also monitors the user’s activity from regular input to the device. If that activity stops in a period of time, the device will warn the user that the screen is about to turn off. It does so by changing the brightness of the screen to the value of `DimBrightness` a few seconds ahead of time. If the user touches any button or the screen then the screen brightness is restored and active monitoring resets. If no input is received, the device turns off. The time of activity monitoring can be configured in the **Screen times out after** option in the lock screen settings screen.

This customization allows partners to customize the brightness by specifying:

-   The value of brightness when dimming the screen.

-   The ABS millilux range mapping.

-   The ABS intensity percent mapping.

-   The brightness state transition delay (in seconds).

The value for `ABSRangeMilliLuxMapping` is a list of values, separated by semicolons, that represent the upper bound in the range of ambient light readings measured by the light sensor. The upper bound value is measured in millilux. For example, if `ABSRangeMilliLuxMapping` is set to 100000;500000;MAX, then the three brightness levels for the phone will be 100000 millilux, 500000 millilux, and maximum brightness. Specifying "MAX" in the list of values means that there is no upper bound to the range.

The ABS millilux range mapping and ABS intensity percent mapping are used together to make a table of brightness values. They must have the same number of elements as each other. For example if `ABSRangeMilliLuxMapping` = 100000;500000;MAX and [ABSPercentIntensityMapping](https://msdn.microsoft.com/library/windows/hardware/mt147022) = 33;66;100, the table will look like the following.

<table>
<colgroup>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
</colgroup>
<thead>
<tr class="header">
<th>Range of ambient light readings in millilux</th>
<th>0-100000</th>
<th>100001-500000</th>
<th>500001 or greater</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Brightness</p></td>
<td><p>33%</p></td>
<td><p>66%</p></td>
<td><p>100%</p></td>
</tr>
</tbody>
</table>

 

<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="AutoBrightness"  
                         Description="Use to customize how the device screen adapts to brightness."  
                         Owner=""  
                         OwnerType="OEM"> 
    <Static>
        <Settings Path="AutoBrightness">  
          <!-- The value of brightness used when dimming the screen. The value must be an integer between 0 and 50 inclusive. -->
          <Setting Name="DimBrightness" Value="" /> 

          <!-- The ABS millilux range mapping. Set the value to a range, for example: "100000;500000;MAX". -->
          <Setting Name="ABSRangeMilliLuxMapping" Value="" />

          <!-- The ABS intensity percent mapping. Sample value: "11;68;100". -->
          <Setting Name="ABSPercentIntensityMapping" Value="" />  

          <!-- The brightness state transition delay in seconds. The value must not be less than 2 seconds. Sample value: "5". -->
          <Setting Name="TransitionDelay" Value="" />  
        </Settings>  
    </Static>
    </ImageCustomizations>
    ```

2.  Specify an `Owner` value in the customization answer file.

3.  Set the `Value` for the following settings:

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Setting name</th>
    <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p><code>DimBrightness</code></p></td>
    <td><p>The dim brightness, in percent. The default value is 10.</p></td>
    </tr>
    <tr class="even">
    <td><p><code>ABSRangeMilliLuxMapping</code></p></td>
    <td><p>The ALS mapping values in millilux.</p></td>
    </tr>
    <tr class="odd">
    <td><p><code>ABSPercentIntensityMapping</code></p></td>
    <td><p>The ALS mapping values in percent.</p></td>
    </tr>
    <tr class="even">
    <td><p><code>TransitionDelay</code></p></td>
    <td><p>Delay, in seconds, from when the ambient light changes until the brightness begins its transition. This value has to be greater than or equal to 2. The default value is 5.</p></td>
    </tr>
    </tbody>
    </table>

     

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Auto%20brightness%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




