---
title: Support HTTP cache-control no-transform for MMS
description: For networks that require it, OEMs can add support for the HTTP header Cache-Control No-Transform directive for MMS messages.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 982c6948-8459-4de3-bb9e-9a49c0682c4d
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Support HTTP cache-control no-transform for MMS


For networks that require it, OEMs can add support for the HTTP header Cache-Control No-Transform directive for MMS messages. When set, proxies and transcoders are instructed not to change the HTTP header and the content should not be modified (`Cache-Control: no-transform\r\n`).

When this directive is not set or the registry setting is missing, the HTTP header is set to Cache-Control No-Cache (`Cache-Control: no-cache\r\n`).

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-SIM** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="SetCacheControlNoTransform"  
                         Description="Use to add support for the HTTP header Cache-Control No-Transform directive for MMS messages."  
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
          <Setting Name="SetCacheControlNoTransform" Value="1" />        
        </Settings>  

      </Variant>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Define **Targets** or conditions for when a variant can be applied, such as keying off a SIM's MCC, MNC, and SPN.

4.  Define settings for a **Variant**, which are applied if the associated target's conditions are met.

5.  Do not modify the `SetCacheControlNoTransform``Value`. A value of 1 or 0x1 adds support for the HTTP header Cache-Control No-Transform directive.

    When the `SetCacheControlNoTransform``Value` is set to 0 or 0x0 or when the setting is not set, the default HTTP header Cache-Control No-Cache directive is used.

<a href="" id="testing-"></a>**Testing:**  
Flash the build containing this customization to a device with a UICC.

**Warning**  
To fully verify this customization, you will need to use a tool that captures HTTP traffic.

 

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Support%20HTTP%20cache-control%20no-transform%20for%20MMS%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




