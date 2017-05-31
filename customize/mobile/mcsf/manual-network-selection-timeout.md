---
title: Manual network selection timeout
description: OEMs can change the default network selection timeout value.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 4ca3a1f4-3bc9-4b3e-b374-f005bb1f0c15
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Manual network selection timeout


OEMs can change the default network selection timeout value. By default, the OS allows the device to register on the manually selected network for 60 seconds (or 1 minute) before it switches back to automatic mode.

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-device** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="ManualNetworkSelectionTimeout"  
                         Description="Use to change the default network selection timeout value."  
                         Owner=""  
                         OwnerType="OEM"> 
      
    <!-- Use for the per-device case

      <Static>  
        <Settings Path="CellCore/PerDevice/General">  
          <Setting Name="ManualNetworkSelectionTimeout" Value="" />
        </Settings>  
      </Static>

    -->

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the `ManualNetworkSelectionTimeout``Value` to a desired timeout value. The range of the value can be from 1-420 seconds. For example, to change the value to 120 seconds (or 2 minutes), you must set the value to 0x78.

    This value is the amount of time that the OS will wait for the modem to register on the manually selected network. If the time lapses and the modem was not able to register on the network that was manually selected by the user, the OS will either:

    -   Switch back to the automatic network selection mode if [Permanent automatic mode](permanent-automatic-mode.md) is enabled and after the user has manually selected a network or the modem was turned on.

    -   Display a dialog that notifies the user that the device was unable to connect to the manually selected network after the device was turned on or after airplane mode was turned off.

<a href="" id="testing-steps-"></a>**Testing steps:**  
**Important**  
To fully test this customization, you must work with your mobile operator partner to perform Steps 2 and 3 in the following procedure.

 

1.  Flash the build that contains this customization to a device that has a UICC.

2.  Ensure that the device is out of range from the home network.

3.  Set the device to the manual network mode by selecting **manual** mode under **Network selection** in the **Settings** &gt; **Cellular & SIM** screen.

4.  While the device attempts to connect to the manually selected network, verify that the OS waits for the amount of time that you specified for `ManualNetworkSelectionTimeout` before it switches back to the automatic network selection mode, or displays a message that indicates that the device was unable to connect to the manually selected network.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Manual%20network%20selection%20timeout%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




