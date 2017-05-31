---
title: Prepare software for modern standby
description: On entry to modern standby, apps and system software must be made ready for the transition to low-power operation.
MS-HAID:
- 'cstandby.prepare\_software\_for\_connected\_standby'
- 'p\_weg\_hardware.prepare\_software\_for\_modern\_standby'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: BD687008-CDE0-494D-9EF2-0DE13772EE5E
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Prepare software for modern standby


On entry to modern standby, apps and system software must be made ready for the transition to low-power operation. Powering down the display is the first activity when entering standby. The display is turned off in response to the user pressing the power button, closing the lid, or selecting Sleep from the power button in the Settings charm.

## Software preparation phases


After the display is powered off, Windows transitions through a set of phases to prepare apps and system software for achieving low power. The phases are sequential—each phase is a set of activities that must be performed before the phase can be completed and the next phase entered.

The purpose of these phases is to stop or reduce as much software activity on the system as possible. This reduction in activity gives more opportunity for the hardware to enter low-power modes, thereby extending overall modern connected standby battery life.

The following table describes each phase of preparing software for modern standby.

<table>
<colgroup>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
</colgroup>
<thead>
<tr class="header">
<th>Topics</th>
<th>Description</th>
<th>Tasks performed</th>
<th>Exited when...</th>
<th>Typical duration (seconds)</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>No-CS phase</p>
<div class="alert">
<strong>Note</strong>  This is also the phase where the device waits for the sleep timeout to elapse.
</div>
<div>
 
</div></td>
<td><p>The system is powered on and the screen is turned on. The system is not in standby.</p></td>
<td><p>No standby preparation tasks are being performed.</p></td>
<td><p>The screen is powered down.</p></td>
<td><p>N/A</p></td>
</tr>
<tr class="even">
<td><p>Connection phase</p></td>
<td><p>The system is checking for remote desktop connections.</p></td>
<td><p></p>
<ul>
<li>Determine if remote desktop session(s) exist.</li>
<li>Begin tracking outstanding power requests.</li>
</ul></td>
<td><p>There are no remote desktop sessions connected.</p></td>
<td><p></p>
<ul>
<li>Zero seconds if no remote desktop sessions are connected.</li>
<li>Phase will last until all remote desktop sessions are disconnected or have timed out.</li>
</ul></td>
</tr>
<tr class="odd">
<td><p>Presence phase</p></td>
<td><p>This phase is currently not used by Windows 8 or Windows 8.1.</p></td>
<td><p></p></td>
<td><p></p></td>
<td><p></p></td>
</tr>
<tr class="even">
<td><p>Process Lifetime Manager (PLM) phase</p></td>
<td><p>The system suspends Windows Store apps that are in the foreground.</p></td>
<td><p></p>
<ul>
<li>Suspend all foreground Windows Store apps.</li>
<li>Check for ongoing non-offloaded audio playback or communications app activity.</li>
</ul></td>
<td><p>All foreground Windows Store apps have been suspended and no non-offloaded audio playback is occurring.</p></td>
<td><p></p>
<ul>
<li>Typically, less than five seconds.</li>
<li>If non-offloaded audio playback is ongoing, this phase will block until audio playback stops.</li>
<li>Audio playback may be part of a music or communications app.</li>
</ul></td>
</tr>
<tr class="odd">
<td><p>Maintenance phase</p></td>
<td><p>The system executes maintenance tasks.</p></td>
<td><p>Wait for maintenance tasks to complete if running (most common on AC power).</p></td>
<td><p>No system maintenance tasks are running.</p></td>
<td><p></p>
<ul>
<li>Typically, less than one second.</li>
<li>The system is most likely to block on maintenance phase on AC power.</li>
</ul></td>
</tr>
<tr class="even">
<td><p>Desktop Activity Moderator (DAM) phase</p></td>
<td><p>The system pauses desktop applications to reduce their power consumption during standby.</p></td>
<td><p></p>
<ul>
<li>Check for outstanding power requests (PowerRequestExecutionRequired).</li>
<li>Wait for outstanding power requests to be dropped by the application, or enforce a maximum time-out on battery power (five minutes).</li>
</ul></td>
<td><p>All outstanding power requests have been cleared by applications or the maximum time-out has been reached.</p></td>
<td><p></p>
<ul>
<li>Typically, zero seconds.</li>
<li>If the system is on battery power, outstanding power requests will cause this phase to block for a maximum of five minutes. The applications with power requests can be inspected by running Powercfg.exe with the /requests option.</li>
<li>If the system is on AC power, outstanding power requests will cause this phase to block indefinitely or until the power request is cleared by the application.</li>
</ul></td>
</tr>
<tr class="odd">
<td><p>Low-power phase</p></td>
<td><p>The system notifies registered subscribers that the power manager is entering a low-power, long-resume-latency phase. This is used by some devices as a hint to power down.</p></td>
<td><p>Notify registered subscribers.</p></td>
<td><p>All registered subscribers have been notified.</p></td>
<td><p>Typically, five seconds.</p></td>
</tr>
<tr class="even">
<td><p>Resiliency notification phase</p></td>
<td><p>The network subsystem is notified to enter a low-power mode.</p></td>
<td><p>Notify the network subsystem. Network adapters that do not support modern connected standby are turned off (D3).</p></td>
<td><p>The network subsystem has been notified.</p></td>
<td><p>Typically, less than one second.</p></td>
</tr>
<tr class="odd">
<td><p>Resiliency phase</p></td>
<td><p>The system is ready for the SoC to enter the lowest power mode and remain idle.</p></td>
<td><p></p>
<ul>
<li>PDC resiliency clients are notified that the system is in resiliency phase.</li>
<li>Session-0 services are throttled by the DAM to no more than one second of activity every 30 seconds.</li>
<li>The power manager waits for activators to turn on their reference and cause the system to remain active.</li>
</ul></td>
<td><p></p>
<ul>
<li>The system exits standby due to user input or a power button press.</li>
<li>The system transitions to maintenance phase to run system maintenance.</li>
</ul></td>
<td><p>The majority of time the system is in standby.</p></td>
</tr>
</tbody>
</table>

 

After Windows has entered the resiliency phase, software is considered to be fully prepared for low-power operation. As soon as all devices have entered their low-power modes, the SoC and core chipset will enter the lowest idle power mode, as described in [Prepare Hardware for Modern Standby](prepare-hardware-for-modern-standby.md).

**Note**  Currently, no means is available to system designers to change or influence the behavior of these phases—they are a core part of Windows behavior. The details are explained here to aid in system debugging and development.

 

## Desktop activity moderator


The desktop activity moderator (DAM) is the Windows component that is used to pause all desktop applications and throttle the runtime of third-party system services. The purpose of the DAM is to enable basic software compatibility with existing applications and services, but mitigate their impact on battery life during standby.

Windows prevents desktop applications from running during any part of modern standby after completing the DAM phase. Windows allows third-party system services to execute in a throttled mode after completing the DAM phase.

 

 






