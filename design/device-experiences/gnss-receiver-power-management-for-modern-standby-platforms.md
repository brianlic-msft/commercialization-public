---
title: GNSS receiver power management for modern standby platforms
description: This topic discusses Global Navigation Satellite System (GNSS) power management for modern standby-capable platforms.
MS-HAID:
- 'cstandby.gnss\_receiver\_power\_management\_for\_connected\_standby\_platforms'
- 'p\_weg\_hardware.gnss\_receiver\_power\_management\_for\_modern\_standby\_platforms'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 7808A80E-FC76-4518-B320-C10D1720265A
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# GNSS receiver power management for modern standby platforms


This topic discusses Global Navigation Satellite System (GNSS) power management for modern standby-capable platforms.

A Windows PC that implements the modern standby power model may also contain a Global Navigation Satellite System (GNSS) device. A GNSS device enables the user to obtain high-precision positioning information from a satellite navigation system, such as the Global Positioning Systems (GPS) or Global Orbiting Navigation Satellite System (GLONASS). After the hardware platform enters modern standby, the GNSS device must enter a low-power mode of operation in which it consumes no more than 1 mW of power. The GNSS device must then stay in this mode until the platform exits modern standby.

GNSS devices that support GPS and the Global Orbiting Navigation Satellite System (GLONASS) have been available for some time, but newer GNSS devices support satellite navigation systems such as BeiDou Navigation Satellite System (BDS) and Galileo.

A modern standby platform is typically built around a System on a Chip (SoC) integrated circuit. Windows supports the following options for adding a GNSS device to such a platform:

-   Incorporate a mobile broadband (MBB) module that contains an integrated GNSS device. This method is common in cellular phones.
-   Select a SoC that contains an integrated GNSS device.
-   Use a low power bus such as I2C, SPI, or UART to connect a stand-alone GNSS device to the SoC.

If possible, the system integrator should select a GNSS device that implements a low-power sleep mode in which the device consumes no more than 1 mW of power. The GNSS device vendor must provide a location sensor driver that translates location data from the GNSS device to the form required by client applications. These applications connect to the GNSS device through the Windows Location API. The location sensor driver for the GNSS device keeps track of the following information:

-   The number of clients that are currently connected to the GNSS device through the Location API.
-   The state of the radio on/off switch for the GNSS device. The user controls this switch through the Windows Settings application. For more information, see Integrating radio management.

The location sensor driver uses this information to determine when the GNSS device is idle so that it can be placed in a low-power mode. A GNSS device is actively being used only if one or more clients are connected to the device. Otherwise, the device is idle.

To extend system battery life, access to the GNSS device is restricted during modern standby. Lock-screen applications can access geofencing and position information during modern standby. However, non-lock screen applications can use the Location API to obtain location data from the GNSS device only while the display is turned on and the platform is interacting with the user. Shortly after the display turns off and the platform enters modern standby, any non-lock-screen applications that have connections to the GNSS device are automatically disconnected by Windows, and the applications are suspended.

## Power management modes


The GNSS receiver is expected to have 4 power management modes as described below.

**GNSS Receiver Power Modes**

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
<th>Device Power Mode</th>
<th>Description</th>
<th>Device Power State (Dx)</th>
<th>Radio State (as shown to user)</th>
<th>Number of Connected Clients</th>
<th>Average Power Consumption (mW)</th>
<th>Transition Mechanism</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Active (acquisition)</p></td>
<td><p>The GNSS receiver is acquiring a satellite fix.</p></td>
<td><p>D0</p></td>
<td><p>On</p></td>
<td><p>&gt;= 1</p></td>
<td><p>~200 mW</p></td>
<td><p>N/A</p></td>
</tr>
<tr class="even">
<td><p>Active (1 Hz Tracking)</p></td>
<td><p>The GNSS receiver has acquired a satellite fix and is providing data to one or more applications on a periodic basis.</p></td>
<td><p>D0</p></td>
<td><p>On</p></td>
<td><p>&gt;= 1</p></td>
<td><p>~100 mW (device-specific)</p></td>
<td><p>N/A</p></td>
</tr>
<tr class="odd">
<td><p>Sleep</p></td>
<td><p>The GNSS receiver has no connected clients The GNSS receiver hardware still has power applied to preserve context on the device and reduce resume latency time to the Active mode.</p></td>
<td><p>D3(D3hot)</p></td>
<td><p>Off or on</p></td>
<td><p>0</p></td>
<td><p>&lt;1 mW (device-specific)</p></td>
<td><p>Software-initiated. This is the selective suspend state for GNSS radios attached directly to the Universal Serial Bus (USB) bus or a USB composite device.</p></td>
</tr>
<tr class="even">
<td><p>Power removed</p></td>
<td><p>The GNSS receiver has no connected clients, the radio is powered down and all power from the GNSS receiver has been removed by an external entity.</p></td>
<td><p>D3(D3cold)</p></td>
<td><p>Off or on</p></td>
<td><p>0</p></td>
<td><p>0 mW</p></td>
<td><p>Software-initiated and requires hardware coordination to remove power.</p></td>
</tr>
</tbody>
</table>

 

The software driver for the GNSS receiver also needs to handle radio management as described below.

## Platform implementation requirements


A modern standby platform has multiple options for physically integrating a GNSS receiver. The GNSS receiver may be part of a standalone device which is connected to the SoC by a low-power communications bus. The GNSS receiver may also be integrated into a mobile broadband (MBB) radio as GNSS receivers are common in cellular phones. Finally, the GNSS receiver may be integrated onto the SoC itself.

These multiple options present a challenge to the system integrator when determining which implementation to select for a platform that requires GNSS functionality. For Windows modern standby platforms, system integrators are recommended to integrate GNSS in the following priority order:

1.  If the system is equipped with an MBB radio, use the GNSS receiver integrated into the MBB module.
2.  If the system is equipped with a SoC that has an onboard GNSS receiver, use the GNSS receiver integrated into the SoC.
3.  Integrate a standalone GNSS receiver attached to the SoC over a low power communications bus (such as UART, SPI or I2C).

The system integrator should not expose any extraneous GNSS receivers to Windows. In the presence of multiple GNSS receivers exposed to the operating system, Windows will NOT aggregate the location information from all GNSS devices.

## Software power management mechanism


GNSS devices in Windows platforms are expected to be managed by a User-Mode Driver Framework (UMDF) driver that uses the Windows Sensor Class Extension model and implements the ISensorDriver interface. This GNSS driver is called a location sensor driver and is expected to power-manage the underlying GNSS receiver and provide data to application requests for location information.

## Overview and application model


Location sensor drivers use the number of connected application clients as the primary mechanism to determine when the GNSS device can enter the sleep or power removed mode. The location sensor driver is also responsible for communicating with a GNSS vendor-provided radio manager library that enables the user to control if the GNSS radio is enabled or disabled. The location sensor driver can use both the number of connected clients and the user's preference for radio state to ensure the GNSS device is in a low-power sleep or power removed mode whenever possible.

Windows Store apps manage the lifetime of foreground and background applications and therefore have significant influence on the number of application clients connected to the location sensor driver. A foreground application requests location information through the Windows Location API. When the foreground application is switched to the background by the user, the Windows Store app model ensures that the client application is disconnected from the GNSS receiver.

This application model mechanism allows the location sensor driver to easily track the number of connected application clients. Whenever there are zero connected application clients, the location sensor driver can transition the GNSS device into a sleep or power removed mode.

When the system enters modern standby, Windows will automatically suspend all foreground applications resulting in the location sensor driver observing the number of connected clients transition to zero.

## Integrating radio management


The location sensor driver must also implement an interface to communicate with the vendor-provided radio manager library. The radio manager library allows Windows to expose a GNSS device radio "on/off" control in the Windows Settings application.

## Location sensor driver implementation requirements


The location sensor driver must place the GNSS device into a low-power D3 state when the GNSS device is not in use. The GNSS device is not in use when there are no currently connected clients or the GNSS has been disabled through the radio manager.

The location sensor driver must persist the GNSS device in the D3 state at all times when the GNSS device has been disabled through the radio manager. This requirement prevents the driver from using a power-managed queue and simply forwarding requests from connected clients. The location sensor driver must use a non-power-managed queue for I/O and manage idle directly using the *StopIdle* and *ResumeIdle* methods. The location sensor must continue to be the power policy owner for the driver stack of the GNSS device. The driver must set the value of *bPowerManaged* to FALSE when calling *IWDFDevice::CreateIoQueue* to create the I/O queue.

As mentioned above, the driver uses the number of connected clients and the state of the radio from the radio manager to determine whether the GNSS device is idle. When the GNSS device is idle, the driver calls the ResumeIdle method which causes the driver framework to initiate a D3 transition. The driver framework will execute the driver's implementation of the *OnD0Exit* method.

When the GNSS device should be reactivated due to a new connected client or power on of the radio, the driver calls the *StopIdle* method. The driver framework will execute the driver's implementation of the *OnD0Entry* method. Note, the driver must execute the *StopIdle* method with the *WaitForD0* parameter set to FALSE.

The state diagram provided below illustrates this relationship and serves as a guide for the driver developer for when to call the *StopIdle* and *ResumeIdle* methods.

Because the driver is responsible for keeping track of whether the device is idle, it must directly manage the I/O queue and resulting hardware device accesses.

The location sensor driver must implement both the *IPnpCallbackSelfManagedIo::OnSelfManagedIoSuspend* and *IPnpCallbackSelfManagedIo::OnSelfManagedIoRestart* methods. Note that the driver framework will call IPnpCallbackSelfManagedIo::OnSelfManagedIoInit when the device is started, including on system boot. Subsequent calls are to the *IPnpCallbackSelfManagedIo::OnSelfManagedIoRestart* callback. These interfaces must be registered when the driver framework calls the CreateDevice method.

The *IPnpCallbackSelfManagedIo::OnSelfManagedIoRestart* signals the location sensor driver that requests into the driver may directly interact with the GNSS device hardware, including requests from *ISensorDriver::* callbacks. Note that the driver framework guarantees that the device hardware may be accessed in both the *OnD0Exit* and *OnD0Entry* methods.

Similarly, when the *IPnpCallbackSelfManagedIo::OnSelfManagedIoSuspend* method is called by the framework, the driver must complete all ISensorDriver requests immediately before returning from *OnSelfManagedIoSuspend*. The driver cannot access the device hardware if doing so might prevent any of these requests from completing within one second. If the location sensor driver has a pending request to the GNSS device hardware, the request must be cancelled if it cannot be completed in any other way without violating this time constraint.

If the driver does not directly interact with a hardware device or all outstanding hardware requests are guaranteed to complete within one second, the driver should implement the *OnSelfManagedIoSuspend* method by using the following procedure:

1.  Set a global flag indicating the device is inactive.
2.  Call the *StopSynchronously* method on the Windows Driver Frameworks (WDF) queue.
3.  Stop any other, asynchronous work that accesses the GNSS device hardware.
4.  Call the *Start* method on the WDF queue.
5.  Clear the global flag set in step 1.

For a code example that performs these operations, see the OnSelfManagedIoSuspend implementation in Sensors Geolocation Sample Driver (UMDF Version 1).

If the driver interacts directly with a hardware device, then any outstanding requests to the hardware must be cancelled before flushing the I/O queue. The driver should implement the *OnSelfManagedIoSuspend* method by using the following procedure:

1.  Set a global flag indicating the device is inactive.
2.  Call the *Stop* method on the WDF queue.
3.  Cancel all pending hardware requests to allow all *ISensorDriver* callback threads to complete.
4.  Call the *StopSynchronously* method on the WDF queue.
5.  Stop any other, asynchronous work that accesses the GNSS device hardware.
6.  Call the *Start* method on the WDF queue.
7.  Clear the global flag set in step 1.

All location sensor drivers must synchronously purge the I/O queue within their implementation of the *OnSelfManagedIoFlush* method.

## <a href="" id="sleep-and-power-removed-modes-"></a>Sleep and power removed modes


GNSS devices may support both a sleep mode and a power removed mode when the device has local context preserved and can still respond to requests over the communications bus without external signaling. (Typically, a device in power removed mode cannot respond to bus requests.) The location sensor driver must be written to understand if the underlying device is capable of the power removed mode. The location sensor driver should enable D3cold only if the underlying device is capable of the power removed mode and the driver is capable of saving/restoring context and re-initializing the device. Otherwise, the location sensor should continue to use D3 as its idle state, but not enable D3cold. This allows the underlying bus and filter drivers to put the device in the sleep low-power mode and not the power removed mode.

When the location sensor driver indicates that it supports D3cold and begins a D3 transition, the underlying bus and filter drivers are responsible for removing power from the device. The mechanism may be implemented by ACPI in the case of UART-connected GNSS devices. Or, the mechanism may be enabled by a combination of the USB hub driver and the ACPI driver in the case of USB-enumerated GNSS devices.

If the GNSS device is on the SoC, proprietary driver and firmware from the SoC vendor implemented in the underlying driver(s) is responsible for removing power from the GNSS device. If the GNSS device consumes greater than 1 mW in its sleep power mode, the GNSS driver, platform firmware and hardware must be engineered to place the device in the power removed mode when all clients are disconnected.

## Idle detection


The location sensor driver for a GNSS device must transition the device to the sleep power mode whenever possible. If an app requests a long report interval, the location sensor driver should transition the GNSS device to the sleep power mode until the next fix is requested. The location sensor driver must transition the GNSS device to the active power mode with sufficient time to triangulate a fix and provide the app with location data.

For example, assume the shortest requested report interval is 30 minutes and the device requires one minute to warm up and acquire a location fix. In this scenario, the location sensor driver must:

-   Immediately after providing location information, call ResumeIdle which will transition the GNSS device to sleep mode (D3).
-   Arm a timer to expire 28 minutes in the future. (TimerExpiration = ReportInterval – WarmUpTime).
-   When the timer expires, call StopIdle which will transition the GNSS device to D0.
-   When the device has acquired a fix, provide location information to the application.
    **Note**  The location sensor driver must carefully configure D3cold.

     

If the device requires continual power in order to achieve the resume latency for the WarmUpTime, D3cold must not be enabled. D3cold can be enabled dynamically at runtime by changing the value of ExcludeD3Cold in the WDF\_DEVICE\_POWER\_POLICY\_IDLE\_SETTINGS structure.

When a USB-attached GNSS device transitions to the sleep mode (D3) with D3cold disabled, the device will transition to the USB suspend state which saves significant chipset and processor power. If the location sensor driver enables D3cold and transitions to the sleep mode (D3), the underlying platform may remove power from the device even when it is attached via the USB bus.

## Supported hardware configurations


Windows supports four physical hardware configurations for the GNSS device. The connectivity bus differentiates each hardware configuration.

## GNSS connected to the SoC over UART


In this configuration, the GNSS radio is a standalone device connected to a UART on the SoC. The GNSS radio may have one or more GPIOs between the radio and the SoC for the purposes of transitioning between the active and sleep power modes or for handling reset and power-up sequencing conditions.

If the GNSS radio consumes less than 1 mW in its sleep power mode, the GNSS radio may be connected to any system power rail that meets the device's specifications.

The GNSS device must be declared in the ACPI namespace and GPIOs for power management should be controlled by the \_PS3 and \_PS0 control methods under the device in the ACPI namespace. The \_PS3 and \_PS0 methods are executed by the ACPI driver in response to the D3 and D0 transitions initiated by the location sensor driver. The system integrator must declare the GPIOs as part of a GPIO operation region in the ACPI namespace.

If the GNSS receiver consumes more than 1 mW in its sleep power mode, the GNSS receiver must be connected to a power rail which can be switched on and off using a GPIO controlled by ACPI firmware on the SoC. In this configuration, the location sensor driver must enable D3cold. The GPIO for controlling the switchable power rail must be exposed in an ACPI GPIO operation region. The system integrator must describe a power resource for the switchable power rail, including the \_OFF and \_ON methods, as well as the references to the power resource under the GNSS device in the namespace.

The Windows ACPI driver will evaluate the \_OFF method when the location sensor driver transitions to D3. When the location sensor driver transitions to D0, the Windows ACPI driver will evaluate the \_ON method under the power resource. The implementation of the \_OFF and \_ON methods should toggle the GPIO that controls the switchable power rail and implement any power sequencing delay(s) required.

## GNSS integrated into the SoC


If the GNSS device is physically integrated into the SoC, the implementation of communications and power management is specific to the SoC itself.

The GNSS device must still be enumerated via ACPI, though communications to the underlying GNSS receiver may occur through a transport driver that is provided by the SoC vendor. In this configuration, the location sensor driver must still implement a D3 transition to enter the sleep or power removed mode when all clients have disconnected. The D3 transition ensures that Windows OS power management tools and diagnostics can easily observe the power state of the GNSS device.

System integrators that plan to leverage a GNSS radio integrated into the system SoC should consult closely with the SoC vendor for firmware, driver and power management support.

## GNSS integrated into a USB-attached MBB radio as a USB composite device


The system designer may choose to integrate a USB-attached MBB module that contains an embedded GNSS receiver. In this hardware configuration, the location sensor driver communicates with the embedded GNSS receiver directly over the USB bus as one function in a USB composite device.

**Note**  Systems with GNSS devices on the MBB module require careful integration consideration. Contact your Microsoft representative to review the hardware, software and firmware design for these solutions.

 

In this configuration, the GNSS device is an integrated part of the MBB module. The GNSS radio may share processing, power supply and RF antenna components with the MBB radio. The GNSS radio is exposed directly to software as one interface on a USB composite device. The location sensor driver communicates with the GNSS radio directly over the USB bus using USB driver interfaces implemented inside the location sensor driver.

Power management of the GNSS hardware is driven by in-band communications to the GNSS module. The GNSS module and the location sensor driver must support an in-band mechanism to turn on and off the GNSS radio. This mechanism must not rely on the use of any GPIOs from the SoC to the MBB+GNSS module.

Similarly, the GNSS module and the location sensor driver must support transitioning the device to the D3 state such that the USB composite device can enter the USB suspend (selective suspend) state. All functions on a USB composite device must be suspended in order for the composite device to suspend. The GNSS device must be in the Sleep (D3) mode in order for the GNSS function and the whole USB composite device to be in the suspend state.

**Note**  The GNSS device and the driver must support selective suspend otherwise the USB host controller on the SoC cannot enter a low-power mode and will prevent power savings during modern standby.

 

In this configuration, the GNSS device is enumerated via USB and the USB composite driver, but is described in the ACPI namespace. In this configuration there is no support for GPIO communications between the GNSS device on the MBB module and the SoC. The GNSS device must remain enumerated to Windows via ACPI during the entire time that the platform stays in the S0 system power state, even if the radio is disabled by the user. The GNSS device must not ever disappear from the USB bus during any portion of system on time.

## GNSS integrated into a USB-attached MBB radio using device services


The system designer may choose to integrate a USB-attached MBB module that contains an embedded GNSS receiver. In this hardware configuration, the location sensor driver communicates with the embedded GNSS receiver through the mobile broadband device services interface as opposed to the GNSS device being exposed as a standalone USB function as part of the composite device that represents the whole MBB module.

**Note**  This configuration is not recommended. System integrators choosing this method of GNSS device integration should contact their Microsoft representative to validate correct implementation. Exposing the GNSS device as part of a USB composite device representing the MBB module is preferred.

 

In this configuration, the GNSS device is an integrated part of the MBB module. The GNSS radio may share processing, power supply and RF antenna components with the MBB radio. The GNSS radio is exposed indirectly to software via the device services interface which can be accessed using the WindowsIMbnDeviceServices COM interface. The location sensor driver communicates with the GNSS radio through the IMbnDeviceServices interface.

Power management of the GNSS hardware is driven by in-band communications over the device services interface to the MBB module. The GNSS hardware must support an in-band mechanism over the device services interface to turn off the radio and place the GNSS device in a low-power mode. These mechanisms must be accessible by the location sensor driver through the device services interface.

In this configuration, the GNSS device must be enumerated by ACPI and described in the ACPI namespace as a child of the mobile broadband module. The GNSS device will have no hardware resources described under the device in the ACPI namespace.

The location sensor driver must still perform the same set of power management implementation guidance as described in the previous driver implementation requirements section.

In this configuration there is no support for GPIO communications between the GNSS device on the MBB module and the SoC. All power management and radio communications are performed physically over the USB bus and exposed to the location sensor driver through the device services interface. The GNSS device must remain enumerated to Windows via ACPI for all of system on time, even if the radio is disabled by the user.

When implementing this hardware configuration, the system integrator is encouraged to partner closely with the MBB module vendor to ensure the GNSS device is exposed correctly in the ACPI namespace.

## Wake concerns


There are no wake concerns for GNSS devices. GNSS devices are not expected to support waking the SoC from a low-power state.

## Testing and validation


GNSS device vendors, MBB module vendors and system integrators should follow these recommendations to test and validate the power management implementation of the GNSS device and its related software components. For more information, see Global Navigation Satellite System (GNSS) Test Guidance.

## <a href="" id="location-sensor-power--management"></a>Location sensor power management


The system integrator should validate that the location sensor driver for the GNSS device performs power management transitions and enters the D3 state when all clients have disconnected or the radio has been disabled.

The basic test cases are:

-   Observe the location sensor driver transitions to D3 within 10 seconds of the screen turning off for modern standby.
-   Observe the location sensor driver transitions to D3 within 10 seconds of the radio being turned off in the Windows Settings application.
-   Observe the location sensor driver transition to D0 immediately after exiting modern standby and launching an application that uses the Location API.

The easiest way to observe Dx state transitions of the location sensor driver is to use the Windows Performance Toolkit to compare against to other Windows sensor devices. This method uses Windows instrumentation to validate the D3 IRP is transitioning through the device driver stack that comprises the GNSS device. The Windows power manager includes built in Event Tracing for Windows (ETW) instrumentation, including instrumentation for device power (Dx) IRPs. To view this information in a manual mode, obtain and install the Windows Performance Toolkit (WPT) on the system under test.

Begin a user-mode XPerf trace by using the following commands:

1.  Open an Administrator Command Prompt.
2.  Browse to the **\\%ProgramFiles%\\Windows Kits\\8.0\\Windows Performance Toolkit\\** folder.
3.  Start Xperf: `xperf.exe -start power_session -on Microsoft-Windows-Kernel-Power`
4.  Transition the system to modern standby by using the power button.
5.  Wait 120 seconds.
6.  Transition the system out of modern standby using the power button.
7.  Wait 60 seconds.
8.  Run the following command to stop the event logging: `xperf.exe -stop power_session`
9.  Convert the binary trace file into .csv and human-readable format: `xperf.exe –i \user.etl > power.txt`
10. Open the power.txt file in a text editor and search for the hardware ID of the GNSS device. The hardware ID of the GNSS device can be determined from the **Details** tab of the device properties in **Device Manager** under *Device Instance Path*. In the example below, the device instance path of the GNSS device is *ACPI\\MST0731\\2&daba3ff&0*.
11. The D3 IRP for the GNSS device is indicated by an event of type Microsoft-Windows-Kernel-Power/IRP/Stop with the device instance path of the GNSS device and the last event value of 3 for the D3 state. The event output below from the power.txt file shows the start of the D3 IRP.

    `Microsoft-Windows-Kernel-Power/Irp/Start ,    7605393,        "Unknown" (   4),        256,   0, , , , , 0x868e2728, 1, 2, 0x85fb56e0, 25, "ACPI\MSFT0731\2&daba3ff&0", 3`

12. This event should be logged near the beginning of the power.txt output file. The parameter *0x868e2728* in the example above is a pointer to the D3 IRP structure. By finding the subsequent events with this same IRP pointer, a view of the D3 IRP flowing through the driver stack that comprises the GNSS device can be discovered. Note that the IRP pointer will be system and boot-lifetime specific.
13. `Microsoft-Windows-Kernel-Power/Irp/Start ,    7605393,        "Unknown" (   4),        256,   0, , , , , 0x868e2728, 1, 2, 0x85fb56e0, 25, "ACPI\ATML1000\2&daba3ff&0", 3`
14. `Microsoft-Windows-Kernel-Power/Driver/Start ,    7605416,        "Unknown" (   4),         20,   0, , , , , 0x868e2728, 0x85fb56e0, "\Driver\gpsdrv"`
15. `Microsoft-Windows-Kernel-Power/Driver/Stop ,    7605515,        "Unknown" (   4),         20,   0, , , , , 0x868e2728, 0x85fb56e0`
16. `Microsoft-Windows-Kernel-Power/Driver/Start ,    7608351,        "Unknown" (   4),         20,   0, , , , , 0x868e2728, 0x857ffb90, "\Driver\ACPI"`
17. `Microsoft-Windows-Kernel-Power/Driver/Stop ,    7608416,        "Unknown" (   4),         20,   0, , , , , 0x868e2728, 0x857ffb90`
18. `Microsoft-Windows-Kernel-Power/Driver/Start ,    7608424,        "Unknown" (   4),         20,   0, , , , , 0x868e2728, 0x85fb56e0, "\Driver\sensdrv"`

Validating the GNSS device is returning to D0 when the screen is turned on is a similar process. A Microsoft-Windows-Kernel-Power/IRP/Start event for the GNSS device will be logged with a 0 (D0) target state. The D0 IRP will flow through the driver(s) comprising the GNSS device stack in a similar manner to the D3 IRP.

## GNSS power management checklist


System integrators, GNSS radio vendors, and SoC vendors should use the following checklist to ensure that their system power management design is compatible with Windows 8 and above.

-   Integrate a GNSS device into the modern standby-capable platform in the following configuration preference order:
    1.  Integrated together with a MBB module (for systems equipped with MBB), connected over USB.
    2.  Integrated onto the SoC (for systems that have GNSS on the SoC).
    3.  Standalone outside the SoC connected to UART, I2C or another low-power bus.
-   Select a GNSS device that has a sleep (radio off) average power consumption of less than 1 mW, including any bus connection interfaces.
-   If the GNSS device has a sleep (radio off) average power consumption of greater than 1 mW, the system integrator and GNSS device vendor must support removing power completely from the GNSS device when there are no connected application clients or the radio is turned off by the user.
-   Ensure that the GNSS device vendor provides a location sensor driver that implements runtime power management based on the number of connected clients and the state of the GNSS radio.
-   Ensure that the GNSS device vendor provides a radio manager library that exposes the GNSS radio in the Windows Settings application.

    The location sensor driver must implement a private interface to communicate radio on/off state between the vendor-provided radio manager library and the vendor-provided location sensor driver.

-   If the GNSS is a standalone device outside of the SoC connected via UART, I2C or other low-power bus, the system integrator and GNSS device vendor must:
    1.  Document any GPIOs between the GNSS device and the SoC itself.
    2.  Expose any GPIOs for power management as part of a GPIO operation region in the ACPI namespace.
-   If the GNSS is a standalone device outside of the SoC connected via UART, I2C or other low-power bus and the average power consumption of the GNSS device in the sleep power mode is greater than 1 mW, the system integrator and GNSS device vendor must:
    1.  Provide an ACPI power resource and \_ON/\_OFF control methods to describe the GNSS power domain.
    2.  Provide the \_PR0 and \_PR3 methods under the GNSS device in the ACPI namespace that refer to the described ACPI power resource.
    3.  Ensure that the location sensor driver does a D3 transition and enables D3cold in the driver.
-   If the GNSS is part of a MBB module, the system integrator and GNSS device vendor must:
    1.  Expose the GNSS device as part of a USB composite device.
    2.  Provide a location sensor driver that communicates to the GNSS device directly through the USB bus.
    3.  Ensure that radio on/off and all power management of the GNSS device may be performed in-band over the USB bus. No GPIOs can be used to change GNSS radio or power state in this hardware configuration.
    4.  Ensure that the USB device describing the MBB module or the USB composite device describing both the MBB and GNSS radio enters the USB suspend state during modern standby.
    5.  The location sensor driver MUST enter the D3 (sleep) mode when all clients are disconnected or the radio has been turned off even if communicating to the device over the device services interface.
    6.  If the GNSS device is controlled over the mobile broadband device services interface (which is not recommended), the GNSS device must be described in the system ACPI namespace with no hardware resources. The GNSS device must be described as a child of the mobile broadband module in the ACPI namespace.
-   Test and validate that the GNSS device and the location sensor driver perform power management correctly. Please validate the following test cases at a minimum:
    -   Observe the location sensor driver transitions to D3 within 10 seconds of the screen turning off for modern standby.
    -   Observe the location sensor driver transitions to D3 within 10 seconds of the radio being turned off in the Windows Settings application.
    -   Observe the location sensor driver transition to D0 immediately after exiting modern standby and launching an application that uses the Location API.
-   Validate the power consumption of the GNSS device in the sleep (D3) state and ensure that it is less than 1 mW on average.

 

 






