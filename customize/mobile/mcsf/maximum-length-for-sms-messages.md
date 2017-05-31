---
title: Maximum length for SMS messages
description: Partners can specify a maximum length for SMS messages.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 7a266e23-f514-4b25-9e9c-73fa7b97e1e5
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Maximum length for SMS messages


Partners can specify a maximum length for SMS messages. This requires setting both the maximum number of SMS fragments per SMS message, from 1 to 255, and the maximum size in bytes of each SMS fragment, from 16 to 140 bytes.

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-IMSI** value, **per-device** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="MaxLengthSMS"  
                         Description="Use to configure the maximum length for SMS messages."  
                         Owner=""  
                         OwnerType="OEM"> 
      
    <!-- Use for the per-IMSI case 

      <!-- Define the Targets --> 
      <Targets>
         <Target Id="">
            <TargetState>
               <Condition Name="" Value="" />
               <Condition Name="" Value="" />
            </TargetState>
         </Target>
      </Targets>
      
      <Static>
        <Settings Path="Multivariant">
          <Setting Name="Enable" Value="1" />
        </Settings>
        <Settings Path="AutoDataConfig">
          <Setting Name="Enable" Value="0" />
        </Settings>
      </Static>

      <!-- Specify the Variant -->
      <Variant Name=""> 
        <TargetRefs>
          <TargetRef Id="" /> 
        </TargetRefs>
        <Settings Path="CellCore/PerIMSI/$(__IMSI)/SMS">  
          <Setting Name="SmsFragmentLimit" Value="" />  
          <Setting Name="SmsPageLimit" Value="" />
        </Settings>  
      </Variant>

    -->

    <!-- Use for the per-device case

      <Static>  
        <Settings Path="CellCore/PerDevice/SMS">  
          <Setting Name="SmsFragmentLimit" Value="" />  
          <Setting Name="SmsPageLimit" Value="" />
        </Settings>  
      </Static>

    -->

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Determine if you need to use the **per-IMSI** or **per-device** setting.

    For the **per-IMSI** case:

    1.  Define **Targets** or conditions for when a variant can be applied, such as keying off a SIM's MCC, MNC, and SPN.

    2.  Define settings for a **Variant**, which are applied if the associated target's conditions are met.

4.  Use `SmsFragmentLimit` to set the maximum number of bytes in the user data body of an SMS message. You must set the value between 16 (**0x10**) and 140 (**0x8C**).

5.  Use `SmsPageLimit` to set the maximum number of segments in a concatenated SMS message. You must set the value to 255 (**0xFF**) or smaller.

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a device that contains a UICC or a configured CDMA connection.

2.  Open the messaging application and attempt to send a message with a length that exceeds the combination of `SmsFragmentLimit x SmsPageLimit`.

    You should receive an error message indicating that the message was too long.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Maximum%20length%20for%20SMS%20messages%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




