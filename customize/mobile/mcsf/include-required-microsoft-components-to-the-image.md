---
title: Include required Microsoft components to the image
description: This customization provides information on how partners can include the required Microsoft components in the OS image.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: B1F6D86A-8E5C-4E4F-ABC5-B3DF59916019
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Include required Microsoft components to the image


This customization provides information on how partners can include the required Microsoft components in the OS image. For more information about other features you can include or exclude from your image, see [Optional features for building images](https://msdn.microsoft.com/en-us/windows/hardware/commercialize/manufacture/mobile/optional-features-for-building-images).

For a comprehensive list of required Microsoft components that must be included in a Windows 10 Mobile image, refer to the *OEM Policy Document (OPD) for Windows 10 Mobile*.

-   For any phone or other device that is submitted for NAL certification in China (excluding Hong Kong SAR and Macau), partners must meet the following requirements:

    -   Do not include the any Skype app, tile, or functionality as part of any Windows 10 Mobile image, including any test images and final images.

    -   Install the MESSAGINGLITE package, which does not contain Skype, on all devices.

-   For any devices other than those listed above for which MESSAGINGLITE is required, partners must install the MESSAGINGGLOBAL package, which contains Skype.

    **Note**  
    The OS selects the correct messaging package to include as part of the image based on different locale and language combinations and sets this as the default selection. OEMs don't need to select the correct messaging package to install, but should make sure that the correct package is chosen to meet the requirements.

     

<a href="" id="instructions-"></a>**Instructions:**  
**To install the Messaging package that does not include Skype integration**

1.  Locate the OEMInput.xml file that you are using to define your image.

2.  Find the **Features** section, and within the **Microsoft** child element, review the **Feature** elements.

3.  Add a &lt;Feature&gt;MESSAGINGLITE&lt;/Feature&gt; entry in your OEMInput.xml file.

    ``` syntax
    <Features>
       <Microsoft>
          <Feature>MESSAGINGLITE</Feature>
       </Microsoft>
    </Features>
    ```

4.  Save the updated OEMInput.xml file and rebuild your OS image.

5.  Verify that the Messaging app does not have Skype integration.

**To install the Messaging package that includes Skype integration**

1.  Locate the OEMInput.xml file that you are using to define your image.

2.  Find the **Features** section, and within the **Microsoft** child element, review the **Feature** elements.

3.  Add a &lt;Feature&gt;MESSAGINGGLOBAL&lt;/Feature&gt; entry in your OEMInput.xml file.

    ``` syntax
    <Features>
       <Microsoft>
          <Feature>MESSAGINGGLOBAL</Feature>
       </Microsoft>
    </Features>
    ```

4.  Save the updated OEMInput.xml file and rebuild your OS image.

5.  Verify that the Messaging app includes Skype integration.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Include%20required%20Microsoft%20components%20to%20the%20image%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




