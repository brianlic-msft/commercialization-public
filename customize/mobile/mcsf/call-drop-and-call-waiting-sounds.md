---
title: Call drop and call waiting sounds
description: OEMs can customize the call drop and call waiting sounds.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 35849a27-a4eb-4e0a-82f9-00b100b29f60
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Call drop and call waiting sounds


OEMs can customize the call drop and call waiting sounds.

On devices that exhibit a loud snap or tone during a phone call, OEMs can customize these sounds to add 50 ms of silence and improve the user experience. When used for this purpose, OEMs must:

-   Add a sound file that contains 50 ms of silence. The sound file must be in a .wma format.

-   Set the registry settings to the name of the sound file. This removes the loud snap or tone heard during some phone calls.

<a href="" id="constraints---firstvariationonly"></a>**Constraints:** FirstVariationOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>

    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="CallDropCallWaitingSounds"  
                         Description="Use to customize the call drop and call waiting sounds."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="EventSounds">  
          <!-- Use to add the OEM sound file. Change the Source path to poitn to the location and file name of the .wma sound file. -->
          <Asset Name="NotificationSounds" Source="" />
          <Asset Name="NotificationSounds" Source="" />

          <!-- Use to set the default call drop sound. Set the value to the file name of the sound file. -->
          <Setting Name="DefaultCallDropSound" Value="" /> 

          <!-- Use to set the default call waiting sound. Set the value to the file name of the sound file. -->
          <Setting Name="DefaultCallWaitingSound" Value="" /> 
        </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Add additional notification sounds by adding a `NotificationSounds` asset. To do this:

    -   Set the asset's `Name` to `NotificationSounds`.

    -   Set `Source` to the full path to the call drop sound file on your development machine. For example: *C:\\Path\\CallDropSound.wma*.

    -   Repeat the previous steps for any additional ringtone sound, such as if you are using a different sound file for the call waiting sound.

4.  Set the value of `DefaultCallDropSound` to the desired default ringtone sound file name. For example: *CallDropSound.wma*.

5.  Set the value of `DefaultCallWaitingSound` to the desired default ringtone sound file name. For example: *CallWaitingSound.wma*.

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build that contains this customization to a device.

2.  Receive or make a phone call.

3.  Verify that a loud snap or tone is no longer heard.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Call%20drop%20and%20call%20waiting%20sounds%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




