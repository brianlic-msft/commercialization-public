---
title: Enable the data connection prompt
description: Partners can set the device to display a dialog that asks for permission to enable the data connection when the user connects the device to a host computer via a USB cable.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b72aa5ac-a192-46bb-bfa8-4abf9296a50d
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Enable the data connection prompt


Partners can set the device to display a dialog that asks for permission to enable the data connection when the user connects the device to a host computer via a USB cable. Partners may need to enable this customization for certain markets.

By default, when the user connects the device to a host computer via a USB cable, the USB data connection is automatically enabled. This means that certain media files on the device, including pictures and music, are accessible through Windows Explorer on the host computer.

This setting is also available to users in the **USB** settings screen.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="USBDataConnection"  
                         Description="Use to display a dialog that asks for permission to enable the data connection when 
                                      the user connects the device to a host computer via a USB cable."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  
        <Settings Path="USBData">  
          <Setting Name="PromptForDataConnection" Value="" />   
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
    <td><p>0</p></td>
    <td><p>When the user connects the device to a host computer via a USB cable, do not display a dialog that asks for permission to enable the data connection. This is the default value.</p></td>
    </tr>
    <tr class="even">
    <td><p>1</p></td>
    <td><p>When the user connects the device to a host computer via a USB cable, display a dialog that asks for permission to enable the data connection.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-"></a>**Testing:**  
1.  Build an image that has this customization enabled, and flash this image to a device.

2.  Connect the device to a host computer using a USB cable.

3.  Confirm that the device displays a dialog that asks for permission to enable the data connection.

4.  Verify that the setting also appears in the **USB** settings screen.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Enable%20the%20data%20connection%20prompt%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




