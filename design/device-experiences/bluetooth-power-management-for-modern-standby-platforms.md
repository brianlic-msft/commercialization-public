---
title: Bluetooth power management for modern standby platforms
description: A Bluetooth radio device enables short-range RF communication between a PC and an input device, an audio device, or other Bluetooth-attached user peripheral.
MS-HAID:
- 'cstandby.bluetooth\_\_power\_management\_for\_connected\_standby-capable\_platforms'
- 'p\_weg\_hardware.bluetooth\_power\_management\_for\_modern\_standby\_platforms'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: c14acf01-6451-4367-9030-190198bde437
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Bluetooth power management for modern standby platforms


A Bluetooth radio device enables short-range RF communication between a PC and an input device, an audio device, or other Bluetooth-attached user peripheral. In a modern standby PC, the driver for a Bluetooth radio should manage this device's power states according to the guidelines presented in this article.

## Bluetooth radio


In a Windows system, the way that the power state of the Bluetooth radio device is managed depends on the bus to which the radio is connected. On hardware platforms that support the modern standby power model, Windows supports Bluetooth radios that are connected to UARTs or to Universal Serial Bus (USB). (In theory, the Bluetooth transport bus driver model that was introduced in Windows 8 should support any underlying communication bus. Currently, Microsoft verifies modern standby compatibility only for Bluetooth radios that are connected to UARTs or USB, or are integrated into System on a Chip (SoC) chips.)

Most modern standby PCs use UARTs to connect to Bluetooth radio devices. This type of connection requires the Bluetooth device vendor to provide a transport bus driver that communicates requests from the Windows Bluetooth driver stack to the Bluetooth radio device over the system-specific bus connection. This driver is also responsible for responding to power management requests from the Windows Bluetooth driver stack and for controlling the Bluetooth radio hardware. To control the hardware, the driver uses a combination of in-band bus communication, coordination with the power-engine plug-in (PEP), and/or out-of-band signaling through GPIO pins.

Bluetooth radio devices typically support multiple low-power modes, some of which may be proprietary to the device itself. The Windows Bluetooth driver stack requires that a Bluetooth radio support the following three device power states:

-   Active (D0)
-   Sleep (D2)
-   Off (D3)

Device power management for a Bluetooth radio is expected to operate in a consistent way across all system power states. The Bluetooth radio does not enter a special power management mode when the system enters modern standby. Instead, the Bluetooth radio is transitioned in and out of the Sleep (D2) state based on idle time-outs that are managed by the Windows Bluetooth driver stack and the devices that are associated with the radio. To support wake from modern standby on Bluetooth-attached HID input devices, the radio stays mostly in the Sleep (D2) state during modern standby. (Only Bluetooth HID input devices are enabled to wake the Bluetooth radio and the rest of the system during modern standby.) The Bluetooth radio is expected to have a very low power consumption—less than one milliwatt—in the Sleep (D2) state if no devices are connected through RF links. The power consumption can be expected to vary based on the number of associated devices, the types of those devices, and their activity patterns.

The Bluetooth radio must also support the capability to turn off the radio through the radio management user interface. This user interface control is built into Windows. After the Bluetooth radio is turned off through this user interface, the radio is transitioned to the Off (D3) power state, in which it is expected to consume nearly zero watts.

Previous versions of Windows, including Windows 8 and Windows 8 RT, require the Bluetooth device vendor to provide a radio control DLL. However, starting with Windows 8.1 and Windows RT 8.1, all Bluetooth radios in modern standby platforms should support the Bluetooth Core Specification Version 4.0. Thus, vendors are no longer required to supply a software DLL to implement the radio on/off control function. Windows now handles this function and will ignore any such DLL, even if present.

**Note**  For more information about implementing a Bluetooth transport bus driver, see [Transport Bus Driver for Bluetooth Power Control Handling Guidelines](https://msdn.microsoft.com/library/windows/hardware/dn349726.aspx). System integrators and Bluetooth driver developers are encouraged to read this documentation in conjunction with the power management guidance that is provided in the following discussion.

 

## Power management modes


From a software point of view, the Bluetooth radio supports three power management modes, regardless of the bus to which the radio is connected. The Windows Bluetooth driver owns the definition of the three modes and manages the transitions into and out of these modes. The following table describes the three Bluetooth radio power modes.

<table style="width:100%;">
<colgroup>
<col width="16%" />
<col width="16%" />
<col width="16%" />
<col width="16%" />
<col width="16%" />
<col width="16%" />
</colgroup>
<thead>
<tr class="header">
<th>Mode</th>
<th>Description</th>
<th>Device power state (Dx)</th>
<th>Average power consumption</th>
<th>Exit latency to active</th>
<th>Transition mechanism</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Active</p></td>
<td><p>The Bluetooth radio is actively communicating with an associated device on behalf of an application on the operating system.</p></td>
<td><p>D0</p></td>
<td><p>Varies, specific to the scenario and associated devices.</p></td>
<td><p>N/A</p></td>
<td><p>N/A</p></td>
</tr>
<tr class="even">
<td><p>Sleep (mostly idle with a low-rate duty cycle)</p></td>
<td><p>The Bluetooth radio is in a low-power state. The system has been paired with a remote Bluetooth device, but there is no connection between the two. That is, the device has been disconnected. The Bluetooth controller must be able to generate a wake signal (to the SoC if the radio is not integrated) when new data arrives from the paired device.</p>
<p>Or, the Bluetooth radio has no associations.</p>
<p>Or, the Bluetooth radio has an active connection that is idle (no data being sent/received) and the link is in sniff mode.</p></td>
<td><p>D2</p></td>
<td><p>&lt; 4 milliwatts</p></td>
<td><p>&lt; 100 milliseconds</p></td>
<td><p>Windows Bluetooth driver initiates a D2 transition using a D2 power IRP.</p>
<p>Windows Bluetooth driver initiates a pending wait-wake IRP in the underlying transport bus driver. If the Bluetooth device is attached through USB, this state is equivalent to selective suspend. (Bluetooth selective suspend requires the device to be marked as remote wake-capable and self-powered in the USB device descriptor.)</p></td>
</tr>
<tr class="odd">
<td><p>Off</p></td>
<td><p>The Bluetooth radio is completely off (zero watts) or in a low-power state in which no radio state is preserved. The Bluetooth radio is not capable of generating a wake signal to the SoC in this state. The Bluetooth radio is also not able to emit or receive any radio signals—all RF components are powered off.</p></td>
<td><p>D3</p></td>
<td><p>0 watts</p></td>
<td><p>&lt; 2 seconds</p></td>
<td><p>The Windows Bluetooth driver initiates a D3 transition using a D3 power IRP.</p>
<p>The transport bus driver or system ACPI firmware may remove power or toggle GPIO lines to transition the Bluetooth radio hardware to the Off (D3) state.</p></td>
</tr>
</tbody>
</table>

 

The Bluetooth radio also supports an associated mode in which the radio transmitter can be powered down by software in response to a request from the user. When the radio is enabled for the Bluetooth device, this device is in the Active (D0) or Sleep (D2) state. When the radio for the Bluetooth device is disabled by the user, Windows stops Bluetooth activity by surprise-removing the protocol drivers and their children, submitting the HCI\_Reset command to the controller, and then transitioning the radio device stack to the Off (D3) state.

## Software power management mechanisms


The power management of a Bluetooth radio device is driven by device Dx state transitions that are initiated by the Windows Bluetooth driver. The Windows Bluetooth driver is the power policy owner (PPO). The PPO decides when the device transitions between the Active (D0), Sleep (D2), and Off (D3) states.

When the radio does not have any associated devices, Windows transitions the device to D2 and persists it in that state until the user begins the pairing process. When the radio is associated with one or more devices, the Windows Bluetooth driver uses a simple algorithm that is based on the idle time-out to decide when to transition the Bluetooth radio from D0 to D2. This algorithm uses the pattern of Bluetooth usage by the operating system and applications to determine when to transition the radio to the D2 state. For example, the radio transitions to D2 several seconds after the last key press on a Bluetooth keyboard if there is no other activity on the Bluetooth radio.

The Windows Bluetooth driver transitions the device to D0 in response to any of the following:

-   The user begins a pairing process.
-   An application requests the use of Bluetooth functionality.
-   The Bluetooth radio has generated a wake request based on input from an associated device.

Unlike other devices, the Bluetooth radio follows the same power management pattern during modern standby (system display off) that it does when the system is normally operational and the display is on. That's because the Bluetooth radio is expected to be available to wake the SoC when input is received from an associated device at any time during modern standby. For example, if a user has associated a Bluetooth keyboard with a Windows computer, pressing any key on the keyboard should wake the computer from modern standby and turn on the display.

If no devices are associated with the radio, the radio is expected to be configured to consume less than one milliwatt when it's in the Sleep (D2) state.

When the Bluetooth radio is in the Off (D3) state, it is expected to consume nearly zero watts.

## Driver implementation notes


If the Bluetooth radio is connected through a UART or integrated into the SoC itself, the Bluetooth device vendor is required to implement and provide a transport bus driver. The transport bus driver is responsible for the following: • Translating Bluetooth HCI packet requests from the Windows Bluetooth driver (Bthmini.sys) to commands that are sent over the transport bus to the Bluetooth radio. • Transitioning the Bluetooth radio device into various power management modes that map to the Active (D0), Sleep (D2), and Off (D3) device power states. The driver also implements routines that handle power management events. • Configuring the Bluetooth radio to wake the SoC when a device generates input, and changing the state of any optional GPIO lines from the SoC to the Bluetooth radio that are used for power management. • Enumerating and power-managing other devices (such as an FM transmitter or GPS device) that share the same bus as the Bluetooth radio. If other devices are physically connected to the shared bus, but are not exposed to the operating system, the transport bus driver must completely power down these devices.

For details about implementing a transport bus driver, see Transport Bus Driver for Bluetooth Power Control Handling Guidelines. Transport bus drivers must be written using the Windows Driver Framework (WDF). A sample driver is available at [Bluetooth Serial HCI Bus Driver](https://code.msdn.microsoft.com/windowshardware/Bluetooth-Serial-HCI-6d95ac60).

To enable Bluetooth radio power management, the transport bus driver must perform the following actions:

-   Enable support for run-time idle power management and expose support for the Active (D0), Sleep (D2), and Off (D3) device power states.
-   Indicate to the Windows Bluetooth driver that the Bluetooth radio device is capable of signaling wake events from the D2 state.
-   Support arming the Bluetooth radio device to wake the SoC and disarming the Bluetooth device's wake signal to the SoC. This support might require handling one or more GPIO interrupts and executing wake methods within WDF.
-   Change the state of any optional GPIO lines from the SoC to the Bluetooth radio device when the device transitions between the Active (D0), Sleep (D2), and Off (D3) states.

If the Bluetooth radio is integrated into the SoC itself, the transport bus driver can register with the Windows power management framework to communicate Bluetooth radio power status to a SoC-specific power-engine plug-in (PEP). This is accomplished by setting the IdleTimeoutType member of the WDF\_DEVICE\_POWER\_POLICY\_IDLE\_SETTINGS structure to the value SystemManagedIdleTimeout.

If the Bluetooth radio is connected through USB, the built-in Windows USB Bluetooth driver stack must be used. The stack handles all power management operations.

## Radio management


The state of the Bluetooth radio transmitter is tied directly to the device power state. The radio transmitter is expected to be on when the radio is in the Active (D0) or Sleep (D2) power state. The radio transmitter must be turned off when the radio transitions to the Off (D3) state.

When the user turns off the Bluetooth radio, Windows terminates Bluetooth activity by canceling pending I/O operations and unloading the protocol drivers and their children. The Windows Bluetooth driver stack then issues the HCI\_Reset command to the controller to reset the radio to its default state. In the default state, the controller must not be capable of transmitting or receiving any radio signals. Finally, the controller transitions to the Off (D3) state.

In response to the transition to Off (D3), the transport bus driver must power off the Bluetooth device to its lowest power state using device-specific methods. A typical implementation is to change the state of a GPIO line from the SoC to the Bluetooth radio to disable power to the Bluetooth module. An alternate implementation is to require the ACPI firmware to remove power from the Bluetooth module using \_PS0 and \_PS3 control methods.

When the user turns on the Bluetooth radio, Windows transitions the radio to the Active (D0) state, re-initializes the radio, and then re-enumerates child protocol drivers. When the radio transitions to Active (D0), any required GPIO lines must be toggled as part of the normal D0 sequence for the Bluetooth radio. If ACPI firmware was used to power down the radio, it must restore power using the \_PS0 control method.

As part of this normal sequence, the transport bus driver must mark the device as an Internally Connected Device by setting the ContainerId of the Bluetooth radio to a specific GUID value, {00000000-0000-000-ffff-ffffffffffff}. This enables the Windows radio user interface elements to detect that the Bluetooth radio exposed by the transport bus driver is internal to the computer and not an externally attached radio for which radio control is not appropriate.

## Supported hardware power configurations


The power management hardware configuration for a Bluetooth radio depends on the communication bus. Generally speaking, all Bluetooth radios are expected to have the following hardware power management features in common:

-   Support for the Off (D3) state as a means to turn off the radio in response to a user request. Turning off the radio puts the Bluetooth radio in a low-power state that is nearly zero watts.
-   A mechanism to enter a low-power Sleep (D2) state in which connections are persisted to associated devices, but there are no active transfers.
-   A mechanism to generate a wake interrupt when an associated device has data for the SoC and the SoC is in a low-power state in which the bus to which the Bluetooth radio device is attached is not currently active.

Each of the supported buses (USB, UART, and integration into the SoC) for the Bluetooth radio device support all three basic hardware power management features in the preceding list. In addition, each Bluetooth radio can have vendor-specific or device-specific power management features, but these are outside the scope of this topic.

Bluetooth radio vendors are encouraged to implement value-add power management features in a way that is autonomous in hardware and does not require additional vendor-supplied driver software on the Windows system. Bluetooth radio vendors are also encouraged to implement their driver(s) and their power management software in a way that abstracts platform-specific differences into system ACPI firmware instead of into the device driver code or the driver .inf file. This approach allows one driver package for the Bluetooth device to be re-used in additional platforms without requiring an update to the driver source, binary, or signed installation package.

## Bluetooth radio that is connected through a UART outside of the SoC


If the Bluetooth radio is connected through a UART and is physically located outside of the SoC, the Bluetooth radio vendor must provide a transport bus driver that exposes the Bluetooth radio and any other device functions (for example, an FM radio) that share the same communication path through the UART. The bus driver is also responsible for managing any GPIO resources that control the Bluetooth radio's power consumption and wake capability.

Unlike other device classes, the GPIO lines that control Bluetooth power and wake are managed directly by the transport bus driver instead of being abstracted by ACPI control methods. This control scheme is a result of the multifunction bus driver design that enumerates the Bluetooth radio and other functions that share the same UART port. In this design, the Windows ACPI driver, Acpi.sys, is not loaded in the driver stacks for Bluetooth and the FM radio, making it impossible to use ACPI control method execution as a way to respond to a device Dx state transition.

The following block diagram shows the layers of software and hardware that form the communication paths to and from a Bluetooth radio device that is connected to a SoC chip through a UART port and a set of GPIO pins.

When the Bluetooth radio is connected to the UART port on the SoC, the system integrator must use a pin on the GPIO controller on the SoC to control power to the radio. In the ACPI firmware, this pin must be assigned as a GPIO I/O resource to the device object that represents the transport bus driver root device. The GPIO pin can be connected directly to the Bluetooth radio if the radio supports turning off the device with internal power-gating.

If the Bluetooth radio supports power-gating, the power source for the Bluetooth radio can be connected to any system power rail.

If the radio does not support internal power-gating that is controlled by a GPIO pin, the system integrator must place the Bluetooth radio on a power rail that is switchable. The GPIO pin from the SoC is then connected to the power-switching hardware. In this design, ACPI control methods cannot be used to track reference counts or to aggregate the power state of multiple devices sharing the same power rail, so the Bluetooth radio must be isolated on its own switchable power rail.

The system integrator must use an additional pin on the GPIO controller on the SoC to receive wake interrupts from the Bluetooth radio. Interrupts on this pin must be capable of waking the SoC from its lowest power state. In some SoC designs, such a pin is referred to as an always-on GPIO pin because the GPIO controller can detect interrupts on this pin at all times, regardless of the power state of the SoC. The always-on capability may be limited in hardware to a specific set of GPIO pins on the SoC or may be configurable in firmware. It is critical that the system integrator review this design with the SoC vendor to ensure the Bluetooth radio's wake interrupt will cause the SoC to exit its deepest idle power state. (At all times during modern standby, the system is in S0. modern standby systems do not support S3.)

When all functions enumerated by the transport bus driver have been powered off and the ACPI-enumerated transport bus device enters D3, the always-on GPIO pin can be powered off. This occurs when the radios for all device functions enumerated by the transport bus driver have been turned off by the user.

## Bluetooth radio on USB


If the Bluetooth radio is attached to the SoC or core silicon over the USB bus, the radio must be powered from a source other than the USB bus. In the USB specification, such a radio is described as self-powered, and this capability must be reported in the Bluetooth device's USB descriptors.

Similarly, the USB device hardware must advertise support for remote wake, which is the capability for the Bluetooth radio to generate in-band USB resume signaling to wake up the USB host controller. The remote-wake capability must also be advertised in the Bluetooth radio's USB descriptors.

The Bluetooth radio must support both the self-powered and remote-wake capabilities so that the Microsoft Bluetooth driver for USB-attached Bluetooth radios can enter the Sleep (D2) state and enable selective suspend.

The following block diagram shows the layers of software and hardware that form the communication paths to and from a Bluetooth radio device that is connected through a USB port to a SoC chip or core silicon.

If the Bluetooth radio is in the Sleep (D2) state and data from an associated device is available for the host, the Bluetooth radio must generate the remote wake resume signaling to wake the host. An out-of-band resume signal using a GPIO line to the core silicon is not supported. The Bluetooth radio, including its USB connection circuitry, is expected to consume less than one milliwatt of power in the Sleep (D2) state.

## Wake concerns


The Bluetooth radio is expected to be able to generate a wake interrupt when in the Sleep (D2) state. The wake interrupt must cause the SoC to power on, even if the SoC is in its lowest power state. The following table summarizes the two Bluetooth wake-signaling mechanisms.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Connection bus</th>
<th>Hardware signaling path</th>
<th>Comments and notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>UART (with vendor-supplied transport bus driver)</p></td>
<td><p>GPIO from the Bluetooth radio to the SoC.</p></td>
<td><p>The radio must be connected to a GPIO pin that can wake the SoC from its lowest power state.</p></td>
</tr>
<tr class="even">
<td><p>USB</p></td>
<td><p>In-band USB resume signaling from selective suspend.</p></td>
<td><p>Out-of-band GPIO wake is not supported.</p></td>
</tr>
</tbody>
</table>

 

## Testing and validation


Bluetooth device vendors are encouraged to test and validate the power management operation of the Bluetooth radio device.

The transitions between the Active (D0), Sleep (D2), and Off (D3) states can easily be observed using the Xperf tool, as described in other sections.

Bluetooth driver activities can be monitored by using ETW instrumentation that is built into Windows. Bluetooth device vendors are encouraged to review the materials on the Microsoft Connect website.

However, much of the underlying power management of the device is the responsibility of the vendor-supplied transport bus driver. The driver developer is encouraged to use Event Tracing for Windows (ETW) instrumentation to expose significant power management state changes in the driver and observe those by using the [Xperf tool](https://msdn.microsoft.com/library/Windows/Hardware/hh162920.aspx) or the built-in Windows Event Viewer.

If the Bluetooth radio is attached through USB, the built-in Powercfg.exe utility can be used together with the /energy command-line option to validate that the radio is entering the Sleep (D2) state and is suspended. To use the Powercfg.exe utility:

-   Open a Command Prompt window as Administrator.
-   Change to the root directory of the drive (**cd \\**).
-   Enter the command **powercfg.exe /energy**.
-   Wait for the default 60 seconds.
-   The Powercfg.exe utility will output the number of errors and warning conditions on the system, as shown in the following screenshot.
-   After the tool writes the summary information to the command prompt window, it generates an HTML file that is named Energy-report.html. Open the file and look for error or warning conditions from the USB Bluetooth device. The following example summary reports that a USB Bluetooth device has not entered the Sleep (D2) state when it is idle.

Bluetooth device vendors who provide additional third-party Bluetooth profile drivers and applications must verify that their software supports surprise removal and allows the radio management infrastructure to properly turn off the Bluetooth radio in a timely manner. These scenarios should be validated while the profile or application is in use. For example, for audio drivers, there should be Bluetooth audio streaming while the radio is turned off. Then the radio should be turned back on and the audio stream restarted to verify that it still works.

## Bluetooth power management checklist


System integrators, Bluetooth radio vendors, and SoC vendors should use the following checklist to ensure that their system power management design is compatible with Windows 8 and Windows 8.1:

-   Determine the communication bus for the Bluetooth radio in the system design. The Bluetooth radio is either connected over UART or attached via USB.
-   Ensure that the Bluetooth radio supports a low-power sleep mode that consumes less than one milliwatt when no devices are associated.

    The power consumption of the Bluetooth radio in sleep mode can vary based on the number of associated devices that are currently present, but should generally not exceed five milliwatts at any time.

-   Ensure that the Bluetooth radio supports the following basic required power management capabilities:
    -   Support for the Off (D3) state as a way to allow the user to turn off the radio.
    -   A mechanism to enter a low-power Sleep (D2) state where connections are persisted to associated devices, but there are no active transfers.
    -   A mechanism to wake the SoC when an associated device generates data and the SoC is in a low-power state.
-   If the Bluetooth radio is connected over a non-USB bus (UART or integrated into the SoC), the Bluetooth radio vendor must develop a transport bus driver. The transport bus driver must do the following:
    -   Support the features and requirements detailed in Transport Bus Driver for Bluetooth Power Control Handling Guidelines.
    -   Translate Bluetooth requests from the Windows Bluetooth driver (Bthmini.sys) to commands to the Bluetooth radio over the UART bus or a proprietary internal SoC bus.
    -   Transition the Bluetooth radio device into various power management modes that map to the Active (D0), Sleep (D2), and Off (D3) states. The driver must also implement routines that handle device power management (Dx) IRPs.
    -   Configure the Bluetooth radio to wake the SoC when a device generates input, and change the state of any optional GPIO lines that connect the SoC to the Bluetooth radio for power management purposes.
    -   Enumerate other devices (for example, an FM transmitter) that might be shared on the Bluetooth radio.
    -   Use the Windows Driver Framework (WDF) for driver development.
    -   Be implemented based on the Bluetooth Serial HCI Bus Driver.
-   If the Bluetooth radio is connected over USB, the Bluetooth radio vendor must:
    -   Enable support for selective suspend in the radio.
    -   Ensure the radio has the remote-wake and self-powered capabilities set in the USB device descriptor.
    -   Ensure the radio (including USB components) consumes less than one milliwatt.
-   Regardless of connection bus, the Bluetooth radio must do the following for an internally connected radio:
    -   Ensure all RF components are turned off in response to a HCI\_Reset command being sent to the radio in preparation for powering down the radio. The radio should not be capable of transmitting nor receiving any radio signals.
    -   Enter its lowest power mode when set to the Off (D3) state.
-   If the Bluetooth radio is connected over UART, the system integrator must connect the wake signal from the Bluetooth radio to a GPIO pin on the SoC that can wake the SoC from the lowest power state.
    -   The SoC can require wake signals to be routed to a limited set of GPIO pins that are pre-configured to be always-on.
    -   Or, the SoC can support configuration of a GPIO pin to an always-on pin in system firmware during boot.
-   The system integrator must test and verify that the Bluetooth radio enters the Sleep (D2) state when there are no associated devices.
-   The system integrator must test and verify that the Bluetooth radio enters the Sleep (D2) state when all associated devices do not have any active transfers.
-   The system integrator must test and verify that the Bluetooth radio can wake the SoC from its lowest power state when the radio is in the Sleep (D2) state.
-   The system integrator must test and verify that the Bluetooth radio does not generate spurious wake signals while in the Sleep (D2) state.
-   The system integrator must test and verify that add-on third-party software, such as profile drivers and applications, work properly with Bluetooth radio management. The radio should be turned off and on while the third-party software is actively in use (for example, playing audio or transferring a file).

 

 






