---
title: Hide the weak charger notification option UI
description: Partners can configure the device to hide the dialog that is displayed when the user connects the device to an incompatible charging source and hide the USB setting that notifies the user when the device is connected to a slower charger.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 527b9e5a-c6b2-45b9-a5b8-9f9cb5e23bcf
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Hide the weak charger notification option UI


Partners can configure the device to hide the dialog that is displayed when the user connects the device to an incompatible charging source and hide the USB setting that notifies the user when the device is connected to a slower charger.

When this customization is configured, if the device is connected to an incompatible charger, the option to show the **Phone charging slowly** dialog is hidden, and the **Notify me if my mobile device is charging slowly over USB** toggle is hidden.

By default, the OS shows the weak charger notification option UI.

<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="USBHideWeakChargerNotificationUI"  
                         Description="Use to hide the weak charger notification option UI."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="WeakCharger">  
          <Setting Name="HideWeakChargerNotifyOptionUI" Value="" /> 
       </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner` value in the customization answer file.

3.  Set the value for `HideWeakChargerNotifyOptionUI` to one of the following values:

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
    <td><p>0 or 'False'</p></td>
    <td><p>Shows the weak charger notification option UI.</p>
    <p>This is the default OS behavior.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'True'</p></td>
    <td><p>Hides the weak charger notification option UI.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-"></a>**Testing:**  
1.  Build an image that has this customization configured, and flash this image to a device.

2.  Connect the device to an incompatible charging source.

3.  If the weak charger notification UI is suppressed, verify the following behavior:

    -   Confirm that the device does not display the dialog that states that a weak or unsupported USB charger is connected.

    -   Verify that the **Notify me if my mobile device is charging slowly over USB** setting is also hidden to a user in the **USB** settings screen.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Hide%20the%20weak%20charger%20notification%20option%20UI%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




