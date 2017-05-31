---
title: Modern standby testing prerequisites
description: Describes the set of basic software and hardware requirements before testing and validating a modern standby operation.
MS-HAID:
- 'cstandby.connected\_standby\_testing\_prerequisites'
- 'p\_weg\_hardware.modern\_standby\_testing\_prerequisites'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 932A3B7F-7250-4707-966B-7B4BCDC883F2
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Modern standby testing prerequisites


The System on a Chip (SoC) platform should meet a set of basic software and hardware requirements before you try to test and validate modern standby operation. These requirements help to ensure that any problems that might arise are quickly identified and easily debugged.

## Physical setup and equipment


Effective modern standby testing cannot be accomplished without first ensuring that the system under test has the basic physical setup that is required to capture diagnostic information. The setup for this system should include the equipment listed in the following table.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Equipment</th>
<th>Purpose</th>
<th>Physical setup</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Kernel debug board and cable</p></td>
<td><p>Supports Windows kernel debugging.</p>
<p>Consult with your SoC vendor to determine what type of debugging is supported and what equipment is necessary. Some systems require a specialized debugging board.</p></td>
<td><p>Connect the kernel debugger between a host PC and the system under test.</p></td>
</tr>
<tr class="even">
<td><p>Host PC(s)</p></td>
<td><p>Serves as the host for kernel and hardware debugging.</p>
<p>You can have the same or separate PCs for kernel and hardware debugging.</p></td>
<td><p>Connect the PC(s) to the kernel and hardware debuggers.</p></td>
</tr>
<tr class="odd">
<td><p>Power meter</p></td>
<td><p>A power meter is required to measure power consumption on a power-instrumented system.</p>
<p>If you are unsure about the appropriate device to measure power, consult with your SoC vendor.</p></td>
<td><p>When measuring the power floor, connect the power meter to the platform that is being tested.</p></td>
</tr>
<tr class="even">
<td><p>SIM card</p></td>
<td><p>A SIM card is required to test mobile broadband (MBB) connectivity during modern standby.</p></td>
<td><p>When testing MBB operation, plug the SIM card into the SIM card slot.</p></td>
</tr>
</tbody>
</table>

 

## System hardware requirements


The system under test must be built of hardware components that are suitable for a modern standby PC and that can operate at low power during standby. Work closely with your SoC and power-management IC (PMIC) vendors to identify the appropriate version of SoC and PMIC to use for modern standby testing. All off-SoC device components—such as Wi-Fi, Bluetooth, and near-field communication (NFC) devices—must also support low power.

Before you start modern standby testing, verify the following:

-   The system is built with the appropriate version of SoC for low-power/modern-standby testing.
-   The system is built with the appropriate version of PMIC for low-power/modern -standby testing.
-   All off-SoC device components support low-power operation and are wired to switchable power planes.

## Driver and firmware requirements


Drivers and firmware play a critical role in modern standby operations and are therefore an important part of modern standby testing.

The system must have the appropriate drivers and firmware installed to allow the system to enter low-power states. The easiest way to verify that all firmware and drivers are properly installed is to open Device Manager and check that no devices have active problem codes (yellow ! symbols) and that no devices are missing drivers.

Do not proceed with modern standby testing unless all of the following is true:

-   All system and device firmware is properly installed.
-   All device drivers are properly installed.
-   All devices in Device Manager do not show a problem code (yellow !).
-   There are no missing drivers for devices in Device Manager.

## Software requirements


The system must have a stable and functioning graphics driver before you start modern standby testing. Similarly, the Wi-Fi and mobile broadband (MBB) devices must be capable of functioning correctly when the screen is on before they can be properly tested for low-power and modern standby operation.

Before starting modern standby testing, make sure that your system has the following:

-   A stable graphics driver.
-   Reliable Wi-Fi connectivity when the screen is on.
-   Reliable MBB connectivity when the screen is on (if the system is equipped with MBB).

 

 






