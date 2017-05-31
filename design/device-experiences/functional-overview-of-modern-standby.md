---
title: Functional overview of modern standby
description: Provides an overview of the functionality supported by modern standby.
MS-HAID:
- 'cstandby.functional\_overview\_of\_connected\_standby'
- 'p\_weg\_hardware.functional\_overview\_of\_modern\_standby'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: FCEFAADA-394D-4418-B43D-1D88661CE940
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Functional overview of modern standby


Windows achieves the low-power and constant connectivity of modern connected standby by dramatically reducing the opportunities for software components to execute. Windows allows software to execute only in short, controlled bursts of activity. Windows and the SoC hardware are always listening for interesting events (such as a network packet or user input at a keyboard) and will wake up instantly when needed.

Modern standby consists of multiple hardware and software power modes, all of which occur with the screen turned off. The complexity of modern connected standby is a result of keeping the system alive to process background tasks, while ensuring that the system stays quiet enough to achieve long battery life.

Standby starts when the user presses the power button or otherwise causes the system to enter sleep. In response, Windows immediately turns off the display and then begins preparations for entering the lowest idle power mode. Both software and hardware must be made ready for low-power operation.

After these preparations are completed, Windows transitions the SoC between the idle and active modes as needed to process background tasks or manage network connectivity. Minimally, Windows wakes the SoC every 30 seconds for core kernel maintenance. This maintenance activity is extremely brief in duration—typically no more than a few hundred milliseconds—and the wake periods cannot be adjusted.

On occasion, the system stays in the active mode (with the screen off) for a longer interval of time. These longer active intervals occur for a variety of reasons, which can include processing incoming email and downloading critical Windows updates. The durations of these activities vary widely, but are controlled to extend battery life. The durations of the activities can be viewed with the built-in SleepStudy software tool or through Event Tracing for Windows (ETW)-based instrumentation.

The networking and communications devices automatically transition between active and low-power modes, based on the software activity of the system during modern connected standby. The networking device is in the low-power, protocol offload, and WoL patterns mode when there are no system services or Windows Store app background tasks that require the network. When a system service or background task requires network access, Windows automatically transitions the networking device to an active mode.

When the user presses the power button, or otherwise causes the system to resume from standby, the display is immediately turned on and networking devices are restored to their normal, active operating modes. The time from the power button press to the turning on of the display is typically less than 500 milliseconds. After the display is turned on and the networking device returns to normal operating mode, desktop applications resume and the system returns to its normal, screen-on active behavior.

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
<td><p>[Prepare software for modern standby](prepare-software-for-modern-standby.md)</p></td>
<td><p>On entry to modern standby, apps and system software must be made ready for the transition to low-power operation. Powering down the display is the first activity when entering standby. The display is turned off in response to the user pressing the power button, closing the lid, or selecting Sleep from the power button in the Settings charm.</p></td>
</tr>
<tr class="even">
<td><p>[Prepare hardware for modern standby](prepare-hardware-for-modern-standby.md)</p></td>
<td><p>On entry to standby, hardware components must be prepared to make the transition to low-power operation. After software components and apps have been prepared for low-power operation, hardware components, including their software device drivers, must be similarly prepared for low-power operation.</p></td>
</tr>
<tr class="odd">
<td><p>[Transition from idle to active](transition-from-idle-to-active.md)</p></td>
<td><p>During modern standby, Windows periodically transitions the SoC platform from idle mode to active mode to perform kernel maintenance tasks. In addition, on-demand transitions to active mode can occur in response to user inputs, interrupts from networking devices, and other hardware events.</p></td>
</tr>
<tr class="even">
<td><p>[Transition from active to idle](transition-from-active-to-idle.md)</p></td>
<td><p>Windows transitions the SoC platform from active mode to idle mode after all software activity is stopped and the devices on and off the SoC chip have entered low-power states.</p></td>
</tr>
<tr class="odd">
<td><p>[Activators](activators.md)</p></td>
<td><p>Windows can leave the System on a Chip (SoC) in the active power state during standby while app background tasks are executing or critical system tasks are executing. Windows components that are allowed to leave the SoC in the active power state are called activators because they are registered with the power manager as capable of blocking the transition back to the idle power mode.</p></td>
</tr>
<tr class="even">
<td><p>[Functional overview summary](functional-overview-summary.md)</p></td>
<td><p>Summarizes the capabilities supported by modern standby.</p></td>
</tr>
</tbody>
</table>

 

 

 






