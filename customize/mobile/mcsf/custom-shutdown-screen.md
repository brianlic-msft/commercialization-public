---
title: Custom shutdown screen
description: Partners can add a static logo or background during shutdown.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 3d7a9467-7330-4896-9baf-5664d74f8875
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Custom shutdown screen


Partners can add a static logo or background during shutdown. Shutdown screen images must be in .JPG, .JPEG, or .PNG format.

The resolution of the custom logo or background image provided by the partner should match the screen resolution of the device. If the image resolution is less than or greater than the screen resolution, the OS will scale the image to fit the screen.

**Limitations and restrictions:**

-   The **goodbye** text shall not be removed, altered, or replaced and the area behind the **goodbye** text must be dark enough for the text to remain legible.

-   Any logos or images used in the shutdown screen shall be owned or licensed by the OEM or mobile operator partner.

-   Partners shall not lengthen the amount of time the shutdown screen is displayed and thereby extend the amount of time it takes for the phone to shut down.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="CustomShutdownScreen"  
                         Description="Use to add a static logo during shutdown."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  
        
        <Settings Path="BootandShutdownScreens">  
          <Asset Name="ShutdownImage" Source="" />
          <Setting Name="WindowsPhoneShutdownScreenOverride" Value="" />  
        </Settings>  

      </Static>
    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the `Source` of the `ShutdownImage` asset to the full path and name of the static logo or custom background you want to use when the phone shuts down. For example, *C:\\Program Files (x86)\\Windows Kits\\10\\CustomizationAssets\\CustomShutdownScreen\\CustomLogo.png*.

4.  Set the value of the `WindowsPhoneShutdownScreenOverride` setting to the file name of the custom screen or logo that you just added. For example, CustomLogo.png.

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash a build containing this customization to a phone.

2.  Go through initial phone setup.

3.  Shut down the phone.

4.  Verify that you can see the **goodbye** text superimposed over your custom static logo or background.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Custom%20shutdown%20screen%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




