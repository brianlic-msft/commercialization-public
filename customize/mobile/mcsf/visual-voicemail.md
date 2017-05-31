---
title: Visual voicemail
description: Visual voicemail supports both traditional voicemail (retrieved through a phone call) and visual voicemail.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 1cc2c4ef-4c16-455b-8e70-ef181a04a394
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Visual voicemail


**Visual voicemail** supports both traditional voicemail (retrieved through a phone call) and visual voicemail. Users can select between traditional voicemail and visual voicemail when they first attempt to access voicemail. If the mobile operator does not support this visual voicemail implementation, the user will only see the traditional voicemail option. For mobile operators that have their own particular brand that they want to use instead of visual voicemail, partners can rebrand all instances of **visual voicemail** in the Windows 10 Mobile UI to use the operator's brand.

The mobile operator visual voicemail system must be an OMTP-compliant system that meets the following requirements.

-   Uses the AMR-NB codec for incoming voicemail messages.

-   Sends all SMS-MT as port-directed SMS.

-   Sends all SMS-MT with 7-bit default or UCS2 encoding.

-   Supports enabling and disabling the visual voicemail feature on the phone by using ACTIVATE and DEACTIVATE SMS-MO messages.

The visual voicemail implementation on the phone is based on the [OMTP visual voice mail interface specification](http://go.microsoft.com/fwlink/p/?LinkId=212770). Visual voicemail support on Windows Phone 8.1 was tested on OMTP-based protocols by Comverse and Alcatel Lucent. Other OMTP-based protocols like Streamwide may also be supported, although tests were performed only on Comverse and Alcatel Lucent. Variations from the OMTP standard may result in unsupported scenarios.

The following table shows the extent of support for the features recommended by OMTP. The features marked "Partially supported" provide a button to enable the user to call in to the voicemail system and change the settings over the phone.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Feature recommended by OMTP</th>
<th>Support in Windows Phone</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>IMAP4 message retrieval</p></td>
<td><p>Supported</p></td>
</tr>
<tr class="even">
<td><p>Local visual voicemail store creation</p></td>
<td><p>Supported</p></td>
</tr>
<tr class="odd">
<td><p>Hide visual voicemail store from user</p></td>
<td><p>Supported</p></td>
</tr>
<tr class="even">
<td><p>Display non-audio messages</p></td>
<td><p>Not supported</p></td>
</tr>
<tr class="odd">
<td><p>Codec support: AMR 12.2k</p></td>
<td><p>Supported</p></td>
</tr>
<tr class="even">
<td><p>Codec support: WAV g711a</p></td>
<td><p>Not supported</p></td>
</tr>
<tr class="odd">
<td><p>Codec support: WAV g711u</p></td>
<td><p>Not supported</p></td>
</tr>
<tr class="even">
<td><p>Codec support: QCELP 13.3k</p></td>
<td><p>Not supported</p></td>
</tr>
<tr class="odd">
<td><p>Codec support: EVRC 13.3k</p></td>
<td><p>Not supported</p></td>
</tr>
<tr class="even">
<td><p>Mark incoming visual voicemail messages as \Seen, \Deleted</p></td>
<td><p>Supported</p></td>
</tr>
<tr class="odd">
<td><p>Deposit visual voicemail messages</p></td>
<td><p>Not supported</p></td>
</tr>
<tr class="even">
<td><p>Forward visual voicemail messages</p></td>
<td><p>Not supported</p></td>
</tr>
<tr class="odd">
<td><p>Set/Change TUI password</p></td>
<td><p>Partially supported</p></td>
</tr>
<tr class="even">
<td><p>Change TUI language</p></td>
<td><p>Partially supported</p></td>
</tr>
<tr class="odd">
<td><p>Close New User tutorial</p></td>
<td><p>Supported</p></td>
</tr>
<tr class="even">
<td><p>Query for storage quota status</p></td>
<td><p>Not supported</p></td>
</tr>
<tr class="odd">
<td><p>Enable/disable on-demand audio message transcription</p></td>
<td><p>Not supported</p></td>
</tr>
<tr class="even">
<td><p>Store a custom personal greeting</p></td>
<td><p>Not supported</p></td>
</tr>
<tr class="odd">
<td><p>Delete a stored custom personal greeting</p></td>
<td><p>Not supported</p></td>
</tr>
<tr class="even">
<td><p>Store a voice signature</p></td>
<td><p>Not supported</p></td>
</tr>
<tr class="odd">
<td><p>Enable/disable custom personal greeting</p></td>
<td><p>Not supported</p></td>
</tr>
<tr class="even">
<td><p>Retrieve and store provisioning status and credentials</p></td>
<td><p>Supported</p></td>
</tr>
<tr class="odd">
<td><p>Activate and deactivate visual voicemail</p></td>
<td><p>Supported</p></td>
</tr>
</tbody>
</table>

 

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
To configure visual voicemail for a mobile operator, the OEM must add setting several settings depending on the OMTP-based protocol being used by the operator.

**Note**  
Visual voicemail settings have already been set for AT&T, T-Mobile USA, and Deutsche Telekom AG (DTAG), and no further configuration is required for these three mobile operators.

 

1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="VisualVoicemail"  
                         Description="Use to configure visual voicemail settings in the phone image."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <Static>  

        <Settings Path="Phone/VoicemailRegistrationTable">  

          <!-- The MCCMNC macro allows you to set multiple MCCMNC\VVMMMO pairs.
               The Value stored here will be the key for the Table. --> 
          <Setting Name="ProviderRegistration/$(MCCMNC)" Value="" />      
          <Setting Name="ProviderRegistration/$(MCCMNC)" Value="" />          
        </Settings>  


        <!-- The VVMMO is the value stored in the MCCMNC setting. This macro allows you to create multiple table entries. -->
        <Settings Path="Phone/VoicemailRegistrationTable/$(VVMMO)">  
          <Setting Name="CLSIDProvider" Value="" />   
          <Setting Name="CLSIDAccessor" Value="" />
          <Setting Name="ProtocolVariant" Value="" />
          <Setting Name="IncomingPort" Value="" />
          <Setting Name="ClientType" Value="" />
          <Setting Name="DeviceType" Value="" />
          <Setting Name="InitialSmsDestinationNumber" Value="" />
          <Setting Name="EncryptedSmsSupported" Value="" />
          <Setting Name="KeyData" Value="" />
          <Setting Name="ImapPortOverride" Value="" />
          <Setting Name="TokenLogin" Value="" />
          <Setting Name="SuppressSsl" Value="" />
          <Setting Name="IgnoreLegacyNotifications" Value="" />    
          <Setting Name="Branding" Value="" />   
        </Settings>  

        <Settings Path="Phone/VoicemailRegistrationTable/$(VVMMO)">  
          <Setting Name="CLSIDProvider" Value="" />   
          <Setting Name="CLSIDAccessor" Value="" />
          <Setting Name="ProtocolVariant" Value="" />
          <Setting Name="IncomingPort" Value="" />
          <Setting Name="ClientType" Value="" />
          <Setting Name="DeviceType" Value="" />
          <Setting Name="InitialSmsDestinationNumber" Value="" />
          <Setting Name="EncryptedSmsSupported" Value="" />
          <Setting Name="KeyData" Value="" />
          <Setting Name="ImapPortOverride" Value="" />
          <Setting Name="TokenLogin" Value="" />
          <Setting Name="SuppressSsl" Value="" />
          <Setting Name="IgnoreLegacyNotifications" Value="" />    
          <Setting Name="Branding" Value="" />   
        </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set multiple MCCMNC\\VVMMO pairs by adding the following entry in your customization answer file.

    ``` syntax
        <Settings Path="Phone/VoicemailRegistrationTable">
          <Setting Name="ProviderRegistration/$(MCCMNC)" Value="" /> 
        </Settings>
    ```

    1.  Replace *$(MCCMNC)* with the MCCMNC for the mobile operator. For example, *99999*.

    2.  Set the corresponding `Value` to the name of the VVMMO. For example, *Contoso*.

    3.  Add and set as many MCCMNC\\VVMMO pairs as you need for each mobile operator ID. For example, if you are adding another VVMMO called Fabrikam with MCC/MNC of 999/10, your entries will look like this:

        ``` syntax
            <Settings Path="Phone/VoicemailRegistrationTable">
              <Setting Name="ProviderRegistration/99999" Value="Contoso" /> 
              <Setting Name="ProviderRegistration/99910" Value="Fabrikam" /> 
            </Settings>
        ```

4.  For each mobile operator ID defined in the previous step, you must define the applicable settings for that mobile operator by adding the following settings in your customization answer file.

    ``` syntax
        <Settings Path="Phone/VoicemailRegistrationTable/$(VVMMO)">  
          <Setting Name="CLSIDProvider" Value="" />   
          <Setting Name="CLSIDAccessor" Value="" />
          <Setting Name="ProtocolVariant" Value="" />
          <Setting Name="IncomingPort" Value="" />
          <Setting Name="ClientType" Value="" />
          <Setting Name="DeviceType" Value="" />
          <Setting Name="InitialSmsDestinationNumber" Value="" />
          <Setting Name="EncryptedSmsSupported" Value="" />
          <Setting Name="KeyData" Value="" />
          <Setting Name="ImapPortOverride" Value="" />
          <Setting Name="TokenLogin" Value="" />
          <Setting Name="SuppressSsl" Value="" />
          <Setting Name="IgnoreLegacyNotifications" Value="" />    
        </Settings>  
    ```

    1.  Replace *$(VVMMO)* with the name of the VVMMO. For example, *Contoso*.

    2.  Set only the applicable settings that apply to the VVMMO and are required depending on the OMTP-based protocol being used. Note that you do not have to set all of these if they are not supported.

        The following table describes the values to use and indicates if the keys are required depending on the OMTP-based protocol being used.

        <table style="width:100%;">
        <colgroup>
        <col width="16%" />
        <col width="16%" />
        <col width="16%" />
        <col width="16%" />
        <col width="16%" />
        <col width="16%" />
        </colgroup>
        <thead>
        <tr class="header">
        <th>Key name</th>
        <th>Type</th>
        <th>Generic OMTP</th>
        <th>Comverse</th>
        <th>Alcatel Lucent</th>
        <th>Details</th>
        </tr>
        </thead>
        <tbody>
        <tr class="odd">
        <td><p><strong>CLSIDProvider</strong></p></td>
        <td><p>REG_SZ</p></td>
        <td><p>Required</p></td>
        <td><p>Required</p></td>
        <td><p>Required</p></td>
        <td><p>Use {039B8E0E-EA5E-4801-96CD-71E7B343F03F} for an OMTP visual voicemail server or Comverse visual voicemail server.</p>
        <p>Use {C9804AB2-60B0-4AFF-8205-E30E591F145B} for an Alcatel Lucent visual voicemail server.</p></td>
        </tr>
        <tr class="even">
        <td><p><strong>CLSIDAccessor</strong></p></td>
        <td><p>REG_SZ</p></td>
        <td><p>Required</p></td>
        <td><p>Required</p></td>
        <td><p>Required</p></td>
        <td><p>Use the value {BC371B86-031F-4BD7-9E7D-FB5DF7D1D8C3}.</p></td>
        </tr>
        <tr class="odd">
        <td><p><strong>ProtocolVariant</strong></p></td>
        <td><p>REG_SZ</p></td>
        <td><p>Required</p></td>
        <td><p>Required</p></td>
        <td><p>--</p></td>
        <td><p>OMTP protocol version (“pv”). Use &quot;ProtocolVariant&quot;=&quot;omtp&quot; for generic OMTP systems, or &quot;ProtocolVariant&quot;=&quot;comverse&quot; for implementations that use Comverse systems.</p></td>
        </tr>
        <tr class="even">
        <td><p><strong>IncomingPort</strong></p></td>
        <td><p>REG_DWORD</p></td>
        <td><p>Required</p></td>
        <td><p>Required</p></td>
        <td><p>Required</p></td>
        <td><p>SMS-MT application port (“pt”)</p></td>
        </tr>
        <tr class="odd">
        <td><p><strong>ClientType</strong></p></td>
        <td><p>REG_SZ</p></td>
        <td><p>Required</p></td>
        <td><p>Required</p></td>
        <td><p>--</p></td>
        <td><p>An identifier for the category of devices, which can be set to any string. (“ct”)</p></td>
        </tr>
        <tr class="even">
        <td><p><strong>DeviceType</strong></p></td>
        <td><p>REG_SZ</p></td>
        <td><p>Required</p></td>
        <td><p>Required</p></td>
        <td><p>--</p></td>
        <td><p>A second–level Comverse-specific device type identifier.</p></td>
        </tr>
        <tr class="odd">
        <td><p><strong>InitialSmsDestinationNumber</strong></p></td>
        <td><p>REG_SZ</p></td>
        <td><p>Required</p></td>
        <td><p>Required</p></td>
        <td><p>--</p></td>
        <td><p>Phone number to use for SMS-MO messages for visual voicemail such as ACTIVATE or DEACTIVATE (“dn”).</p></td>
        </tr>
        <tr class="even">
        <td><p><strong>EncryptedSmsSupported</strong></p></td>
        <td><p>REG_DWORD</p></td>
        <td><p>Not required</p></td>
        <td><p>Not required</p></td>
        <td><p>--</p></td>
        <td><p>Specifies whether 3DES encrypted SMS is supported.</p>
        <p>Use a value of 0 to indicate it is not supported. Use 1 to indicate this feature is supported.</p></td>
        </tr>
        <tr class="odd">
        <td><p><strong>KeyData</strong></p></td>
        <td><p>REG_BINARY</p></td>
        <td><p>Required if EncryptedSmsSupported is set to 1</p></td>
        <td><p>Required if EncryptedSmsSupported is set to 1</p></td>
        <td><p>--</p></td>
        <td><p>The binary key to use for encrypted SMS.</p></td>
        </tr>
        <tr class="even">
        <td><p><strong>ImapPortOverride</strong></p></td>
        <td><p>REG_DWORD</p></td>
        <td><p>--</p></td>
        <td><p>--</p></td>
        <td><p>Not required</p></td>
        <td><p>Specifies the IMAP port to use regardless of the message contents.</p>
        <p>This feature should be turned on only for mobile operators that require it.</p></td>
        </tr>
        <tr class="odd">
        <td><p><strong>TokenLogin</strong></p></td>
        <td><p>REG_DWORD</p></td>
        <td><p>--</p></td>
        <td><p>--</p></td>
        <td><p>Not required</p></td>
        <td><p>Enables the use of token-based login instead of traditional username and password.</p>
        <p>This feature should be turned on only for mobile operators that require it.</p></td>
        </tr>
        <tr class="even">
        <td><p><strong>SuppressSsl</strong></p></td>
        <td><p>REG_DWORD</p></td>
        <td><p>--</p></td>
        <td><p>--</p></td>
        <td><p>Not required</p></td>
        <td><p>Ignores any directive in the message payload to use SSL and forces non-SSL IMAP. This feature should be turned on only for mobile operators that require it.</p>
        <p>Use a value of 0 to indicate the feature is off; use 1 to indicate it is turned on.</p></td>
        </tr>
        <tr class="odd">
        <td><p><strong>IgnoreLegacyNotifications</strong></p></td>
        <td><p>REG_DWORD</p></td>
        <td><p>Not required</p></td>
        <td><p>Not required</p></td>
        <td><p>Not required</p></td>
        <td><p>Specifies whether legacy voicemail notifications should be ignored when visual voicemail is enabled. If the ignore legacy voicemail notification feature is enabled, legacy message waiting indicator SMS messages are ignored (i.e. these will not trigger a visual voicemail sync). If this feature is absent or not enabled, legacy voicemail MWI messages will cause a visual voicemail sync to be initiated.</p>
        <p>This feature should be turned on only for mobile operators that require it. This feature is not enabled by default.</p>
        <p>Use a value of 0 to indicate the feature is off; use 1 to indicate it is turned on.</p></td>
        </tr>
        </tbody>
        </table>

         

5.  For mobile operators that have their own particular brand that they want to use instead of visual voicemail, partners can rebrand all instances of **Visual voicemail** in the Windows device UI to use the operator's brand.

    To do this, set the value for `Branding` to the specific name that the mobile operator is using for visual voicemail. For example, you can set the value to *Contoso Voice Inbox*.

    **Note**  
    This setting does not support a resource-only DLL for localized strings so you need to set the new string directly as the value.

     

<a href="" id="testing-"></a>**Testing:**  
Work with your mobile operator to obtain the settings and values that you need to configure visual voicemail and the value to use for `Branding`.

Once you have configured the visual voicemail settings and the branding, work with the mobile operator to test this customization on their network and verify that all instances of **Visual voicemail** in the Windows device UI have been replaced with the custom brand that you specified.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Visual%20voicemail%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




