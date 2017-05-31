---
title: Automatic send retry and resize settings for MMS messages
description: For MMS messages that have photo attachments and that fail to send, partners can choose to automatically resize the photo and attempt to resend the message.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 08bdf7ca-5adc-43fc-8280-99d778760f81
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Automatic send retry and resize settings for MMS messages


For MMS messages that have photo attachments and that fail to send, partners can choose to automatically resize the photo and attempt to resend the message.

When this feature is enabled, partners must specify a size greater than or equal to 10 KB to use when resizing the photo.

Partners can also specify the number of times that the device can retry sending the failed MMS message and photo before the user receives a notification that the photo could not be sent.

The resize and retry settings can be used independently:

-   If only the resize setting is set, the MMS will resize the photo and retry to send the message only once.

-   If both settings are set, the MMS with a photo will be resized and the message will be resent up to three times.

-   If only the retry setting is set, the MMS with the photo will not be resized and the message will be resent up to three times.

**Limitations and restrictions**:

-   This resize feature only applies to photos. Videos, audio files, and other file types will not be resized.

-   The maximum number of automatic resend attempts is set to 3.

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-SIM** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="AutoResizeforMMS"  
                         Description="For MMS messages with photo attachments that fail to send, use to resize the photo and attempt to resend the MMS."  
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
          
          <!-- Specify the maximum size to use to resize the photo in KB. Minimum is 0xA (10 KB). -->
          <Setting Name="RetrySize" Value="" />     

          <!-- Specify the number of times the MMS transport will attempt to resend the MMS, max is 0x3. -->
          <Setting Name="MaxRetryCount" Value="" />      
             
        </Settings>  

      </Variant>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Define **Targets** or conditions for when a variant can be applied, such as keying off a SIM's MCC, MNC, and SPN.

4.  Define settings for a **Variant**, which are applied if the associated target's conditions are met.

5.  Specify the `RetrySize``Value` to set a maximum size, in KB, to use when resizing the photo.

    The minimum message retry size is 0xA (10 KB). If this number is less than 0xA, the value will be ignored and the device will not attempt to resize and resend large photos.

6.  Specify the `MaxRetryCount``Value` to specify the number of times the MMS transport will attempt resending the MMS message. This value has a maximum limit of 0x3.

Keep the following in mind when setting the value for `RetrySize` and `MaxRetryCount`:

-   If `MaxRetryCount` is not set and `RetrySize` is set, the MMS transport will retry sending the MMS message once using the specified `RetrySize`. This behavior is similar to the default behavior in Windows 10 Mobile.

-   If `MaxRetryCount` is set and `RetrySize` is not set, the MMS transport will not resize the MMS message and the message will be resent up to three times.

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash the build containing this customization to a device.

2.  Go to the **messaging** application and attempt to attach a file that is larger than the limit that you set.

3.  Send the photo. You may notice a slight delay. When the message arrives, the photo's size should be equal to the limit you specified for `RetrySize`.

4.  If the message fails to send the first time, verify that the number of attempts to resend the message is equal to the limit you set for `MaxRetryCount`.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Automatic%20send%20retry%20and%20resize%20settings%20for%20MMS%20messages%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




