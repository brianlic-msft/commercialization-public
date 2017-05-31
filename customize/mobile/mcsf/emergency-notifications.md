---
title: Emergency notifications
description: Partners can turn on support for various government emergency notification programs.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 7b19d558-ba2f-4c00-9756-d6b2338b1866
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Emergency notifications


Partners can turn on support for various government emergency notification programs.

Windows supports the following types of government emergency notification programs:

-   **For devices sold in the United States**, partners can turn on support for the Commercial Mobile Alert Service (CMAS) if the mobile operator’s network supports it. Partners can also specify the alert type defaults. CMAS is a federal program in the United States in which users can receive emergency notifications as high priority SMS messages in situations such as national emergencies, natural disasters, severe weather, and AMBER alerts.

    The OS also supports handling of CMAS messages for one additional language on a separate range of CMAS channels (4383 – 4395) in compliance with the ATIS-0700013 (*Implementation Guidelines for Mobile Device Support of Multi-Language CMAS*) specification.

-   **For devices sold in Japan**, partners can turn on the Earthquake & Tsunami Warning System (ETWS) if the mobile operator’s network supports it.

-   **For devices sold in the Netherlands**, partners can turn on the Netherlands Announcements if the mobile operator’s network supports it.

-   **For devices sold in Chile**, partners can enable the device to receive LAT-Alert Local Alerts if the mobile operator’s network supports it.

-   **For devices sold in Taiwan**, partners can enable the device to receive Taiwan Alerts.

Emergency messages are displayed as notifications at the top of the screen until they are dismissed by the user. Emergency messages do not support reply, forward or copy and paste. They can be received even in storage full conditions. Emergency messages use a distinct alert sound when they arrive as well as vibration.

Except for LAT-Alert Local Alerts, when an alert notification shows, users can dismiss the alert message or tap a **Settings** button to go to the messaging settings page where they can easily change their emergency alert settings after receiving an alert. The **Settings** button is only shown if the OS has been configured to show the emergency alert settings page. This button is shown for all types of emergency alerts where there is a user-visible settings page to let users control the alerts. If there are other alert messages, these messages will not be dismissed. The user always has to close each alert individually.

<a href="" id="constraints---none"></a>**Constraints:** None  
This customization supports: **per-SIM** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Modify the following answer file code sample based on the instructions given for the alert type that you want to enable.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="EmergencyNotifications"  
                         Description="Use to enable and configure the settings for certain government emergency notification programs."  
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
     
        <!-- Enable and configure the settings for the emergency notification program program. 
             See the sections for the emergency notification program for more information about the settings you can enable. -->

      </Variant>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Define **Targets** or conditions for when a variant can be applied, such as keying off a SIM's MCC, MNC, and SPN.

4.  Define settings for a **Variant**, which are applied if the associated target's conditions are met.

5.  The `EmOperatorEnabled` setting specifies the emergency alert user interface to be shown to the user. The values for specific country/region alert systems are shown in their respective sections.

    However, if `EmOperatorEnabled` is not set, the default value is 0 or none.

    Configure the settings for the government emergency notification program that you want to enable. Each section shows the correct `EmOperatorEnabled` value that you need to use to enable the government emergency notification program and the other settings you can use to fully configure the alert system:

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>EmOperatorEnabled value</th>
    <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p>0</p></td>
    <td><p>None</p></td>
    </tr>
    <tr class="even">
    <td><p>1</p></td>
    <td><p>CMAS Alerts</p></td>
    </tr>
    <tr class="odd">
    <td><p>2</p></td>
    <td><p>NL Alerts</p></td>
    </tr>
    <tr class="even">
    <td><p>3</p></td>
    <td><p>ETWS Alerts</p></td>
    </tr>
    <tr class="odd">
    <td><p>4</p></td>
    <td><p>LAT Alerts</p></td>
    </tr>
    <tr class="even">
    <td><p>5</p></td>
    <td><p>Taiwan Alerts</p></td>
    </tr>
    </tbody>
    </table>

     

<a href="" id="testing-steps-"></a>**Testing steps:**  
Work with your mobile operator to test this customization on their network.

## <a href="" id="us-cmas"></a>US CMAS emergency notifications settings


Windows 10 Mobile supports these CMAS alert types: Presidential alerts, Extreme alerts, Severe alerts, and AMBER alerts.

Each CMAS emergency alert type has a toggle in the UI to allow the user to enable or disable the alert type. By default, all alert types are On. Note that Presidential alerts are read-only and always on.

Users' settings persist across update and restore, including updates and restores from apollo. Partners can set the defaults for these alert types but users' preferences take precedence.

**Instructions:**

1.  Use the following settings to fully configure CMAS alert types:

    ``` syntax
        <Settings Path="Messaging/PerSimSettings/$(__ICCID)/EmergencyAlertOptions">  
          <Setting Name="EmOperatorEnabled" Value="1" />
          <Setting Name="CmasExtremeAlertEnabled" Value="" />
          <Setting Name="CmasSevereAlertEnabled" Value="" />
          <Setting Name="CmasAMBERAlertEnabled" Value="" />
          <Setting Name="SevereAlertDependentOnExtremeAlert" Value="" />
        </Settings>  

        <!-- To fully configure CMAS, you must also set the per-device and per-IMSI DefaultMCC setting. 
        <Settings Path="CellCore/PerDevice/SMS">  
          <Setting Name="DefaultMCC" Value="" />                  
        </Settings>  
     
        <Settings Path="CellCore/PerIMSI/$(__IMSI)/SMS">  
          <Setting Name="DefaultMCC" Value="" />                  
        </Settings>  
        -->
    ```

2.  Keep the `EmOperatorEnabled` value set to 1. This specifies CMAS Alerts.

3.  Specify the values for `CmasExtremeAlertEnabled`, `CmasSevereAlertEnabled`, and `CmasAMBERAlertEnabled` to either 0 (Off) or 1 (On). These settings are on by default.

4.  **Optional.** To meet requirements for certain mobile operators, OEMs may need to configure the `SevereAlertDependentOnExtremeAlert` setting to either 0 (off) or 1 (On). This enables the CMAS-Severe alert switch to be dependent on the CMAS-Extreme alert shown in the **Emergency alerts** page in the messaging settings CPL. When enabled, if users turn off CMAS-Extreme alerts, CMAS-Severe alerts will also be turned off. CMAS-Severe alerts can only be toggled if CMAS-Extreme alerts are also turned on.

5.  To fully configure CMAS, you must also set the per-device or per-SIM `DefaultMCC` setting. You may set the `DefaultMCC` setting for both paths.

    The per-device path covers the scenario when an unexpected SIM target is inserted. In this case, the value for the per-device `DefaultMCC` will be used as the device-wide default value. The per-IMSI `DefaultMCC` value is used when a specific SIM is defined within the **Target** and a SIM matching the **Target** conditions is inserted into the device. In this case, the per-IMSI `DefaultMCC` value will override whatever value you set in the per-device configuration.

    To fully allow device users to receive CMAS messages applicable to the United States, OEMs should set the `DefaultMCC` value to either 310 or 311. Do not use 001 even when performing a test SIM card scenario.

If you are migrating CMAS alert settings from previous Windows Phone releases to Windows 10 Mobile, use the following mapping as a guide for restoring users' settings:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Previous release settings</th>
<th>Windows 10 Mobile settings</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>AMBERT alerts: On</p></td>
<td><p>AMBER alert: On</p></td>
</tr>
<tr class="even">
<td><p>Presidential alerts only</p></td>
<td><p>Presidential alerts: On</p>
<p>Extreme alerts: Off</p>
<p>Severe alerts: Off</p></td>
</tr>
<tr class="odd">
<td><p>Presidential and Extreme alerts</p></td>
<td><p>Presidential: On</p>
<p>Extreme alerts: On</p>
<p>Severe alerts: Off</p></td>
</tr>
<tr class="even">
<td><p>All alerts</p></td>
<td><p>Presidential: On</p>
<p>Extreme alerts: On</p>
<p>Severe alerts: On</p></td>
</tr>
</tbody>
</table>

 

## <a href="" id="japan-etws"></a>Japan ETWS emergency notifications settings


Partners can turn on the Earthquake & Tsunami Warning System (ETWS) and configure an alert sound to be played with the alert message.

**Instructions:**

1.  Use the following settings to fully configure ETWS alert types:

    ``` syntax
        <Settings Path=Messaging/PerSimSettings/$(__ICCID)">
          <!-- Use to add a custom alert sound
          <Asset Name="EtwsSound" Source="" 
          <Setting Name="EtwsSoundFileName" Value="" />
          -->

          <Setting Name="EarthquakeMessageString" Value="" />
          <Setting Name="TsunamiMessageString" Value="" />
          <Setting Name="EarthquakeTsunamiMessageString" Value="" />
        </Settings>

        <Settings Path="Messaging/PerSimSettings/$(__ICCID)/EtwsSoundEnabled">  
          <Setting Name="EmOperatorEnabled" Value="3" />
          <Setting Name="EtwsSoundEnabled" Value="" />
        </Settings>  
    ```

2.  To use a custom alert sound:

    1.  Add the custom alert sound file by adding the `EtwsSound` asset name and setting `Source` to the location and file name of the custom alert sound.

    2.  Use the `EtwsSoundFileName` setting and set the value to the name of the sound file you added in the previous step.

3.  The default strings for the tsunami and earthquake messages are localized. However, only one set of customized strings are allowed. If you override the default strings, the same custom strings are displayed regardless of the language set on the device.

    -   To override the Primary Earthquake default message, specify the `EarthquakeMessageString` setting value. This string will be used regardless of what language is set on the device.

    -   To override the Primary Tsunami default message, specify the `TsunamiMessageString` setting value. This string will be used regardless of what language is set on the device.

    -   To override the Primary Tsunami and Earthquake default message, specify the `EarthquakeTsunamiMessageString` setting value. This string will be used regardless of what language is set on the device.

4.  Keep the `EmOperatorEnabled` value set to 3. This specifies ETWS Alerts.

5.  To play an ETWS alert sound, set `EtwsSoundEnabled` to 0 (Off) or 1 (On). If this value is not set, the default is on.

## <a href="" id="netherlands-nl"></a>Netherlands NL emergency notifications settings


The Netherlands NL alert system is based on the US CMAS system and the device shows a user experience similar to CMAS alerts.

**Instructions:**

1.  Use the following settings to fully configure NL alert types:

    ``` syntax
        <Settings Path="Messaging/PerSimSettings/$(__ICCID)/NlAlertOptions">
            <Setting Name="EmOperatorEnabled" Value="2" />
            <Setting Name="CmasExtremeAlertEnabled" Value="" />
        </Settings>  
    ```

2.  Keep the `EmOperatorEnabled` value set to 2. This specifies NL Alerts.

3.  Set `Nl2AlertEnabled` to 0 (Off) or 1 (On) to enable NL-Alert2 alerts.

    `Nl2AlertEnabled` controls whether NL-Alert2 alerts, which are alert types that users can toggle, appear in the Netherlands CMAS settings page.

## Chile LAT-Alert Local Alerts


The LAT-Alert emergency alert system is based on the 3GPP emergency alerts and CMAS system. For devices shipping in Chile, partners must enable this customization.

**Instructions:**

1.  Use the following settings to fully configure Chile LAT-Alert Local Alert types:

    ``` syntax
        <Settings Path="Messaging/PerSimSettings/$(__ICCID)/LatAlertOptions">
            <Setting Name="EmOperatorEnabled" Value="4" />
            <Setting Name="LatLocalAlertEnabled" Value="" />
        </Settings>  
    ```

2.  Keep the `EmOperatorEnabled` value set to 4. This specifies LAT-Alert Local alerts.

3.  Set `LatLocalAlertEnabled` to 0 (Off) or 1 (On) to enable LAT-Alert Local alerts to be received.

    **Note**  Users will not be able to configure nor disable LAT-Alert Local alerts through the Messaging settings screen.

     

## Taiwan Alerts


The Taiwan Emergency Alerts system provides the following support:

-   Primary and secondary CMAS channels, including Required Monthly Test.

    -   Users see primary language messages if the corresponding setting is enabled, such as Amber Alerts.

    -   The secondary language is dependent on the language ID of the sent broadcast being equivalent to the system's language ID. So, if the user's device language is in English and the sent broadcast comes in through the secondary language channel with a Spanish language ID, the message will not show up. This also applies to CMAS alerts.

    -   Message and notification display is the same as the US CMAS behavior.

-   Taiwan Alert message

    -   Cell broadcast messages are received in these channels: 911 (English) and 919 (Traditional Chinese)

    -   Messages are displayed like regular cell broadcast messages, which means there are no special CMAS tone or vibration.

Support for the Taiwan Emergency Alerts is a regulatory requirement for devices shipping in Taiwan, so partners shipping devices in Taiwan must enable this customization.

Users can change the Taiwan Alert settings through the Messaging settings screen.

**Instructions:**

1.  Use the following settings to fully configure Taiwan Emergency Alerts:

    ``` syntax
        <Settings Path="Messaging/PerSimSettings/$(__ICCID)/TaiwanAlertOptions">
            <Setting Name="EmOperatorEnabled" Value="5" />
            <Setting Name="TaiwanAlertEnabled" Value="" />
            <Setting Name="TaiwanPresidentialAlertEnabled" Value="" />
            <Setting Name="TaiwanEmergencyAlertEnabled" Value="" />
            <Setting Name="TaiwanRequiredMonthlyTestEnabled" Value="" />
        </Settings>  
    ```

2.  Keep the `EmOperatorEnabled` value set to 5. This specifies Taiwan Alerts.

3.  To receive Taiwan Alerts, set `TaiwanAlertEnabled` to 0 (False) or 1 (True).

    Users will not be able to configure nor disable Taiwan alerts through the Messaging settings screen.

4.  To receive alerts from the Leader of the Taiwan Area, set `TaiwanPresidentialAlertEnabled` to 0 (False) or 1 (True).

    Users will not be able to configure this alert type through the Messaging settings screen.

5.  To receive Taiwan Emergency Alerts, set `TaiwanEmergencyAlertEnabled` to 0 (False) or 1 (True).

6.  To receive Taiwan Required Monthly Test Alerts, set `TaiwanRequiredMonthlyTestEnabled` to 0 (False) or 1 (True).

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Emergency%20notifications%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




