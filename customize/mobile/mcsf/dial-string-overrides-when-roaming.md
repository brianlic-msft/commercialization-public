---
title: Dial string overrides when roaming
description: Partners can map certain dial strings to corresponding override numbers that are dialed when the user is roaming. To the user, it will appear as if the original number was dialed.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: c6c69319-b150-4dad-9d66-cee29d908ee4
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Dial string overrides when roaming


Partners can map certain dial strings to corresponding override numbers that are dialed when the user is roaming. To the user, it will appear as if the original number was dialed.

The mappings are customizable and stored in the registry. All roaming override dial strings are organized under a single registry key as name-data pairs. The OS uses the dialed string as the registry name to query and the associated data as the override number to be dialed.

**Design requirements and considerations**:

-   Partners must specify override numbers in full international format, including a leading **+**. The numbers are dialed as-is on 3GPP and the **+** is converted to the appropriate prefix on 3GPP2.

-   Dial string translation is only performed when the phone is roaming.

-   Partners may specify override numbers with `&lt;SUB&gt;` to represent the subscriber number. The first instance of `&lt;SUB&gt;` in an override number is replaced with the subscriber number. Partners cannot specify `&lt;SUB&gt;` as part of a dial string to search for.

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-IMSI** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="DialStringOverrides"  
                         Description="Use to map certain dial strings to corresponding override numbers that are dialed when the user is roaming."  
                         Owner=""  
                         OwnerType="OEM"> 

      
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

        <Settings Path="Phone/PerSimSettings/$(__IMSI)/RoamingNumberOverrides">  
          <Setting Name="DialString/$(DialString)" Value="" />      
          <Setting Name="DialString/$(DialString)" Value="" />      
          <Setting Name="DialString/$(DialString)" Value="" />      
          <Setting Name="DialString/$(DialString)" Value="" />      
        </Settings>  

      </Variant>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  For the **per-IMSI** case:

    1.  Define **Targets** or conditions for when a variant can be applied, such as keying off a SIM's MCC, MNC, and SPN.

    2.  Define settings for a **Variant**, which are applied if the associated target's conditions are met.

4.  Determine the number of dial string overrides you need to configure. For each dial string:

    1.  Replace *$(DialString)* in the settings name with the name of the dial string or number that the user will dial when roaming. For example, if the user will dial \*611, set the setting name to:

        ``` syntax
              <Setting Name="DialString/*611" Value="" />
        ```

    2.  Set the setting value to the override number or number that the dial string is translated into. This corresponds to the number that is actually called. For example, if the user dials \*611 and the number that must be called whenever the user dials \*611 is +18001234567, set the value as shown in the following example:

        ``` syntax
              <Setting Name="DialString/*611" Value="+18001234567" />
        ```

    The following example shows how to create a mapping for two dial strings, \*611 and \*86:

    ``` syntax
        <Settings Path="Phone/PerSimSettings/$(__IMSI)/RoamingNumberOverrides">  
          <Setting Name="DialString/*611" Value="+18001234567" />      
          <Setting Name="DialString/*86" Value="+1&lt;SUB&gt;" />      
        </Settings>  
    ```

    In the preceding example:

    -   \*611 is the dial string and +18001234567 is the override number. The user dials \*611 and the number that is actually called is +18001234567.

    -   \*86 is the dial string and +1&lt;SUB&gt; is the override number. The user dials \*86 and the number that is actually called is +1 and the subscriber’s number.

<a href="" id="testing-"></a>**Testing:**  
To verify this customization, the phone must be roaming internationally. Work with your mobile operator partner to test this customization on their network.

1.  Flash the build containing this customization to a phone.

2.  Dial the numbers that you specified and verify that numbers that are actually called are the override numbers that you specified for each dial string.

    Verify that the override numbers are not shown on the phone when the dial strings are called.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Dial%20string%20overrides%20when%20roaming%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




