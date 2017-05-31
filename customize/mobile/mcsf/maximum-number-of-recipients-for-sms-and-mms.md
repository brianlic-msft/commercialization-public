---
title: Maximum number of recipients for SMS and MMS
description: Partners can set the maximum number of recipients to which a single SMS or MMS message can be sent.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: fbaa5d20-5129-4c36-8f17-eac3841db042
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Maximum number of recipients for SMS and MMS


Partners can set the maximum number of recipients to which a single SMS or MMS message can be sent.

The maximum number of recipients that a user can send an SMS or MMS message to is limited to 500. This limit exists because the OS also supports the [Select multiple recipients for SMS and MMS messages](select-multiple-recipients-for-sms-and-mms-messages.md) feature and having the number of recipients for SMS or MMS messages limited to a large, but finite, number ensures that there is no system performance degradation or negative impact to the user experience. The maximum number of recipients that a user can send messages to is in the range 0 &lt;= 500 (decimal).

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-SIM** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="LimitMessagingMaxRecipients"  
                         Description="Use to set the maximum number of recipients for SMS or MMS messages."  
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
          <Setting Name="LimitRecipients" Value="" />    
        </Settings>  

      </Variant>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Define **Targets** or conditions for when a variant can be applied, such as keying off a SIM's MCC, MNC, and SPN.

4.  Define settings for a **Variant**, which are applied if the associated target's conditions are met.

5.  The `LimitRecipients` setting limits the maximum number of recipients that a user can send messages to, and this value is in the range 0 &lt; `LimitRecipients` &lt;= 500 (decimal). When setting the value for `LimitRecipients`, you can use either decimal or the equivalent hexadecimal value (with a 0x prefix).

    Set the value for `LimitRecipients` according to the following rules:

    -   If `LimitRecipients` is not set, the maximum number of recipients defaults to 500.

    -   If `LimitRecipients` is set to a value greater than 500, the maximum number of recipients is set to 500.

    -   If `LimitRecipients` is set to 1, the maximum number of recipients is set to 1 and the multi-select button in the single select screen is disabled

    -   If `LimitRecipients` is set to a value between 2 and 500, the maximum number of recipients is equal to the number that was set

<a href="" id="instructions-"></a>**Instructions:**  

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a device with a UICC or network connection.

2.  Make sure your device contains more contacts than the number you set for `LimitRecipients`.

3.  Open the messaging application, create a new message, and tap **+** to add recipients.

4.  If [Select multiple recipients for SMS and MMS messages](select-multiple-recipients-for-sms-and-mms-messages.md) is not enabled, the behavior for `LimitRecpients` is the same as in Windows Phone 8.

5.  If [Select multiple recipients for SMS and MMS messages](select-multiple-recipients-for-sms-and-mms-messages.md) is enabled, tap the multi-select menu option, tap **…**, choose **select all contacts** and verify that you can see the following message:

    **Too many contacts**

    **You can select up to X contacts. If you select all, you will have Y contacts.**

    *X* is the decimal equivalent of the value that you set for `LimitRecipients`. *Y* is the total number of contacts you have selected.

6.  If [Select multiple recipients for SMS and MMS messages](select-multiple-recipients-for-sms-and-mms-messages.md) is enabled, tap the multi-select menu option, individually tap the names of your contacts and select one more than the number you set for `LimitRecipients`. Verify that you can see the following message:

    **Too many contacts**

    **You can select up to X contacts, and you already have that many**.

    *X* is the decimal equivalent of the value that you set for `LimitRecipients`.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Maximum%20number%20of%20recipients%20for%20SMS%20and%20MMS%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




