---
title: Warning about light theme for AMOLED and OLED screens
description: OEMs can choose to display a warning about battery life if the user selects the light theme on phones with AMOLED or OLED displays.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: ee78d8e1-adc0-4f19-9491-c6ecc1f0490b
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Warning about light theme for AMOLED and OLED screens


OEMs can choose to display a warning about battery life if the user selects the light theme on phones with AMOLED or OLED displays. This customization is not relevant for other screen types, as there is not a significant power difference between the themes with the light and dark background.

<a href="" id="constraints---firstvariationonly"></a>**Constraints:** FirstVariationOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="OLEDWarning"  
                         Description="Use to display the battery life warning on phones with AMOLED or OLED displays."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="Theme">  
          <Setting Name="OLEDWarning" Value="1" /> 
       </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Do not modify the `Value`.

<a href="" id="testing-"></a>**Testing:**  
1.  Flash an image containing this customization to a phone.

2.  Go to the **Colors** settings screen.

3.  Set the **Choose your mode** option to **Light**.

4.  Verify that the warning text appears above the mode option.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Warning%20about%20light%20theme%20for%20AMOLED%20and%20OLED%20screens%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




