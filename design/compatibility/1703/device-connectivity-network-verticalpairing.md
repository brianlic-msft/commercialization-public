---
title: Device.Connectivity.Network.VerticalPairing
Description: 'Requirements. Root for former Rally technologies.'
ms.assetid: 
MSHAttr: 
author: beneluxboy
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

<!--
# Device.Connectivity.Network.VerticalPairing

 - [Device.Connectivity.Network.VerticalPairing](#device.connectivity.network.verticalpairing)
-->

<a name="device.connectivity.network.verticalpairing"></a>
## Device.Connectivity.Network.VerticalPairing

*Root for former Rally technologies*

### Device.Connectivity.Network.VerticalPairing.WCN

*An 802.11 network-enabled device that operates as a station (STA) must implement WCN-NET and meet basic 802.11 requirements.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

An 802.11 network-enabled device that operates as a station (STA) must meet the following requirements:

-   The device must implement WCN-NET and comply with the specification.

-   The device must implement WCN-NET vertical-pairing extensions and indicate whether it supports a PnP-X transport protocol. If the device supports a PnP-X transport protocol, it must ensure correct universally unique identifier (UUID) alignment.

-   If WCN-UFD is implemented, it must comply with the specification.

-   If the device has a display that is capable of showing a four-digit or eight-digit number, it must support displaying a dynamic Windows Connect Now (WCN) PIN without user intervention. The PIN must be displayed for a minimum of two minutes after the device receives a Wireless Provisioning Services (WPS) M2D message with the value of "Windows" in the WPS Model Name attribute.

-   If the device does not have a display that is capable of showing a four-digit or eight-digit number, it must provide a physical label affixed to the device that includes the eight-digit PIN and clearly labels the PIN value as a PIN (for example, PIN: 12345670).

-   The device must be certified by the Wi-Fi Alliance, including Wi-Fi certification, Wi-Fi Protected Access 2 (WPA2) certification, and Wi-Fi Protected Setup certification.

*Design Notes*

For implementation details, see the WCN-NET specification at <http://go.microsoft.com/fwlink/?LinkId=109371> and the WCN-UFD specification at <http://go.microsoft.com/fwlink/?LinkId=109372>.

For more information, see the "Installing Wi-Fi Devices Using Rally Vertical Pairing" white paper at <http://www.microsoft.com/whdc/connect/rally/WiFiVerticalPair.mspx>.

Additional information can be found at <http://go.microsoft.com/fwlink/?LinkId=109373> and <http://go.microsoft.com/fwlink/?LinkId=109368>.

WCN-NET is required. WCN-UFD is optional and is supported in Windows for backward compatibility with devices that are designed to support WCN functionality for Windows XP with Service Pack 2.

A device uses WCN-NET vertical-pairing extensions to indicate that its supports PnP-X. The device must provide a single UUID that is provided in both the WCN-NET exchange and the UPnP/Web Services for Devices (WSD) device file or provide the UPnP/WSD device UUID in the TransportUUID attribute of the WCN-NET vertical-pairing extension. The UUID that is provided in UPnP or WSD must be in lowercase (decimal digits can also be used).

For WSD implementations, the WSD UUID is provided as the endpoint reference address and must be of the form <code>urn:uuid:</code>. For UPnP implementations, the UPnP UUID is provided as the root device UUID.

