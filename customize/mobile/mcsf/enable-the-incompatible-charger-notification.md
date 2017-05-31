---
title: Enable the incompatible charger notification
description: Partners can set the device to display a warning when the user connects the device to an incompatible charging source.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 1185f4d5-9bb2-40cc-a4df-82d746b6c2e7
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Enable the incompatible charger notification


Partners can set the device to display a warning when the user connects the device to an incompatible charging source. This warning is intended to notify users that their device may take longer to charge or may not charge at all with the current charging source.

An incompatible charging source is one that does not behave like one of the following port types as defined by the *USB Battery Charging Specification, Revision 1.2*, available on the [USB.org](http://go.microsoft.com/fwlink/p/?LinkID=64124) website:

-   Charging downstream port

-   Standard downstream port

-   Dedicated charging port

This setting is also available to users in the **USB** settings screen.

<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  

    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="USBIncompatibleCharger"  
                         Description="Use to display a dialog notifies the user when the phone is connected to an incompatible charger."  
                         Owner=""  
                         OwnerType="OEM"> 

      <Static>  
        <Settings Path="WeakCharger">  
          <Setting Name="NotifyOnWeakCharger" Value="" />   
        </Settings>  
      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner` value in the customization answer file.

3.  Set the `Value` to one of the following:

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Value</th>
    <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p>0 or 'Disable'</p></td>
    <td><p>Do not display a dialog that notifies the user when the device is connected to an incompatible charger. This is the default value.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Enable'</p></td>
    <td><p>Display a dialog that notifies the user when the device is connected to an incompatible charger.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-"></a>**Testing:**  
1.  Build an image that has this customization enabled, and flash this image to a device.

2.  Connect the device to an incompatible charging source.

3.  Confirm that the device displays a dialog that states that a weak or unsupported USB charger is connected.

4.  Verify that the setting is also available to users in the **USB** settings screen.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Enable%20the%20incompatible%20charger%20notification%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




