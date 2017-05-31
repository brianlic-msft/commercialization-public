---
title: Describing the physical width and height of the display
description: As part of implementing support for the touch controller hardware, OEMs must add registry values that specify the physical width and height the portion of the screen that is used to render the mobile device UI.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 10455208-3c90-4be3-b805-e1ef03c93a73
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Describing the physical width and height of the display


As part of implementing support for the touch controller hardware, OEMs must add registry values that specify the physical width and height the portion of the screen that is used to render the mobile device UI. The OS uses this information to properly scale touch gestures and help ensure a fluid user experience.

**Note**  
Although OEMs typically configure this behavior by adding a registry value in an INF file that is included in a driver package, this behavior can also be configured via the customization process described below. By using both options, OEMs can define the default behavior in the driver for a specific hardware component, and modify this behavior as necessary in images for different device models that use the same driver.

 

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  

    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="DisplayWidthAndHeight"  
                         Description="Use to specify the physical width and height the portion of the screen that is used to render the phone UI."  
                         Owner=""  
                         OwnerType="OEM"> 

      <Static>  

        <Settings Path="Input/Touch/DisplayProperties">  

          <!-- The following values are in 10's of micrometers. -->
          <Setting Name="DisplayHeight" Value="" />   
          <Setting Name="DisplayWidth" Value="" />   

        </Settings>  
      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner` value in the customization answer file.

3.  For the `DisplayHeight` setting, set the `Value` to the height of the display in 10's of micrometers, formatted as a hexadecimal value. For example, `Value="0x206C"` specifies a height of 83 mm.

4.  For the `DisplayWidth` setting, set the `Value` to the width of the display in 10's of micrometers, formatted as a hexadecimal value. For example, `Value="0x1388"` specifies a width of 50 mm.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Describing%20the%20physical%20width%20and%20height%20of%20the%20display%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




