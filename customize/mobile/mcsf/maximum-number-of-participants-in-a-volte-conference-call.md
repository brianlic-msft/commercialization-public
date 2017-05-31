---
title: Maximum number of participants in a VoLTE conference call
description: OEMs can specify the maximum number of participants or callers that can be added to a voice over LTE (VoLTE) conference call based on the mobile operator's network requirements.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: dbd7de51-e340-430e-9f6a-84985ef2900b
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Maximum number of participants in a VoLTE conference call


OEMs can specify the maximum number of participants or callers that can be added to a voice over LTE (VoLTE) conference call based on the mobile operator's network requirements.

By default, Windows 10 Mobile supports up to 6-way conference (host + 5 participants) for VoLTE conference calls.

<a href="" id="constraints---firstvariationonly"></a>**Constraints:** FirstVariationOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="VoLTEMaxConferenceCallPartyCount"  
                         Description="Use to set the maximum number of participants in a voice over LTE conference call."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="Phone/PhoneSettings">  
          <Setting Name="ConferenceCallMaximumPartyCount" Value="" />
        </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set the value of `ConferenceCallMaximumPartyCount` the maximum number of participants, including the host, in a VoLTE conference call. Specify the number in decimal or hexadecimal (with the 0x prefix).

    The default OS value is 6.

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash the build containing this customization to a phone.

2.  Work with your mobile operator partner to test this customization on their network.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Maximum%20number%20of%20participants%20in%20a%20VoLTE%20conference%20call%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




