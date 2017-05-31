---
title: CTA app install prompts
description: To meet China Type Approval (CTA) requirements for devices shipping in China, OEMs must show a notification dialog to alert users when the app being downloaded does certain things.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 5c83b11a-82f2-4359-94b3-5945cf807671
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# CTA app install prompts


To meet China Type Approval (CTA) requirements for devices shipping in China, OEMs must show a notification dialog to alert users when the app being downloaded does certain things.

**Note**  This is a legacy mobile setting and is only a requirement for China. It works on phones being upgraded to Windows 10 Mobile, but we recommend that you use the new [CountryCodeForExtendedCapabilityPrompts](https://msdn.microsoft.com/library/windows/hardware/mt219727) Windows provisioning setting instead.

 

The dialog must be shown when the app being downloaded does any of the following:

-   Invokes user data from a phone book

-   Uses recording from the Windows Store

-   Uses location data

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  

    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="CTAAppInstallPrompts"  
                         Description="Use to show a notification dialog to alert users when the app being downloaded invokes data from a 
                                      phone book, uses recording from the Windows Phone Store, or uses location data.
                                      This customization is only a requirement for China."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="Zune/Settings">  
          <Setting Name="RequireExtendedCapabilityPrompts" Value="" />    
       </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the value of `RequireExtendedCapabilityPrompts` to one of the following:

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
    <td><p>1 or 'Yes'</p></td>
    <td><p>Shows a notification dialog when the user downloads an app from the Windows Store that supports the functionality described for the customization.</p></td>
    </tr>
    <tr class="even">
    <td><p>0 or 'No'</p></td>
    <td><p>Disables the feature.</p></td>
    </tr>
    </tbody>
    </table>

     

    If the setting is not set, the feature is not enabled.

<a href="" id="testing-"></a>**Testing:**  
To fully test this customization, the phone must also be configured to use [Windows Store for China](windows-phone-store-for-china.md).

1.  Flash the build containing this customization to a phone.

2.  Go to the Windows Store and download and install an app that can invoke the phone book.

3.  Open the app to access the device's native phone book.

4.  Verify that a notification dialog shows up.

5.  Download another app that uses recording or location data and verify that you see the notification appear when you first run the app.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20CTA%20app%20install%20prompts%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




