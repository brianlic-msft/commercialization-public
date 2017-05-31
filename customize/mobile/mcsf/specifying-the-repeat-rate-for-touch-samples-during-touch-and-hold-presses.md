---
title: Specifying the repeat rate for touch samples during touch-and-hold presses
description: As part of implementing the touch driver, OEMs must determine how to send repeated touch samples to the input reader component in the OS during touch-and-hold presses.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: ae701819-a296-42e2-ab3d-246bb3e603b8
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Specifying the repeat rate for touch samples during touch-and-hold presses


As part of implementing the touch driver, OEMs must determine how to send repeated touch samples to the input reader component in the OS during touch-and-hold presses. OEMs can choose to have the HID touch class driver (TchHID.sys) automatically send duplicate data packets to the input reader component in the OS during touch-and-hold presses, or they can send repeated touch samples from their touch driver. The OEM must add a registry value that tells the OS which implementation they chose, and the repeat rate to use if the OEM chose to have TchHID.sys send duplicate data packets automatically.

Microsoft recommends that OEMs send duplicate touch samples for touch-and-hold presses from their touch driver rather than have TchHID.sys automatically send repeated data packets.

**Note**  
Although OEMs typically configure this behavior by adding a registry value in an INF file that is included in a driver package, this behavior can also be configured via the customization process described below. By using both options, OEMs can define the default behavior in the driver for a specific hardware component, and modify this behavior as necessary in images for different mobile device models that use the same driver.

 

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  

    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="AutoRepeat"  
                         Description="Use to specify the rate at which the HID touch class driver (TchHID.sys) sends duplicate data packets to the input reader component in the OS during touch-and-hold presses."  
                         Owner=""  
                         OwnerType="OEM"> 

      <Static>  

        <Settings Path="Input/Touch/AutoRepeat">  
          <Setting Name="RepeatInterval" Value="" />   
        </Settings>  
      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner` value in the customization answer file.

3.  For the `RepeatInterval` setting, set the `Value` to one of the following values:

    -   If your touch driver sends repeated touch samples to TchHID.sys during touch-and-hold presses, set this to a value of 0.

    -   If instead you want TchHID.sys to automatically send duplicate touch samples to the input reader component during touch-and-hold presses, set this to a value equal to or greater than 1, where the value is the repeat interval for duplicate touch samples in milliseconds.

    -   If you do not set this value, TchHID.sys will automatically send duplicate touch samples to the input reader component at a 50 millisecond interval.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Specifying%20the%20repeat%20rate%20for%20touch%20samples%20during%20touch-and-hold%20presses%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




