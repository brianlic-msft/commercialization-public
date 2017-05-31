---
title: Display CMAS message order
description: Partners can configure the order in which newly received CMAS alert messages are displayed on the device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 4c6fb6f9-7b8e-499f-828d-08c80389d417
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Display CMAS message order


Partners can configure the order in which newly received CMAS alert messages are displayed on the device.

If the device receives at least one CMAS alert message which has not been acknowledged by the user, and another CMAS alert message arrives on the device, partners can configure the order in which the newly received alert messages are displayed on the device regardless of the service category of the alert. Users will not be able to change the display order once it has been set.

If partners do not specify a value for this customization, the default first in/first out (FIFO) display order is used.

Users will be able to acknowledge the messages in the reverse order they were received.

<a href="" id="constraints---firstvariationonly"></a>**Constraints:** FirstVariationOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="DisplayCmasLifo"  
                         Description="Use to configure the order for displaying new CMAS alert messages."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="Messaging/GlobalSettings">  
          <Setting Name="DisplayCmasLifo" Value="" /> 
       </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

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
    <td><p>0 or 'False'</p></td>
    <td><p>Sets a First in/first out (FIFO) message order. Users will not be able to see newer alert messages until they have dismissed the previous alert message(s).</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'True'</p></td>
    <td><p>Sets a Last in/first out (LIFO) message order. Newer alert messages will immediately appear on top of older alert messages.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing Steps:**  
Work with your mobile operator partner to fully test this customization on their network.

Verify that the order in which CMAS alert messages are displayed on the device that contains the customization matches the setting (FIFO or LIFO) that you have specified.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Display%20CMAS%20message%20order%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




