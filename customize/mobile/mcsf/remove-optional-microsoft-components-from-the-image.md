---
title: Remove optional Microsoft components from the image
description: This customization provides information on how partners can remove any of the optional Microsoft components.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 8b02b8c8-353a-445c-af09-070a4fa8cac4
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Remove optional Microsoft components from the image


This customization provides information on how partners can remove any of the optional Microsoft components. For more information about other features you can include or exclude from your image, see [Optional features for building images](https://msdn.microsoft.com/en-us/windows/hardware/commercialize/manufacture/mobile/optional-features-for-building-images).

For a comprehensive list of optional Microsoft components, refer to the *OEM Policy Document (OPD) for Windows 10 Mobile*.

-   Windows 10 Mobile ships with the following optional Microsoft components: Skype Windows Phone Silverlight app, Facebook, MSN Sports, MSN Money, and Continuum.

    An OEM or mobile operator partner may opt-out of installing these optional apps in their final image. Where there is a prepinned Start tile for the replaced optional component, partners must prepin a new Start tile in its place using one of the other Microsoft apps that OEMs can prepin to Start. Partners are encouraged to ship these components as part of their final OS image except in markets where these applications are not allowed.

-   For any phone or other device that is intended to be sold in China, partners must not include any Facebook app or tile provided by Microsoft as part of any Windows 10 Mobile image, including any test images and final images.

<a href="" id="instructions-"></a>**Instructions:**  
**To remove Skype Windows Phone Silverlight app from the OS image**

1.  Locate the OEMInput.xml file that you are using to define your image.

2.  Find the **Features** section, and within the **Microsoft** child element, review the **Feature** elements.

3.  If SKYPE is in the list of optional Microsoft features, delete the **Feature** entry from the list.

    In the following example, the &lt;FEATURE&gt; entry shows what you need to delete from your OEMInput.xml file.

    ``` syntax
    <Features>
       <Microsoft>
          <Feature>SKYPE</Feature>
       </Microsoft>
    </Features>
    ```

4.  Save the updated OEMInput.xml file and rebuild your OS image.

5.  Verify that the Skype Windows Phone Silverlight app is no longer part of the OS image.

**To remove Facebook from the OS image and Start screen**

1.  Locate the OEMInput.xml file that you are using to define your image.

2.  Find the **Features** section, and within the **Microsoft** child element, review the **Feature** elements.

3.  If FACEBOOK is in the list of optional Microsoft features, delete the **Feature** entry from the list.

    In the following example, the &lt;FEATURE&gt; entry shows what you need to delete from your OEMInput.xml file.

    ``` syntax
    <Features>
       <Microsoft>
          <Feature>FACEBOOK</Feature>
       </Microsoft>
    </Features>
    ```

4.  Save the updated OEMInput.xml file and rebuild your OS image.

5.  Verify that Facebook is no longer part of the OS image and does not appear in the Start screen.

    For partners that opt-out of Facebook, partners must prepin a new Start tile in its place using one of the other Microsoft components that OEMs can prepin to Start.

**To remove Continuum from the OS image**

1.  Locate the OEMInput.xml file that you are using to define your image.

2.  Find the **Features** section, and within the **Microsoft** child element, review the **Feature** elements.

3.  If Docking is in the list of optional Microsoft features, delete the **Feature** entry from the list.

    In the following example, the &lt;FEATURE&gt; entry shows what you need to delete from your OEMInput.xml file.

    ``` syntax
    <Features>
       <Microsoft>
          <Feature>Docking</Feature>
       </Microsoft>
    </Features>
    ```

4.  Save the updated OEMInput.xml file and rebuild your OS image.

5.  Verify that Continuum is no longer part of the OS image.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Remove%20optional%20Microsoft%20components%20from%20the%20image%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




