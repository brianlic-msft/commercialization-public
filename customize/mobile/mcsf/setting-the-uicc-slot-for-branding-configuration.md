---
title: Setting the UICC slot for branding configuration
description: OEMs can specify which UICC slot will be used for branding configuration.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 59c4ba6c-e9c7-4982-bebd-3c001bfa733c
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Setting the UICC slot for branding configuration


OEMs can specify which UICC slot will be used for branding configuration.

<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="SetBrandingSlot"  
                         Description="Use to specify which UICC slot to use for branding configuration."
                         Owner=""  
                         OwnerType="OEM"> 

       <Static>

          <Settings Path="Multivariant">  
             <Setting Name="BrandingSlot" Value="" /> 
          </Settings>  

       </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the `BrandingSlot``Value` to use one of the following values depending on which UICC slot you want to use for branding configuration:

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
    <td><p>Slot 0</p></td>
    </tr>
    <tr class="even">
    <td><p>1</p></td>
    <td><p>Slot 1</p></td>
    </tr>
    </tbody>
    </table>

     

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Setting%20the%20UICC%20slot%20for%20branding%20configuration%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




