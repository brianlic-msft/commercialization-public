---
title: Welcome home page for Microsoft Edge
description: Welcome home page for Microsoft Edge
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 8a012b90-1150-4ee3-9fa4-b5979cc6f149
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Welcome home page for Microsoft Edge


Partners can set the home page that appears the first time that Microsoft Edge is opened. This page is only shown the first time the browser is opened. After that, the browser displays either the most recently viewed page or an empty page if the user has closed all tabs or opens a new tab.

<a href="" id="constraints---firstvariationonly"></a>**Constraints:** FirstVariationOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample or use the sample WelcomeHomePage.xml file.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="WelcomeHomePage"  
                         Description="Use to set the home page that appears the first time that Microsoft Edge is opened."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  
        <Settings Path="InternetExplorer">  
          <Setting Name="FirstRunUrl" Value="" />
        </Settings>  
      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Specify the `FirstRunUrl``Value` with a valid link that starts with `http://`. It is recommended that you use a forward link that redirects the user to a localized page.

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash a build containing this customization to a phone with a data connection or Wi-Fi connection enabled.

2.  Open Microsoft Edge, and verify that the correct page appears.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Welcome%20home%20page%20for%20Microsoft%20Edge%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




