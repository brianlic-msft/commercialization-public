---
title: Device-specific power management for modern standby
description: This section describes the supported power management configurations for devices outside of the SoC (or core silicon) in a Windows platform that implements the modern standby power model.
MS-HAID:
- 'cstandby.device\_specific\_power\_management\_for\_connected\_standby'
- 'p\_weg\_hardware.device-specific\_power\_management\_for\_modern\_standby'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 1BDF0EC0-1BB2-4AFE-83A7-4481BD9AAC1F
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Device-specific power management for modern standby


To achieve long battery life in modern standby, a platform must be able to operate at a very low hardware power floor. The term power floor describes the hardware power state in which all devices are idle and inactive, and power consumption is dominated by hardware static leakage. If properly designed, the platform typically spends well over 90 percent of a modern standby session operating at the platform's power floor.

To reliably operate at the power floor requires each device outside the System on a Chip (SoC) to enter very low standby power state when it is unused. The power management methodology and system configuration used to achieve power-floor operation is device-specific. Power to a device might be controlled autonomously by the device, based on commands from software drivers. Or, power to the device might be managed by ACPI firmware that controls power management hardware external to the device.

This section describes the supported power management configurations for devices outside of the SoC (or core silicon) in a Windows platform that implements the modern standby power model. For each class of device, the supported hardware and software power management configurations are described. The driver developer for a device should work closely with the device vendor and system integrator to review platform schematics, device integration, and ACPI firmware.

**Note**  This documentation describes the power management configurations that Windows supports for device classes that are commonly used in modern standby platforms. This documentation does not introduce Windows Certification requirements or explicitly discuss such requirements.

 

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
<td><p>[Audio subsystem power management for modern standby platforms](audio-subsystem-power-management-for-modern-standby-platforms.md)</p></td>
<td><p>Every Windows PC has an audio subsystem that enables the user to listen to and record high-quality sound in real-time. A hardware platform that supports the connected standby power model is typically built around a SoC integrated circuit that features built-in, low-power audio processing units.</p></td>
</tr>
<tr class="even">
<td><p>[Bluetooth power management for modern standby platforms](bluetooth-power-management-for-modern-standby-platforms.md)</p></td>
<td><p>A Bluetooth radio device enables short-range RF communication between a PC and an input device, an audio device, or other Bluetooth-attached user peripheral. In a modern standby PC, the driver for a Bluetooth radio should manage this device's power states according to the guidelines presented in this article.</p></td>
</tr>
<tr class="odd">
<td><p>[Camera power management for modern standby platforms](camera-power-management-for-modern-standby-platforms.md)</p></td>
<td><p>Outlines various aspects of camera power management for modern standby platforms.</p></td>
</tr>
<tr class="even">
<td><p>[GNSS receiver power management for modern standby platforms](gnss-receiver-power-management-for-modern-standby-platforms.md)</p></td>
<td><p>This topic discusses Global Navigation Satellite System (GNSS) power management for modern standby-capable platforms.</p></td>
</tr>
<tr class="odd">
<td><p>[Mobile broadband (MBB) power management for modern standby platforms](mobile-broadband--mbb--power-management-for-modern-standby-platforms.md)</p></td>
<td><p>A mobile broadband (MBB) device provides a mobile computer with a wireless data connection to a cellular service. An MBB device supports one or more cellular radio technologies, such as GSM, 3G, CDMA, or LTE. MBB devices in modern standby platforms are all required to provide the same set of power management capabilities and to implement the same general hardware configuration, regardless of the specific cellular technologies supported.</p></td>
</tr>
<tr class="even">
<td><p>[Near-field proximity (NFP) power management for modern standby platforms](near-field-promiximity--nfp--power-management-for-modern-standby-platforms.md)</p></td>
<td><p>Describes near-field proximity (NFP) power management requirements for modern standby platforms.</p></td>
</tr>
<tr class="odd">
<td><p>[Sensors power management for modern standby platforms](sensors-power-management-for-modern-standby-platforms.md)</p></td>
<td><p>This article explains how to implement power management for sensor devices. In addition, power management of the optional sensor microcontroller (also called the sensor fusion hub or the sensor MCU) and aggregated sensor devices is discussed.</p></td>
</tr>
<tr class="even">
<td><p>[Wi-Fi power management for modern standby platforms](wi-fi-power-management-for-modern-standby-platforms.md)</p></td>
<td><p>In a Windows hardware platform that implements the [modern standby power model](modern-standby.md), the Wi-Fi device maintains its connection to the network while the platform is in the modern standby power state. Correct power management of the Wi-Fi device—both during modern standby and when the display is turned on—is essential to achieving long battery life.</p></td>
</tr>
</tbody>
</table>

 

 

 






