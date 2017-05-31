---
title: Configuring the duration of the first boot screen
description: If partners specify two boot screens (in addition to the Windows 10 Mobile boot screen), they can modify the duration of the first boot screen.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 6ebecfbf-1bce-42bc-b3ab-25e01cd24f7d
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Configuring the duration of the first boot screen


If partners specify two boot screens (in addition to the Windows 10 Mobile boot screen), they can modify the duration of the first boot screen. We recommend that partners choose a duration for the first boot screen so that the first and second boot screens appear for the same amount of time.

Only the duration of the first OEM-specified boot screen can be modified. The second OEM-specified boot screen appears when first boot screen duration is complete, and it is displayed until the boot process is complete. To determine the duration of the first boot screen, Microsoft recommends that OEMs time the boot process for their hardware, and choose a duration for the first boot screen that results in the first and second boot screens appearing for the same amount of time.

The following table describes the duration of each boot screen when three boot screens are used.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Screen</th>
<th>Duration</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>First boot screen</p></td>
<td><p>By default, this screen is displayed for at least 5 seconds, generally several seconds longer due to firmware and early boot initialization time as described in the following note. This duration is configurable by the OEM. Microsoft recommends that this screen be displayed for at least 2.5 seconds.</p>
<div class="alert">
<strong>Note</strong>  
<p>The first boot screen typically appears for several seconds longer than the duration specified by the OEM, and the OEM should take this into consideration when determining a duration. The OEM-specified duration actually begins with the start of ntoskrnl.exe initialization, and typically the first boot screen actually appears several seconds before ntoskrnl.exe initialization starts.</p>
</div>
<div>
 
</div></td>
</tr>
<tr class="even">
<td><p>Second boot screen</p></td>
<td><p>This screen is displayed from the time the first boot screen is finished until the boot process is complete and the primary display driver can display the third boot screen. This duration is not configurable by the OEM.</p></td>
</tr>
<tr class="odd">
<td><p>Third boot screen (by default, the Windows Phone boot screen)</p></td>
<td><p>During cold boot, this screen is displayed until phone initialization is complete. During warm boot, this screen is displayed for 2.5 seconds.</p></td>
</tr>
</tbody>
</table>

 

For comparison, the following table shows the duration of each boot screen when only two boot screens are used.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Screen</th>
<th>Duration</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>First boot screen</p></td>
<td><p>This screen is displayed until the boot process is complete.</p></td>
</tr>
<tr class="even">
<td><p>Second boot screen (by default, the Windows Phone boot screen)</p></td>
<td><p>During cold boot, this screen is displayed until phone initialization is complete. During warm boot, this screen is displayed for 2.5 seconds.</p></td>
</tr>
</tbody>
</table>

 

<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="FirstBootScreenDuration"  
                         Description="Use to modify the duration of the first boot screen if partners specify an addition to the 
                                     Windows Phone boot screen."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="BootDisplaySettings">  
          <Setting Name="BootUXLogoTransitionTime" Value="" />  
        </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the `BootUXLogoTransitionTime` value to the hexadecimal value of the number of milliseconds to display the first boot screen.

    **Note**  
    Because the associated setting is a REG\_BINARY value, this value must be specified in hexadecimal pairs. For example, if you want to set the value to 1000 milliseconds or 0x03E8 (hexadecimal), you must set the value to "**E8,03**" in your customization answer file. Also note that the actual duration of the first screen may be several seconds longer than the value specified. For more information, see the note in the first table above.

     

## Related topics


[Configuring OEM and mobile operator boot screens](configuring-oem-and-mobile-operator-boot-screens.md)

[Configuring a boot screen to display in the final boot screen slot](configuring-a-boot-screen-to-display-in-the-final-boot-screen-slot.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Configuring%20the%20duration%20of%20the%20first%20boot%20screen%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





