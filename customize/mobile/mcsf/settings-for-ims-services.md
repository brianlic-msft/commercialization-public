---
title: Settings for IMS services
description: OEMs can configure the default settings and toggle for IMS services to meet mobile operator requirements.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: bcac2772-da23-48df-bd3c-c729a2f4cace
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Settings for IMS services


OEMs can configure the default settings and toggle for IMS services to meet mobile operator requirements. Users can later manually change the default values for these settings if they choose to do so.

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-IMSI** value, **per-device** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="IMSSettings"  
                         Description="Use to configure the toggles and other settings for IMS services."  
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

        <Settings Path="Localization/MUI">  
          <!-- Use to add your base MUI DLL file -->
          <Asset Name="BaseDll" Source="" />

          <!-- Use to specify the language MUI packages (*.dll.mui) for the languages you are supporting and have localized strings for -->
          <Asset Name="LanguageDll/$(langid)" Source="" />
          <Asset Name="LanguageDll/$(langid)" Source="" />
          <Asset Name="LanguageDll/$(langid)" Source="" />
          <!-- Add as many as you need -->         
        </Settings>
      </Static>

      <!-- Specify the Variant -->
      <Variant Name=""> 
        <TargetRefs>
          <TargetRef Id="" /> 
        </TargetRefs>
     
        <Settings Path="CellCore/PerIMSI/$(__IMSI)/CellUX/Critical">  

          <Setting Name="ShowVoLTEToggle" Value="" />
          <Setting Name="SwitchIMS" Value="" />         
          <Setting Name="SwitchSMSOverIMS" Value="" />         
          <Setting Name="SwitchVoiceOverIMS" Value="" />
          <Setting Name="SwitchVideoOverIMS" Value="" />         
          <Setting Name="SwitchXCAP" Value="" />
          <Setting Name="VoLTEToggleDescription" Value="" />
          <Setting Name="VoLTEToggleTitle" Value="" />

          <!-- Settings for IMS roaming -->
          <Setting Name="ShowVoLTERoaming" Value="" />
          <Setting Name="VoLTESectionTitle" Value="" />
          <Setting Name="VoLTERoamingTitle" Value="" />
          <Setting Name="VoLTERoamingOnDescription" Value="" />
          <Setting Name="VoLTERoamingOffDescription" Value="" />

          <!-- Settings during active VoLTE calls -->
          <Setting Name="VoLTESettingDisableDuringCall" Value="" />
          <Setting Name="WFCSettingDisableDuringCall" Value="" />
          <Setting Name="VoLTEToggleSettingDisableDuringCall" Value="" />
          <Setting Name="VoLTERoamingSettingDisableDuringCall" Value="" />

        </Settings>  

        <Settings Path="CellCore/PerDevice/CellUX/Critical">  
          <!-- Use to hide or show the VoLTE toggle in the Settings > Cellular+SIM > SIM settings screen.
          <Setting Name="ShowVoLTEToggle" Value="" />        
        </Settings>  

      </Variant>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Add the resource-only .dll file and the language MUI packages (\*.dll.mui) for the languages you are supporting. To do this, follow these steps:

    1.  Add the resource-only .dll that contains the custom display string by setting the `BaseDll` asset to point to the location of your base MUI DLL file. For example: *C:\\Path\\DisplayStrings.dll*.

    2.  Add the language MUI packages (\*.dll.mui) for all the languages you are supporting and have localized strings for. To do this:

        -   Set the asset's `Name` to `LanguageDll/`*$(langid)* where *$(langid)* corresponds to the language. For example: *LanguageDll/en-US*.

        -   Set the asset's `Source` to the location of the .dll.mui file for that language. For example: *C:\\Path\\en-us\\DisplayStrings.dll.mui*.

        -   Repeat the previous steps for the other languages.

            The following example shows the customization answer file entries for en-US, fr-CA, and es-MX languages:

            ``` syntax
            <Asset Name="LanguageDll/en-US" Source="C:\Path\en-us\DisplayStrings.dll.mui" />
            <Asset Name="LanguageDll/fr-CA" Source="C:\Path\fr-CA\DisplayStrings.dll.mui" />
            <Asset Name="LanguageDll/es-MX" Source="C:\Path\es-MX\DisplayStrings.dll.mui" />
            ```

        For more information, see [Create a resource-only .dll for localized strings](create-a-resource-only-dll-for-localized-strings.md).

4.  Define **Targets** or conditions for when a variant can be applied, such as keying off a SIM's MCC, MNC, and SPN.

5.  Define settings for a **Variant**, which are applied if the associated target's conditions are met.

6.  Set the value for the following settings:

    1.  Set the value for `ShowVoLTEToggle` to one of the following to hide or show the VoLTE toggle.

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
        <td><p>0 or 'No'</p></td>
        <td><p>Hides the VoLTE toggle in the <strong>Settings</strong> &gt; <strong>Cellular+SIM</strong> &gt; <strong>SIM</strong> screen.</p></td>
        </tr>
        <tr class="even">
        <td><p>1 or 'Yes'</p></td>
        <td><p>Shows the VoLTE toggle in the <strong>Settings</strong> &gt; <strong>Cellular+SIM</strong> &gt; <strong>SIM</strong> screen.</p></td>
        </tr>
        </tbody>
        </table>

         

    2.  Set the value for `SwitchIMS` to one of the following to switch IMS off or on with a toggle.

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
        <td><p>0 or 'No'</p></td>
        <td><p>The IMS service is not configured with the toggle.</p></td>
        </tr>
        <tr class="even">
        <td><p>1 or 'Yes'</p></td>
        <td><p>The IMS service will be switched on or off with the toggle.</p></td>
        </tr>
        </tbody>
        </table>

         

    3.  Set the value for `SwitchSMSOverIMS` to one of the following to switch SMS over IMS on or off when VoLTE is enabled.

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
        <td><p>0 or 'No'</p></td>
        <td><p>SMS over IMS is not configured with the toggle.</p></td>
        </tr>
        <tr class="even">
        <td><p>1 or 'Yes'</p></td>
        <td><p>SMS over IMS is switched on or off with the toggle.</p></td>
        </tr>
        </tbody>
        </table>

         

    4.  Set the value for `SwitchVoiceOverIMS` to one of the following to switch voice over IMS on or off when VoLTE is enabled.

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
        <td><p>0 or 'No'</p></td>
        <td><p>Voice over IMS is not configured with the toggle.</p></td>
        </tr>
        <tr class="even">
        <td><p>1 or 'Yes'</p></td>
        <td><p>Voice over IMS is switched on or off with the toggle.</p></td>
        </tr>
        </tbody>
        </table>

         

    5.  Set the value for `SwitchVideoOverIMS` to one of the following to switch video over IMS on or off when VoLTE is enabled.

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
        <td><p>0 or 'No'</p></td>
        <td><p>Video over IMS is not configured with the toggle.</p></td>
        </tr>
        <tr class="even">
        <td><p>1 or 'Yes'</p></td>
        <td><p>Video over IMS is switched on or off with the toggle.</p></td>
        </tr>
        </tbody>
        </table>

         

    6.  Set the value for `SwitchXCAP` to one of the following to switch the XML Configuration Access Protocol (XCAP) on or off when VoLTE is enabled.

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
        <td><p>0 or 'No'</p></td>
        <td><p>XCAP is not configured with the toggle.</p></td>
        </tr>
        <tr class="even">
        <td><p>1 or 'Yes'</p></td>
        <td><p>XCAP is switched on or off with the toggle.</p></td>
        </tr>
        </tbody>
        </table>

         

    7.  1.  To customize the VoLTE toggle description, set the `VoLTEToggleDescription` value to the name of the resource-only .dll file and specify the string offset. For example: *@DisplayStrings.dll,-101*.

            Replace *DisplayStrings.dll* with the name of your .dll file and replace *Offset* with the correct offset for the localized string.

        2.  To customize the VoLTE toggle label, set the `VoLTEToggleTitle` value to the name of the resource-only .dll file and specify the string offset. For example: *@DisplayStrings.dll,-102*.

            Replace *DisplayStrings.dll* with the name of your .dll file and replace *Offset* with the correct offset for the localized string.

7.  Set the value for the following IMS roaming settings:

    1.  To show the IMS roaming control in the cellular settings page, set `ShowVoLTERoaming` to one of the following values:

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
        <td><p>0 or 'No'</p></td>
        <td><p>Hides the VoLTE roaming control in the <strong>Settings</strong> &gt; <strong>Cellular+SIM</strong> &gt; <strong>SIM</strong> screen.</p></td>
        </tr>
        <tr class="even">
        <td><p>1 or 'Yes'</p></td>
        <td><p>Shows the VoLTE roaming control in the <strong>Settings</strong> &gt; <strong>Cellular+SIM</strong> &gt; <strong>SIM</strong> screen.</p></td>
        </tr>
        </tbody>
        </table>

         

    2.  To customize the section title for the IMS settings, specify a string as the value for `VoLTESectionTitle`. The string must not be longer than 127 characters.

    3.  To customize the description string for the IMS roaming control, specify a string as the value for `VoLTERoamingTitle`. The string must not be longer than 127 characters.

    4.  To customize the description that appears under the IMS roaming control when IMS roaming is turned on, specify a string as the value for `VoLTERoamingOnDescription`. The string must not be longer than 127 characters.

    5.  To customize the description that appears under the IMS roaming control when IMS roaming is turned off, specify a string as the value for `VoLTERoamingOffDescription`. The string must not be longer than 127 characters.

8.  You can customize the settings related to active VoLTE calls by configuring these settings:

    1.  To specify whether to grey out VoLTE-related settings during an active VoLTE call, set `VoLTESettingDisableDuringCall` to one of the following values:

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
        <td><p>0 or 'No'</p></td>
        <td><p>VoLTE-related settings are not greyed out.</p></td>
        </tr>
        <tr class="even">
        <td><p>1 or 'Yes'</p></td>
        <td><p>VoLTE-related settings are greyed out.</p></td>
        </tr>
        </tbody>
        </table>

         

    2.  To specify whether to grey out Wi-Fi calling settings during an active VoLTE call, set the value for `WFCSettingDisableDuringCall` to one of the following values:

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
        <td><p>0 or 'No'</p></td>
        <td><p>Wi-Fi calling settings are not greyed out.</p></td>
        </tr>
        <tr class="even">
        <td><p>1 or 'Yes'</p></td>
        <td><p>Wi-Fi calling settings are greyed out.</p></td>
        </tr>
        </tbody>
        </table>

         

    3.  To specify whether to grey out the VoLTE toggle during an active VoLTE call, set the value for `VoLTEToggleSettingDisableDuringCall` to one of the following values:

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
        <td><p>0 or 'No'</p></td>
        <td><p>The VoLTE toggle is not greyed out.</p></td>
        </tr>
        <tr class="even">
        <td><p>1 or 'Yes'</p></td>
        <td><p>The VoLTE toggle is greyed out.</p></td>
        </tr>
        </tbody>
        </table>

         

    4.  To specify whether to grey out the VoLTE roaming settings during an active VoLTE call, set the value for `VoLTERoamingSettingDisableDuringCall` to one of the following values:

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
        <td><p>0 or 'No'</p></td>
        <td><p>The VoLTE roaming settings are not greyed out.</p></td>
        </tr>
        <tr class="even">
        <td><p>1 or 'Yes'</p></td>
        <td><p>The VoLTE roaming settings are greyed out.</p></td>
        </tr>
        </tbody>
        </table>

         

9.  

    **Important**  
    Beginning with Windows Phone 8.1 GDR1, the `ShowVoLTEToggle` setting under the CellCore/PerDevice/CellUX/Critical settings path must be set. This ensures that OMA-DM VoLTE features for certain mobile operators are functioning properly. Once you have made this change to your answer file, the `ShowVoLTEToggle` setting in the CellCore/PerIMSI/$(\_\_IMSI)/CellUX/Critical settings path will be ignored. You may remove or leave the per-IMSI setting in your answer file.

     

    Set the value for `ShowVoLTEToggle` to one of the following to hide or show the VoLTE toggle.

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
    <td><p>0 or 'No'</p></td>
    <td><p>Hides the VoLTE toggle in the <strong>Settings</strong> &gt; <strong>Cellular+SIM</strong> &gt; <strong>SIM</strong> screen.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Yes'</p></td>
    <td><p>Shows the VoLTE toggle in the <strong>Settings</strong> &gt; <strong>Cellular+SIM</strong> &gt; <strong>SIM</strong> screen.</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a phone.

2.  Go to the **Settings** &gt; **Cellular & SIM** settings screen.

3.  Verify that the correct settings and toggle values are showing up depending on the values you specified for `ShowVoLTEToggle`, `SwitchIMS`, `SwitchSMSOverIMS`, and `SwitchVoiceOverIMS`.

4.  If you customized the VoLTE toggle label and description, verify that the correct localized strings are showing up based on the phone language.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Settings%20for%20IMS%20services%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




