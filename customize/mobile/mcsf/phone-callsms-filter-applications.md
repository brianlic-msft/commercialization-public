---
title: Phone call/SMS filter applications
description: OEMs can build and register a phone call/SMS filter application, which helps reduce the number of unwanted phone calls and text messages that users receive.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 147b86c0-9e6c-4679-81d5-94ae0b4c365d
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Phone call/SMS filter applications


OEMs can build and register a phone call/SMS filter application, which helps reduce the number of unwanted phone calls and text messages that users receive. This application must be preloaded on the phone as a Settings/CPL application.

**Limitations and restrictions:**

-   The OEM application shall be a CPL/Settings application.

-   The OEM application shall have a privacy policy that is presented to the user before the user enables filtering, and also is available from the application, for example, a *Privacy policy* or *About* link. Furthermore, the application shall not send any of the information from the user (including phone numbers, dates of communication, text messages, and so on) off the device or to any other application or service which might do so.

-   The user shall explicitly enable filtering in order to begin filtering calls and/or SMS messages. Additionally, the application must provide a way for the user to disable filtering.

-   The application shall indicate to the user that no MMS or IM messages will be blocked, and that the user may still be charged for blocked SMS or blocked phone calls.

-   The OEM application shall show blocked calls when launched from the **blocked calls** screen and must show blocked messages when launched from the **blocked messages** screen. Additionally, the OEM application shall require the user to explicitly consent to block or unblock a number when launched from the **block number...** option.

<a href="" id="constraints---firstvariationonly"></a>**Constraints:** FirstVariationOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a phone call/SMS filter application. 

2.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="PhoneCallSMSFilterApp"  
                         Description="Use to preload and configure your phone call/SMS filter application."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  
        <!-- Preload the phone call/SMS filter app. Specify the source, license, and ProvXML files. -->
        <Applications>
          <Application Source=""
                       License=""
                       ProvXML="" />
        </Applications>

        <Settings Path="Phone/PhoneSmsFilter">  
          <!-- Specify the app ID or GUID for your phone call/SMS filter app. 
               The format looks like {12345678-1234-1234-1234-123456781234} -->
          <Setting Name="AppId" Value="" />  
        </Settings>  
      </Static>

    </ImageCustomizations>
    ```

3.  Specify an `Owner`.

4.  To preload the phone call/SMS filter application, add an **Applications** parent element and add an **Application** child element to correspond to the phone call/SMS filter app that you are preloading. For the **Application**, specify the `Source` (.xap), `License`, and `ProvXML` files that correspond to app.

5.  Set the value of `AppId` to the app ID or GUID for your phone call/SMS filter app. The value must be in the format *{12345678-1234-1234-1234-123456781234}*.

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash the build containing this customization to a device. The phone call/SMS filter application will be pre-installed as a settings/CPL app.

2.  After the device has finished initial setup, launch the OEM CPL app.

3.  In the phone call/SMS filter app, verify the following:

    -   The privacy policy shows up as expected and the user is requested to approve.

    -   The user is prompted if they would like to begin filtering.

4.  Depending on your implementation, verify that the app can do the following:

    -   Recognize the phone numbers of blocked incoming calls.

    -   Recognize the phone number and message from an incoming SMS.

    -   Add or remove phone numbers from the blocked list.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Phone%20call/SMS%20filter%20applications%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




