---
title: Near-field proximity (NFP) power management for modern standby platforms
description: Describes near-field proximity (NFP) power management requirements for modern standby platforms.
MS-HAID:
- 'cstandby.near-field\_proximity\_power\_management\_for\_connected\_standby-capable\_platforms'
- 'p\_weg\_hardware.near-field\_promiximity\_\_nfp\_\_power\_management\_for\_modern\_standby\_platforms'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 54D9E23E-28A3-4011-B55A-D015101210F3
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Near-field proximity (NFP) power management for modern standby platforms


A near-field proximity (NFP) device is a short-range radio transmitter/receiver device that enables a Windows PC to associate and pair with other NFP-equipped computers. An NFP device is exposed to the Windows operating system through the GUID\_DEVINTERFACE\_NFP Plug and Play (PnP) interface. A third-party driver, provided by the NFP device vendor, is responsible for implementing the GUI\_DEVINTERFACE\_NFP interface and power-managing the physical NFP device. The NFP device is typically connected to the I2C interface pins of the System on a Chip (SoC) or core silicon.

Generally, the NFP device can enter a low-power mode (standby mode or power-removed mode) when either no software clients have proximity publications or subscriptions, or all publications and subscriptions are disabled. From a driver development point of view, this condition occurs when there are no handles outstanding on the device. The NFP device should be placed in either standby mode or power-removed mode when no handles to the device are open and enabled.

When the platform enters modern standby and the display is turned off, the NFP device must enter either standby mode or power-removed power mode. The NFP device must enter a 0-watt, power-removed mode if its power consumption in standby mode is greater than one milliwatt on average.

The NFP device driver is not directly notified when the platform enters and exits modern standby. Instead, Windows notifies the driver indirectly by disabling the handles to the driver on entry to modern standby, and enabling these same handles on exit from modern standby. After the platform enters modern standby, Windows sends a disable notification to each open handle that is not already disabled. When the platform exits modern standby, Windows sends an enable notification to each handle that it previously disabled. An open handle that was already disabled before modern standby was entered stays disabled after the exit from modern standby.

## Device power management modes


Starting with Windows 8, an NFP device for a modern standby platform is expected to have three power modes—*active*, *idle*, and *standby*—in addition to a power-removed mode in which all power inputs to the NFP device have been switched off by a hardware mechanism external to the device. Contact the hardware vendor for an NFP device for details about the power management modes supported by the device.

The following table describes the device power modes for an NFP device.

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
<th>Device power mode</th>
<th>Description</th>
<th>Average power consumption</th>
<th>Exit latency to active</th>
<th>Transition mechanism</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Active</p></td>
<td><p>NFP device is actively communicating with another NFP device on a nearby computer.</p></td>
<td><p>&lt; 50 milliwatts</p></td>
<td><p>N/A</p></td>
<td><p>N/A</p></td>
</tr>
<tr class="even">
<td><p>Idle</p></td>
<td><p>NFP device is waiting for another computer with NFP to come nearby. The driver for the NFP device has open publications and subscriptions.</p></td>
<td><p>&lt; 5 milliwatts</p></td>
<td><p>&lt; 10 milliseconds (typical)</p></td>
<td><p>Hardware autonomous</p></td>
</tr>
<tr class="odd">
<td><p>Standby</p></td>
<td><p>The NFP device has power applied, but there are no outstanding publications or subscriptions (no open handles).</p></td>
<td><p>&lt; 1 milliwatt (device-dependent)</p></td>
<td><p>&lt; 50 milliseconds (typical)</p></td>
<td><p>Driver command or GPIO pin from the SoC or core silicon.</p></td>
</tr>
<tr class="even">
<td><p>Power-removed</p></td>
<td><p>The NFP device has no power applied because the platform is not powered on or an external entity has switched off power.</p></td>
<td><p>0 watts</p></td>
<td><p>&lt; 100 milliseconds</p></td>
<td><p>External entity removes power or applies power via ACPI firmware in response to a D3 IRP.</p></td>
</tr>
</tbody>
</table>

 

**Note**  
-   In the preceding table, the term *standby* refers to a device power mode that is distinct from *modern standby*, which is a platform-wide power state.
-   In the preceding table, the term *D3 IRP* refers to an IRP\_MN\_SET\_POWER request of type **DevicePowerState**.

 

The specified power consumption of an NFP device in standby mode will vary by part number and manufacturer. System designers should work with the device vendor to understand the device-specific standby power consumption. If the power consumption in standby mode is more than one milliwatt, the NFP device should be attached to a switchable power rail so that the device can be put in power-removed mode during modern standby.

## Software power management mechanism


Windows relies on the NFP device vendor to provide a third-party driver that power-manages the NFP device. Windows expects this driver to monitor the current number of open handles to the NFP device driver and the state of these handles to determine when to put the NFP device in a low-power mode.

We recommend that NFP driver developers use the User-Mode Driver Framework (UMDF) to develop their drivers. UMDF includes a number of features that make development of device run-time power management easier.

**D3 support**

NFP driver developers are encouraged to put the NFP device in a D3 state when all handles to the device have been closed or all open handles to the device have received the **IOCTL\_NFP\_DISABLE** notification. All open handles will receive the **IOCTL\_NFP\_DISABLE** notification after the platform enters modern standby and the user desktop is locked.

Even if the NFP device can attain a power consumption of less than one milliwatt in idle power mode, a transition to D3 is still recommended when all handles are closed or have received the **IOCTL\_NFP\_DISABLE** notification. Performing a transition to D3 allows all drivers in the driver stack for the NFP device to be notified that the hardware is entering a low-power mode. Additionally, a transition to D3 can be detected by instrumentation that is built into Windows. The [Windows Performance Toolkit](https://msdn.microsoft.com/windows/hardware/commercialize/test/wpt/index) and other performance diagnostic tools can be used to observe this transition. This built-in diagnostic support reduces the cost for a system integrator to verify that the NFP device is IOCTL\_NFP\_DISABLE correctly performing power management.

For some buses, the devices on the bus must transition to D3 before the bus controller can enter a low-power state. For an I2C-connected NFP device, there is no such dependence on the endpoint NFP device entering D3 in order for the I2C bus controller to power down.

However, if modern standby platforms in the future use Universal Serial Bus (USB) to connect to NFP devices, an NFP device must be able to enter D3 so that the USB host controller can power down and the SoC or core silicon can enter a low-power idle state during modern standby. NFP device driver developers are encouraged to transition their devices to D3 when they're ready to enter a low-power mode, regardless of the underlying bus, to enable future driver re-use and easy power management diagnostics.

If, to enter standby power mode, the NFP device requires a command to be sent from the NFP device driver over the communications bus, this command should be sent as part of the transition to D3 in the driver.

If the NFP device requires a GPIO pin from the SoC to be toggled to enter standby power mode, a transition to D3 is required. Initiating a transition to D3 notifies the Windows ACPI driver, Acpi.sys, which executes the \_PS3 control method implemented under the NFP device in the ACPI namespace. The \_PS3 method can toggle the GPIO line through a GPIO operation region. To make the NFP device driver more portable, any platform-specific delays or other timing constraints should be implemented in the platform firmware so that the NFP device driver does not need to be customized for a specific platform.

To enable the transition of the NFP device to D3 when the device is idle and the platform is in the S0 (working) system power state, a UMDF driver calls the IWDFDevice2::AssignS0IdleSettingsEx method. In this call, the driver supplies a pointer to a WUDF\_DEVICE\_POWER\_POLICY\_IDLE\_SETTINGS structure as the input parameter, and sets the DxState member of this structure to PowerDeviceD3.

If the power consumption of the NFP device in standby mode is greater than one milliwatt, the device must be put in power-removed mode when all handles are closed or all handles have been sent the **IOCTL\_NFP\_DISABLE** notification. In order for the underlying firmware and hardware to remove power from the NFP device, the device must already have entered D3 (that is, D3hot) and the NFP device driver must previously have enabled the transition to D3cold. Enabling D3cold implies that the driver for the NFP device saves the device's hardware state before the transition to D3 so that all power can be removed from the device. The device must be able to resume normal operation at a later time after the device is powered on (that is, the device exits D3cold) and the driver restores the device's hardware state. To enable D3cold, a UMDF driver calls the IWDFDevice2::AssignS0IdleSettingsEx method. In this call, the driver supplies a pointer to a WUDF\_DEVICE\_POWER\_POLICY\_IDLE\_SETTINGS structure, and sets the ExcludeD3Cold member of this structure to WdfFalse.

For more information, see [Supporting D3cold in a Driver](https://msdn.microsoft.com/library/windows/hardware/hh967717).

**Radio manager**

If the NFP device uses an RF (radio) mechanism to detect proximity events, the NFP device vendor must supply a [radio manager](http://go.microsoft.com/fwlink/p/?LinkId=617920) in addition to an NFP device driver. The radio manager is a COM DLL that implements the radio-management user-interface API and communicates privately with the NFP device driver. When the user changes the radio on/off state of the NFP device in the Windows Settings application, the NFP device driver receives notification of the change through the radio manager. The driver developer must define a private interface to communicate radio management state between the radio manager COM object and the NFP device driver. When the NFP device driver receives a command from the radio manager object to set the device's radio on/off state to off, the driver must save device's hardware state, turn off any RF components associated with the NFP device, and transition the device to D3. Note that the quantity and state of all handles from the GUID\_DEVINTERFACE\_NFP interface that are already open when the device enters D3 must be preserved while the device is in D3.

After the radio manager has indicated that the RF components in the NFP device should be enabled and powered on, the NFP device must immediately transition back to D0 when either of the following occurs:

-   A client opens a new handle to the NFP device driver.
-   Any already open handle receives the **IOCTL\_NFP\_ENABLE** notification.

The **IOCTL\_NFP\_ENABLE** notification will be sent by Windows to the NFP device driver when the platform exits modern standby and the user enters their password.

If the radio manager has indicated that the RF components in the NFP device should be disabled and powered off, the NFP device must remain in D3—even if a new handle is opened or an existing handle is enabled—until the radio manager indicates that the RF components should be enabled and powered on.

If the NFP device requires a command to be sent to return the NFP device to idle mode, this command can be sent over the communications bus (typically I2C) and should occur as part of the completion of the transition to D0 in the NFP device driver.

Transitioning the NFP device to D0 allows the \_PS0 control method under the device in the ACPI namespace to be executed. If required, this control method can toggle a GPIO line from the SoC to the NFP device to return the device to idle mode.

## Supported hardware power configurations


An NFP device should consume no more than one milliwatt of power, on average, while the hardware platform is in modern standby. If the device consumes no more than one milliwatt of power when it is in standby mode, the NFP device driver can place the device in standby mode when the device is not being used. Otherwise, the system designer must attach the device to a dedicated power rail that can be switched off when the device is not being used.

**Standby power is less than one milliwatt**

If the NFP device consumes less than one milliwatt of power in standby mode, the NFP device can be placed on any system power rail and can share this rail with any number of other devices. The device's transition to standby power mode occurs as part of its transition to D3.

The NFP device's entry to standby mode can be initiated either by sending a command over the communications bus (typically I2C) or by toggling a SoC GPIO line that is routed to the NFP device.

If the NFP device requires toggling of a GPIO line from the SoC to enter standby mode, the GPIO line must be described in a GPIO operation region in the ACPI namespace. The system integrator must implement the \_PS3 and \_PS0 methods under the NFP device in the ACPI namespace. The implementation of the \_PS3 method should toggle the GPIO line to switch the NFP device to standby mode. The implementation of the \_PS0 method should toggle the GPIO line to switch the NFP device from standby mode to idle mode. The toggling of this line might be subject to platform-specific or device-specific timing constraints.

As previously described, the NFP device driver must initiate a transition to D3 when all handles are closed, or all handles have received the **IOCTL\_NFP\_DISABLE** notification, or the radio manager has requested that the RF components in the NFP device be turned off.

**Standby power is more than one milliwatt**

If the power consumption of the NFP device in standby mode is more than one milliwatt, the NFP device must be placed on a dedicated power rail that can be independently switched on and off under control of a GPIO from the SoC. When all handles are closed, or all handles have received the **IOCTL\_NFP\_DISABLE** notification, or the radio manager has requested that the RF components be turned off, the NFP device first transitions to D3, and then transitions to power-removed mode when the power rail is switched off.

The switchable power rail must be controlled by a GPIO line from the SoC or core silicon. The GPIO line should be described as part of a GPIO operation region in the ACPI namespace. In addition, the ACPI namespace must include a Power Resource that describes the switchable power rail and that implements \_ON and \_OFF control methods. The \_ON and \_OFF control methods toggle the GPIO line described in the GPIO operation region to turn the power rail on and off. \_PR3 and \_PR0 packages must be placed under the NFP device in the ACPI namespace and must link to the Power Resource that describes the power rail.

As previously described, the NFP device driver must enable D3cold. In addition, the driver must initiate a transition to D3 when all handles are closed, or all handles have received the **IOCTL\_NFP\_DISABLE** notification, or the radio manager requests that RF components be turned off. When the ACPI driver receives the D3 IRP, it will execute the \_OFF method on the Power Resource indicated by the \_PR3 package. This method will toggle the GPIO line that controls the power switching hardware to remove power from the NFP device.

If the radio manager has indicated that the RF components should be enabled, the NFP device driver must perform a transition to D0 when a new handle is opened or an existing handle has received the **IOCTL\_NFP\_ENABLE** notification. When the ACPI driver receives the D0 IRP (an **IRP\_MN\_SET\_POWER** request of type **DevicePowerState**), it will execute the \_ON method on the Power Resource indicated by the \_PR0 package. This method will toggle the GPIO line that controls the power switching hardware to re-apply power to the NFP device.

## Wake concerns


There are no wake concerns for the NFP device. The NFP device is not permitted to support waking the SoC while the platform is in modern standby.

## Testing and validation


It is critical for the system designer to verify that the NFP device reliably enters standby mode or power-removed mode when the display is powered off for modern standby. The power management solution for the NFP device is highly dependent on the implementation of the third-party driver. Therefore, system integrators are encouraged to discuss the best method to test and validate the functionality of the NFP device with the NFP device vendor.

If the NFP device driver initiates a transition to D3 when all handles to the driver are closed or disabled, the [XPerf tool](http://msdn.microsoft.com/library/windows/hardware/hh162920.aspx) can be used to observe this transition. This validation method is similar to that described elsewhere for touch controllers and sensor devices.

If the driver sends commands over the communications bus to transition the device into and out of standby mode, the driver should support event tracing so that the system integrator can easily validate power management operations. Instrumentation can easily be added to Windows drivers using Event Tracing for Windows (ETW) events. For more information, see [Adding Event Tracing to Kernel-Mode Drivers](https://msdn.microsoft.com/library/windows/hardware/ff541236). An advantage of ETW tracing is that that it can be viewed using the Windows Performance Toolkit suite of tools, which includes XPerf.

## NFP device power management checklist


System integrators and NFP vendors should review the checklist below to verify that their system power management design is compatible with Windows 8 and above.

-   Select an NFP device that has a standby mode that consumes an average of less than one milliwatt of power.
-   Verify that the NFP device driver initiates a transition to D3 when all handles to the device are closed, or all open handles have received the IOCTL\_NFP\_DISABLE notification, or the radio manager requests that the RF components in the NFP device be disabled and powered off.
-   Verify that the NFP device driver initiates a transition to D0 if the radio manager has indicated that the RF components should be enabled and subsequently the first handle is opened to the device or the first open handle receives the IOCTL\_NFP\_ENABLE notification.
-   If the NFP device driver sends a custom command over the communications bus to tell the NFP device to enter standby mode, work with the NFP device vendor to determine the best way to verify that the NFP device enters standby power mode in response to this command.
-   If the power consumption for the NFP device is greater than one milliwatt, ensure that the device is placed on a switchable power rail.
-   If the NFP device is located on a switchable power rail:
    -   Verify that the device supports completely removing power from the device when it's unused, and that restoring power automatically re-enables and re-initializes the device.
    -   Verify that the power rail is controlled by a GPIO line from the SoC or core silicon.
    -   Map the GPIO line into a GPIO operation region implemented in the system ACPI firmware.
    -   Provide a Power Resource to describe the power rail, and include the \_ON, \_OFF, and \_STA control methods in this Power Resource.
    -   Provide the \_PR0 and \_PR3 packages under the NFP device in the system ACPI firmware and ensure that they reference the Power Resource.
    -   If the NFP device requires a power-on delay before the driver can access it, encode this delay in the implementation of the \_ON control method.
-   Initiate multiple transitions into and out of modern standby, and then stress-test the operation of the NFP device when the display is turned on.

 

 






