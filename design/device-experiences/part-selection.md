---
title: Part selection
description: If a system reports itself as supporting S0 low power idle, but does not support the networking or storage requirements to support a modern standby state, the system will automatically be placed in a disconnected state.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: F84FA615-927E-4AD4-A35B-DE729D43E36A
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Part selection


If a system reports itself as supporting S0 low power idle, but does not support the networking or storage requirements to support a modern standby state, the system will automatically be placed in a disconnected state.

## Start from a CS-capable chipset or CS reference platform


Platform designs that support Windows 8.1 Connected Standby can also support Modern Standby.

Starting from an existing Connected Standby system design or a reference design from your silicon partner designed for S0 low power idle is highly recommended.

**Note**  You should not try to convert existing S3 platforms to Modern Standby, as significant development investments are required to ensure proper behavior and a good power floor. This risk must be considered by OEMs, as there was no validation done by Microsoft and silicon partners to validate this design approach.

 

To support Modern Standby, a PC platform must meet the technical requirements summarized in the following table.
<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Technical Requirements</th>
<th>Motivation</th>
<th>Who's responsible?</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>The system ACPI firmware must set the ACPI_S0_LOW_POWER_IDLE FADT flag.</td>
<td>Indicates the hardware platform supports the low-power idle mode for Connected Standby or Modern Standby.</td>
<td>System firmware developer (Core silicon or SoC must be capable of low-power idle.)</td>
</tr>
<tr class="even">
<td>The core silicon or SoC manufacturer must provide a power engine plug-in (PEP).</td>
<td>The PEP coordinates device state and processor idle state dependencies. A minimal PEP is required to communicate to Windows when the device power state dependencies are achieved for the lowest SoC idle power mode.</td>
<td>Core silicon or SoC provider (Windows 8.1 includes the PEP for Intel-based platforms. For details on how to enable its use, please contact Intel.)</td>
</tr>
<tr class="odd">
<td>x86/x64-based Connected Standby or Modern Standby PCs must also support Hibernate.
<div class="alert">
<strong>Note</strong>  Applicable to Desktop SKUs only.
</div>
<div>
 
</div></td>
<td>Hibernate is used to save the state of desktop/Win32 applications when critical-low battery capacity is reached.</td>
<td></td>
</tr>
</tbody>
</table>

 

Modern Standby component selection is important. The following low power support is highly recommended for achieving a good power floor on disconnected systems:

-   USB 2.0- LPM support for L2/U2
-   PCIe (WLAN and storage) – support for L1.substate
-   For SATA SSD devices use of Slumber and Device Sleep

For more detailed guidance on platform design for systems that support S0 low power idle, refer to [MSDN](http://msdn.microsoft.com/library/windows/hardware/dn481228.aspx) or contact your silicon provider.

## D3 device power state support


Devices going into [low power states](http://msdn.microsoft.com/library/windows/hardware/ff543186.aspx) (when not in use) is an important part of maintaining a low power floor. The same guidance for Windows 8.1 Connected Standby (for devices moving to D3 hot and D3 cold as appropriate) also applies to Modern Standby systems. Device class guidance is available on MSDN.

## NIC selection


The connected Modern Standby state requires at least one network devices to be NDIS 6.3 compliant, especially for wake-on-LAN (WoL) patterns, protocol offloads, and D0 packet coalescing. Otherwise, the system is placed in disconnected standby.

## Storage selection


The current policy for disconnected vs. connected is as follows:

-   If the storage device/solution reports a seek penalty/rotational delay, indicating rotating media, then disconnected will be the default standby mode.
-   If the storage device/solution indicates that it has no rotational delay or seek penalty (for example, is an SSD), then connected will be the default standby mode.

**Note**  You change/modify the above default policy to even allow modern connected standby on pure rotational media. However, it is up to the OEM to validate that such a system is viable from a performance and reliability standpoint.

 

## SSD storage


As in the past, SATA SSDs need to support DEVSLP in order to improve battery life in Modern Standby. Further, AHCI PCIe SSDs should ideally also expose support for DEVSLP (device sleep or SATA DEVSLP), which would likely be mapped to a L1.2 PCI sub-state by the firmware. In this case, the device should not transition between power states autonomously, so the host can control the state transitions. If the AHCI PCIe SSD does not support DEVSLP, you need to ensure the SSD can enter low-power modes on its own .

Akin to AHCI PCIe SSDs, NVMe SSDs need to provide the host with a non-operational power state that is comparable to DEVSLP (&lt;5mW draw, &lt;100ms exit latency) in order to allow the host to perform appropriate transitions into Modern Standby. Should the NVMe SSD not expose such a non-operational power state, autonomous power state transitions (APST) is the only other option to enter Modern Standby successfully.

Note that in the absence of DEVSLP or a comparable NVMe non-operational power state, the host can make no guarantees on the device’s power draw. In this case, if you observe non-optimal power consumption by the device/system, you will have to work with your device vendor to determine the cause.

## Rotational storage


Storage solutions combining flash and rotating media have shown to be generally capable to keep important data in the flash, thus allowing for quick resume times and a relatively low power profile. The feasibility of rotational media however is impacted by various factors, an important one of which is reliability.

Rotating media contains many moving parts that wear out over time. When frequently power cycling a drive, the wear can be considerably increased, since the read/write heads have to move from the platter to their parked position and back.

The number of such load/unload cycles is directly influenced by the following factors:

| Item | Factor                   | Description                                                                                                                                         |
|------|--------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| 1    | Cache Size               | How large is the non-volatile cache that can absorb I/O requests before the platter has to be accessed? A larger cache means less platter accesses. |
| 2    | Firmware Timers          | Firmware Timers: At which point of idleness does the firmware automatically unload the read/write heads?                                            |
| 3    | Cache Manager Efficiency | How well can the cache manager “predict” which data will be needed in Modern Standby and thus pre-load it into the NAND cache?                      |
| 4    | I/O Load & Pattern       | How active is the user and how many apps are running in Modern Standby causing I/O? How frequent is this I/O? What is the user’s working set?       |

 

From the above factors, \#3 and \#4 are very difficult or almost impossible to control. Cache Size (\#1) and Firmware Timers (\#2) are directly in the OEM’s control.

Even though Windows 10 attempts to balance power savings with device reliability, internal testing has shown that enabling connectivity while in Modern Standby on a pure rotational device (HDD) can cause a large amount of load/unload cycles in a very short time, thus putting warranty claims at risk. Out of these observations, we formed the following guidance:

-   For the best experience, use pure flash devices (SSDs) and take full advantage of connectivity while in Modern Standby.
-   If you use rotational or hybrid storage in some form, make sure (through your own testing and validation) that the Load/Unload cycles stay in reasonable bounds. This can be positively affected by:
    -   Deploying hybrid solutions with at least 12GB useable NAND to absorb while in Modern Standby.
    -   Setting firmware load/unload timers at 45 s or more (&lt;10s is currently common) to ensure that the frequency of load/unload cycles does not exceed warranty claims.

**Note**  We strongly do not recommend enabling connectivity on rotational-only (HDD) systems.

 

## Battery selection


Battery life targets vary by form factor and price. Component selection and the associated power floor also impact how long a given charge will last.

 

 






