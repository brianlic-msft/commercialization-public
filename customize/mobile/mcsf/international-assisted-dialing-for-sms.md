---
title: International assisted dialing for SMS
description: If partners have turned off Assistance for dialing international phone numbers, partners may still override the MCC and MNC used for plus code replacement when sending SMS.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: a634fb89-bb8d-44bd-b5c7-4064828515ec
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# International assisted dialing for SMS


If partners have turned off [Assistance for dialing international phone numbers](assistance-for-dialing-international-phone-numbers.md), partners may still override the MCC and MNC used for plus code replacement when sending SMS. These values are used to generate the correct IDD. This change applies regardless of roaming status. By setting `AssistedDialingMcc` and `AssistedDialingMnc`, international assisted dialing will be enabled for SMS if the user setting for international assisted dialing is enabled.

For devices that support IMS over SMS, partners can override support for the assisted dialing plus (**+**) code for SMS by setting `AssistedDialingPlusCodeSupportOverride`. If enabled, the OS will not convert the plus (**+**) code to the proper assisted number when the user turns on the dialing assist option.

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-SIM** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="SMSAssistedDialing"  
                         Description="Use to override the MCC and MNC used for sending SMS messages."  
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

        <Settings Path="Messaging/PerSimSettings/$(__ICCID)">  
          <Setting Name="AssistedDialingMcc" Value="" />
          <Setting Name="AssistedDialingMnc" Value="" />     

         <!-- For an IMS over SMS supported device, partners can override the assisted dialing plus code support for SMS.
          <Setting Name="AssistedDialingPlusCodeSupportOverride" Value="" />
          -->
        </Settings>  

      </Variant>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Define **Targets** or conditions for when a variant can be applied, such as keying off a SIM's MCC, MNC, and SPN.

4.  Define settings for a **Variant**, which are applied if the associated target's conditions are met.

5.  Set the values for the following settings to enable international assistance dialing for SMS:

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Setting</th>
    <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p><code>AssistedDialingMcc</code> : REG_SZ</p></td>
    <td><p>The Mobile Country Code (MCC) to use for sending SMS.</p></td>
    </tr>
    <tr class="even">
    <td><p><code>AssistedDialingMnc</code> : REG_SZ</p></td>
    <td><p>The Mobile Network Code (MNC) to use for sending SMS.</p></td>
    </tr>
    </tbody>
    </table>

     

6.  For a device that supports IMS over SMS, you can override the support for the assisted dialing plus (**+**) code for SMS. To do this, set `AssistedDialingPlusCodeSupportOverride` to one of the following values:

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
    <td><p>Don't override the assisted dialing plus code support.</p>
    <p>This is the default OS value.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'True'</p></td>
    <td><p>Override the assisted dialing plus code support. The OS will not convert the plus (<strong>+</strong>) code to the proper assisted number when the user turns on the dialing assist option.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing steps:**  
Work with your mobile operator to test this customization on their network.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20International%20assisted%20dialing%20for%20SMS%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




