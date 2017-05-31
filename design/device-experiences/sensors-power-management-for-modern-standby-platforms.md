---
title: Sensors power management for modern standby platforms
description: This article explains how to implement power management for sensor devices. In addition, power management of the optional sensor microcontroller (also called the sensor fusion hub or the sensor MCU) and aggregated sensor devices is discussed.
MS-HAID:
- 'cstandby.sensors\_\_power\_management\_for\_connected\_standby-capable\_platforms'
- 'p\_weg\_hardware.sensors\_power\_management\_for\_modern\_standby\_platforms'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: EF815AD1-39C5-400B-B02C-7D358A6E5194
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Sensors power management for modern standby platforms


A mobile PC typically incorporates sensor devices such as an ambient light sensor (ALS), 3-D accelerometer, 3-D gyrometer, or 3-D magnetometer. When a sensor device is not being used by the operating system or by an application, power-management software can switch the device to a low-power mode to reduce power consumption. In a PC that supports the modern standby power model, sensor devices are expected to switch to a low-power mode shortly after the PC enters modern standby and remain in this mode until the PC exits modern standby.

This article explains how to implement power management for sensor devices. In addition, power management of the optional sensor microcontroller (also called the sensor fusion hub or the sensor MCU) and aggregated sensor devices is discussed. For example, a compass sensor device can be implemented by aggregating an accelerometer, a gyrometer, and a magnetometer under the control of a sensor microcontroller. The microcontroller exposes these sensor devices to Windows as a single logical sensor device.

## Sensors and sensor microcontroller


Sensor hardware is critical to the modern mobile experience. Starting with Windows 8, a rich system infrastructure is available to expose and manage multiple sensor devices. This infrastructure simplifies the development of applications that incorporate sensor information and that support critical built-in Windows scenarios, such as screen auto-rotation and changing the display brightness based on ambient light. An aggregated sensor device can include a sensor microcontroller to seamlessly integrate raw data from discrete accelerometer, gyrometer, and magnetometer devices into a single sensor information stream.

During system runtime, individual sensors can be powered off when they're not in use. The requirements for using a particular sensor device are communicated to the device and its drivers through the Windows Sensor API. When a sensor device is not being used by the operating system or by any applications, the device can be powered down by the sensor driver or by the firmware that is running on the sensor microcontroller.

After the system display turns off and the hardware platform enters modern standby, all sensor devices and optional sensor microcontrollers that are not already in low-power states should enter their low-power, standby states within a few seconds so that the platform as a whole can enter a low-power state. However, sensor drivers do not directly monitor transitions to and from modern standby to determine when sensor devices should be powered on and off. Instead, the sensor driver should enable the device to receive power when the device is actively being used by one or more clients, which can be applications or operating system components. The driver should remove power from the device when no clients are using the device.

When a client requests event notifications from a sensor device, the sensor class extension calls the sensor driver's ISensorDriver::OnClientSubscribeToEvents callback method. When the client later cancels event notifications, the sensor class extension calls the driver's ISensorDriver::OnClientUnsubscribeFromEvents callback method. The driver uses these callbacks to keep track of the number of clients that are currently using the sensor. For more information, see About Sensor Driver Events.

After the computer enters modern standby and all sensor devices enter low-power states, the total power consumption of all system sensor hardware must be less than one milliwatt. The sensor devices and optional sensor microcontroller might enter a low-power standby state that is specific to the sensor hardware. Or, the hardware power rail to the sensor devices and the optional sensor microcontroller can be switched off under control of the sensor drivers and/or the system ACPI firmware.

Starting with Windows 8, support is provided for a limited set of sensor hardware connectivity options to the core silicon or System on a Chip (SoC) in a modern standby platform. The following sections detail the supported hardware and software configurations as well as their power-management behaviors both during modern standby and when the platform is actively being used.

## Power management modes


Windows expects each sensor device or the sensor microcontroller to have three device power modes—active, idle, and standby—in addition to an optional, zero-watt, power-removed mode. The following table describes the power modes for a sensor device and optional sensor microcontroller. The table distinguishes between an idle mode in which the sensor hardware is being used but is currently idle, and an idle mode in which the sensor hardware is not being used.

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
<th>Mode</th>
<th>Description</th>
<th>Average power consumption</th>
<th>Exit latency to active</th>
<th>Transition mechanism</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Active</p></td>
<td><p>The sensor device and/or sensor microcontroller is actively providing or processing environmental changes.</p></td>
<td><p>&lt; 100 milliwatts</p></td>
<td><p>N/A</p></td>
<td><p>N/A</p></td>
</tr>
<tr class="even">
<td><p>Idle (in use)</p></td>
<td><p>The sensor device and/or sensor microcontroller is being used by one or more applications and is waiting to provide the next set of sensor information to the main processor.</p></td>
<td><p>&lt; 50 milliwatts</p></td>
<td><p>Sensor-specific</p></td>
<td><p>Hardware autonomous</p></td>
</tr>
<tr class="odd">
<td><p>Idle (not in use)</p></td>
<td><p>The sensor device and/or sensor microcontroller is not being used by any application. Calibration data for the sensor or the sensor microcontroller is maintained.</p></td>
<td><p>&lt; 5 milliwatts</p></td>
<td><p>Sensor-specific</p></td>
<td><p>Human Interface Device (HID) commands or Sensor Framework messages describing current usage of sensor devices.</p></td>
</tr>
<tr class="even">
<td><p>Standby</p></td>
<td><p>The sensor device and/or sensor microcontroller is not being used by any application. Calibration data for the sensor or the sensor microcontroller is maintained. The sensor and/or sensor microcontroller does not take any further action until requested by software running on the main processor.</p></td>
<td><p>&lt; 1 milliwatt (for all system sensors)</p></td>
<td><p>&lt; 10 milliseconds</p></td>
<td><p>Multiple options:</p>
<ul>
<li>HIDI2C command SET_POWER(Sleep)</li>
<li>Third-party driver private message</li>
<li>GPIO line from SoC to sensor hardware</li>
</ul></td>
</tr>
<tr class="odd">
<td><p>Power-removed</p></td>
<td><p>Power is removed from the sensor device and/or sensor microcontroller and all hardware context is lost.</p></td>
<td><p>0 milliwatts</p></td>
<td><p>&lt; 100 milliseconds</p></td>
<td><p>External entity removes power or applies power via ACPI firmware in response to D3 power IRP.</p></td>
</tr>
</tbody>
</table>

 

**Note**  In the preceding table, the term standby refers to a device power mode that is distinct from modern standby, which is a platform-wide power state.

 

## Software power-management mechanisms


Run-time power management for sensor devices and the sensor microcontroller is predominately driven by whether they are being used. As a general rule, the sensor driver and hardware are expected to put a sensor in the idle power mode when it is not being used by the operating system or an application. The [Windows Sensor Platform](http://msdn.microsoft.com/library/windows/hardware/gg463473.aspx) provides information about the number of application or operating system clients connected to a given sensor, as well as requirements for the sensor's duty cycle or data rate. The sensor driver and/or hardware uses this information to seamlessly transition the sensor device to the idle power mode during times when the system is running and the display is turned on.

After the system display is powered off and the platform enters modern standby, Windows expects all sensors and sensor microcontrollers to enter a standby or power-removed mode.

The choice of a software power-management mechanism to use for sensor devices and the optional sensor microcontroller depends on how the sensor hardware is exposed to Windows by the device driver, and how the sensor hardware is physically connected to the SoC or core silicon. Windows supports two methods of exposing and connecting sensor devices. One method uses the built-in sensor HID class driver over an I2C connection, and the other requires a third-party driver that implements the ISensorDriver interface and calls the methods in the ISensorClassExtension interface. When the sensor hardware uses the sensor HID class driver over an I2C connection, the built-in HIDI2C driver transfers HID information over the I2C connection.

The two options for connecting to a sensor or sensor microcontroller are compared in the following table.

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
<th>Connection option</th>
<th>Bus connection</th>
<th>Sensor driver required</th>
<th>Driver provider</th>
<th>Comments</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>HIDI2C</p></td>
<td><p>Sensor hardware connects directly to the SoC or core silicon over I2C.</p></td>
<td><p>Sensor HID class driver + HID-over-I2C class driver</p></td>
<td><p>Microsoft. Inbox component starting with Windows 8.</p></td>
<td><p>Easiest to implement in terms of connectivity and software; does not require third-party software for the sensor device.</p></td>
</tr>
<tr class="even">
<td><p>Third-party sensor driver</p></td>
<td><p>Sensor hardware connects directly to the SoC or core silicon over I2C or UART.</p></td>
<td><p>Third-party driver that implements <strong>ISensorDriver</strong></p></td>
<td><p>Sensor device vendor.</p></td>
<td><p>The sensor device vendor must provide a User-Mode Driver Framework (UMDF) driver that implements <strong>ISensorDriver</strong> interface. The UMDF driver communicates over I2C or UART.</p></td>
</tr>
</tbody>
</table>

 

For the HIDI2C option, the optional sensor microcontroller is physically connected to the SoC or core silicon through an I2C bus. The microcontroller exposes multiple top-level HID collections, one for each logical sensor device. For example, a compass sensor can be exposed through HID as a logical sensor device that is an aggregation of the accelerometer, gyrometer, and magnetometer sensors behind the sensor microcontroller.

The other option requires a third-party sensor driver. The sensor microcontroller is physically connected to the core silicon through an I2C bus or UART. The sensor device vendor supplies a device driver that communicates with the sensor device over this connection, and that implements the **ISensorDriver** interface. This interface can be implemented multiple times—one time for each sensor that is behind the sensor microcontroller.

The selection of one of the two options for connecting to sensor hardware dictates the software power-management mechanisms that are needed to transition the sensor hardware to the standby or power-removed mode.

## HIDI2C


The Windows HIDI2C stack is similar to that of touch controllers and pen digitizers in that it supports the following two software power-management mechanisms:

-   An in-band HID SET\_POWER(Sleep) command.
-   A run-time transition to the D3 state for the HID sensor device stack.

For any sensor device that is exposed to Windows through the HIDI2C protocol, Windows sends the SET\_POWER(Sleep) command to the device after the display turns off and the platform enters modern standby. The SET\_POWER(Sleep) command can transition the device to the standby power mode. When the platform exits modern standby and the display is turned on again, Windows sends the SET\_POWER(On) command to the device.

For any sensor device that is exposed to Windows through the HIDI2C protocol, Windows sends a D3 IRP to the driver stack for the device immediately after the SET\_POWER(Sleep) command is sent. A D3 IRP is an **IRP\_MJ\_POWER** request that tells the device to enter the D3 device power state. As part of the transition to D3, the system ACPI firmware might run control methods to switch the device into the standby or power-removed mode. When the platform exits modern standby and the display is turned on, Windows sends a D0 IRP to the driver stack for the device. A D0 IRP is an IRP\_MJ\_POWER request that tells the device to enter the D0 device power state. If necessary, the system ACPI firmware can run control methods to switch the device back to the idle (not-in-use) mode.

## Third-party sensor driver


If the sensor hardware is managed by a third-party sensor driver that implements the ISensorDriver interface, the third-party sensor driver is responsible for creating and coordinating all power management. The requirements of the third-party sensor driver for power management are a function of the standby power consumption of the sensor hardware.

If the sensor hardware has a standby power consumption of less than one milliwatt for all controlled sensor hardware, the sensor driver should automatically switch the device to the standby mode when the sensors (or all sensors on the microcontroller) are no longer in use. Shortly after entry to modern standby, Windows automatically stops the use of all sensors by disabling the operating system's use of sensors (for example, ambient light and rotation) and by suspending applications. The sensor driver should aggregate the state of all controlled sensor hardware and switch this hardware to the standby device power mode when all sensors are no longer in use.

The mechanism to switch the sensor device to the standby mode can be designed to use in-band communication through the bus that connects the device to the SoC. For example, a proprietary standby command can be sent over the bus to the sensor hardware. Or, the sensor hardware might be connected to a GPIO line that switches the device into and out of standby mode. We recommend that when a GPIO line is used to switch the device to standby mode, the sensor driver should transition the driver stack to D3 and allow the ACPI control methods for the device (for example, \_PS3) to set the GPIO line to the state required to place the hardware in standby mode. This scheme allows the sensor driver to be written in a platform-agnostic manner—the specific GPIO line, timing requirements, and other platform-specific information are encoded in the ACPI firmware supplied by the system integrator and not in the device-specific driver. As a best practice, put device-specific code in the driver and put platform-specific code in the ACPI firmware to enable low-cost re-use of driver code across multiple platforms.

Third-party sensor drivers should initiate a transition to D3 when the sensor device is ready to enter the standby or power-removed mode, even if the device is capable of using an in-band communications mechanism to switch to a power mode that consumes less than a milliwatt. The reason for this requirement is that many bus drivers in Windows track the device power state of their endpoint devices and power down only when all endpoint devices have powered down. For some SoC designs and connection buses (notably Universal Serial Bus (USB)), all endpoint devices and the host controller must be in D3 for the SoC to enter the lowest power state during modern standby. Inability to enter the lowest power state can easily prevent a system from meeting modern standby requirements for battery life.

Third-party sensor drivers are expected to be built by using the Windows Driver Frameworks (WDF) and be based on the [SpbAccelerometer](http://go.microsoft.com/fwlink/p/?LinkID=256189) sample driver. The driver must use a power-managed queue and configure the D3 idle state through a call to the **IWDFDevice3::AssignS0IdleSettingsEx** method. The driver should use the **IWDFDevice2::StopIdle** and **IWDFDevice2::ResumeIdle** methods to indicate to WDF when the device is idle or active. The driver should also enable D3cold by setting the **ExcludeD3Cold** member of the **WDF\_DEVICE\_POWER\_POLICY\_IDLE\_SETTINGS** structure to **WdfFalse**. Enabling D3cold allows the platform to remove power from the sensor device after it becomes idle and enters the D3 state.

**Note**  The driver must save all sensor device context before the device enters D3, and must restore all sensor device context after the device enters D0.
If the sensor hardware has a standby power consumption of greater than one milliwatt, the sensor driver must perform a D3 transition and allow ACPI control methods to remove power from the sensor device. The sensor driver must save all required sensor device state so that power can be removed from the device during D3. The sensor hardware vendor should collaborate closely with the system integrator to ensure that the sensor hardware and driver performs the D3 transition reliably and quickly.

 

When the platform exits modern standby, the sensor driver must transition the sensor hardware back to the idle (not-in-use) mode. As system services resume, Windows will request the use of sensors, such as rotation and ambient light, that are needed to perform system functions. As applications resume, they might request sensor information. If the sensor hardware requires an in-band message to return the device to the idle mode, the device driver should send this message as soon as the first request for sensor information is sent. If the sensor hardware requires a GPIO line to signal the device to return to the idle state, the driver must use this GPIO line to perform a transition to D0 as soon as the first request for sensor information is provided. In this case, ACPI control methods (for example, \_PS0) should toggle the GPIO line as required to initiate the transition. Finally, if the sensor hardware previously required a transition to the power-removed mode because the power consumption in standby mode exceeds one milliwatt, the sensor driver must perform a transition to D0 and allow ACPI control methods to restore power to the device.

## Supported hardware power configurations


The hardware power-management configuration to use for a sensor device depends on the sensor hardware's power consumption in standby mode and whether an optional sensor microcontroller manages the device.

## <a href="" id="standalone-sensor--standby-power---one-milliwatt-"></a>Standalone sensor (standby power &lt; one milliwatt)


If the power consumption of a sensor device in the standby power mode does not exceed one milliwatt, the platform designer is not required to attach the sensor hardware to a power rail that can be turned on and off by ACPI control methods. One of the following mechanisms is used to switch the sensor to the standby power mode:

-   A HID SET\_POWER(Sleep) command.
-   A GPIO line from the SoC.
-   A proprietary command sent to the sensor hardware by the third-party sensor driver.

If the sensor requires a GPIO line from the SoC to initiate transitions to and from standby mode, the platform firmware must provide both a \_PS3 object and a \_PS0 object in the ACPI namespace under the sensor hardware device. The ACPI firmware must also include a GPIO operation region that describes the GPIO line from the SoC to the sensor hardware. The \_PS3 control method toggles the GPIO line to switch the device to the standby mode, and the \_PS0 control method toggles the GPIO line to switch the sensor hardware to the idle mode.

The following block diagram shows the power-management options for a standalone sensor that consumes less than one milliwatt in standby power mode.

One option is to use the Windows HIDI2C stack, as shown on the left side of the preceding diagram. In this case, the sensor's transition to standby power mode can be initiated either by an in-band HID SET\_POWER(Sleep) command or by a D3 IRP that the ACPI driver handles by executing the \_PS3 control method for the sensor.

The other option is to use a third-party sensor driver, as shown on the right side of the preceding diagram. The third-party sensor driver can initiate the transition to standby power mode either by using an proprietary in-band command or by sending a D3 IRP that the ACPI driver handles by executing the \_PS3 control method for the sensor.

## <a href="" id="sensors-aggregated-by-a-sensor-microcontroller--total-standby-power---one-milliwatt-"></a>Sensors aggregated by a sensor microcontroller (total standby power &lt; one milliwatt)


If the platform includes a sensor microcontroller, the microcontroller chip either might contain one or more integrated sensor devices or might be connected to one or more external sensor devices. In either case, these sensor devices are, from the software point of view, hidden behind the microcontroller and invisible to Windows. If a sensor microcontroller and its aggregated sensor devices together consume less than one milliwatt when the microcontroller and sensor hardware are in the standby power mode, the platform designer is not required to attach the microcontroller or sensor hardware to a power rail that can be turned on and off by ACPI control methods. The sensor microcontroller uses one of the following mechanisms to transition itself and all the sensors that it manages to and from standby mode:

-   An HIDI2C SET\_POWER (or similar) command sent over the communications bus.
-   A GPIO line from the SoC.

The platform designer can choose either mechanism regardless of whether the sensor devices are integrated or external to the microcontroller chip.

One option is to use the Windows HIDI2C stack, as shown on the left side of the preceding diagram. In this case, the sensor's transition to standby power mode can be initiated either by an in-band HID SET\_POWER(Sleep) command or by a D3 IRP that the ACPI driver handles by executing the \_PS3 control method for the sensor.

The other option is to use a third-party sensor driver, as shown on the right side of the preceding diagram. The third-party sensor driver can initiate the transition to standby power mode either by using an proprietary in-band command or by sending a D3 IRP that the ACPI driver handles by executing the \_PS3 control method for the sensor.

## <a href="" id="sensors-or-sensor-microcontroller--standby-power---one-milliwatt-"></a>Sensors or sensor microcontroller (standby power &gt; one milliwatt)


If the platform includes sensor hardware and/or a sensor microcontroller that together consume more than one milliwatt in standby power mode, the sensor hardware and microcontroller must be transitioned to the power-removed mode when the system is in modern standby. In this configuration, the sensor, the optional sensor microcontroller, and any sensors behind the microcontroller should be placed on a single power rail that is switched on and off under the control of a GPIO line from the SoC.

This configuration requires the platform designer to place all sensor hardware on a switchable power rail, controlled by a GPIO line from the SoC. If multiple input voltages are required for the sensor hardware, multiple switches, each controlled by the same GPIO line, can be used. In addition to the switchable power rail, the platform ACPI firmware must define a Power Resource in the namespace. This Power Resource describes the sensor hardware, and includes the \_ON and \_OFF methods that are responsible for using a GPIO operation region to toggle the GPIO line from the SoC.

The platform firmware must include a reference to the Power Resource under each sensor device in the ACPI namespace on the switchable power rail, including \_PR0 and \_PR3 objects.

The following block diagram shows the power-management options for sensor hardware and/or a sensor microcontroller that together consume more than one milliwatt in standby power mode. The two options are to use the Windows HIDI2C stack, as shown on the left side of the diagram, or to use a third-party sensor driver, as shown on the right side.

In the configuration that uses the built-in HIDI2C driver stack, as shown on the left side of the preceding diagram, the HIDI2C driver initiates a D3 transition after the display turns off and the platform enters modern standby. When the D3 IRP flows through the ACPI driver, the \_PR3 object will be evaluated and Windows will turn off the specified Power Resource by running the \_OFF method. If multiple sensors share the Power Resource, Windows automatically reference-counts all of the sensors and runs the \_OFF method only after all sensors have entered D3.

If the sensor hardware uses a third-party sensor driver, as shown on the right side of the preceding diagram, the control flow is the same as before, except that the sensor driver is responsible for initiating the transition to D3.

After the platform resumes from modern standby and an application or the operating system requests use of the sensor, the driver transitions to D0. A D0 IRP flows through the ACPI driver and the \_PR0 object is evaluated so that the ACPI driver executes the \_ON method for the associated Power Resource. The \_ON method toggles the GPIO line to turn on the switchable power rail. If the system uses a third-party sensor driver, the driver must request a D0 IRP and initiate a transition to D0 immediately after sensor data is requested by the operating system or an application.

## Wake concerns


There are no wake concerns for sensors or the optional sensor microcontroller. Sensor devices are expected to be in the standby or power-removed mode during modern standby and are not expected to wake the SoC while the platform is in modern standby.

## Testing and validation


It is critical for the system designer to verify that the sensor hardware enters the standby or power-removed mode when the display is powered off for modern standby. The method used to test and validate device power management depends on how the sensor device is connected.

## HIDI2C-connected sensor


If the system uses the Windows HIDI2C stack, the system integrator should contact the sensor driver vendor for information about how to best verify that the driver correctly performs power management. Sensor driver vendors are encouraged to use Event Tracing for Windows (ETW) tracing for all power-management decisions in their device driver, and to provide sample documentation to system integrators to describe how to verify correct power-management operation using the ETW events and the Windows Performance Toolkit (WPT).

## Third-party sensor driver


If the system uses a third-party sensor driver, the system integrator should contact the sensor driver vendor for information about how to best verify that the driver correctly performs power management. Sensor driver vendors are encouraged to use Event Tracing for Windows (ETW) tracing for all power-management decisions in their device driver, and to provide sample documentation to system integrators to describe how to verify correct power-management operation using the ETW events and the Windows Performance Toolkit (WPT).

If the driver initiates a transition to D3 when all of its sensor devices are no longer being used, you can follow the instructions in the following list to verify that this transition occurs as expected, and that a sensor device returns to D0 when an application or the operating system needs to use the device again.

The software-focused method uses Windows instrumentation to verify that the D3 IRP passes through the device driver stack for the sensor device. The Windows power manager has built-in ETW instrumentation, which includes instrumentation for detecting Dx IRPs (device power requests). To view this information in a manual mode, download the Windows Performance Toolkit and install it on the system under test.

After installing the Windows Performance Toolkit, follow these instructions to start a user-mode XPerf trace:

1.  Open a Command Prompt window as Administrator.
2.  Browse to the **\\%ProgramFiles%\\Windows Kits\\8.0\\Windows Performance Toolkit\\** folder.
3.  To start Xperf, run the following command: `xperf.exe -start power_session -on Microsoft-Windows-Kernel-Power`
4.  Transition the system to modern standby by pressing the power button.
5.  Wait 30 seconds.
6.  Transition the system out of modern standby by pressing the power button.
7.  Run the following command to stop event logging: `xperf.exe -stop power_session`
8.  Convert the binary trace file to .csv and human-readable format: `xperf.exe –i \user.etl > power.txt`
9.  Open the Power.txt file in a text editor and search for the hardware ID of the sensor device. You can look up the hardware ID of the sensor device in the **Details** tab of the device properties in Device Manager under **Device Instance Path**. In the following example the device instance path of the sensor device is ACPI\\MST0731\\2&daba3ff&0.
10. The initiation of the D3 IRP for the sensor device is indicated by an event of type Microsoft-Windows-Kernel-Power/IRP/Stop that has the device instance path of the sensor device and a last event value of 3, which indicates that the target state is D3. The following output event from the Power.txt file shows the start of the D3 IRP. The last two parameter values for this event (shown at the far right) indicate the device instance path and target state.

    `Microsoft-Windows-Kernel-Power/Irp/Start, 7605393, "Unknown" (4), 256, 0,,,,, 0x868e2728, 1, 2, 0x85fb56e0, 25, "ACPI\MSFT0731\2&daba3ff&0", 3`

11. This event should be logged near the start of the Power.txt output file. The parameter value `0x868e2728` in the preceding output event is a pointer to the IRP structure for the D3 IRP. By searching for subsequent events in the trace file that have this same IRP pointer, you can follow the progress of the D3 IRP as it flows through the driver stack for the sensor device.
12. `Microsoft-Windows-Kernel-Power/Irp/Start,    7605393, "Unknown" (4),256, 0,,,,, 0x868e2728, 1, 2, 0x85fb56e0, 25, "ACPI\ATML1000\2&daba3ff&0", 3`
13. `Microsoft-Windows-Kernel-Power/Driver/Start, 7605416, "Unknown" (4), 20, 0,,,,, 0x868e2728, 0x85fb56e0, "\Driver\sensdrv"`
14. `Microsoft-Windows-Kernel-Power/Driver/Stop,  7605515, "Unknown" (4), 20, 0,,,,, 0x868e2728, 0x85fb56e0`
15. `Microsoft-Windows-Kernel-Power/Driver/Start, 7605522, "Unknown" (4), 20, 0,,,,, 0x868e2728, 0x85fab6a0, "\Driver\i2cdrv"`
16. `Microsoft-Windows-Kernel-Power/Driver/Stop,  7608342, "Unknown" (4), 20, 0,,,,, 0x868e2728, 0x85fab6a0`
17. `Microsoft-Windows-Kernel-Power/Driver/Start, 7608351, "Unknown" (4), 20, 0,,,,, 0x868e2728, 0x857ffb90, "\Driver\ACPI"`
18. `Microsoft-Windows-Kernel-Power/Driver/Stop,  7608416, "Unknown" (4), 20, 0,,,,, 0x868e2728, 0x857ffb90`
19. `Microsoft-Windows-Kernel-Power/Driver/Start, 7608424, "Unknown" (4), 20, 0,,,,, 0x868e2728, 0x85fb56e0, "\Driver\sensdrv"`

When the Windows ACPI driver, Acpi.sys, processes the D3 IRP, Acpi.sys runs the corresponding \_PR3 control method. The system firmware designer provides this control method to indicate which Power Resource must be turned off for the sensor device to enter the D3 state. Acpi.sys also executes the \_OFF control method under the Power Resource.

You can use a similar process to verify that the sensor device returns to D0 when the platform enters modern standby and the display turns on. A Microsoft-Windows-Kernel-Power/IRP/Start event for the sensor device will be logged with a target state of 0 (indicating D0) immediately after the power button is pressed to wake the system, and the operating system or a resumed application requests sensor data.

## Sensor and sensor microcontroller power-management checklist


System integrators and sensor device vendors should use the following checklist to ensure that their system power-management design is compatible with Windows 8 and higher.

-   Select sensor hardware that is compatible with the built-in HIDI2C driver and HIDSensor driver stack.
-   Select sensor hardware that has a standby power consumption of less than one milliwatt.
-   Verify that the sensor hardware and third-party driver (if required) support run-time idle power management when the display is turned on:
    -   Sensors should be powered down and enter D3 automatically when they are not being used by an application or the operating system.
    -   Sensors should power on and enter D0 automatically when sensor data is requested by an application or the operating system.
    -   The third-party sensor driver should be implemented as a WDF driver and can be based on the SpbAccelerometer sample driver.
    -   Polling for sensor information should be limited and enabled at the lowest power consumption level possible. For example, polling an analog sensor should happen behind a microcontroller or other low-power control hardware, which can interrupt the SoC when new sensor data exceeds some threshold detection value. Avoid polling the sensor in a driver that periodically runs on the SoC, which can significantly increase overall system power consumption.
-   If the sensor hardware uses a third-party driver:
    -   The system integrator should communicate with the sensor device vendor to understand how to implement power management for the sensor hardware.
    -   If the sensor hardware consumes more than one milliwatt in standby power mode, place the sensor hardware on a standalone power rail that is controlled by a GPIO line from the SoC. Provide references to the required ACPI Power Resource, \_ON/\_OFF control methods, and Power Resource under the sensor device in the ACPI namespace (as described below).
    -   If the sensor hardware uses a GPIO line from the SoC to switch the device to standby power mode, make sure that the system ACPI firmware includes the proper \_PS3 and \_PS0 control methods (as described below).
-   If the sensor hardware includes a sensor microcontroller that has sensor devices connected behind it, the sensor microcontroller must have a way to power down the sensor devices. The devices can be powered down by using either in-band communication over the bus that connects the microcontroller to the devices, or a GPIO line from the microcontroller to the devices.
-   If the sensor hardware requires a GPIO line from the SoC to switch the device to the standby power mode:
    -   Make sure the GPIO line from the SoC meets the level and trigger requirements set by the sensor hardware vendor.
    -   In the ACPI namespace, describe the SoC GPIO pin as part of a GPIO operation region.
    -   Provide a \_PS3 control method under the sensor device in the ACPI namespace to toggle the signal on the GPIO line as needed to switch the sensor hardware to the standby power mode.
    -   Provide a \_PS0 control method under the sensor device in the ACPI namespace to toggle the signal on the GPIO line as needed to switch the sensor hardware to the idle or active mode after the device switches to D0.
-   If the sensor hardware consumes more than one milliwatt in the standby power mode:
    -   Place all sensor hardware on a power rail that can be switched on and off by a GPIO line from the SoC. Or, if the platform contains multiple sensors that have different supply voltage requirements, provide separate rails that can be independently switched.
    -   Describe the switchable power rail as a Power Resource in the ACPI namespace.
    -   Under this Power Resource, provide the \_ON and \_OFF control methods that toggle the power rail on and off by using a GPIO line that is described as part of a GPIO operation region.
    -   In the ACPI namespace, provide \_PR3 and \_PR0 objects that designate the Power Resource for the sensor hardware.
    -   Make sure that the \_ON and \_OFF methods incorporate any de-bounce or timing requirements of the sensor hardware.
-   Test and validate the run-time power management of the sensor devices in the platform. Work closely with the sensor hardware vendor to validate run-time power management when the system display is on.
-   Test and verify that the sensor hardware enters the standby or power-removed mode when the platform enters modern standby.
    -   If the sensor hardware uses the HIDI2C + HID sensor driver stacks included with Windows, see Testing and validation for details.
    -   If the sensor hardware uses a third-party driver, contact the sensor driver vendor for the recommended test methodology.
    -   If the sensor driver performs a transition to D3 as part of its entry to the standby or power-removed mode, use the Windows Performance Toolkit as described in Testing and validation. Verify that the sensor hardware enters D3 when the platform enters modern standby, and that the sensor hardware enters D0 after the system exits modern standby and sensor information is requested again.
-   Measure the power consumption of the sensor hardware in the standby or power-removed mode.
-   Initiate multiple transitions into and out of modern standby, and then stress-test the operation of the sensor devices and the applications that use sensor information when the display is turned on.

 

 






