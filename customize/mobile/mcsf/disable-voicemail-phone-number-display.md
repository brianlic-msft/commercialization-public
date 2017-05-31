---
title: Disable voicemail phone number display
description: Disable voicemail phone number display on the call progress screen.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 6427c974-8def-4d7f-92db-9329e2b213d6
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Disable voicemail phone number display


Disable voicemail phone number display on the call progress screen.

By default, when a user calls the voicemail number, the number dialed is displayed below the **Voicemail** label on the call progress screen. If the user enters a phone number directly using the keypad, the actual number dialed (and displayed on the call progress screen) may differ from what the user entered and may potentially cause confusion. To address possible user confusion, partners can control whether the dialed voicemail phone number is displayed below the **Voicemail** label on the call progress screen.

<a href="" id="constraints---firstvariationonly"></a>**Constraints:** FirstVariationOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="DisableVoicemailPhoneNumberDisplay"  
                         Description="Use to either display or hide the voicemail phone number displayed in the call progress screen."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  
        <Settings Path="Phone/PhoneSettings">  
          <Setting Name="DisableVoicemailPhoneNumberDisplay" Value="" />
        </Settings>  
      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the `DisableVoicemailPhoneNumberDisplay` setting to one of the following values:

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
    <td><p>0 or 'False'</p></td>
    <td><p>Shows the phone number below the <strong>Voicemail</strong> label on the call progress screen.</p>
    <p>This is the default OS behavior.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'True'</p></td>
    <td><p>Hides the phone number below the <strong>Voicemail</strong> label on the call progress screen.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash the build containing this customization to a phone that has a UICC or SIM.

2.  Open the phone app.

3.  Call the voicemail either by pressing and holding "1" from the keypad screen, tapping the voicemail icon, or calling the voicemail number directly.

4.  Depending on the value that you set for `DisableVoicemailPhoneNumberDisplay`, verify that the voicemail phone number is either displayed or hidden below the **Voicemail** label on the call progress screen.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Disable%20voicemail%20phone%20number%20display%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




