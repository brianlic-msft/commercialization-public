---
title: Configuring a boot screen to display in the final boot screen slot
description: By default, the Windows 10 Mobile logo is displayed as the final boot screen. However, partners can display a different screen for the final boot screen slot. The image must be in .JPG, .JPEG, or .PNG format.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: a84e741c-fae5-48e4-883f-d6b8460140e6
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Configuring a boot screen to display in the final boot screen slot


By default, the Windows 10 Mobile logo is displayed as the final boot screen. However, partners can display a different screen for the final boot screen slot. The image must be in .JPG, .JPEG, or .PNG format.

**Limitations and restrictions:**

-   If partners display a different boot screen for the final slot, the Windows 10 Mobile boot screen must be moved to the first or second slot by following the instructions in [Configuring OEM and mobile operator boot screens](configuring-oem-and-mobile-operator-boot-screens.md). When moving the Windows 10 Mobile boot screen to the first or second slot, partners must use one of the bitmaps available in the Windows 10 Mobile Kit under %WPDKCONTENTROOT%\\WPBootScreens. The Windows 10 Mobile boot screen must not be removed, altered, or replaced.

    **Note**  
    The Windows 10 Mobile Kit provides a different bitmap for each of the supported screen resolutions: 480 × 800, 720 × 1280, 768 × 1280, and 1080 × 1920. OEMs should use the appropriate bitmap for the screen resolution supported by their hardware.

     

-   The amount of time the final boot screen is displayed cannot be configured by the OEM. During cold boot, the final boot screen is displayed until device initialization is complete. During warm boot, the final boot screen is displayed for 2.5 seconds.

-   Logos and images must be owned or licensed by the OEM or mobile operator partner.

-   The final boot screen supports 24-bit-per-pixel bitmaps, and the screen cannot be animated.

-   The bitmap for the final boot screen should match the screen resolution.

-   Support for localization is not included. Images and text should be appropriate for the market in which the device will ship.

-   Additional boot screens must not be added to the startup sequence.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
    Name="CustomBootScreen"  
                         Description="Use to display a different screen for the final boot screen slot."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="BootandShutdownScreens">  
          <Asset Name="BootImage" Source="" />
          <Setting Name="WindowsPhoneBootScreenOverride" Value="" />  
        </Settings>  

      </Static>
    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the `Source` of the `BootImage` asset to the full path and name of the static logo or custom background you want to use when the device shuts down. For example, *C:\\Program Files (x86)\\Windows Kits\\10\\CustomizationAssets\\CustomBootScreen\\CustomLogo.png*.

4.  Set the `WindowsPhoneBootScreenOverride` setting's value to the file name of the custom screen or logo that you just added. In the example, the value is CustomLogo.png.

## Related topics


[Configuring OEM and mobile operator boot screens](configuring-oem-and-mobile-operator-boot-screens.md)

[Configuring the duration of the first boot screen](configuring-the-duration-of-the-first-boot-screen.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Configuring%20a%20boot%20screen%20to%20display%20in%20the%20final%20boot%20screen%20slot%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





