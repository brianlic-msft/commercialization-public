---
title: Voicemail SMS intercept
description: Partners can define a filter that intercepts an incoming SMS message and triggers visual voicemail synchronization. The filtered message does not appear in the user’s conversation list.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 182c627c-ab07-481f-a970-7cd096813076
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Voicemail SMS intercept


Partners can define a filter that intercepts an incoming SMS message and triggers visual voicemail synchronization. The filtered message does not appear in the user’s conversation list.

A visual voicemail sync is triggered by an incoming SMS message if the following conditions are met:

-   The message sender value starts with the string specified in the `SyncSender` setting. The length of the specified values must be greater than 3 characters but less than 75 characters.

-   The body of the message starts with the string specified in the `SyncPrefix` setting. The length of the specified values must be greater than 3 characters but less than 75 characters.

-   Visual voicemail is configured and enabled. For more information, see [Visual voicemail](visual-voicemail.md).

<a href="" id="constraints---atomic"></a>**Constraints:** Atomic  
This customization supports: **per-SIM** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="VoicemailSMSIntercept"  
                         Description="Use to define a filter that intercepts an incoming SMS message and triggers visual voicemail synchronization."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>

        <Settings Path="Messaging/GlobalSettings/VoicemailIntercept">  
          <Setting Name="SyncSender" Value="" />       
          <Setting Name="SyncPrefix" Value="" />       
        </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Specify a value for `SyncSender` that is greater than 3 characters but less than 75 characters in length.

    For networks that support it, this value can be a short code of the mailbox server that sends a standard SMS notification.

4.  Specify a value for `SyncPrefix` that is greater than 3 characters but less than 75 characters in length.

    For networks that support it, this value can be the keyword for the SMS notification.

**Note**  
The `SyncSender` and `SyncPrefix` values vary for each mobile operator, so OEMs must work with their mobile operators to obtain the correct or required values.

Make sure that the correct visual voicemail settings for the mobile operator are also set. For more information, see [Visual voicemail](visual-voicemail.md).

 

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash the build containing this customization to a phone that has a UICC.

2.  Successfully testing this customization requires the correct values, so work with your mobile operator partner to test this customization on their network.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Voicemail%20SMS%20intercept%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




