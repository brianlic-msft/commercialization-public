---
title: Phone metadata in DeviceTargetingInfo
description: Partners are required to set certain device metadata, including hardware, support, and OEM and MO information.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: d7c42730-f34f-44c5-a2dc-662df84160e8
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Phone metadata in DeviceTargetingInfo


Partners are required to set certain device metadata, including hardware, support, and OEM and MO information.

Partners are required to set the following information:

-   OEM and mobile operator information, used for display strings in the UI, device update, and connecting to the Windows Store.

-   Hardware component versions and software versions, used for targeting updates to devices and for user support.

-   A required phone number and optional website for user support, which appears in the **About** screen in **Settings**.

<a href="" id="constraints-"></a>**Constraints:**  
-   **ImageTimeOnly** – For those settings to put directly into the registry hive.

-   **FirstVariationOnly** – For those settings that can be configured at runtime and potentially based on SIM value.

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="PhoneMetadataDeviceTargetingInfo"  
                         Description="Use to set phone metadata including the phone model name, OEM and mobile operator name, hardware and software versions, and so on."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <!-- Define the Targets for the Variant --> 
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

      <Static>  
        <!-- These settings are ImageTimeOnly and will be put directly into the registry hive -->
        <Settings Path="DeviceInfo/Static">       
          <Setting Name="PhoneManufacturer" Value="" />    
          <Setting Name="PhoneManufacturerDisplayName" Value="" /> 
          <Setting Name="PhoneROMVersion" Value="" /> 
          <Setting Name="PhoneHardwareRevision" Value="" />    
          <Setting Name="PhoneSOCVersion" Value="" /> 
          <Setting Name="PhoneFirmwareRevision" Value="" />   
          <Setting Name="PhoneRadioHardwareRevision" Value="" />    
          <Setting Name="PhoneRadioSoftwareRevision" Value="" /> 
          <Setting Name="PhoneBootLoaderVersion" Value="" />    
          <Setting Name="PhoneROMLanguage" Value="" /> 
          <Setting Name="PhoneHardwareVariant" Value="" /> 
       </Settings>  
      </Static>

      <!-- Specify the Variant -->
      <Variant Name=""> 
        <TargetRefs>
          <TargetRef Id="" /> 
        </TargetRefs>

        <!-- These settings are FirstVariationOnly and can be configured at runtime potentially based on SIM value --> 
        <Settings Path="DeviceInfo/Variant">
          <Setting Name="PhoneMobileOperatorName" Value="" /> 
          <Setting Name="PhoneManufacturerModelName" Value="" />    
          <Setting Name="PhoneMobileOperatorDisplayName" Value="" /> 
          <Setting Name="PhoneSupportPhoneNumber" Value="" />    
          <Setting Name="PhoneSupportLink" Value="" /> 
          <Setting Name="PhoneOEMSupportLink" Value="" />    
          <Setting Name="PhoneModelName" Value="" /> 
          <Setting Name="RoamingSupportPhoneNumber" Value="" />
       </Settings> 
      </Variant>

    </ImageCustomizations>
    ```

2.  Specify an `Owner` and configure the targets and conditions for the variant.

3.  Specify a value for each of the following settings.

    <table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Constraint</th>
    <th>Setting Name</th>
    <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p>ImageTimeOnly</p></td>
    <td><p><strong>PhoneManufacturer</strong></p></td>
    <td><p><strong>Required.</strong> This setting must contain a code specified by Microsoft that corresponds to the OEM. This setting must not be changed over time, even if an OEM name changes (such as in a merger); the original OEM name must continue to be specified.</p>
    <p>This setting is used for targeting device updates, for connecting to the store-within-a-store in the Windows Store, and for Watson reports. It also appears as part of the device friendly name on the Welcome screen, the <strong>About</strong> screen in <strong>Settings</strong>, the Ringtone list, and on the computer.</p>
    <p>The value must be a valid OEM ID. To get the valid OEM ID that applies to you, contact your Microsoft representative.</p>
    <p>The OEM ID value is in all capital letters, for example, FABRIKAM.</p>
    <p>To use an OEM-provided value to display in the <strong>Settings</strong> &gt; <strong>About</strong> screen, OEMs can use the optional <strong>PhoneManufacturerDisplayName</strong> setting. For more information, see the next entry in this table.</p>
    <p>The <strong>PhoneManufacturer</strong>, <strong>PhoneManufacturerModelName</strong>, and <strong>PhoneMobileOperatorName</strong> should create a unique Phone-Operator-Pairing (POP). </p></td>
    </tr>
    <tr class="even">
    <td><p>ImageTimeOnly</p></td>
    <td><p><strong>PhoneManufacturerDisplayName</strong></p></td>
    <td><p><strong>Optional.</strong> Use this setting to create an OEM-provided value to display in the <strong>Settings</strong> &gt; <strong>About</strong> screen, on apps running on the PC connected to the device through MTP, in the <strong>Manufacturer</strong> field in the device properties window when the device is connected to the PC through MTP, and in the list of backups on OneDrive and during initial device setup on the <strong>Restore backups</strong> page.</p>
    <p>If <strong>PhoneManufacturerDisplayName</strong> is set, the OS does not use the value in the <strong>PhoneManufacturer</strong> setting and uses the OEM-provided value to display in the <strong>About</strong> screen instead. If OEMs do not set a value for <strong>PhoneManufacturerDisplayName</strong>, the OS uses the value in the required <strong>PhoneManufacturer</strong> setting instead.</p>
    <p>When setting the value, OEMs must only use these characters: alphanumeric (A-Z, a-z, 0-9), space, period (<strong>.</strong>), comma (<strong>,</strong>)</p></td>
    </tr>
    <tr class="odd">
    <td><p>ImageTimeOnly</p></td>
    <td><p><strong>PhoneROMVersion</strong></p></td>
    <td><p><strong>Optional.</strong> This value is specified by the silicon vendor and should not be modified by the OEM. It is used for targeting phone updates.</p>
    <p>This value has the format uint16.uint16.uint16.uint16.</p></td>
    </tr>
    <tr class="even">
    <td><p>ImageTimeOnly</p></td>
    <td><p><strong>PhoneHardwareRevision</strong></p></td>
    <td><p>This value is specified by the silicon vendor and should not be modified by the OEM. It is used for targeting phone updates and for Watson reports.</p>
    <p>This value has the format uint16.uint16.uint16.uint16.</p></td>
    </tr>
    <tr class="odd">
    <td><p>ImageTimeOnly</p></td>
    <td><p><strong>PhoneSOCVersion</strong></p></td>
    <td><p>This value is specified by the silicon vendor and should not be modified by the OEM. It is used for targeting phone updates.</p>
    <p>This string must be less than 256 Unicode characters in length, and be alphanumeric (A-Z, a-z, 1-9). Leading and trailing spaces and other white space characters such as tabs are not permitted. The underscore character may be used to separate elements in the string, for example &quot;Contoso_4000&quot;.</p></td>
    </tr>
    <tr class="even">
    <td><p>ImageTimeOnly</p></td>
    <td><p><strong>PhoneFirmwareRevision</strong></p></td>
    <td><p><strong>Required.</strong> This setting represents the complete version of the OEM software on the phone. It is used for targeting phone updates.</p>
    <p>This value has the format uint16.uint16.uint16.uint16. The recommended value is based on the Silicon Vendor (SV) BSP version (major.minor) and the OEM software version (major.minor), with the format &quot;<em>majorSV.minorSV.majorOEM.minorOEM</em>&quot;. The value cannot be &quot;0.0.0.0&quot;.</p></td>
    </tr>
    <tr class="odd">
    <td><p>ImageTimeOnly</p></td>
    <td><p><strong>PhoneRadioHardwareRevision</strong></p></td>
    <td><p><strong>Optional.</strong> This value should reflect the current version of the OEM’s modem hardware. It should be incremented when the modem hardware is modified. It is used for targeting phone updates.</p>
    <p>This string must be less than 256 Unicode characters in length, and be alphanumeric (A-Z, a-z, 1-9). Leading and trailing spaces and other white space characters such as tabs are not permitted. The underscore character may be used to separate elements in the string, for example &quot;Contoso_4000&quot;.</p></td>
    </tr>
    <tr class="even">
    <td><p>ImageTimeOnly</p></td>
    <td><p><strong>PhoneRadioSoftwareRevision</strong></p></td>
    <td><p>This value is specified by the silicon vendor and should not be modified by the OEM. It is used for targeting phone updates.</p>
    <p>This value has the format uint16/string, and can contain a maximum of 15 characters.</p></td>
    </tr>
    <tr class="odd">
    <td><p>ImageTimeOnly</p></td>
    <td><p><strong>PhoneBootLoaderVersion</strong></p></td>
    <td><p><strong>Optional.</strong> This value is specified by the silicon vendor and should not be modified by the OEM. It is used for targeting phone updates and for Watson reports.</p></td>
    </tr>
    <tr class="even">
    <td><p>ImageTimeOnly</p></td>
    <td><p><strong>PhoneROMLanguage</strong></p></td>
    <td><p><strong>Required.</strong> Set the value to a four character Language Code Identifier (LCID), such as &quot;0409&quot; for English (US). </p></td>
    </tr>
    <tr class="odd">
    <td><p>ImageTimeOnly</p></td>
    <td><p><strong>PhoneHardwareVariant</strong></p></td>
    <td><p><strong>Required.</strong> Use to describe the specific hardware configuration used for a particular phone model. The hardware configuration that makes up the <strong>PhoneHardwareVariant</strong> includes specific hardware parts such as the applications processor, radio (network bands), sensors, memory configuration, and so on. For example, if Contoso (a fictional OEM) produces a popular phone model called Fabrikam 2000 that ships on multiple mobile networks, the phone may come in two hardware variants: &quot;VAR-CDMA&quot;, for use on CDMA networks, and &quot;VAR-GSM&quot; for use on GSM networks.</p>
    <p>Use a string value to specify the variant of the OEM's hardware. This setting is mandatory for code signing and registration.</p>
    <div class="alert">
    <strong>Note</strong>  
    <p>OEMs creating a runtime configuration image cannot span across multiple <strong>PhoneHardwareVariant</strong>s.</p>
    </div>
    <div>
     
    </div></td>
    </tr>
    <tr class="even">
    <td><p>FirstVariationOnly</p></td>
    <td><p><strong>PhoneMobileOperatorName</strong></p></td>
    <td><p><strong>Required.</strong> This setting is used for targeting phone updates. It must contain a code specified by Microsoft that corresponds to the mobile operator. These codes are provided in [Registry values for mobile operator IDs](registry-values-for-mobile-operator-ids.md). For open market phones, in which the mobile operator is not known, use the codes in [Registry values for carrier-unlocked phones](registry-values-for-carrier-unlocked-phones.md) instead.</p>
    <p>This string is not visible to the user.</p>
    <p>This setting must not be changed over time even if the user switches SIMs or mobile operators, as updates are always targeted based on the first mobile operator associated with the phone.</p>
    <p>The <strong>PhoneManufacturer</strong>, <strong>PhoneManufacturerModelName</strong>, and <strong>PhoneMobileOperatorName</strong> should create a unique Phone-Operator-Pairing (POP). </p></td>
    </tr>
    <tr class="odd">
    <td><p>FirstVariationOnly</p></td>
    <td><p><strong>PhoneManufacturerModelname</strong></p></td>
    <td><p><strong>Required.</strong> This setting is used for targeting phone updates. It must contain a code that is registered with Microsoft to correspond to the phone model. This string must be unique – if there are any hardware differences between phones that require changes to the BSP, the phones must have different <strong>PhoneManufacturerModelName</strong> values. This string must not be changed after the phone is sold.</p>
    <p>This string is for OEM reference and can be set to any value that meets the following requirements:</p>
    <ul>
    <li><p>The string length must be less than 256 characters</p></li>
    <li><p>The string must be alphanumeric (A-Z, a-z, 1-9)</p></li>
    <li><p>Leading and trailing spaces are not permitted and will cause update failures</p></li>
    </ul>
    <div class="alert">
    <strong>Note</strong>  
    <p>This string is returned by the <strong>DeviceStatus.DeviceName</strong> property. For more information, see the SDK Documentation.</p>
    </div>
    <div>
     
    </div>
    <p>Microsoft recommends using a different value for <strong>PhoneManufacturerModelname</strong> and another value for <strong>PhoneModelName</strong>. <strong>PhoneManufacturerModelname</strong> should be as unique as possible for the particular device revision or variant.</p>
    <p>The <strong>PhoneManufacturer</strong>, <strong>PhoneManufacturerModelName</strong>, and <strong>PhoneMobileOperatorName</strong> should create a unique Phone-Operator-Pairing (POP). </p></td>
    </tr>
    <tr class="even">
    <td><p>FirstVariationOnly</p></td>
    <td><p><strong>PhoneMobileOperatorDisplayName</strong></p></td>
    <td><p><strong>Optional.</strong> Defines the friendly name of the Mobile Operator. This string is displayed in the support section of the <strong>About</strong> screen in <strong>Settings</strong> and in the ringtone list.</p></td>
    </tr>
    <tr class="odd">
    <td><p>FirstVariationOnly</p></td>
    <td><p><strong>PhoneSupportPhoneNumber</strong></p></td>
    <td><p><strong>Optional.</strong> Specifies the OEM or mobile operator’s support contact phone number. This string is displayed in the <strong>About</strong> screen in <strong>Settings</strong>. This setting also corresponds to the Genuine Windows Phone Certificates (GWPC) support number. This should be a string of numbers. The country code is not required. This setting varies by partner.</p></td>
    </tr>
    <tr class="even">
    <td><p>FirstVariationOnly</p></td>
    <td><p><strong>PhoneSupportLink</strong></p></td>
    <td><p><strong>Optional.</strong> Specifies the mobile operator’s support website. The default is an empty string (&quot;&quot;), which means that a support link will not be displayed to the user.</p>
    <p>This should be a functional link that starts with http://. The link should be a URL that redirects to the mobile version of the web page. The content in the webpage should reflow to the screen width. This can be achieved by adding the CSS Tag &quot;@-ms-viewport { width: device-width; }&quot;</p>
    <p>This setting varies by mobile operator.</p></td>
    </tr>
    <tr class="odd">
    <td><p>FirstVariationOnly</p></td>
    <td><p><strong>PhoneOEMSupportLink</strong></p></td>
    <td><p><strong>Optional.</strong> Specifies the OEM’s support website. The default is an empty string (&quot;&quot;), which means that a support link will not be displayed to the user.</p>
    <p>This should be a functional link that starts with http://. The link should be a URL that redirects to the mobile version of the web page. The content in the webpage should reflow to the screen width. This can be achieved by adding the CSS Tag &quot;@-ms-viewport { width: device-width; }&quot;</p>
    <p>This setting varies by OEM.</p></td>
    </tr>
    <tr class="even">
    <td><p>FirstVariationOnly</p></td>
    <td><p><strong>PhoneModelName</strong></p></td>
    <td><p><strong>Required.</strong> This string is the brand name of the phone and is used for Customer Support and Watson reports. This string is the name marketed to consumers or end users and appears as part of the phone friendly name in multiple places in the phone’s UI including: on the Welcome screen, the <strong>About</strong> screen in <strong>Settings</strong>, and on the desktop computer.</p>
    <p>OEMs should ensure that this value matches the value of the <strong>ProductString</strong> value under the <strong>HKEY_LOCAL_MACHINE\CurrentControlSet\Control\USBFN\Default</strong> registry key.</p>
    <p>Microsoft recommends that partners consider the following when specifying the value for the <code>PhoneModelName</code> setting:</p>
    <ul>
    <li><p>Leave this name blank during development until the phone is ready to enter trials, as applications can collect and read this value.</p></li>
    <li><p>Do not include the manufacturer or OEM name when setting the value for this setting. There are dialogs on the phone that display <code>PhoneManufacturer</code> appended to <code>PhoneModelName</code> so including the OEM or manufacturer’s name when setting <code>PhoneModelName</code> will result in repetitions. For example, if <code>PhoneManufacturer</code> is set to <em>Contoso</em> and <code>PhoneModelName</code> is set to <em>Contoso Phone z102</em>, the result will show up as <em>Contoso Contoso Phone z102</em>.</p></li>
    <li><p>Use a different value for <code>PhoneModelName</code> and another value for <code>PhoneManufacturerModelName</code>. The latter should be as unique as possible for the particular device revision or variant.</p></li>
    </ul></td>
    </tr>
    <tr class="odd">
    <td><p>FirstVariationOnly</p></td>
    <td><p><strong>RoamingSupportPhoneNumber</strong></p></td>
    <td><p><strong>Optional.</strong> Specifies the OEM or mobile operator's roaming support contact phone number. This string is displayed in the <strong>About</strong> screen in <strong>Settings</strong>.</p>
    <p>For C+G dual SIM phones, OEMs may need to configure this setting. For more information, see [Configure C+G dual SIM settings](configure-c-g-dual-sim-settings.md).</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing Steps:**  
1.  Flash the build containing this customization to a phone.

2.  Go to the **About** screen in **Settings**. Tap on the **More Info** button.

3.  Verify that the information on this screen matches the values you specified.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Phone%20metadata%20in%20DeviceTargetingInfo%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




