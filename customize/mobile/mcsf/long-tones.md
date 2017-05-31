---
title: Long tones
description: Partners can make a user option visible that makes it possible to toggle between short and long DTMF tones.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 788d595b-7a84-4d63-83dd-c82326f880be
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Long tones


Partners can make a user option visible that makes it possible to toggle between short and long DTMF tones.

By default, the device supports Dual-Tone Multi-frequency (DTMF) with continuous tones.

<a href="" id="constraints---firstvariationonly"></a>**Constraints:** FirstVariationOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="ShowLongTones"  
                         Description="Use to make the user option for toggling between short and long tones visible to users."  
                         Owner=""  
                         OwnerType="OEM"> 

    <Static>

        <Settings Path="Phone/PhoneSettings">  
          <Setting Name="ShowLongTones" Value="" />      
        </Settings>  

    </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set `ShowLongTones` to one of the following values:

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
    <td><p>Hides the user option to make it possible for users to toggle between short and long tones.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or True</p></td>
    <td><p>Shows the user option.</p></td>
    </tr>
    </tbody>
    </table>

     

    By default, the user option for toggling between short and long tones is hidden on GSM phones and visible for CDMA phones.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Long%20tones%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




