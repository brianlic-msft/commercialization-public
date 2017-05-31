---
title: SMS encoding
description: Partners can change the default GSM 7-bit code page decoding and encoding, and can also extend the set of supported SMS encodings by setting an \ 0034;always-on \ 0034; GSM 7-bit shift table, adding encoders, and adding decoders.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: db44b70d-a887-4452-83da-4efae141f088
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# SMS encoding


Partners can change the default GSM 7-bit code page decoding and encoding, and can also extend the set of supported SMS encodings by setting an "always-on" GSM 7-bit shift table, adding encoders, and adding decoders.

Using augmented NLS encodings, Windows 10 Mobile supports the following SMS encodings, as defined in the [3GPP TS 23.038](http://go.microsoft.com/fwlink/p/?LinkId=259778) specification:

-   7-bit ASCII (used on 3GPP2 only)

-   GSM 7-bit encoding

    -   Default alphabet

    -   GSM with Single Shift for Spanish

    -   GSM with Single Shift for Portuguese

    -   GSM with Single Shift for Turkish

-   UCS2

-   KSC 5601

-   Shift-JIS

-   SMS Greek Reduction

-   Other binary data encoding usage

By default, Windows 10 Mobile supports the GSM 7-bit default alphabet table. Partners do not need to set a registry key to support this. However, partners can change the default GSM 7-bit code page to decode and encode all incoming and outgoing SMS messages by using `GSM7BitEncodingPage` and setting this to one of the allowed values. See the following instructions for more information on how to do this.

Partners can change the default GSM 7-bit encoding to one of the other supported SMS encodings by setting the appropriate registry setting. See the following instructions for more information on how to do this.

OEMs can also extend the set of supported SMS encodings by setting an "always-on" GSM 7-bit shift table, adding encoders, and adding decoders. For more information, see [Add encoding extension tables for SMS](add-encoding-extension-tables-for-sms.md).

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-IMSI** value, **per-device** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="SMSEncoding"  
                         Description="Use to configure the SMS encoding settings."  
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
          <Setting Name="Encodings/GSM7BitEncodingPage" Value="" />
          <Setting Name="Encodings/GSM8BitEncodingPage" Value="" />
          <Setting Name="Encodings/UseASCII" Value="" /> 
          <Setting Name="Encodings/UseKeyboardLanguage" Value="" /> 
          <Setting Name="Encodings/SendUDHNLSS" Value="" /> 
          <Setting Name="Encodings/OctetEncodingPage" Value="" />
        </Settings>  
      </Variant>
    -->

    <!-- Use for the per-device case
      <Static>  
        <Settings Path="CellCore/PerDevice/SMS">  
          <Setting Name="Encodings/GSM7BitEncodingPage" Value="" />
          <Setting Name="Encodings/GSM8BitEncodingPage" Value="" />
          <Setting Name="Encodings/UseASCII" Value="" /> 
          <Setting Name="Encodings/UseKeyboardLanguage" Value="" /> 
          <Setting Name="Encodings/SendUDHNLSS" Value="" /> 
          <Setting Name="Encodings/OctetEncodingPage" Value="" />
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

4.  Configure the settings and values depending on the SMS encoding that you want to set.

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Setting name</th>
    <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p><strong>Encodings/GSM7BitEncodingPage</strong></p></td>
    <td><p>Used to set the code page value for GSM 7-bit encoding.</p>
    <p>The possible values are as follows:</p>
    <table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Code page value</th>
    <th>Setting value</th>
    <th>Code page</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p>55000</p></td>
    <td><p>0xD6D8</p></td>
    <td><p>Default alphabet</p></td>
    </tr>
    <tr class="even">
    <td><p>55001</p></td>
    <td><p>0xD6D9</p></td>
    <td><p>GSM with Single Shift for Spanish</p></td>
    </tr>
    <tr class="odd">
    <td><p>55002</p></td>
    <td><p>0xD6DA</p></td>
    <td><p>GSM with Single Shift for Portuguese</p></td>
    </tr>
    <tr class="even">
    <td><p>55003</p></td>
    <td><p>0xD6DB</p></td>
    <td><p>GSM with Single Shift for Turkish</p></td>
    </tr>
    <tr class="odd">
    <td><p>55004</p></td>
    <td><p>0xD6DC</p></td>
    <td><p>SMS Greek Reduction</p></td>
    </tr>
    </tbody>
    </table>
    <p> </p></td>
    </tr>
    <tr class="even">
    <td><p><strong>Encodings/GSM8BitEncodingPage</strong></p></td>
    <td><p>Used to set the code page value for GSM 8-bit encoding.</p></td>
    </tr>
    <tr class="odd">
    <td><p><strong>Encodings/UseASCII</strong></p></td>
    <td><p>Used only for CDMA carriers that use 7-bit ASCII encoding instead of GSM 7-bit encoding.</p>
    <p>The possible values are as follows:</p>
    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Setting value</th>
    <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p>1</p></td>
    <td><p>Turns on 7-bit ASCII</p></td>
    </tr>
    <tr class="even">
    <td><p>0</p></td>
    <td><p>Turns off 7-bit ASCII</p></td>
    </tr>
    </tbody>
    </table>
    <p> </p></td>
    </tr>
    <tr class="even">
    <td><p><strong>Encodings/UseKeyboardLanguage</strong></p></td>
    <td><p>Used to change the SMS encoding based on the language of the device keyboard. This only works for these languages: Spanish, Portuguese, Turkish</p>
    <p>The possible values are as follows:</p>
    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Setting value</th>
    <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p>1</p></td>
    <td><p>Turns on SMS encoding based on keyboard language.</p></td>
    </tr>
    <tr class="even">
    <td><p>0</p></td>
    <td><p>Turns off SMS encoding based on keyboard language.</p></td>
    </tr>
    </tbody>
    </table>
    <p> </p></td>
    </tr>
    <tr class="odd">
    <td><p><strong>Encodings/SendUDHNLSS</strong></p></td>
    <td><p>Used to specify whether outgoing SMS messages using GSM 7-bit encoding will contain header information that defines the shift table used.</p>
    <p>The possible values are as follows:</p>
    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Setting value</th>
    <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p>1</p></td>
    <td><p>Turns on the feature.</p></td>
    </tr>
    <tr class="even">
    <td><p>0</p></td>
    <td><p>Turns off the feature.</p></td>
    </tr>
    </tbody>
    </table>
    <p> </p></td>
    </tr>
    <tr class="even">
    <td><p><strong>Encodings/OctetEncodingPage</strong></p></td>
    <td><p>Used to set the code page for octet (binary) encoding.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a device.

2.  Go to the messaging application to write and send an SMS message.

3.  Verify that the written SMS message used the correct encoding and, when possible, also verify that the sent SMS message was received with the correct encoding.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20SMS%20encoding%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




