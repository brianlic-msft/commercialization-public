---
title: Customizations for connectivity
description: Describes the customizations for configuring connectivity settings.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 2302cb01-7ccd-4840-8559-f1ac81f28082
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Customizations for connectivity


Describes the customizations for configuring connectivity settings.

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
<td><p>[Authentication for Wi-Fi hotspot settings](authentication-for-wi-fi-hotspot-settings.md)</p></td>
<td><p>When mobile devices connect to a Wi-Fi hotspot that uses a captive portal, the web browser is automatically opened so that the user can sign in.</p></td>
</tr>
<tr class="even">
<td><p>[Cellular data connection icon](cellular-data-connection-icon.md)</p></td>
<td><p>The one-, two-, or three-character codes used to signify the data connection type in the status bar can be modified.</p></td>
</tr>
<tr class="odd">
<td><p>[Configure C+G dual SIM settings](configure-c-g-dual-sim-settings.md)</p></td>
<td><p>Partners can configure the settings for C+G dual SIM phones.</p></td>
</tr>
<tr class="even">
<td><p>[Cortana phone number](cortana-phone-number.md)</p></td>
<td><p>Partners can configure a phone book entry for Cortana to allow users to initiate speech from a car that doesn't have support for activating speech on the device that is connected over Bluetooth.</p></td>
</tr>
<tr class="odd">
<td><p>[Custom percentages for signal strength bars](custom-percentages-for-signal-strength-bars.md)</p></td>
<td><p>Partners must modify the percentage values used for the signal strength bars in the status bar.</p></td>
</tr>
<tr class="even">
<td><p>[Data transfer indicator](data-transfer-indicator.md)</p></td>
<td><p>OEMs can display a data transfer indicator on a device’s status bar for mobile operators that require it.</p></td>
</tr>
<tr class="odd">
<td><p>[Disable Cell Broadcast](disable-cell-broadcast.md)</p></td>
<td><p>By default, Cell Broadcast (also known as Short Message Service-Cell Broadcast (SMS-CB)) is a feature that is active at all times.</p></td>
</tr>
<tr class="even">
<td><p>[Ignore NITZ information from LTE networks](ignore-nitz-information-from-lte-networks.md)</p></td>
<td><p>For mobile networks that can receive Network Identity and Time Zone (NITZ) information from multiple sources, partners can set the device to ignore the time received from an LTE network.</p></td>
</tr>
<tr class="odd">
<td><p>[LTE attach: GUID for user configured internet APN](lte-attach-guid-for-user-configured-internet-apn.md)</p></td>
<td><p>Partners can set the OEMConnectionId that is used when creating the user-configured connection for internet from the <strong>SIM</strong> settings screen.</p></td>
</tr>
<tr class="even">
<td><p>[LTE attach: Mapping OEMConnectionId values to modem profiles](lte-attach-mapping-oemconnectionid-values-to-modem-profiles.md)</p></td>
<td><p>Partners can set the list of OEMConnectionId values that map to a LTE attach profile in the MBB driver.</p></td>
</tr>
<tr class="odd">
<td><p>[Maximum number of PDP contexts](maximum-number-of-pdp-contexts.md)</p></td>
<td><p>OEMs can set different maximum values for the number of PDP contexts for the device if required by their mobile operator.</p></td>
</tr>
<tr class="even">
<td><p>[Network Time Protocol support](network-time-protocol-support.md)</p></td>
<td><p>Use to automatically set the time using an NTP client in a mobile device that doesn't support NITZ, or when cellular data is not available.</p></td>
</tr>
<tr class="odd">
<td><p>[Preferred data provider list](preferred-data-provider-list.md)</p></td>
<td><p>For mobile operators that require it, OEMs can set a list of MCC/MNC pairs for the purchase order (PO) carrier or primary operator so that it can be set as the default data line for phones that have a dual SIM.</p></td>
</tr>
<tr class="even">
<td><p>[Preferred system types for phone connectivity](preferred-system-types-for-phone-connectivity.md)</p></td>
<td><p>OEMs can provide more control over the system types that their devices use to connect by: mapping an ICCID or IIN to one radio (regardless of which SIM is chosen), specifying a list of MCC/MNCs that the MO wishes to limit, and/or restricting the second slot in a dual SIM device.</p></td>
</tr>
<tr class="odd">
<td><p>[Roaming filter](roaming-filter.md)</p></td>
<td><p>Partners can add roaming filters that determine when the device appears to be roaming, based on the network the device is currently connected to. With roaming filters enabled, connections on other companies’ specified networks are not treated as roaming.</p></td>
</tr>
<tr class="even">
<td><p>[Threshold for automatic time update](threshold-for-automatic-time-update.md)</p></td>
<td><p>For mobile networks that support Network Identity and Time Zone (NITZ), OEMs can specify the difference (in number of seconds) between the NITZ information and the current device time before a device time update is triggered.</p></td>
</tr>
</tbody>
</table>

 

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Customizations%20for%20connectivity%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




