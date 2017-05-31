---
title: Branding for phone calls
description: Partners can add a custom image that displays the mobile operator name or logo on the Incoming Call screen.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 470bc072-f0a2-43de-ab7c-5c423811220b
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Branding for phone calls


Partners can add a custom image that displays the mobile operator name or logo on the **Incoming Call** screen. This image can be hidden when the device is roaming.

Note that the **Call Progress** screen, **Call History** screen, the 12-key dialer, and the phone tile on the Start page display the PLMN string of the mobile operator, but this is not customizable. It is possible to display error messages about the registration status on these components if an invalid UICC is inserted. Alternately, partners can choose to display a longer version of the error messages that includes a reject code.

VoIP applications can also add a custom image that displays the mobile operator name and logo to the Incoming Call screen.

The custom image must meet the following requirements:

-   .PNG format

-   40 px high and no more than 180 px wide

-   Transparent background

-   White logo – This can contain text or an image, but keep in mind that the image is not localized, and so any text should work regardless of the display language.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="BrandingForPhoneCalls"  
                         Description="Use to add a custom image that displays the mobile operator name or logo on the Incoming Call screen."
                         Owner=""  
                         OwnerType="OEM"> 

       <Static>

          <Settings Path="Phone/BrandingInformation">  
             <Asset Name="BrandingImages" Source="C:\Path\BrandingImagePhoneScreens.png" />
             <Setting Name="CellularBrandingImagePath" Value="BrandingImagePhoneScreens.png" /> 
             <Setting Name="BrandingFlags" Value="" /> 
          </Settings>  

       </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Add the custom branding image. To do this:

    1.  Add an **Asset** element and set the `Name` to BrandingImages.

    2.  Set the asset's **Source** value to the location and name of the custom .png file. For example: *C:\\Path\\BrandingImagePhoneScreens.png*

4.  Set the value of `CellularBrandingImagePath` to the name of the custom .png file. For example: *BrandingImagePhoneScreens.png*

5.  Specify when the branding image should be displayed or display registration status and reject codes in the phone UI by setting the value of `BrandingFlags`.

    The default value of the `BrandingFlags` setting is 0x000000FB. This value can be replaced by a bit-wise **OR** of the following flags:

    <table>
    <colgroup>
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Flag</th>
    <th>Value</th>
    <th>Set by default</th>
    <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p>ShowBrandingImage</p></td>
    <td><p>0x00000001</p></td>
    <td><p>Yes</p></td>
    <td><p>Display the branding image for all non-roaming phone calls.</p></td>
    </tr>
    <tr class="even">
    <td><p>HideBrandingImageOnRoam</p></td>
    <td><p>0x00000002</p></td>
    <td><p>Yes</p></td>
    <td><p>Do not display the branding image when the phone is roaming.</p></td>
    </tr>
    <tr class="odd">
    <td><p>DisplayEmergencyCallStatus</p></td>
    <td><p>0x00000004</p></td>
    <td><p>No</p></td>
    <td><p>For markets in which the user must be aware that emergency calls are always permitted, partners can turn on a user notification that emergency calls are still possible even if there is no SIM, the SIM is currently blocked, or the SIM is invalid.</p>
    <p>Setting this flag changes the phone branding from SIM state (No SIM, Invalid SIM, PIN required) to emergency possibility state (emergency only versus no service). In the call history page, the progress and dialer where a longer string is possible, the SIM state is appended to the emergency possibility state.</p>
    <p>This customization replaces the “No SIM” warning on the phone tile, the call history page, and the dialer with a longer message <strong>Emergency only</strong> on the phone tile, and <strong>No SIM – Emergency calls only</strong> on the dialer and call history page.</p>
    <p>When the phone does not have a SIM and there is no service, the phone displays <strong>No SIM – No Service</strong> on the call history, call progress, and the dialer. The phone token shows <strong>No service</strong> in this scenario.</p></td>
    </tr>
    <tr class="even">
    <td><p>ShowRegistrationStatusInCallHistory</p>
    <p>ShowRegistrationStatusInCallProgress</p>
    <p>ShowRegistrationStatusInDialer</p>
    <p>ShowRegistrationStatusInIncomingCall</p>
    <p>ShowRegistrationStatusInPhoneToken</p></td>
    <td><p>0x00000008</p>
    <p>0x00000010</p>
    <p>0x00000020</p>
    <p>0x00000040</p>
    <p>0x00000080</p></td>
    <td><p>Yes</p></td>
    <td><p>Display the registration status on different parts of the phone call UI when the operator name is not available because the network cannot be accessed or the SIM is locked or missing.</p>
    <p>When the flags are not set, the string <strong>Phone</strong> is used as the branding text.</p></td>
    </tr>
    <tr class="odd">
    <td><p>ExtendedRejectCodes</p></td>
    <td><p>0x00000100</p></td>
    <td><p>No</p></td>
    <td><p>Display extended reject codes in error cases such as when the UICC is not provisioned or not allowed.</p>
    <p>To fully enable this functionality, you must also configure [Extended error messages for reject codes](extended-error-messages-for-reject-codes.md).</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash a build containing this customization to a phone that contains a UICC, or that is otherwise equipped to receive phone calls.

2.  Depending on the flags you set, verify that the branding image appears appropriately on the Incoming Call screen. The branding image is added as an overlay on top of the contact image.

3.  If you set `DisplayEmergencyCallStatus`, verify that the image is visible during emergency calls.

4.  Remove the UICC.

5.  Depending on the flags you set, verify that the registration status appears appropriately on the Call History, Call Progress, and Incoming Call screens, as well as the dialer and the phone tile.

6.  If you set `ExtendedRejectCodes`, verify that messages that are displayed to alert the user that they cannot make calls include reject codes. For information about which screens are affected, see [Extended error messages for reject codes](extended-error-messages-for-reject-codes.md).

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Branding%20for%20phone%20calls%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




