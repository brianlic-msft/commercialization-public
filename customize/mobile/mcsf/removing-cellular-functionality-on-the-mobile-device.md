---
title: Removing cellular functionality on the mobile device
description: If your mobile device does not support a cellular radio or will not be connected to a cellular network, you can remove all cellular-related functionality from the device's user interface by adding the WIFI\_FEATURE\_PACK feature entry in your OEMInput.xml file.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: EBB722FA-F267-49BB-9F4D-DCA6066ECF54
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Removing cellular functionality on the mobile device


If your mobile device does not support a cellular radio or will not be connected to a cellular network, you can remove all cellular-related functionality from the device's user interface by adding the WIFI\_FEATURE\_PACK feature entry in your OEMInput.xml file. This feature replaces the WEH\_WIFIONLY feature that you previously used in earlier versions of the mobile OS.

The WIFI\_FEATURE\_PACK package reduces memory usage and improves the user experience by removing the non-functioning cellular-related tiles, icons, and settings. Wi-Fi features will continue to work and airplane mode will also work.

<a href="" id="instructions-"></a>**Instructions:**  
**To create an update package for an existing mobile device using Windows 10 Mobile**

1.  Update your OS image using Windows 10 Mobile as your new base image.

2.  Remove the WEH\_WIFIONLY Microsoft Update package if you are upgrading from Windows Embedded Handheld 8.1.

3.  Add the WIFI\_FEATURE\_PACK as a BSP update.

4.  Test, sign, and submit the update.

**To create a new Windows 10 Mobile image without cellular functionality**

1.  Locate the OEMInput.xml file that you are using to define your image.

2.  Find the **Features** section, and within the **Microsoft** child element, review the **Feature** elements.

3.  Add a &lt;Feature&gt;WIFI\_FEATURE\_PACK&lt;/Feature&gt; entry in your OEMInput.xml file.

    ``` syntax
    <Features>
       <Microsoft>
          <Feature>WIFI_FEATURE_PACK</Feature>
       </Microsoft>
    </Features>
    ```

    For more information about other features you can include in your image, see [Optional features for building images](https://msdn.microsoft.com/en-us/windows/hardware/commercialize/manufacture/mobile/optional-features-for-building-images).

4.  Save the updated OEMInput.xml file and build your mobile OS image.

5.  Verify that the new image doesn't contain cellular-related tiles, icons, and settings. Also verify that Wi-Fi features work and airplane mode functions correctly.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Removing%20cellular%20functionality%20on%20the%20mobile%20device%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




