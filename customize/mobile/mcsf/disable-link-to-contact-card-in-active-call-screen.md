---
title: Disable link to contact card in active call screen
description: Disable the ability to access a contact's information while in the active call screen.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 3d595e72-644d-4ae8-9d15-44c1d85b4245
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Disable link to contact card in active call screen


Disable the ability to access a contact's information while in the active call screen.

By default, when a user is in the active call screen, the user can tap on the contact's name or phone number while in a phone call to bring up the contact's information card. The contact information card includes information such as the contact's phone numbers, email addresses, and so on.

OEMs can disable this link in the active call screen by setting the **EnableSoftwareProximitySensorMitigation** so that the contact information is not shown while in an active call. For example, if the phone does not have a proximity sensor and the user may accidentally tap the contact name or phone number with their ear during a phone call, disabling the link may be the desired user experience.

The reminders, toasts, and the shutdown curtain also assume that the proximity sensor is covered if the **EnableSoftwareProximitySensorMitigation** setting is set. When the setting is set to 1 or 'True', the device emits a noise (for toasts and reminders if sounds for these events are not silenced), but the screen does not turn on.

<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="SoftwareProximitySensorMitigation"  
                         Description="Use to disable the tappable contact information in the active call screen such as for phones
                                      without a proximity sensor. "  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="Phone/PhoneShellUI">  
          <!-- Set the Value to 0 or 'False' (to disable, default), or set to 1 or 'True' (to enable) -->
          <Setting Name="EnableSoftwareProximitySensorMitigation" Value="" />
        </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set `EnableSoftwareProximitySensorMitigation` to one of the following values:

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
    <td><p>The link to the contact information in the active call screen is enabled. This is the default OS behavior.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'True'</p></td>
    <td><p>The link to the active contact information in the active call screen is disabled.</p>
    <p>If event sounds for toasts and reminders are not turned off, the device emits a noise, but the screen does not turn on.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a phone that has a SIM or UICC.

2.  Open the **Phone** app and call one of your contacts.

3.  In the active call screen, verify the following behaviors depending on the value you set for `EnableSoftwareProximitySensorMitigation`:

    -   If `EnableSoftwareProximitySensorMitigation` is set to 0, verify that the link to the contact information in the active call screen is enabled. If you tap the link, verify that the contact's information card is displayed while the call is ongoing.

    -   If `EnableSoftwareProximitySensorMitigation` is set to 1, verify that the link to the contact information in the active call screen is disabled. If you tap the link, nothing should happen and you should remain in the active call screen.

        If event sounds for toasts and reminders are not turned off, verify that the device emits a noise when a toast or reminder goes off, but the screen does not turn on.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Disable%20link%20to%20contact%20card%20in%20active%20call%20screen%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




