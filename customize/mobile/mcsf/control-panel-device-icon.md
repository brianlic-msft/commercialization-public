---
title: Control Panel device icon
description: OEMs can change the default icon associated with the phone on a connected computer.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 8a443574-47db-4ef3-b155-9f07fef289bf
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Control Panel device icon


OEMs can change the default icon associated with the phone on a connected computer.

When the user connects a phone to a Windows computer, the phone name and icon shows up in the **Devices and Printers** list. OEMs can change the default icon associated with the phone.

**Limitations and restrictions:**

Create an icon to represent the phone that meets the following specifications:

-   **Filename:** Device.ico

-   **Dimensions, bit level and transparency:**

    256x256: 32bit + Alpha

    48x48: 32bit + Alpha

    48x48: 8bit 256

    48x48: 8bit 16

    32x32: 32bit + Alpha

    32x32: 8bit 256

    32x32: 4bit 16

    24x24: 32bit + Alpha

    24x24: 8bit 256

    24x24: 4bit 16

    16x16: 32bit + Alpha

    16x16: 8bit 256

    16x16: 4bit 16

-   Match the orientation and general creative style of the sample image. To avoid issues associated with the localization of the screen image text, the phone image must depict a phone that is turned off.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="ControlPanelDeviceIcon"  
                         Description="Use to change the icon associated with the phone when connecting to a Windows computer."
                         Owner=""  
                         OwnerType="OEM"> 

       <Static>

          <Settings Path="MediaTransferProtocol/DeviceAssets">  
             <!-- Use to add the icon to represent the phone when connected to a Windows computer. -->
             <Asset Name="DeviceIcon" Source="C:\Path\Device.ico" />
             
             <!-- Use to specify the file name of the device icon to use -->
             <Setting Name="Icon" Value="Device.ico" /> 
          </Settings>  

       </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Add the icon you want to use to represent the phone when connected to a Windows computer. To do this:

    1.  Set the asset `Name` to **DeviceIcon**.

    2.  Specify the file name and location of the asset on your workstation by setting the `Source`.

4.  Set the `Icon` value to the name of your custom icon. For example, *Device.ico*.

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash a build containing this customization to a phone.

2.  On the Windows computer, open **Device Manager** and remove the driver associated with the phone.

3.  Connect the phone to the computer using a USB cable.

4.  On the computer, navigate to the **Devices and Printers** screen. Verify that the phone icon that you included in the build is visible.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Control%20Panel%20device%20icon%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




