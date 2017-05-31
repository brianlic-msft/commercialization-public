---
title: User agent profile for MMS messages
description: Partners can specify a user agent profile to use on the device for MMS messages.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 6d3ae2da-3521-4d04-b2d2-da11b1b556b0
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# User agent profile for MMS messages


Partners can specify a user agent profile to use on the device for MMS messages. The user agent profile XML file details a device’s hardware specifications and media capabilities so that an MMS application server (MMSC) can return supported optimized media content to the device. The user agent profile XML file is generally stored on the MMSC.

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-SIM** value

<a href="" id="instructions-"></a>**Instructions:**  
The MMS-specific components for Windows 10 Mobile are included in the following code sample.

``` syntax
<!-- **** Microsoft MMS Baseline Characteristics Description ****
   5/25/2012 --> 
<prf:component>
   <rdf:Description rdf:ID="MMSCharacteristics">
      <rdf:type rdf:resource=
         "http://www.wapforum.org/profiles/MMS/ccppschema-20010111#MmsCharacteristics" /> 
      <!-- Max size must mirror max size that the mobile operator 
         allows for sending. -->
      <mms:MmsMaxMessageSize>614400</mms:MmsMaxMessageSize> 
      <mms:MmsMaxImageResolution>1600x1600</mms:MmsMaxImageResolution> 
      <mms:MmsCcppAccept>
         <rdf:Bag>
            <!-- Image --> 
            <rdf:li>image/jpeg</rdf:li> 
            <rdf:li>image/gif</rdf:li> 
            <rdf:li>image/bmp</rdf:li> 
            <rdf:li>image/png</rdf:li> 
            <rdf:li>image/tiff</rdf:li> 
            <rdf:li>image/wdp</rdf:li> 
            <rdf:li>image/vnd.ms-photo</rdf:li> 
            <!-- Audio --> 
            <rdf:li>audio/mp3</rdf:li> 
            <rdf:li>audio/mpeg</rdf:li> 
            <rdf:li>audio/mpeg3</rdf:li> 
            <rdf:li>audio/mp4</rdf:li> 
            <rdf:li>audio/wav</rdf:li> 
            <rdf:li>audio/x-ms-wav</rdf:li> 
            <rdf:li>audio/vnd.wave</rdf:li> 
            <rdf:li>audio/3gpp</rdf:li> 
            <rdf:li>audio/3gpp2</rdf:li> 
            <rdf:li>audio/x-ms-wma</rdf:li> 
            <rdf:li>audio/aac</rdf:li>
            <rdf:li>audio/aacp</rdf:li>
            <rdf:li>audio/vnd.dlna.adts</rdf:li>
            <rdf:li>audio/x-aac</rdf:li>
            <rdf:li>audio/x-m4a</rdf:li>
            <rdf:li>audio/x-mp3</rdf:li>
            <rdf:li>audio/x-mpeg</rdf:li>
            <rdf:li>audio/x-wav</rdf:li>
            <rdf:li>audio/amr</rdf:li>
            <rdf:li>audio/x-m4r</rdf:li>
            <!-- Video --> 
            <rdf:li>video/3gpp</rdf:li> 
            <rdf:li>video/3gpp2</rdf:li> 
            <rdf:li>video/mp4</rdf:li> 
            <rdf:li>video/x-m4v</rdf:li> 
            <rdf:li>video/x-ms-wmv</rdf:li> 
            <rdf:li>video/quicktime</rdf:li> 
            <!-- Text --> 
            <rdf:li>text/plain</rdf:li> 
            <!-- VCards --> 
            <rdf:li>text/vcard</rdf:li> 
            <rdf:li> text/x-vcard</rdf:li>
            <!-- Other MIME type --> 
            <rdf:li>application/vnd.wap.multipart.mixed</rdf:li> 
            <rdf:li>application/vnd.wap.multipart.related</rdf:li> 
            <rdf:li>application/smil</rdf:li> 
            <rdf:li>application/vnd.wap.mms-message</rdf:li> 
            <rdf:li>application/vnd.oma.drm.message</rdf:li>
         </rdf:Bag>
      </mms:MmsCcppAccept>
      <mms:MmsCcppAcceptCharSet>
         <rdf:Bag>
            <rdf:li>UTF-8</rdf:li> 
            <rdf:li>UTF-16</rdf:li> 
            <rdf:li>ISO-8859-1</rdf:li> 
            <rdf:li>ISO-8859-2</rdf:li> 
            <rdf:li>ISO-8859-3</rdf:li> 
            <rdf:li>ISO-8859-4</rdf:li> 
            <rdf:li>ISO-8859-5</rdf:li> 
            <rdf:li>ISO-8859-6</rdf:li> 
            <rdf:li>ISO-8859-7</rdf:li> 
            <rdf:li>ISO-8859-8</rdf:li> 
            <rdf:li>ISO-8859-9</rdf:li> 
            <rdf:li>ISO-8859-10</rdf:li> 
            <rdf:li>US-ASCII</rdf:li> 
            <rdf:li>ISO-10646-UCS-2</rdf:li>
         </rdf:Bag>
      </mms:MmsCcppAcceptCharSet>
      <mms:MmsVersion>
         <rdf:Bag>
            <rdf:li>1.2</rdf:li> 
         </rdf:Bag>
      </mms:MmsVersion>
   </rdf:Description>
</prf:component>
```

There are two ways to correlate a user agent profile with a given device:

-   You can take the user agent string of the device that is sent with MMS requests and use it as a hash to map to the user agent profile on the MMSC. The user agent string cannot be modified.

-   Alternatively, you can directly set the URI of the user agent profile on the device.

The following steps describe how to specify a custom user agent profile XML file by using a registry setting.

1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="MMSUAProfile"  
                         Description="Use to specify a user agent profile to use for MMS messages."  
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

          <!-- Replace UAProf.xml with the full URI of your user agent profile file. -->
          <Setting Name="UAProf" Value="UAProf.xml" />     

          <!-- Use to specify the custom user agent property name. Set the value to either
               "x-wap-profile or "profile" -->
          <Setting Name="UAProfToken" Value="x-wap-profile" />     
            
        </Settings>  

      </Variant>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Define **Targets** or conditions for when a variant can be applied, such as keying off a SIM's MCC, MNC, and SPN.

4.  Define settings for a **Variant**, which are applied if the associated target's conditions are met.

5.  In the `UAProf``Value`, replace `UAProf.xml` value with the full URI of your user agent profile.

    Optionally, you can also specify the custom user agent property name for MMS that is sent in the header by setting `UAProfToken` to either `x-wap-profile` or `profile`.

<a href="" id="testing-steps-"></a>**Testing steps:**  
Work with your mobile operator to test this customization on their network.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20User%20agent%20profile%20for%20MMS%20messages%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




