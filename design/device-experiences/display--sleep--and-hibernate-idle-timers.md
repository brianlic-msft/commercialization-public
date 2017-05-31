---
title: Display, sleep, and hibernate idle timers
description: Summarizes the supported timers in Windows 10.
MS-HAID:
- 'cstandby.display\_\_sleep\_\_and\_hibernate\_idle\_timers'
- 'p\_weg\_hardware.display\_\_sleep\_\_and\_hibernate\_idle\_timers'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: D688598F-AB14-47D1-8C79-98BCC04F55D8
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Display, sleep, and hibernate idle timers


A system that can enter the traditional ACPI Sleep (S3) state implements both a display idle time-out and a sleep idle time-out. The reason for providing two separate time-outs is to allow the system to stay turned on and fully running, but save power by turning off the display. In contrast, a connected standby PC has a single, unified display-off and sleep idle time-out that is simply called the "sleep" time-out. This power model is similar to that used by most smartphones: when the screen is off, the system is always in a low-power mode and always connected to the Internet.

In a connected standby PC, the display idle time-out is not displayed in the Power Options control panel or in the PC Settings app. A mobile system that has the traditional ACPI Sleep (S3) state also supports the ACPI Hibernate (S4) state. Hibernate is used to reduce battery drain during sleep by saving all information in memory to the disk and powering off the system completely. In contrast, a connected standby PC does not idle to the Hibernate (S4) state to save power. That's because connected standby is a consistently low-power state with long battery life. A connected standby PC is similar to a smartphone—few users would tolerate their smartphone periodically turning off and entering hibernation. Instead, users would expect the system to stay turned on and connected but operate in a low-power mode.

The following table summarizes the differences between a connected standby PC and a PC that supports the ACPI S3 and S4 states.

<table>
<colgroup>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
</colgroup>
<thead>
<tr class="header">
<th>Timer</th>
<th>Description</th>
<th>In a connected standby system</th>
<th>Notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Dim the display</p></td>
<td><p>This time-out is no longer supported starting with Windows 8.1. In Windows 10, the display is automatically dimmed 15 seconds before it is turned off.</p></td>
<td><p>This time-out is no longer supported starting with Windows 8.1. In Windows 10, the display is automatically dimmed 15 seconds before it is turned off.</p></td>
<td><p></p></td>
</tr>
<tr class="even">
<td><p>Turn off the display</p></td>
<td><p>When this time-out occurs, the display immediately turns off. However, the system continues to run and all applications continue to operate normally as if the display was powered on.</p></td>
<td><p>This time-out is the same as <strong>Put the computer to sleep</strong>.</p></td>
<td><p></p></td>
</tr>
<tr class="odd">
<td><p>Put the computer to sleep</p></td>
<td><p>When this time-out occurs, the system immediately enters the ACPI Sleep (S3) state. All applications stop execution because all processors will be powered off.</p></td>
<td><p>When this time-out occurs, the system enters connected standby and the display is immediately powered down. Then the system steps through the preparation phases described in [Prepare software for modern standby](prepare-software-for-modern-standby.md).</p></td>
<td><p></p></td>
</tr>
<tr class="even">
<td><p>Hibernate after</p></td>
<td><p>When this timer expires, the system wakes from ACPI Sleep (S3) and immediately enters ACPI Hibernate (S4) to save power.</p></td>
<td><p>This time-out is not used on or supported by connected standby systems.</p></td>
<td><p>Hibernate is enabled on x86/x64-based connected standby platforms to save desktop application state when the battery is critically low.</p></td>
</tr>
</tbody>
</table>

 

 

 






