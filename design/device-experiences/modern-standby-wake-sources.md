---
title: Modern standby wake sources
description: This topic describes the scenarios in which the devices in this PC must be able to wake the processor.
MS-HAID:
- 'cstandby.connected\_standby\_wake\_sources'
- 'p\_weg\_hardware.modern\_standby\_wake\_sources'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
author: beneluxboy
ms.assetid: 4DB2F090-A0AD-4167-8805-85930FEF926F
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Modern standby wake sources


A PC that supports the modern standby power model must be capable of waking from standby in response to certain events, even if the platform has entered a very low-power idle state.

This topic describes the scenarios in which the devices in this PC must be able to wake the processor. It also explains which wake events should turn the screen on and which wake events should allow the screen to stay turned off. System integrators should use this information to ensure that their hardware platforms, firmware, and software can configure wake sources to achieve the required behavior.

## Overview of modern standby user experience for wake


The modern standby user experience is designed to model that of a cellular phone. When users finish using their phones, they press the system power button and the cell phone turns off. The phone remains off until the user presses the power button again, or a phone call, email, or instant message is received.

Similarly, when a PC is in modern standby, it looks and feels off—the screen is blanked, the system has no visible LED indicators, and there is no acoustic noise. However, a PC in modern standby remains on and connected to the Internet, just as the cell phone remains connected to the cellular network. (The modern standby PC uses any available network connection—Wi-Fi, mobile broadband (MBB)/cellular, or wired Ethernet.) And the modern standby PC, connected or not also has very long battery life in its off state, just like a cell phone.

Enabling the modern standby user experience requires all of the devices and software in the modern standby PC to actively and correctly participate in system power management. Achieving long standby battery life is primarily a function of allowing all devices, plus the core silicon or System on a Chip (SoC), to enter a very low-power idle state. During modern standby, the networking subsystem stays connected so that the system can wake and instantly respond to incoming emails or VOIP calls. Enabling the real-time nature of modern standby is primarily a function of platform devices waking the SoC for the correct events at the correct times.

Nearly all devices in the modern standby PC are expected to be capable of waking the SoC from its deepest idle power state. However, few devices should be capable of generating a wake signal for an event that would cause the system display to turn on. The difference between waking the SoC and turning on the display is at the center of delivering the modern standby user experience. The following rules govern platform wake behavior:

-   Only wake events that are user-initiated cause the system to turn on the display.
-   Wake source operation and scenarios are the same for all modern standby PCs, regardless of whether they are based on the x86 or ARM processor architecture.
-   Wake source operation and scenarios are the same for all modern standby PCs, regardless of whether they are based on the x86 or ARM processor architecture.
-   Wake source operation and scenarios are the same across all form factors, including slate, convertible tablet, clamshell, and docked slate.
-   Wake source operation and scenarios do not change between AC and battery-powered states. To deliver a consistent user experience, the guidelines in this section apply equally to when the system is on AC power and on battery power.

The remainder of this topic describes, for each device type, whether a device should be capable of waking the SoC from a deep idle state. Also described are the wake mechanisms for these devices, and whether the driver and system software will turn on the display in response to the wake event.

## Real-time clock (RTC) or always-on timer


The core silicon or SoC chip in a modern standby platform has one or more timers that are always powered on that so that Windows can schedule future work and place the SoC into a deep idle state. During standby, the always-on timer reliably wakes the SoC as programmed by the OS.

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
<th>Device</th>
<th>Wake the SoC from deep idle?</th>
<th>Wake mechanism or path</th>
<th>Turns on the display?</th>
<th>Remarks</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Always-on timer</p></td>
<td><p>Yes</p></td>
<td><p>SoC-specific, internal to the SoC</p></td>
<td><p>No</p></td>
<td><p>Each SoC has a different mechanism for programming the always-on timer.</p></td>
</tr>
</tbody>
</table>

 

## Buttons


The system power button is the most common user-initiated wake source in a modern standby platform. All modern standby PCs must be designed so that the power button is always enabled to send a wake interrupt to the SoC. To deliver an instant-on experience, the power button must cause the SoC to wake from the deepest idle state without delay.

Modern standby PCs might feature other system buttons, including rotation-lock and volume up/down buttons.

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
<th>Device</th>
<th>Wake the SoC from deep idle?</th>
<th>Wake mechanism or path</th>
<th>Turns on the display?</th>
<th>Remarks</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Power button</p></td>
<td><p>Yes</p></td>
<td><p>GPIO interrupt</p></td>
<td><p>Yes</p></td>
<td><p>The Windows power manager will turn on the display when the power-button interrupt occurs.</p></td>
</tr>
<tr class="even">
<td><p>Windows button</p></td>
<td><p>Optional</p></td>
<td><p>GPIO interrupt</p></td>
<td><p>Yes (if wake-enabled)</p></td>
<td><p>The Windows power manager will be notified that the Windows button was pressed and will turn on the screen. The Windows button is considered to be user input.</p></td>
</tr>
<tr class="odd">
<td><p>Volume buttons</p></td>
<td><p>N/A</p></td>
<td><p>N/A</p></td>
<td><p>N/A</p></td>
<td><p>Volume buttons are expected to function while the system is playing audio, including when the screen is off. However, when the screen is off and no audio is being played, the volume buttons must not wake the system.</p></td>
</tr>
<tr class="even">
<td><p>Rotation-lock button</p></td>
<td><p>No</p></td>
<td><p>N/A</p></td>
<td><p>N/A</p></td>
<td><p></p></td>
</tr>
<tr class="odd">
<td><p>Lid switch (mechanical or sensor-based)</p></td>
<td><p>Yes</p></td>
<td><p>GPIO interrupt</p></td>
<td><p>GPIO interrupt</p></td>
<td><p>There might be multiple types of lid switches, all of which are exposed to Windows in the same way. The lid switch can be a mechanical-contact switch or sensor-based switch. The platform can expose a lid switch for turning off the display when a tablet is attached to a keyboard dock that is closed. If the tablet has a cover, the sensor for detecting cover closing is also treated as a lid switch.</p>
<p>Opening the lid, opening the cover, or adjusting the display to make it visible must cause the display to automatically turn on. The Windows power manager automatically turns on the display in response to the lid switch interrupt.</p></td>
</tr>
</tbody>
</table>

 

## Communications devices


The Wi-Fi and mobile broadband (MBB) devices are responsible for delivering the real-time and constant connectivity features of modern standby.

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
<th>Device</th>
<th>Wake the SoC from deep idle?</th>
<th>Wake mechanism or path</th>
<th>Turns on the display?</th>
<th>Remarks</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Wi-Fi radio</p></td>
<td><p>GPIO interrupt</p></td>
<td><p>Typically, GPIO interrupt</p>
<p>(See Note following this table.)</p></td>
<td><p>No</p>
<p>(See Note following this table.)</p></td>
<td><p>The Wi-Fi wake-up source is not required for Disconnected Standby systems. </p></td>
</tr>
<tr class="even">
<td><p>Mobile broadband (MBB) radio</p></td>
<td><p>USB in-band resume signaling</p></td>
<td><p>Typically, GPIO interrupt</p>
<p>(See Note following this table.)</p></td>
<td><p>No</p>
<p>(See Note following this table.)</p></td>
<td><p></p></td>
</tr>
<tr class="odd">
<td><p>Bluetooth radio</p></td>
<td><p>Typically, GPIO interrupt</p>
<p>(See Note following this table.)</p></td>
<td><p>N/A</p></td>
<td><p>No</p></td>
<td><p>Windows and its drivers are responsible for detecting the type of associated Bluetooth device. If a keyboard, mouse, or other user-input device is responsible for causing the Bluetooth radio to wake the SoC, the display will turn on. Other Bluetooth devices such as portable audio headphones will not cause the display to turn on.</p></td>
</tr>
<tr class="even">
<td><p>Wired LAN (USB-attached, modern standby-capable)</p></td>
<td><p>USB in-band resume signaling</p></td>
<td><p>N/A</p></td>
<td><p>No</p>
<p>(See Note following this table.)</p></td>
<td><p>Wired LAN devices in modern standby platforms or their supported docks must support pattern-match offloads in order to be modern standby-capable.</p></td>
</tr>
</tbody>
</table>


**Note**  Windows can turn on the display when an incoming critical alert or activity is detected over the Wi-Fi network. Examples include notifications from lock-screen applications and VOIP calls.

**Note**  The interrupt mechanism is determined by the type of bus. For example, if Wi-Fi radio, MBB radio, or Bluetooth radio is connected via USB, it would use USB in-band resume signaling.

## Input devices


We recommend using HIDI2C for input peripherals whenever possible, but this is not a requirement. If necessary, USB can be used to connect to an input device such as a touchpad, touch digitizer, or pen digitizer. A precision touchpad must be capable of waking the system from deep idle, regardless of whether this device is connected to USB or I2C. As an option, a non-precision touchpad can wake the system from deep idle. Touch digitizers and pen digitizers must not wake the system from deep idle.

In addition to buttons on the chassis, a modern standby PC might have other input devices physically integrated into the system or attached to the system directly or indirectly through a dock. When the user generates input through an input device, it must always wake the SoC from the deepest idle state and cause the display to turn on.

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
<th>Device</th>
<th>Wake the SoC from deep idle?</th>
<th>Wake mechanism or path</th>
<th>Turns on the display?</th>
<th>Remarks</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Keyboard (integrated HIDI2C)</p></td>
<td><p>Yes</p>
<p>(See Note in Remarks.)</p></td>
<td><p>GPIO interrupt</p></td>
<td><p>Yes</p></td>
<td><p>The Windows power manager will turn on the display when keyboard input is detected.</p>
<p>All keys on the keyboard must generate a GPIO wake interrupt and cause the display to turn on (with the exception of volume buttons, which should not turn on the screen).</p>
<p>If the keyboard exposes consumer control keys—such as volume up/down and brightness—these keys must also generate a GPIO wake interrupt.</p>
<div class="alert">
<strong>Note</strong>  If the keyboard is not visible to a user who is interacting with the display (as in a convertible tablet), we recommend that the keyboard not wake the SoC in that mode.
</div>
<div>
 
</div></td>
</tr>
<tr class="even">
<td><p>Keyboard (external USB)</p></td>
<td><p>Yes</p></td>
<td><p>In-band USB resume signaling</p></td>
<td><p>Yes</p></td>
<td><p>Depending on the USB host controller, more than one key press might be required to generate a resume event that causes the screen to turn on.</p></td>
</tr>
<tr class="odd">
<td><p>Keyboard (external Bluetooth)</p></td>
<td><p>Yes</p></td>
<td><p>Bluetooth radio event followed by GPIO interrupt</p></td>
<td><p>Yes</p></td>
<td><p></p></td>
</tr>
<tr class="even">
<td><p>Touchpad (integrated HIDI2C)</p></td>
<td><p>Yes</p>
<p>(See Note in Remarks.)</p></td>
<td><p>GPIO interrupt</p></td>
<td><p>Yes</p></td>
<td><p>Moving a finger on the touchpad or exerting button activation force on the digitizer surface should cause a wake event.</p>
<div class="alert">
<strong>Note</strong>  
<ul>
<li>We recommend a precision touchpad wakes the SoC, though this is optional for either a precision touchpad or a non-precision touchpad.</li>
<li>If the touchpad is not visible to a user who is interacting with the display (as in a convertible tablet), the touchpad is not required to wake the SoC in that mode.</li>
</ul>
</div>
<div>
 
</div></td>
</tr>
<tr class="odd">
<td><p>Touchpad (external USB)</p></td>
<td><p>Yes</p>
<p>(See Note in Remarks.)</p></td>
<td><p>In-band USB resume signaling</p></td>
<td><p>Yes</p></td>
<td><p>Moving a finger on the touchpad or exerting button activation force on the digitizer surface should cause a wake event.</p>
<div class="alert">
<strong>Note</strong>  
<ul>
<li>We recommend a precision touchpad wakes the SoC, though this is optional for either a precision touchpad or a non-precision touchpad.</li>
<li>If the touchpad is not visible to a user who is interacting with the display (as in a convertible tablet), the touchpad is not required to wake the SoC in that mode.</li>
</ul>
</div>
<div>
 
</div></td>
</tr>
<tr class="even">
<td><p>Mouse (external USB)</p></td>
<td><p>Yes</p></td>
<td><p>In-band USB resume signaling</p></td>
<td><p>Yes</p></td>
<td><p>At a minimum, pressing any button on the mouse should generate a resume event and cause the screen to turn on. Depending on the USB host controller, more than one button press might be required to cause the screen to turn on. It is an optional capability for the mouse to support generating a resume event and waking the system for any movement of the mouse other than pressing a button.</p></td>
</tr>
<tr class="odd">
<td><p>Mouse (external Bluetooth)</p></td>
<td><p>Yes</p></td>
<td><p>Bluetooth radio event followed by GPIO interrupt</p></td>
<td><p>Yes</p></td>
<td><p>At a minimum, pressing any button on the mouse will generate a resume event and cause the screen to turn on. It is an optional capability for the mouse to support generating a resume event and waking the system for any movement of the mouse other than pressing a button. For a USB-connected Bluetooth radio, the Bluetooth radio event is not followed by a GPIO interrupt.</p></td>
</tr>
<tr class="even">
<td><p>Touch digitizer (integrated HIDI2C)</p></td>
<td><p>No</p></td>
<td><p>GPIO interrupt</p></td>
<td><p>No</p></td>
<td><p></p></td>
</tr>
<tr class="odd">
<td><p>Touch digitizer (external USB)</p></td>
<td><p>No</p></td>
<td><p>In-band USB resume signaling</p></td>
<td><p>No</p></td>
<td><p></p></td>
</tr>
<tr class="even">
<td><p>Pen digitizer (integrated HIDI2C)</p></td>
<td><p>No</p></td>
<td><p>GPIO interrupt</p></td>
<td><p>No</p></td>
<td><p></p></td>
</tr>
<tr class="odd">
<td><p>Pen digitizer (external USB)</p></td>
<td><p>No</p></td>
<td><p>In-band USB resume signaling</p></td>
<td><p>No</p></td>
<td><p></p></td>
</tr>
<tr class="even">
<td><p>Select sensors (such as proximity)</p></td>
<td><p>Yes</p></td>
<td><p>GPIO interrupt</p></td>
<td><p>Yes</p></td>
<td><p></p></td>
</tr>
<tr class="odd">
<td><p>USB HID devices other than keyboards or mice</p></td>
<td><p>No</p></td>
<td><p>N/A</p></td>
<td><p>N/A</p></td>
<td><p></p></td>
</tr>
</tbody>
</table>

 

**Note**  Windows can turn on the display when an incoming critical alert or activity is detected over the Wi-Fi network. Examples include notifications from lock-screen applications and VOIP calls.

 

## Insertion or removal of a connector or device


In addition to buttons on the chassis, a modern standby PC may have other input devices that are physically integrated into the system, or are attached to the system directly or indirectly through a dock. When the user generates input through an input device, this event must always wake the SoC from the deepest idle state and cause the display to turn on.

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
<th>Device</th>
<th>Wake the SoC from deep idle?</th>
<th>Wake mechanism or path</th>
<th>Turns on the display?</th>
<th>Remarks</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>USB device insertion</p></td>
<td><p>Yes</p></td>
<td><p>USB host controller wake signaling</p></td>
<td><p>No</p></td>
<td><p></p>
I</td>
</tr>
<tr class="even">
<td><p>USB device removal</p></td>
<td><p>Yes</p></td>
<td><p>USB host controller wake signaling</p></td>
<td><p>No</p></td>
<td><p></p></td>
</tr>
<tr class="odd">
<td><p>SD card insertion (SDIO controller-attached)</p></td>
<td><p>Yes</p></td>
<td><p>Card-detect GPIO interrupt</p></td>
<td><p>No</p></td>
<td><p></p></td>
</tr>
<tr class="even">
<td><p>SD card removal (SDIO controller-attached)</p></td>
<td><p>Yes</p></td>
<td><p>Card-detect GPIO interrupt</p></td>
<td><p>No</p></td>
<td><p></p></td>
</tr>
<tr class="odd">
<td><p>SD card insertion (USB-attached)</p></td>
<td><p>Yes</p></td>
<td><p>In-band resume signaling</p></td>
<td><p>No</p></td>
<td><p>The SD controller selected must be capable of detecting card insertion and removal while in the USB suspend state drawing less than 1 milliwatt average.</p></td>
</tr>
<tr class="even">
<td><p>SD card removal (USB-attached)</p></td>
<td><p>Yes</p></td>
<td><p>In-band USB resume signaling</p></td>
<td><p>No</p></td>
<td><p>The SD controller selected must be capable of detecting card insertion and removal while in the USB suspend state drawing less than 1 milliwatt average.</p></td>
</tr>
<tr class="odd">
<td><p>Attaching a dock</p></td>
<td><p>Yes</p></td>
<td><p>Varies independently per device in the dock.</p></td>
<td><p>Varies.</p>
<p>Depends on the devices in the dock and their current state.</p></td>
<td><p>Attaching a dock should be treated the same as individually attaching each of the devices included in the dock.</p>
<p>For example, attaching a dock alone should not cause the SoC to wake. Instead, detection of new devices (USB device, I²C device, battery, AC power source, and so on) contained in the dock should cause the SoC to wake.</p></td>
</tr>
<tr class="even">
<td><p>Removing a dock</p></td>
<td><p>Yes</p></td>
<td><p>Varies independently per device in the dock.</p></td>
<td><p>Varies.</p>
<p>Depends on the devices in the dock and their previous state.</p></td>
<td><p>Removing a dock should be treated the same as individually removing each of the devices included in the dock.</p>
<p>Removal of a dock alone should not cause the SoC to wake. Instead, removal of the individual devices (USB device, I²C device, battery, AC power source, and so on) contained in the dock should cause the SoC to wake.</p></td>
</tr>
<tr class="odd">
<td><p>Headphone or microphone insertion</p></td>
<td><p>Yes</p></td>
<td><p>GPIO interrupt</p></td>
<td><p>No</p></td>
<td><p>Attaching a headphone or microphone to the system provides an interrupt to enable the audio stack to correctly route audio.</p></td>
</tr>
<tr class="even">
<td><p>Headpohone or microphone removal</p></td>
<td><p>Yes</p></td>
<td><p>GPIO interrupt</p></td>
<td><p>No</p></td>
<td><p>Removing a headphone or microphone from the system generates an interrupt to enable the audio stack to correctly route audio.</p></td>
</tr>
<tr class="odd">
<td><p>eSATA insertion</p></td>
<td><p>Yes</p></td>
<td><p>In-band resume signaling</p></td>
<td><p>No</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>eSATA removal</p></td>
<td><p>Yes</p></td>
<td><p>In-band resume signaling</p></td>
<td><p>No</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>Optical disc drive, including Zero-Power Optical Disc Drive (ZPODD): disc insertion</p></td>
<td><p>Yes</p></td>
<td><p>GPIO interrupt</p></td>
<td><p>Yes</p></td>
<td><p>For ZPODD, the event is a GPE event handled by a storage stack component.</p></td>
</tr>
<tr class="even">
<td><p>Optical disc drive, including Zero-Power Optical Disc Drive (ZPODD): disc ejection button</p></td>
<td><p>Yes</p></td>
<td><p>GPIO interrupt</p></td>
<td><p>Yes</p></td>
<td><p>For ZPODD, the event is a GPE event handled by a storage stack component.</p></td>
</tr>
</tbody>
</table>

 

## Environmental context changes


The modern standby PC must also respond in real-time to changes in environmental conditions. The common cases are thermal events and power source change events.

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
<th>Device</th>
<th>Wake the SoC from deep idle?</th>
<th>Wake mechanism or path</th>
<th>Turns on the display?</th>
<th>Remarks</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Power source change (AC to battery, or battery to AC)</p></td>
<td><p>Yes</p></td>
<td><p>GPIO interrupt from battery subsystem or power-management IC (PMIC)</p></td>
<td><p>Yes</p></td>
<td><p>The Windows power manager will turn on the display when the battery subsystem has indicated a power source change. The GPIO interrupt for power source changes must cause the ACPI _PSR method under the power supply device to be executed.</p>
<p>The power subsystem must wake the SoC any time the power source changes, including when the system is attached or removed from a dock that has a battery or AC power source.</p></td>
</tr>
<tr class="even">
<td><p>Thermal event</p></td>
<td><p>Yes</p></td>
<td><p>USB host controller wake signaling</p></td>
<td><p>No</p></td>
<td><p>All temperature sensors must wake the SoC from the deepest power state to indicate temperature change.</p>
<p>ACPI firmware should monitor thermal zone temperature changes continuously during standby and when the SoC is in the deepest idle state. The ACPI firmware should report to the Windows thermal manager when the temperature rises above the trip points.</p></td>
</tr>
<tr class="odd">
<td><p>Battery charge completion</p></td>
<td><p>Yes</p></td>
<td><p>GPIO interrupt from battery subsystem or PMIC</p></td>
<td><p>No</p></td>
<td><p></p></td>
</tr>
<tr class="even">
<td><p>Battery threshold change</p></td>
<td><p>Yes</p></td>
<td><p>GPIO interrupt</p></td>
<td><p>No</p>
<p>(See Note following this table.)</p></td>
<td><p>The battery subsystem must wake the SoC from its deepest idle state anytime the remaining capacity goes below the value specified by Windows in the _BTP control method.</p>
<p>The battery subsystem must wake the SoC from its deepest idle state anytime the remaining capacity goes below the value specified by DesignCapacityOfLow in the _BIX control method. Windows will hibernate (x86) or shut down (ARM) the system when the remaining capacity falls below DesignCapacityOfLow.</p></td>
</tr>
</tbody>
</table>

 

**Note**  When the battery charge level crosses either the low or critical level, Windows briefly turns on the display to present a visual notification of the charge status to the user. This behavior is implemented in Windows and does not require additional firmware support.

 

 

 






