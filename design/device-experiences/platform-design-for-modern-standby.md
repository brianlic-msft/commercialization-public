---
title: Platform design for modern standby
description: Platform design for modern standby
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: A5DBA225-C7AD-44ED-A199-2F037C7EAA04
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Platform design for modern standby


To modern connected standby, a PC hardware platform must meet a specific set of requirements. These requirements govern the selection of the SoC chip, DRAM, networking device, and other key hardware components.

Enabling modern standby on a PC platform requires careful planning and engineering. The primary reason for additional engineering is to deliver the low power consumption that the end user expects when the system is in a sleep state and the screen is turned off. Users will not tolerate excessive battery drain, particularly relative to the very good battery life of most smartphones.

The second largest engineering investment for modern standby is to enable low-power communications (Wi-Fi, mobile broadband, and Ethernet). Each communications device includes a significant amount of autonomous processing capability and firmware to allow the platform's SoC or core silicon to power off while connectivity is maintained.

### Low-power core silicon (CPU, SoC, DRAM)

The modern standby power state requires frequent transitions between a low-power idle mode and short periods of activity. Through all these transitions, the system is in standby and the screen stays turned off. This model allows the operating system and apps to be always on and running while the hardware delivers low idle power. This combination results in low average power and long battery life during standby.

A modern standby platform with long battery life includes low-power core silicon (or SoC) and DRAM that have the following characteristics:

-   The capability to switch between idle and active modes in less than 100 milliseconds. The active mode allows code to run on the CPU(s), but does not necessarily allow accessing the storage device or other host controllers or peripherals. The idle mode can be a clock-gated or power-gated state, but should be the state that has the lowest power consumption for the SoC and DRAM.
-   DRAM technology and size to minimize power consumption while in self-refresh mode. Current modern connected standby PCs typically use mobile DRAM (LP-DDR) or low-voltage PC DRAM (PC-DDR3L, PC-DDR3L-RS).
-   A power engine plug-in (PEP) that coordinates the low-power state of host controllers on the SoC with SoC-wide power states. The PEP is a small, lightweight driver that abstracts the SoC-specific power dependencies. All modern connected standby platforms must include a PEP that, at minimum, communicates to Windows when the SoC is ready to enter the lowest-power idle mode. For Intel based platforms, the PEP is already present as an inbox driver where SoC specific information is conveyed directly through ACPI FW tables (link).

### Communications and networking devices

The networking device(s) in a modern connected standby platform are responsible for maintaining connectivity to the cloud while the SoC remains in a low-power idle mode. This capability is achieved by offloading basic network maintenance to the networking device.

The network devices in a modern connected standby platform must be capable of protocol offloads. Specifically, the network device must be capable of offloading Address Resolution Protocol (ARP), Name Solicitation (NS), and several other Wi-Fi-specific protocols. To offload protocol processing, the small microcontroller on the networking device responds to network requests while the SoC remains in a low-power idle mode, saving battery power during sleep.

The network devices in a modern connected standby platform must also be capable of detecting important incoming network packets and waking the SoC if necessary. The ability to detect these packets is called wake-on-LAN (WoL) patterns. With WoL patterns, the network device wakes the SoC or core silicon only when an important network packet is detected, which allows the SoC to otherwise remain in a low-power idle mode. The list of important packets to detect is provided to the networking device by Windows and correspond to the system services or apps on the lock screen.

For example, Windows always asks the network adapter to listen for incoming packets from the Windows Notification Service (WNS). Apps that are pinned to the lock screen can also request that the network device listen for app-specific packets for real-time communications, such as Skype.

For more information about protocol offloads, see Protocol Offloads for NDIS Power Management. For more information about WoL patterns, see WOL Patterns for NDIS Power Management.

System designers who build modern connected standby-capable PCs are highly encouraged to build a deep working relationship with their networking hardware vendors.

### Other platform requirements

Here are some additional platform requirements for enabling modern standby on Windows 8 and higher:

-   The system ACPI firmware must set the ACPI\_S0\_LOW\_POWER\_IDLE FADT flag to indicate the platform hardware supports the low-power idle mode for modern connected standby.
-   The system ACPI firmware must not provide an S3 object in the root of the namespace. Windows supports a platform exposing either the S3 object or the ACPI\_S0\_LOW\_POWER\_IDLE FADT flag, but not both at the same time.
    **Note**  The FADT bit takes precedence over an S3 object.

     

-   For non-Intel based platforms, the core silicon or SoC manufacturer must provide a power engine plug-in (PEP) that coordinates device state and processor idle state dependencies. A minimal PEP is required to communicate to Windows when the device power state dependencies have been achieved for the lowest SoC idle power mode.
-   x86/x64-based modern connected standby PCs must also support Hibernate. Hibernate is used to save the state of desktop/Win32 applications when critical-low battery capacity is reached.

### Platform requirements for modern standby

To support modern connected standby, a PC platform must meet the technical requirements summarized in the following table.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Topics</th>
<th>Description</th>
<th>Who's responsible?</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>The system ACPI firmware must set the ACPI_S0_LOW_POWER_IDLE FADT flag.</p></td>
<td><p>Indicates that the hardware platform supports the low-power idle mode for modern connected standby.</p></td>
<td><p>System firmware developer</p>
<p>(Core silicon or SoC must be capable of low-power idle.)</p></td>
</tr>
<tr class="even">
<td><p>For non-Intel based platforms, the core silicon or SoC manufacturer must provide a power engine plug-in (PEP).</p></td>
<td><p>The PEP coordinates device state and processor idle state dependencies. A minimal PEP is required to communicate to Windows when the device power state dependencies have been achieved for the lowest SoC idle power mode.</p></td>
<td><p>Core silicon or SoC provider</p>
<p>(Windows 8.1 includes the PEP for Intel-based platforms.)</p></td>
</tr>
<tr class="odd">
<td><p>x86/x64-based modern standby PCs must also support Hibernate.</p></td>
<td><p>Hibernate is used to save the state of desktop/Win32 applications when critical-low battery capacity is reached.</p></td>
<td><p>System firmware developer</p></td>
</tr>
<tr class="even">
<td><p>For modern standby systems, networking devices that are expected to remain connected must be compatible with NDIS 6.3 (specifically WoL patterns, protocol offloads, and D0 packet coalescing).</p></td>
<td><p>Enables the SoC to enter low-power modes while the networking device maintains connectivity.</p></td>
<td><p>System designer (OEM/ODM)</p></td>
</tr>
</tbody>
</table>

 

 

 






