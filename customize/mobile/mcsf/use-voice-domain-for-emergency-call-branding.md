---
title: Use voice domain for emergency call branding
description: To meet mobile operator requirements, OEMs can enable the voice domain to decide whether to use Emergency calls only or No service in the phone UI branding.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b7956175-e79d-4a15-b001-544e474191d4
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Use voice domain for emergency call branding


To meet mobile operator requirements, OEMs can enable the voice domain to decide whether to use **Emergency calls only** or **No service** in the phone UI branding.

<a href="" id="constraints---firstvariationonly"></a>**Constraints:** FirstVariationOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="UseVoiceDomainForEmergencyCallBranding"  
                         Description="Use to let the voice domain decide whether to use 'Emergency calls only' or 'No service' in the
                                      phone UI branding. "  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="Phone/PhoneSettings">  
          <Setting Name="UseVoiceDomainForEmergencyCallBranding" Value="" />
        </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the `UseVoiceDomainForEmergencyCallBranding` setting to one of the following values:

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
    <td><p>The OS inspects the registration state to decide the emergency call branding.</p>
    <p>This is the default OS behavior.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'True'</p></td>
    <td><p>The voice domain decides the emergency call branding.</p></td>
    </tr>
    </tbody>
    </table>

     

    If `UseVoiceDomainForEmergencyCallBranding` is set to 1, the phone will not display **Emergency calls only** in the following cases. Instead, it will display **No service**.

    -   If the system type [RILSYSTEMTYPE] is NONE, which means there is no signal.

    -   If the system type is LTE but there is no voice domain. This situation can occur in these cases:

        -   In LTE networks being used by a non-VoLTE capable device without 3G coverage.

        -   In forbidden LTE networks.

    However, if you do not set `UseVoiceDomainForEmergencyCallBranding` to 1, or the setting is missing, the device may display **Emergency calls only** in the above situations.

<a href="" id="testing-steps-"></a>**Testing steps:**  
Work with your mobile operator partner to test this customization on their network.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Use%20voice%20domain%20for%20emergency%20call%20branding%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




