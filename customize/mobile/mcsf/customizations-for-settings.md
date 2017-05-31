---
title: Customizations for Settings
description: The Settings app contains a predefined collection of user-configurable system settings that's organized into pages by functionality.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: c25e8fc8-09aa-4d3d-8288-26de2f43332b
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Customizations for Settings


The **Settings** app contains a predefined collection of user-configurable system settings that's organized into pages by functionality. As specified in policy, the appearance and default values of these settings are generally not customizable. The following table contain the complete list of user-facing settings that OEMs and mobile operators can change.

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
<td><p>[Start + theme settings: Enabling dark mode](https://msdn.microsoft.com/library/windows/hardware/mt762907)</p></td>
<td><p>OEMs can choose to specify whether the dark mode is applied.</p></td>
</tr>
<tr class="even">
<td><p>[Start + theme settings: Warning about light theme for AMOLED and OLED screens](warning-about-light-theme-for-amoled-and-oled-screens.md)</p></td>
<td><p>OEMs can choose to display a warning about battery life if the user selects the light theme on phones with AMOLED or OLED displays.</p></td>
</tr>
<tr class="odd">
<td><p>[Ringtones + sounds settings: Additional alarms](additional-alarms.md)</p></td>
<td><p>Partners can add one additional alarm sound to the phone for use in the <strong>Alarm &amp; Clocks</strong> app. Partners can also set a new default alarm.</p></td>
</tr>
<tr class="even">
<td><p>[Ringtones + sounds settings: Additional notification sounds](additional-notification-sounds.md)</p></td>
<td><p>Partners can add up to three new notification sounds and a reminder sound. In addition, you can also specify a default notification sound for messaging, voicemails, and reminders.</p></td>
</tr>
<tr class="odd">
<td><p>[Ringtones + sounds settings: Additional ringtones](additional-ringtones.md)</p></td>
<td><p>OEMs and mobile operators can each preload a set of custom ringtone files on Windows mobile devices, and they can set a default ringtone.</p></td>
</tr>
<tr class="even">
<td><p>[Ringtones + sounds settings: Call drop and call waiting sounds](call-drop-and-call-waiting-sounds.md)</p></td>
<td><p>OEMs can customize the call drop and call waiting sounds.</p></td>
</tr>
<tr class="odd">
<td><p>[Ringtones + sounds settings: Camera shutter sound](camera-shutter-sound.md)</p></td>
<td><p>The camera shutter sound that occurs when the user takes a picture or starts filming a video can be turned off by removing the <strong>Camera shutter</strong> option from the <strong>Sounds</strong> settings screen.</p></td>
</tr>
<tr class="even">
<td><p>[Ringtones + sounds settings: Ringtone store application](ringtone-store-application.md)</p></td>
<td><p>Partner apps can be used to sell ringtones to users. The app owner must provide the service for the ringtone catalog and to manage downloads. Users are shown an option to <strong>Get more</strong> ringtones in the ringtone picker, from which they can automatically launch the ringtone store application.</p></td>
</tr>
<tr class="odd">
<td><p>[Lock screen settings: Additional lock screen backgrounds](additional-lock-screen-backgrounds.md)</p></td>
<td><p>OEMs can add new lock screen background images for the lock screen and also set the default lock screen background.</p></td>
</tr>
<tr class="even">
<td><p>[Lock screen settings: Lock screen notifications](lock-screen-notifications.md)</p></td>
<td><p>OEMs can preload apps that support lock screen notifications.</p></td>
</tr>
<tr class="odd">
<td><p>[Lock screen settings: Screen timeout for AMOLED and OLED displays](screen-time-out-for-amoled-and-oled-displays.md)</p></td>
<td><p>OEMs can remove the <strong>15 minutes</strong>, <strong>30 minutes</strong>, and <strong>Never</strong> options from the <strong>Screen times out after</strong> dropdown in the <strong>Lock screen</strong> settings screen.</p>
<p>This is recommended for phones with AMOLED and OLED screens to prevent screen damage.</p></td>
</tr>
<tr class="even">
<td><p>[Notifications + actions settings: Configure Quick actions](configure-quick-settings.md)</p></td>
<td><p>OEMs can change the default set of actions for each slot on the <strong>Quick actions</strong> screen in <strong>Notifications &amp; actions</strong>.</p></td>
</tr>
<tr class="odd">
<td><p>[Wi-Fi settings: Change Wi-Fi to WLAN](change-wi-fi-to-wlan.md)</p></td>
<td><p>To meet regulatory requirements and/or meet mobile operator requirements for some markets, partners can replace the string <strong>Wi-Fi</strong> with the generic term <strong>WLAN</strong>.</p></td>
</tr>
<tr class="even">
<td><p>[Wi-Fi settings: Enable static IP](enable-static-ip.md)</p></td>
<td><p>To facilitate Wi-Fi certification tests, OEMs can enable a screen from the Wi-Fi settings screen that provides UI elements that allow you to specify a static IP address, gateway address, and DNS server address.</p></td>
</tr>
<tr class="odd">
<td><p>[Wi-Fi settings: Limited connectivity status](limited-connectivity-status.md)</p></td>
<td><p>Partners may override the default status message shown when a device is connected to a Wi-Fi access point.</p></td>
</tr>
<tr class="even">
<td><p>[Wi-Fi settings: Wi-Fi always on, always connected](wi-fi-always-on-always-connected.md)</p></td>
<td><p>Partners can modify AOAC behavior and UX for non-AOAC mode devices.</p></td>
</tr>
<tr class="odd">
<td><p>[Wi-Fi settings: Wi-Fi icon and notifications](wi-fi-icon-and-notifications.md)</p></td>
<td><p>Partners can configure settings related to the Wi-Fi icon.</p></td>
</tr>
<tr class="even">
<td><p>[Cellular + SIM settings: Add a suffix to the mobile operator name](add-a-suffix-to-the-mobile-operator-name.md)</p></td>
<td><p>To meet branding requirements for some mobile operators, OEMs can add a suffix to the network name that is displayed on the phone.</p></td>
</tr>
<tr class="odd">
<td><p>[Cellular + SIM settings: Additional Internet APN settings](additional-internet-apn-settings.md)</p></td>
<td><p>OEMs can hide both the <strong>add internet apn</strong> button and the <strong>IP type</strong> listbox in the <strong>internet APN</strong> settings screen.</p></td>
</tr>
<tr class="even">
<td><p>[Cellular + SIM settings: Background cellular data restriction](background-cellular-data-restriction.md)</p></td>
<td><p>To meet market or mobile operator requirements, OEMs can restrict background data in the data usage settings.</p></td>
</tr>
<tr class="odd">
<td><p>[Cellular + SIM settings: Cellular data fallback when in limited Wi-Fi connectivity](cellular-data-fallback-when-in-limited-wi-fi-connectivity.md)</p></td>
<td><p>OEMs can change the default behavior for the device when Wi-Fi connectivity becomes limited.</p></td>
</tr>
<tr class="even">
<td><p>[Cellular + SIM settings: Cellular settings for phones](cellular-settings-for-phones.md)</p></td>
<td><p>OEMs can hide certain user options for phones that appear in the <strong>Cellular &amp; SIM</strong> screen in <strong>Settings</strong>.</p></td>
</tr>
<tr class="odd">
<td><p>[Cellular + SIM settings: Change SIM to SIM/UIM](change-sim-to-simuim.md)</p></td>
<td><p>Partners can change the string &quot;SIM&quot; to &quot;SIM/UIM&quot; in the device UI.</p></td>
</tr>
<tr class="even">
<td><p>[Cellular + SIM settings: Change the default SIM name to match the SPN or operator name](change-the-default-sim-name-to-match-the-spn-or-operator-name.md)</p></td>
<td><p>By default, the OS displays <strong>SIM 1</strong> or <strong>SIM 2</strong> as the default friendly name for the SIM in slot 1 or slot 2 if the service provider name (SPN) or mobile operator name has not been set. Partners can use this customization to change the default name read from the SIM to define the SPN for SIM cards that do not contain this information or to generate the default friendly name for the SIM.</p></td>
</tr>
<tr class="odd">
<td><p>[Cellular + SIM settings: Connection speed option](connection-speed-option.md)</p></td>
<td><p>Partners can customize the listed names of the connection speeds, and can hide the user option to select the connection speed that is displayed on the <strong>SIM</strong> screen.</p></td>
</tr>
<tr class="even">
<td><p>[Cellular + SIM settings: Default highest connection speed](default-highest-connection-speed.md)</p></td>
<td><p>Partners can set the default value for the <strong>Highest connection speed</strong> option in the <strong>Settings</strong> &gt; <strong>Cellular &amp; SIM</strong> &gt; <strong>SIM</strong> screen by specifying the bitmask for any combination of radio technology to be excluded from the default value. The connection speed that has not been excluded will show up as the highest connection speed.</p></td>
</tr>
<tr class="odd">
<td><p>[Cellular + SIM settings: Default roaming option](default-roaming-option.md)</p></td>
<td><p>Partners can set the default value for the <strong>Default roaming options</strong> option in the <strong>Cellular &amp; SIM</strong> settings screen.</p></td>
</tr>
<tr class="even">
<td><p>[Cellular + SIM settings: Extended error messages for reject codes](extended-error-messages-for-reject-codes.md)</p></td>
<td><p>When a reject code is sent by the network, partners can specify that extended error messages should be displayed instead of the standard simple error messages.</p></td>
</tr>
<tr class="odd">
<td><p>[Cellular + SIM settings: Hide CDMA mode selection](hide-cdma-mode-selection.md)</p></td>
<td><p>For CDMA phones, partners can hide <strong>CDMA</strong> option in the network <strong>Mode</strong> selection drop-down that appears on the <strong>Cellular &amp; SIM</strong> screen in <strong>Settings</strong>.</p></td>
</tr>
<tr class="odd">
<td><p>[Cellular + SIM settings: Manual network selection timeout](manual-network-selection-timeout.md)</p></td>
<td><p>OEMs can change the default network selection timeout value.</p></td>
</tr>
<tr class="even">
<td><p>[Cellular + SIM settings: Permanent automatic mode](permanent-automatic-mode.md)</p></td>
<td><p>OEMs can enable permanent automatic mode for mobile networks that require the cellular settings to revert to automatic network selection after the user has manually selected another network when roaming or out of range of the home network.</p></td>
</tr>
<tr class="odd">
<td><p>[Cellular + SIM settings: Remove the trailing MSISDN digits on a SIM card](remove-the-trailing-msisdn-digits-on-a-sim-card.md)</p></td>
<td><p>OEMs can remove the trailing MSISDN digits from the service provider name (SPN) in the device UI.</p></td>
</tr>
<tr class="even">
<td><p>[Cellular + SIM settings: Settings for IMS services](settings-for-ims-services.md)</p></td>
<td><p>OEMs can configure the default settings and toggle for IMS services to meet mobile operator requirements.</p></td>
</tr>
<tr class="odd">
<td><p>[Cellular + SIM settings: View Internet APN](view-internet-apn.md)</p></td>
<td><p>For mobile operators that require it, OEMs can show the <strong>View Internet APN</strong> button in the <strong>Cellular &amp; SIM</strong> settings page for users that have a data plan.</p></td>
</tr>
<tr class="even">
<td><p>[Cellular + SIM settings: Wi-Fi calling errors](https://msdn.microsoft.com/library/windows/hardware/mt651724)</p></td>
<td><p>OEMs can customize the mobile device to configure settings related to Wi-Fi calling errors</p></td>
</tr>
<tr class="odd">
<td><p>[Kid's Corner: Default theme and accent color](kids-corner-default-theme-and-accent-color.md)</p></td>
<td><p>Partners can set the default theme, including the background color (light or dark) and the accent color for Kid’s Corner.</p></td>
</tr>
<tr class="even">
<td><p>[Brightness settings: Brightness tuning](brightness-tuning.md)</p></td>
<td><p>When the <strong>Brightness</strong> screen in <strong>Settings</strong> is not set to automatically adjust, this customization enables the user to select low, medium, and high intensities for the screen brightness.</p></td>
</tr>
<tr class="odd">
<td><p>[Brightness settings: Hide the auto brightness setting](hide-the-auto-brightness-setting.md)</p></td>
<td><p>OEMs can hide the automatic brightness setting for phones that do not have an ambient light sensor.</p></td>
</tr>
<tr class="even">
<td><p>[Date + time settings: Disabling NITZ or daylight saving time](disabling-nitz-or-daylight-saving-time.md)</p></td>
<td><p>OEMs can configure NITZ to handle daylight saving time appropriately for their market, or disable automatic setting of date and time completely.</p></td>
</tr>
<tr class="odd">
<td><p>[Date + time settings: Time zone priority list](time-zone-priority-list.md)</p></td>
<td><p>Beginning with Windows 10 Mobile, this customization is no longer necessary as the OS supports a location-based timezone detection service. However, to maintain backwards compatibility for some RPAL APIs that were previously released (such as <strong>GetTimeZoneInformationID</strong>, <strong>SetTimeZoneInformationByID</strong>, and so on), an updated table of the timezone IDs is provided for your reference.</p></td>
</tr>
<tr class="even">
<td><p>[Keyboard settings: Disabling text correction and suggestions](disabling-text-correction-and-suggestions.md)</p></td>
<td><p>For markets that do not use any of the available input languages, partners pick an alternative available input language as the default, but disable text prediction, auto-correction, and the spelling checker by default, using this customization.</p></td>
</tr>
<tr class="odd">
<td><p>[Keyboard settings: Hardware keyboard character repeats hold time and delay](hardware-keyboard-character-repeats-hold-time-and-delay.md)</p></td>
<td><p>For devices that have a hardware keyboard, partners can optionally set the character repeat hold time and delay.</p></td>
</tr>
<tr class="even">
<td><p>[Keyboard settings: Pre-enabled keyboard](pre-enabled-keyboard.md)</p></td>
<td><p>OEMs can use this customization to pre-enable additional device keyboards.</p></td>
</tr>
<tr class="odd">
<td><p>[Keyboard settings: Text correction and suggestions](text-correction-and-suggestions.md)</p></td>
<td><p>Partners must enable text correction and text suggestions for at least one input language, and can optionally include more.</p></td>
</tr>
<tr class="even">
<td><p>[Language settings: Mobile device languages](phone-languages.md)</p></td>
<td><p>Partners must select the set of available languages to include on the mobile device. Partners must also specify one of the included languages as the default device language.</p></td>
</tr>
<tr class="odd">
<td><p>[Region settings: Default list of countries/regions](https://msdn.microsoft.com/library/windows/hardware/mt637405)</p></td>
<td><p>OEMs can select the countries/regions to exclude from the default list shown in the mobile device's <strong>Country/Region</strong> list in the <strong>Settings</strong> screen.</p></td>
</tr>
<tr class="even">
<td><p>[Region settings: Regional format](regional-format.md)</p></td>
<td><p>Partners can specify the default country/region, regional format, pre-enabled keyboard, and speech languages for the device.</p></td>
</tr>
<tr class="odd">
<td><p>[Speech settings: Speech languages](speech-languages.md)</p></td>
<td><p>OEMs can specify the speech languages to include on the mobile device.</p></td>
</tr>
<tr class="even">
<td><p>[Ease of access settings: Telecoil and TTY support for accessibility](telecoil-and-tty-support-for-accessibility.md)</p></td>
<td><p>Partners can choose whether to show TTY and/or Telelcoil options in the device settings.</p></td>
</tr>
<tr class="odd">
<td><p>[Phone update settings: Auto scan for phone updates](auto-scan-for-phone-updates.md)</p></td>
<td><p>OEMs can show or hide the auto scan for updates setting on the device.</p></td>
</tr>
<tr class="even">
<td><p>[Phone update settings: Block using SD card for updates](block-using-sd-card-for-updates.md)</p></td>
<td><p>For devices that support an SD card, OEMs can either allow or block the use of the SD card for device updates.</p></td>
</tr>
<tr class="odd">
<td><p>[Phone update settings: Enable SD card override](enable-sd-card-override.md)</p></td>
<td><p>By default, using the SD card for device updates is disabled. OEMs who want to use the SD card for device updates must set <strong>EnableSDCardOverride</strong> to opt-in and re-enable updates using the SD card.</p></td>
</tr>
<tr class="even">
<td><p>[About settings: Phone metadata in DeviceTargetingInfo](phone-metadata-in-devicetargetinginfo.md)</p></td>
<td><p>Partners are required to set certain device metadata, including hardware, support, and OEM and MO information.</p></td>
</tr>
<tr class="odd">
<td><p>[FM Radio](fm-radio.md)</p></td>
<td><p>The BSP provided by the SoC vendor includes support for the FM radio.</p></td>
</tr>
<tr class="odd">
<td><p>[Radio settings: Showing the FM radio](showing-the-fm-radio.md)</p></td>
<td><p>For devices that include an FM radio chip, OEMs can show <strong>FM Radio</strong> in the Apps list.</p></td>
</tr>
<tr class="even">
<td><p>[Radio settings: FM radio frequency band](fm-radio-frequency-band.md)</p></td>
<td><p>OEMs can change the default setting for the FM radio receiver to use an appropriate frequency for the market in which the device will be sold.</p></td>
</tr>
<tr class="odd">
<td><p>[Browser settings: Default value for browser data saver](default-value-for-browser-data-saver.md)</p></td>
<td><p>Partners can configure the default setting for the browser data saver feature by turning the browser optimization service on or off, using the <strong>BrowserDataSaver</strong> setting</p></td>
</tr>
<tr class="even">
<td><p>[Browser settings: Show pictures automatically when browsing](show-pictures-automatically-when-browsing.md)</p></td>
<td><p>Partners can enable or disable the <strong>Show pictures automatically</strong> setting in the browser's <strong>advanced settings</strong> screen.</p></td>
</tr>
<tr class="odd">
<td><p>[Messaging settings: Adding an LED notification option](https://msdn.microsoft.com/library/windows/hardware/mt653694)</p></td>
<td><p>OEMs can configure a registry key to specify a selected notification LED as the LED notification and then add an <strong>LED notification</strong> option to the device's messaging <strong>Settings</strong> screen.</p></td>
</tr>
<tr class="even">
<td><p>[Messaging settings: CMAS Required Monthly Test](cmas-required-monthly-test.md)</p></td>
<td><p>Windows supports the Commercial Mobile Alert System (CMAS) Required Monthly Test (RMT) messages. To enable this, OEMs can set a registry key so messages can be delivered to the device.</p></td>
</tr>
<tr class="odd">
<td><p>[Messaging settings: Disable editing of the SMS center number](disable-editing-of-the-sms-center-number.md)</p></td>
<td><p>To meet market or mobile operator requirements, OEMs can configure a setting to prevent users from editing the <strong>SMS center number</strong> in the messaging settings CPL.</p></td>
</tr>
<tr class="even">
<td><p>[Messaging settings: Display CMAS message order](display-cmas-message-order.md)</p></td>
<td><p>Partners can configure the order in which newly received CMAS alert messages are displayed on the device.</p></td>
</tr>
<tr class="odd">
<td><p>[Messaging settings: Emergency notifications](emergency-notifications.md)</p></td>
<td><p>Partners can turn on support for various government emergency notification programs.</p></td>
</tr>
<tr class="even">
<td><p>[Messaging settings: Extract phone numbers in strings](extract-phone-numbers-in-strings.md)</p></td>
<td><p>Partners can extend the entity extraction feature that recognizes phone numbers in text. This customization allows strings of numbers that are concatenated to a string to be recognized.</p></td>
</tr>
<tr class="odd">
<td><p>[Messaging settings: International assisted dialing for SMS](international-assisted-dialing-for-sms.md)</p></td>
<td><p>If partners have turned off [Assistance for dialing international phone numbers](assistance-for-dialing-international-phone-numbers.md), partners may still override the MCC and MNC used for plus code replacement when sending SMS.</p></td>
</tr>
<tr class="even">
<td><p>[Messaging settings: MMS APN settings](mms-apn-settings.md)</p></td>
<td><p>Partners can choose to display an <strong>add mms apn</strong> or <strong>edit mms apn</strong> button that enables the user to configure the APN used for MMS.</p></td>
</tr>
<tr class="odd">
<td><p>[Messaging settings: MMS automatic download](mms-automatic-download.md)</p></td>
<td><p>Partners can choose to display an <strong>Automatically download MMS</strong> toggle to allows users to turn off automatic downloads of MMS messages. If the toggle is displayed, partners can also change the default value to stop automatic MMS downloads.</p></td>
</tr>
<tr class="even">
<td><p>[Messaging settings: MMS data options](https://msdn.microsoft.com/library/windows/hardware/mt628525)</p></td>
<td><p>Partners can configure the MMS data options to:</p>
<ul>
<li><p>Show the <strong>Allow MMS if cellular data is off</strong> toggle in the <strong>Messaging</strong> settings screen.</p></li>
<li><p>Allow MMS messaging even if data is turned off.</p></li>
<li><p>Allow MMS messaging even if data is turned off and the user is roaming.</p></li>
</ul></td>
</tr>
<tr class="odd">
<td><p>[Messaging settings: MMS delivery confirmation](mms-delivery-confirmation.md)</p></td>
<td><p>Partners can specify whether users receive notification that MMS messages could not be delivered, and determine whether users can control this by using the <strong>MMS delivery confirmation</strong> toggle in the <strong>Messaging</strong> settings screen.</p></td>
</tr>
<tr class="even">
<td><p>[Messaging settings: MMS for group messages](mms-for-group-messages.md)</p></td>
<td><p>For the setting that determines if group messages sent to multiple people must be sent as MMS, partners can customize the setting by hiding or showing the <strong>Group text</strong> toggle in the <strong>Messaging</strong> settings screen, changing the default value, and configuring the option to alert the user of possible additional charges for sending a group text as MMS.</p></td>
</tr>
<tr class="odd">
<td><p>[Messaging settings: MMS receipt acknowledgement](mms-receipt-acknowledgement.md)</p></td>
<td><p>Partners can specify whether the device automatically sends a receipt acknowledgment for MMS messages when messages arrive, and allow users to control the receipt acknowledgments by using the <strong>Send MMS acknowledgement</strong> toggle in the <strong>Messaging</strong> setting screen.</p></td>
</tr>
<tr class="even">
<td><p>[Messaging settings: SMS delivery confirmation](sms-delivery-confirmation.md)</p></td>
<td><p>Partners can specify whether users receive notification that SMS messages could not be delivered, and determine whether users can control these notifications by using the <strong>SMS delivery confirmation</strong> toggle in the <strong>Messaging</strong> settings screen.</p></td>
</tr>
<tr class="odd">
<td><p>[People settings: Contact management on the SIM](contact-management-on-the-sim.md)</p></td>
<td><p>Partners can specify that users should be able to read, edit, delete, import, and export contact information on their SIM (basic SIM, USIM, or RUIM). This customization is only available for devices sold in China.</p></td>
</tr>
<tr class="even">
<td><p>[People settings: Disable wait for phonebook ready signal from the modem](disable-wait-for-phonebook-ready-signal-from-the-modem.md)</p></td>
<td><p>FDN SIM contacts syncs from the SIM during device boot. By default, this component waits until the phonebook ready signal is received from the modem and then it verifies whether FDN contact management is enabled on the SIM. If needed, OEMs can disable the wait for the phonebook ready signal.</p></td>
</tr>
<tr class="odd">
<td><p>[People settings: Hide contacts without phone numbers](hide-contacts-without-phone-numbers.md)</p></td>
<td><p>Partners can change the default OS behavior so that both contacts with phone numbers and contacts without phone numbers are shown in the People Hub.</p></td>
</tr>
<tr class="even">
<td><p>[People settings: Sort order for contacts](sort-order-for-contacts.md)</p></td>
<td><p>OEMs can use this customization to set the list of contacts displayed in the People Hub to be organized by last name instead of first name or first name instead of last name.</p></td>
</tr>
<tr class="odd">
<td><p>[People settings: Sort order for contacts override](sort-order-for-contacts-override.md)</p></td>
<td><p>OEMs can customize the default values for people sort and display settings as documented in the [Sort order for contacts](sort-order-for-contacts.md) customization. However, these settings may be overridden by the defaults for the user’s current locale unless the OEM sets an additional override registry key.</p></td>
</tr>
<tr class="even">
<td><p>[Phone settings: Assistance for dialing international phone numbers](assistance-for-dialing-international-phone-numbers.md)</p></td>
<td><p>Partners can turn off the international assist feature that helps users with the country codes needed for dialing international phone numbers.</p></td>
</tr>
<tr class="odd">
<td><p>[Phone settings: Call forwarding](call-forwarding.md)</p></td>
<td><p>Partners can hid the user option for call forwarding.</p></td>
</tr>
<tr class="even">
<td><p>[Phone settings: Conditional call forwarding](conditional-call-forwarding.md)</p></td>
<td><p>Partners can now show the call forwarding icon for conditional call forwarding as well as unconditional call forwarding.</p></td>
</tr>
<tr class="odd">
<td><p>[Phone settings: Hide the SIM security settings option](hide-the-sim-security-settings-option.md)</p></td>
<td><p>OEMs can hide the <strong>SIM security</strong> settings option.</p></td>
</tr>
<tr class="even">
<td><p>[Phone settings: Long tones](long-tones.md)</p></td>
<td><p>Partners can make a user option visible that makes it possible to toggle between short and long DTMF tones.</p></td>
</tr>
<tr class="odd">
<td><p>[Phone settings: Overriding the voicemail number on the UICC](overriding-the-voicemail-number-on-the-uicc.md)</p></td>
<td><p>Mobile operators can override the voicemail number on the UICC with a different voicemail number that is configured in the registry.</p></td>
</tr>
<tr class="even">
<td><p>[Phone settings: Trim supplementary service codes](https://msdn.microsoft.com/library/windows/hardware/mt762906)</p></td>
<td><p>OEMs can trim supplementary service codes to ensure network compatibility. When a code is sent using a USSD string in a ##code# format, <code>EnableSupplementaryServiceEraseToDeactivateOverride</code> trims the USSD string so #code# is sent. This customization applies only to codes that use the ##code# format.</p></td>
</tr>
<tr class="odd">
<td><p>[Phone settings: Video over LTE](video-over-lte.md)</p></td>
<td><p>Partners can customize specific settings and behavior for Video over LTE to meet mobile operator requirements.</p></td>
</tr>
<tr class="even">
<td><p>[Phone settings: Voicemail number for CDMA phones](voicemail-number-for-cdma-phones.md)</p></td>
<td><p>CDMA mobile operator partners who do not have the voicemail numbers on the device SIM can configure the voicemail number for their devices.</p></td>
</tr>
<tr class="odd">
<td><p>[Phone settings: Wi-Fi calling operator name](https://msdn.microsoft.com/library/windows/hardware/mt628526)</p></td>
<td><p>OEMs can customize the display name for the mobile operator when the device is using Wi-Fi calling.</p></td>
</tr>
<tr class="even">
<td><p>[USB settings: Enable the incompatible charger notification](enable-the-incompatible-charger-notification.md)</p></td>
<td><p>Partners can set the device to display a warning when the user connects the device to an incompatible charging source. This warning is intended to notify users that their device may take longer to charge or may not charge at all with the current charging source.</p></td>
</tr>
<tr class="odd">
<td><p>[USB settings: Enable the data connection prompt](enable-the-data-connection-prompt.md)</p></td>
<td><p>Partners can set the device to display a dialog that asks for permission to enable the data connection when the user connects the device to a host computer via a USB cable.</p></td>
</tr>
<tr class="even">
<td><p>[USB settings: Hide the weak charger notification option UI](hide-the-weak-charger-notification-option-ui.md)</p></td>
<td><p>Partners can configure the device to hide the dialog that is displayed when the user connects the device to an incompatible charging source and hide the USB setting that notifies the user when the device is connected to a slower charger.</p></td>
</tr>
<tr class="odd">
<td><p>[Store settings: CTA app install prompts](cta-app-install-prompts.md)</p></td>
<td><p>To meet China Type Approval (CTA) requirements for devices shipping in China, OEMs must show a notification dialog to alert users when the app being downloaded does certain things.</p></td>
</tr>
<tr class="even">
<td><p>[Store settings: Windows Store for China](windows-phone-store-for-china.md)</p></td>
<td><p>For a Windows 10 Mobile device shipping in China, OEMs must specify that the device is intended for that market by setting the <strong>PhoneROMLanguage</strong> setting in <strong>DeviceTargetingInfo</strong> to the appropriate locale ID.</p></td>
</tr>
<tr class="odd">
<td><p>[System tray: Display location icon](display-location-icon.md)</p></td>
<td><p>Partners can hide the location icon in the system tray if they choose.</p></td>
</tr>
</tbody>
</table>

 

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Customizations%20for%20Settings%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




