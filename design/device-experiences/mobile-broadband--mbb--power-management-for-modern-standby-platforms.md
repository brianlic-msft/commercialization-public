---
title: Mobile broadband (MBB) power management for modern standby platforms
description: A mobile broadband (MBB) device provides a mobile computer with a wireless data connection to a cellular service.
MS-HAID:
- 'cstandby.mobile\_broadband\_power\_management\_for\_connected\_standby-capable\_platforms'
- 'p\_weg\_hardware.mobile\_broadband\_\_mbb\_\_power\_management\_for\_modern\_standby\_platforms'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: D2FD2AB4-02D4-4218-8588-6B71C596AA49
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Mobile broadband (MBB) power management for modern standby platforms


A mobile broadband (MBB) device provides a mobile computer with a wireless data connection to a cellular service. An MBB device supports one or more cellular radio technologies, such as GSM, 3G, CDMA, or LTE. MBB devices in modern standby platforms are all required to provide the same set of power management capabilities and to implement the same general hardware configuration, regardless of the specific cellular technologies supported.

The MBB device is expected to use Universal Serial Bus (USB) to connect to the modern standby platform, and to use software provided by Microsoft for all connectivity and power management operations. Windows includes an inbox Mobile Broadband Class Driver, which provides a standardized interface for mobile broadband data transfer, connection management, and power management for MBB radios. The following guidance focuses on power management for MBB devices that are integrated inside the mobile computer chassis. MBB devices that connect to an external USB port are not discussed.

During modern standby (when the screen is off), the MBB device is expected to be in a low-power state. How much power the MBB device consumes in this low-power state depends on whether the user has provisioned the MBB device on the cellular network. If the MBB device is provisioned and the radio in the device is currently enabled by the user for a data connection, the device should be in a low-power connected-sleep mode in which the device's USB function is in the D2 (suspend) device power state. However, if the MBB device has not been provisioned on the network or the user has disabled the radio for a data connection, the device should be in a low-power radio-off mode. In radio-off mode, the MBB device has only enough power applied to respond to host commands over the USB interface.

The implementation of MBB device power management for a modern standby platform is based on the following:

-   The user-controlled radio power state of the MBB device.
-   The USB bus suspend and resume transitions.

The MBB device must be able to enter a low-power D2 (suspend) state after the MBB radio is turned off and the USB bus interface enters the suspend state. All sleep and wake power transitions must be signaled over the USB bus. There is no support for out-of-band GPIO signaling to initiate MBB device power transitions or to interrupt the main processor on the System on a Chip (SoC) or core silicon.

If the radio in the MBB device is currently enabled by the user for a data connection, the device must be able to use in-band, USB resume signaling to wake the SoC or core silicon from modern standby. The SoC or core silicon must be able to wake from its lowest power state in response to in-band, USB resume signaling from the MBB device.

## Power management modes


The MBB device is expected to support the five power management modes that are described in the following table. These modes are a combination of provisioned, connectivity, and radio power states. A transition from one mode to another is communicated to the device directly over the USB bus through commands from the Mobile Broadband Class Driver or USB device state transitions. Transitions between power management modes must not use external GPIO signaling.

<table style="width:100%;">
<colgroup>
<col width="14%" />
<col width="14%" />
<col width="14%" />
<col width="14%" />
<col width="14%" />
<col width="14%" />
<col width="14%" />
</colgroup>
<thead>
<tr class="header">
<th>Power management mode</th>
<th>Description</th>
<th>Radio power state</th>
<th>USB device power state (Dx)</th>
<th>Average power consumption</th>
<th>Exit latency to active</th>
<th>Transition mechanism</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Active</p></td>
<td><p>The radio is actively transmitting data or is actively connected to the cellular network.</p></td>
<td><p>On</p></td>
<td><p>D0</p></td>
<td><p>Scenario-specific</p></td>
<td><p>N/A</p></td>
<td><p>N/A</p></td>
</tr>
<tr class="even">
<td><p>Connected-sleep</p>
<p>(Average across 2G, 3G, LTE, and various DRX modes)</p></td>
<td><p>The radio is provisioned on the network and a user account is enabled. The platform is in modern standby. The MBB device is waiting for data from the network to wake up the SoC, and also for events from the SoC.</p></td>
<td><p>On</p></td>
<td><p>D2 (selective suspend)</p></td>
<td><p>&lt;= 15 milliwatts (device-specific)</p></td>
<td><p>USB D2 -&gt; D0 &lt;= 400 milliseconds (USB specification)</p></td>
<td><p>Initiated over USB bus by inbox MBB class driver.</p></td>
</tr>
<tr class="odd">
<td><p>Radio-off</p></td>
<td><p>The radio is provisioned on the network, but Windows or the user has turned off the radio in the MBB device.</p></td>
<td><p>Off</p></td>
<td><p>D2 (selective suspend)</p></td>
<td><p>&lt;= 5 milliwatts</p></td>
<td><p>USB D2 -&gt; D0 &lt; 400 milliseconds + Base station acquisition and registration (specific to location and carrier)</p></td>
<td><p>Initiated over USB bus by inbox MBB class driver.</p></td>
</tr>
<tr class="even">
<td><p>No-subscription</p></td>
<td><p>The user does not have an active subscription.</p></td>
<td><p>Off</p></td>
<td><p>D2 or D3</p></td>
<td><p>&lt;= 3 milliwatts</p></td>
<td><p>N/A</p></td>
<td><p>Initiated over USB bus by inbox MBB class driver.</p></td>
</tr>
<tr class="odd">
<td><p>No-SIM</p></td>
<td><p>The device has no SIM.</p></td>
<td><p>Off</p></td>
<td><p>D2 or D3</p></td>
<td><p>&lt;= 3 milliwatts</p></td>
<td><p>N/A</p></td>
<td><p>Initiated over USB bus by inbox MBB class driver.</p></td>
</tr>
</tbody>
</table>

 

**Note**  In no-subscription mode and no-SIM mode, an MBB device can be in either the D2 or D3 device power state, depending on whether the device supports D3.

 

The power consumption of the MBB device in each of the power modes shown in the preceding table will vary by radio implementation, network type, and distance from the cellular access point. Contact the radio manufacturer for information about the device-specific power consumption in each power management mode shown in the preceding table.

## Software power management mechanisms


The two primary software power management mechanisms for the MBB device are the radio power state and the USB function power state.

**Radio power state**

The Windows Mobile Broadband Class driver will send a MBIM\_CID\_RADIO\_STATE message to the MBB device with a command to turn the radio power state to on or off per the user's preference. When the user disables the radio, the Mobile Broadband Class driver will send the MBIM\_CID\_RADIO\_STATE message with an MBIMRadioOff command.

**USB selective suspend**

The Windows Mobile Broadband Class Driver is a Windows Network Driver Interface Specification (NDIS) miniport driver. The Mobile Broadband Class Driver and NDIS collaborate to manage the power of the MBB device. Windows will transition the USB function of the MBB device to the USB suspend (or, in Windows terminology, selective suspend) state when the MBB device should be in a low-power mode. The transition to the USB suspend state is independent of the radio power state.

Windows will transition the MBB device to *connected-sleep mode* (USB suspend (D2) state) when the system enters modern standby and the device is provisioned on the network. During connected-sleep mode, the radio is on, and the MBB device is expected to generate USB resume wake signaling and return to the D0 state when the radio receives new data from the network that matches programmed wake patterns or when other enabled wake events occur. The power consumption in connected-sleep mode will vary by cellular technology and distance from the cellular access point.

Windows will transition the radio to *radio-off mode* (USB suspend (D2) state) when the system enters modern standby and the device is provisioned on the network, but the user has set the radio power state to *off*. In radio-off mode, the MBB device is expected to consume no more than five milliwatts on average. The following block diagram shows the control path for initiating the MBB device's transition to the USB suspend state.

If the MBB device has not been provisioned on the network by the user, Windows will transition the device to the *no-subscription mode* (D2 or D3 state) when the platform enters modern standby. When the device is in no-subscription mode, its radio power state is always off. When the MBB device is in the no-subscription mode during modern standby, the power consumption of the MBB device is expected to be equivalent to that of the radio-off mode. However, the MBB device must still remain physically enabled on the USB bus during the entire time that the device is in the no-subscription mode.

At all times—regardless of whether the platform is in modern standby—power must not be removed from the USB function portion of the MBB device. Otherwise, when power is removed, the device will fall off of the USB bus and cause the device to be reported as surprise-removed.

**Note**  On modern standby platforms, there is no support for the execution of third-party driver or ACPI firmware to manage transitions of the MBB device between the power management modes previously described. All power management of the device must be done in-band through the USB bus.

 

Third-party driver and ACPI firmware is supported for Specific Absorption Rate (SAR) sensors, which change the MBB radio transmitter power in reaction to the proximity of the MBB antenna to the user.

## Supported hardware power configurations


To meet the power management requirements of a modern standby platform, only one hardware configuration is supported—the MBB device must use USB to connect to the platform. Additionally, the USB-connected MBB device must:

-   Report that it is self-powered and remote-wake-capable in the USB configuration descriptor for the device.
-   Be attached to a system power rail that will be powered on at all times regardless of whether the platform is in modern standby.

Because there is no support for the execution of third-party driver or ACPI firmware for MBB device power management, there must be no GPIO lines connected from the MBB device to the SoC for use by the operating system or third-party driver software. All power management of the MBB device must be communicated in-band over the USB bus.

## MBB module reset


The MBB device must undergo a reset when the platform enters the ACPI S5 (shutdown) system power state. This requirement exists so that the user can indirectly reset the MBB device if it is not responsive by selecting Restart from the Windows Power menu. In addition, this requirement ensures that the MBB device can be reset to detect a newly inserted or removed SIM.

The system integrator should ensure that the system resets the MBB device using one of the following methods:

-   **Reset in UEFI firmware**: The system UEFI firmware can reset the MBB device on system boot. Note that Windows requires platforms that have non-rotational (solid-state) storage to complete power-on self test (POST) within two seconds. Resetting the MBB device must not cause this time to be exceeded.
-   **Remove power with switchable power rail**: The system integrator can design the platform power routing to remove power from the MBB device when the platform enters the S5 state. The removal of power from the device be accomplished by using a GPIO-controlled power switch or by placing the MBB device on a power rail that is disabled by the system power-management IC (PMIC) when the platform enters the S5 state.

## Wake concerns


An MBB device that is in the USB suspend state must be able to wake the SoC by using USB resume signaling. The SoC must be able to wake from its lowest run-time idle state on detection of a USB specification-compliant resume-from-suspend signal from an attached USB device.

A USB-connected MBB device that is located inside the computer chassis will typically be self-powered. That is, the device draws its power from a system power rail instead of from the USB host controller to which it is attached. The reason for this requirement is that some MBB devices (depending on the cellular technology) require more than the USB specification-allotted suspend current to stay connected to the network during connected-sleep mode.

## Testing and validation


The MBB device vendor, the system integrator, and the SoC designer should test the MBB device's USB power management and verify that it is functioning correctly. Specifically, the MBB device should transition to the D2 (USB suspend) device power state and stay in this state during modern standby when the device is not actively transmitting or receiving data. In addition, verify that the MBB device can use in-band USB resume signaling to wake the SoC from its deepest idle state when data is transmitted to the MBB device over the cellular network.

## Power management checklist


System integrators, MBB device vendors, and SoC designers should review the checklist below to ensure that their system power management design is compatible with Windows 8 and Windows 8.1.

-   Select a MBB device that implements support for the Windows Mobile Broadband Class Driver and the Mobile Broadband Interface Model (MBIM).
-   Windows includes all of the built-in software required to enumerate, describe, communicate with, and power-manage the MBB device. No additional software is required or supported.

    Verify that your MBB device does not require additional driver software or firmware support on the SoC for power management.

-   The MBB device hardware must:
    -   Report the self-powered and remote-wake capabilities in the USB descriptor for the device.
    -   Be capable of using in-band USB resume signaling to wake the SoC when data from the cellular network is ready for processing.
    -   Not require any GPIO lines between the MBB device and the SoC to generate wake signaling or enter low-power modes.
    -   Not generate spurious USB in-band wakes. The MBB device must wake the SoC only when data matching programmed patterns arrives for the SoC or other enabled wake events occur.
-   The MBB device must be reset when the platform enters the S5 (shutdown) system power state. The system integrator must either:
    -   Reset the MBB module in system UEFI boot firmware during POST. Note that Windows requires a modern standby platform to complete POST within two seconds.
    -   Place the MBB module on a power rail that is turned off when the platform is in the S5 state. The rail can be turned off by a GPIO-controlled switch or by the system PMIC.
-   The SoC used in the platform design must be capable of detecting a USB resume signal and waking from its lowest power state.
-   System integrators should verify that the power consumption of the MBB device in the radio-off and no-subscription modes meets the previously described requirements.

 

 






