---
title: Custom user agent string for Microsoft Edge
description: The user agent string indicates which browser you are using, its version number, and details about your system, such as operating system and version.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 5ab146be-e7a5-40c5-8dfb-104900a11eba
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Custom user agent string for Microsoft Edge


The user agent string indicates which browser you are using, its version number, and details about your system, such as operating system and version. A web server can use this information to provide content that is tailored for your specific browser and phone.

The user agent string for the browser cannot be modified. By default, the string has the following format:

`Mozilla/5.0 (Windows Phone 10.0; Android 4.2.1; <Manufacturer>; <Device>) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Mobile Safari/537.36 Edge/12.10166`

-   *&lt;Manufacturer&gt;* is automatically replaced with the OEM name. This is the same as the `PhoneManufacturer` setting value that is set as part of the customization [Phone metadata in DeviceTargetingInfo](phone-metadata-in-devicetargetinginfo.md).

-   *&lt;Device&gt;* is replaced with the device name or phone name. This is the same as the `PhoneModelName` setting value that is set as part of the customization [Phone metadata in DeviceTargetingInfo](phone-metadata-in-devicetargetinginfo.md).

**Limitations and restrictions**:

-   The user agent string for the browser cannot be modified outside of the customizations listed above.

-   The user agent type registry setting cannot be modified or used to change the default browser view from Mobile to Desktop.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Custom%20user%20agent%20string%20for%20Microsoft%20Edge%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




