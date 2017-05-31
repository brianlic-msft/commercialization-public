---
title: Hardware keyboard character repeats hold time and delay
description: For devices that have a hardware keyboard, partners can optionally set the character repeat hold time and delay.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: ca578835-2c73-4aa9-865f-d8ed51c62b1c
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Hardware keyboard character repeats hold time and delay


For devices that have a hardware keyboard, partners can optionally set the character repeat hold time and delay.

The optional keyboard customizations are:

-   The amount of time, in milliseconds, the user must hold down a key before the keyboard character repeats.

-   The amount of time, in milliseconds, to use as the delay between each keyboard character repeats.

<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="HardwareKeyboardSettings"  
                         Description="Use to configure the settings for the hardware keyboard character repeats hold time and delay"  
                         Owner=""  
                         OwnerType="OEM"> 
      <Static>  
        <Settings Path="TextInput/HardwareKeyboard">  
          <Setting Name="AutoRepeatInitialDelay" Value="" />
          <Setting Name="KeyRepeatRate" Value="" />
        </Settings>  
      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  To specify the amount of time that the user must hold down a key before the keyboard character repeats, set the value for the `AutoRepeatInitialDelay` setting. The value is in milliseconds.

4.  To specify the amount of time to use as the delay between each keyboard character repeats, set the value for the `KeyRepeatRate` setting. The value is in milliseconds.

<a href="" id="testing-steps-"></a>**Testing Steps:**  
1.  Flash the build containing this customization to a phone with a hardware keyboard.

2.  Set up the phone. Press and hold down the same keyboard key. Verify that the amount of time needed to hold down a key before the keyboard character repeats corresponds to the value that you set. Also verify that the delay between each character repeat is equivalent to the value that you set.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Hardware%20keyboard%20character%20repeats%20hold%20time%20and%20delay%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




