---
title: Customizations for SMS and MMS
description: Contains settings that you can configure for SMS and MMS.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 765e9d5b-87d9-49f2-8b16-3d54cb364643
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Customizations for SMS and MMS


Contains settings that you can configure for SMS and MMS.

## In this section


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Topic</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>[Add encoding extension tables for SMS](add-encoding-extension-tables-for-sms.md)</p></td>
<td><p>Partners can extend the set of supported SMS encodings.</p></td>
</tr>
<tr class="even">
<td><p>[Automatic send retry and resize settings for MMS messages](automatic-send-retry-and-resize-settings-for-mms-messages.md)</p></td>
<td><p>For MMS messages that have photo attachments and that fail to send, partners can choose to automatically resize the photo and attempt to resend the message.</p></td>
</tr>
<tr class="odd">
<td><p>[Automatically retry downloading MMS messages](automatically-retry-downloading-mms-messages.md)</p></td>
<td><p>Partners can configure the messaging app to automatically retry downloading an MMS message if the initial download attempt fails.</p></td>
</tr>
<tr class="even">
<td><p>[Content location in the multimedia message service center (MMSC)](content-location-in-the-multimedia-message-service-center--mmsc-.md)</p></td>
<td><p>For networks that require it, partners can specify the default GET path within the MMSC to use when the GET URL is missing from the WAP push MMS notification.</p></td>
</tr>
<tr class="odd">
<td><p>[Delay for resend attempts](delay-for-resend-attempts.md)</p></td>
<td><p>If an SMS message fails to send correctly, partners can specify the number of additional attempts and the minimum delay between them in seconds.</p></td>
</tr>
<tr class="even">
<td><p>[Disable the EMS long messages feature](disable-the-ems-long-messages-feature.md)</p></td>
<td><p>Partners can disable the enhanced messaging service (EMS), which concatenates text messages so that the user can enter more than 160 characters in a single message.</p></td>
</tr>
<tr class="odd">
<td><p>[Expiration time for SMS messages](expiration-time-for-sms-messages.md)</p></td>
<td><p>Partners can set the expiration time before the device deletes the received parts of a long SMS message.</p></td>
</tr>
<tr class="even">
<td><p>[Full error messages for SMS and MMS](full-error-messages-for-sms-and-mms.md)</p></td>
<td><p>Partners can choose to display additional content in the conversation view when an SMS or MMS message fails to send.</p></td>
</tr>
<tr class="odd">
<td><p>[IMS retry](ims-retry.md)</p></td>
<td><p>For networks that support it, when an outgoing SMS message fails to send due to a transient error, partners can specify the threshold for the number of attempts to resend the SMS over IMS before switching over to 3GPP or 3GPP2.</p></td>
</tr>
<tr class="even">
<td><p>[IMSI authentication](imsi-authentication.md)</p></td>
<td><p>For networks that require it, MMS messages can include the IMSI in the GET and POST header that the message center uses to authenticate the mobile subscriber.</p></td>
</tr>
<tr class="odd">
<td><p>[Maximum length for SMS messages](maximum-length-for-sms-messages.md)</p></td>
<td><p>Partners can specify a maximum length for SMS messages.</p></td>
</tr>
<tr class="even">
<td><p>[Maximum number of attachments for MMS messages](maximum-number-of-attachments-for-mms-messages.md)</p></td>
<td><p>Partners can specify the maximum number of attachments for MMS messages, from 1 to 20.</p></td>
</tr>
<tr class="odd">
<td><p>[Maximum number of recipients for SMS and MMS](maximum-number-of-recipients-for-sms-and-mms.md)</p></td>
<td><p>Partners can set the maximum number of recipients to which a single SMS or MMS message can be sent.</p></td>
</tr>
<tr class="even">
<td><p>[Permanent SMS message failures](permanent-sms-message-failures.md)</p></td>
<td><p>Partners can mark SMS message failures as permanent failures so that the user will not be given the option to attempt to resend the SMS.</p></td>
</tr>
<tr class="odd">
<td><p>[Ports that accept cellular broadcast messages](ports-that-accept-cellular-broadcast-messages.md)</p></td>
<td><p>Partners can specify one or more ports from which the device will accept cellular broadcast messages.</p></td>
</tr>
<tr class="even">
<td><p>[Proxy authorization for MMS](proxy-authorization-for-mms.md)</p></td>
<td><p>Partners can specify the use of NAI information as a dedicated header for MMS authentication for mobile networks that require this functionality. The string value must be the MMS header used for authentication.</p></td>
</tr>
<tr class="odd">
<td><p>[Select multiple recipients for SMS and MMS messages](select-multiple-recipients-for-sms-and-mms-messages.md)</p></td>
<td><p>Partners can show the <strong>select all contacts</strong>/<strong>unselect all</strong> menu option to allow users to easily select multiple recipients for an SMS or MMS message.</p></td>
</tr>
<tr class="even">
<td><p>[Sending SMS messages to SMTP addresses](sending-sms-messages-to-smtp-addresses.md)</p></td>
<td><p>Partners can configure SMS messages to be sent to email addresses as well as phone numbers.</p></td>
</tr>
<tr class="even">
<td><p>[SMS encoding](sms-encoding.md)</p></td>
<td><p>Partners can change the default GSM 7-bit code page decoding and encoding, and can also extend the set of supported SMS encodings by setting an &quot;always-on&quot; GSM 7-bit shift table, adding encoders, and adding decoders.</p></td>
</tr>
<tr class="odd">
<td><p>[SMS intercept deny list](sms-intercept-deny-list.md)</p></td>
<td><p>OEMs can specify one or more filters in order to intercept incoming SMS messages intended for mobile operator partner applications that are not installed on the device.</p></td>
</tr>
<tr class="even">
<td><p>[SMS intercept ports](sms-intercept-ports.md)</p></td>
<td><p>OEMs can configure ports on which a Wireless Application Protocol (WAP)-formatted message can be intercepted by the mobile operator app.</p></td>
</tr>
<tr class="odd">
<td><p>[Support HTTP cache-control no-transform for MMS](support-http-cache-control-no-transform-for-mms.md)</p></td>
<td><p>For networks that require it, OEMs can add support for the HTTP header Cache-Control No-Transform directive for MMS messages.</p></td>
</tr>
<tr class="even">
<td><p>[Supported protocols for service indication messages](supported-protocols-for-service-indication-messages.md)</p></td>
<td><p>Partners can add additional supported protocols for service indication messages.</p></td>
</tr>
<tr class="odd">
<td><p>[Switch from SMS to MMS for long messages](switch-from-sms-to-mms-for-long-messages.md)</p></td>
<td><p>For networks that do support MMS and do not support segmentation of SMS messages, partners can specify an automatic switch from SMS to MMS for long messages.</p></td>
</tr>
<tr class="even">
<td><p>[Truncated content handling for WAP push notification](truncated-content-handling-for-wap-push-notification.md)</p></td>
<td><p>For networks that require non-standard handling of single-segment incoming MMS WAP Push notifications, partners can specify that MMS messages may have some of their content truncated and that they may require special handling to reconstruct truncated field values.</p></td>
</tr>
<tr class="odd">
<td><p>[Use insert-address-token or local raw address](use-insert-address-token-or-local-raw-address.md)</p></td>
<td><p>To meet certain mobile operator requirements, OEMs can customize the OS image to use either the insert-address-token or the local raw address for the <strong>From</strong> field in MMS messages.</p></td>
</tr>
<tr class="even">
<td><p>[Use UTF-8 for MMS messages with unspecified character encoding](use-utf-8-for-mms-messages-with-unspecified-character-encoding.md)</p></td>
<td><p>Some incoming MMS messages may not specify a character encoding. To properly decode MMS messages that do not specify a character encoding, OEMs can set UTF-8 to decode the message.</p></td>
</tr>
<tr class="odd">
<td><p>[User agent profile for MMS messages](user-agent-profile-for-mms-messages.md)</p></td>
<td><p>Partners can specify a user agent profile to use on the device for MMS messages.</p></td>
</tr>
<tr class="even">
<td><p>[User agent string for MMS messages](user-agent-string-for-mms-messages.md)</p></td>
<td><p>Partners can replace the entire user agent string for MMS.</p></td>
</tr>
<tr class="odd">
<td><p>[User alert for service indication messages](user-alert-for-service-indication-messages.md)</p></td>
<td><p>Partners can hide the user prompts for signal-medium messages.</p></td>
</tr>
<tr class="even">
<td><p>[Video attachments in MMS](video-attachments-in-mms.md)</p></td>
<td><p>Partners can specify the transcoding to use for video files sent as attachments in MMS messages.</p></td>
</tr>
</tbody>
</table>

 

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Customizations%20for%20SMS%20and%20MMS%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




