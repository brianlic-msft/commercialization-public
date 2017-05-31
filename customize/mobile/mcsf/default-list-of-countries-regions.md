---
title: Default list of countries/regions
description: OEMs can select the countries/regions to exclude from the default list shown in the mobile device's Country/Region list in the Settings screen.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 074130F7-E5F3-4FD1-BB64-E20D016AA17D
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Default list of countries/regions


OEMs can select the countries/regions to exclude from the default list shown in the mobile device's **Country/Region** list in the **Settings** screen.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="DefaultRegionsList"  
                         Description="Use to specify list of countries/regions to exclude from Country/Region list."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="Globalization">  
          <Setting Name="ExcludedNations" Value="" />    
       </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the value for `ExcludedNations` to specify the countries/regions that should not show up on the device's **Country/Region** list in the **Region** settings page.

    You can specify the value as a list of semicolon-delimited ISO-3166-1 Alpha2 character codes (no spaces) that should be excluded when enumerating all supported countries with **EnumSystemGeoID**. The entire string must not be larger than 255 characters. The value must have a maximum of 85 codes only. Note that some ISO-3166-1 ALPHA2 codes cover multiple GeoIDs.

    The value for `ExcludedNations` must follow this format: "IO;SJ;AQ;BV;CX;CC;HM;NF;MP;PN;GS;TK;WF;BL;UM"

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash the build containing this customization to a device.

2.  After device setup, go to the **Region** screen in **Settings**.

3.  .

4.  Look at the **Country/Region** list to verify that the countries or regions you specified in `ExcludedNations` are not showing up on the list.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Default%20list%20of%20countries/regions%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




