---
title: Expiration time for SMS messages
description: Partners can set the expiration time before the device deletes the received parts of a long SMS message.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 502b888a-6545-4be6-af98-5b7939bbd790
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Expiration time for SMS messages


Partners can set the expiration time before the device deletes the received parts of a long SMS message.

For example, if the device is waiting for a three-part SMS message and the first part has been received, the first part will be deleted when the time expires and the other part of the message has not arrived. If the second part of the message arrives before the time expires, the first and second parts of the message will be deleted if the last part does not arrive after the time expires. The expiration time is reset whenever the next part of the long message is received.

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-IMSI** value, **per-device** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample or use the sample SMSExpirationTime.xml file.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="SMSExpirationTime"  
                         Description="Use to set the expiration time before the device deletes the received parts of a long SMS message."  
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
          <Setting Name="MessageExpirySeconds" Value="" />      
               <!-- Default is 0x15180 which is 1 day or 86400 seconds. -->
        </Settings>  

      </Variant>

    -->

    <!-- Use for the per-device case

      <Static>  
        <Settings Path="CellCore/PerDevice/SMS">  
          <Setting Name="MessageExpirySeconds" Value="" />      
               <!-- Default is 0x15180 which is 1 day or 86400 seconds. -->
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

4.  Set `MessageExpirySeconds` to the number seconds that the device should wait before deleting the received parts of a long SMS messages. This value should be in hexadecimal and must be prefixed with 0x.

    The default value is 0x15180, which is equivalent to 1 day or 86,400 seconds.

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a device with a UICC.

2.  From another device, send a long SMS message to the device containing the customization.

3.  Verify that received parts of the long message are deleted within the expiration time that you have set if the next part is not received within that same amount of time.

    **Note**  
    Work with your mobile operator to fully test this customization.

     

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Expiration%20time%20for%20SMS%20messages%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




