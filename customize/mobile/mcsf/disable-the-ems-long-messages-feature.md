---
title: Disable the EMS long messages feature
description: Partners can disable the enhanced messaging service (EMS), which concatenates text messages so that the user can enter more than 160 characters in a single message.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 73eeb587-2727-4eed-817d-147bb0089c0c
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Disable the EMS long messages feature


Partners can disable the enhanced messaging service (EMS), which concatenates text messages so that the user can enter more than 160 characters in a single message. If EMS is disabled, the user can still enter more than 160 characters. However, the send button is disabled and the UI alerts the user that the text message is too long instead of showing the character count of the text entry.

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-IMSI** value, **per-device** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="DisableEMSLongMessages"  
                         Description="Use to disable the enhnaced messaging service (EMS) long messages feature on Windows Phones. If EMS is disabled, 
                                      users can still enter more than 160 characters, but the send button is disabled and the user sees an alert 
                                      that the message is too long."  
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
          <!-- Set the value to 1 to limit the size of the message to one page and disable EMS. -->       
          <Setting Name="SmsPageLimit" Value="1" />             
        </Settings>  

      </Variant>

    -->

    <!-- Use for the per-device case

      <Static>  
        <Settings Path="CellCore/PerDevice/SMS">  
          <!-- Set the value to 1 to limit the size of the message to one page and disable EMS. -->       
          <Setting Name="SmsPageLimit" Value="1" />         
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

4.  Set `SmsPageLimit` to 1 to limit the size of the message to one page and disable EMS.

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a device with a cellular connection.

2.  Open the messaging application and attempt to send a message with a length that exceeds 160 characters.

3.  Verify that the send button is disabled and that an alert that the text message is too long is showing next to the character count of the text entry.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Disable%20the%20EMS%20long%20messages%20feature%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




