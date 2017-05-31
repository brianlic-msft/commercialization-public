---
title: Call forwarding
description: Partners can hid the user option for call forwarding.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: aa253358-9422-439f-8202-afb5957279e0
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Call forwarding


Partners can hid the user option for call forwarding.

By default, users can decide whether to turn on call forwarding. Partners can hide this user option so that call forwarding is permanently disabled.

<a href="" id="constraints---firstvariationonly"></a>**Constraints:** FirstVariationOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="HideCallForwarding"  
                         Description="Use to hide user option for call forwarding to users."  
                         Owner=""  
                         OwnerType="OEM"> 
    <Static>
        <Settings Path="Phone/PhoneSettings">  
          <Setting Name="HideCallForwarding" Value="" />      
        </Settings>  
    </Static>
    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set `HideCallForwarding` to one of the following values:

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
    <td><p>0 or False</p></td>
    <td><p>Shows the user option to make it possible for users to forward calls.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or True</p></td>
    <td><p>Hides the user option</p></td>
    </tr>
    </tbody>
    </table>

     

    By default, the hide call forwarding UI is set to 0 or always shown.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Call%20forwarding%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




