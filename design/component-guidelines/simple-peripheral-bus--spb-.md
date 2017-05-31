---
title: Simple Peripheral Bus (SPB)
description: Simple Peripheral Bus (SPB)
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: C35E376C-DB22-459F-BCB0-C1C2BB5988E5
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Simple Peripheral Bus (SPB)


This topic covers recommendations for Simple Peripheral Bus in Windows 10.Windows includes support for low-power, simple buses, such as Inter Integrated Circuit (I²C) and (I²C) and Simple Peripheral Interface (SPI), using framework extensions of the Kernel Mode Driver Framework (KMDF) architecture. Controller drivers are not provided in-box. Chipset vendors, OEMs, or IHVs must develop a controller driver implemented in KMDF. The architecture provides flexible device configuration topologies supporting simultaneous use of buses for control and data transactions, as well as GPIO for signaling and interrupts. The complete device definition is defined through Advanced Configuration and Power Interface (ACPI).

In Windows, buses are supported through KMDF controller drivers. With the aid of the KMDF platform, the controller driver is used predominantly to define the hardware-specific interfaces necessary to enable controller function.

The Windows infrastructure supports devices that share buses, buses that are multiplexed on the same line, and device configuration through ACPI. Windows uses ACPI as the primary means for device identification, configuration, and control.

The following table summarizes the support for the Simple Peripheral Bus.

<table>
<thead valign="bottom">
<tr class="header">
<th>Bus</th>
<th>Inbox Support</th>
<th>Framework extension provided</th>
<th>Third party allowed</th>
<th>Additional support details</th>
</tr>
</thead>
<tbody valign="top">
<tr class="odd">
<td>I²C</td>
<td>No</td>
<td>Yes</td>
<td>Yes, using SPB Framework extension</td>
<td><p>Master only</p>
<p>&quot;General Call&quot; is not supported</p>
<p>Direct Memory Access (DMA) supported</p></td>
</tr>
<tr class="even">
<td>SPI</td>
<td>No</td>
<td>Yes</td>
<td>Yes, using SPB Framework extension</td>
<td><p>Master only, &quot;General Call&quot; is not supported</p>
<p>Full duplex supported</p>
<p>DMA supported</p></td>
</tr>
<tr class="odd">
<td>MIPI-HSI</td>
<td>No</td>
<td>No</td>
<td>Yes, using Windows Driver Foundation (WDF)</td>
<td></td>
</tr>
<tr class="even">
<td>MIPI-SLIMbus</td>
<td>No</td>
<td>No</td>
<td>Yes, using WDF</td>
<td></td>
</tr>
<tr class="odd">
<td>MIPI-CSI</td>
<td>No</td>
<td>No</td>
<td>Yes, using WDF</td>
<td></td>
</tr>
<tr class="even">
<td>UART</td>
<td>No</td>
<td>Yes</td>
<td>Yes, using Serial Framework extension (SerCx2)</td>
<td><p>DMA supported</p>
<p>Custom transfer modes supported with SerCx2</p></td>
</tr>
</tbody>
</table>

 

## Design considerations for SPB


The following are some generic considerations for SPB:

-   SPB is not a Plug and Play bus. Peripheral devices typically have fixed connections to an SPB and cannot be removed. System manufacturers must ensure accurate information in ACPI to enumerate the SPB-connected peripheral devices for the Plug and Play manager, and specifies the hardware resources that are dedicated to each device.
-   There is no in-band interrupt support for SPB. Most peripherals support device signaling through a separate interrupt (often GPIO based) mechanism, and accurately mapped in ACPI.
-   Windows provides support for the SPB Class Extension (spbcx.sys) in Windows 8 and beyond. SoC partners are responsible for developing and redistributing their appropriate SPB Controller driver.
-   Peripheral drivers for SPB devices are generally provided by SPB Device partners. Microsoft provides one class driver for SPB devices for HID over I²C (hidi2c.sys).
-   Device classes may provide HLK requirements or WEG guidance around the following topics related to I²C:

    -   Sharing I²C controller with other devices
    -   Preferred I²C signaling speed
    -   Power management and wake scenarios over I²C and GPIO.
-   Inter Integrated Circuit (I²C): I²C is the primary bus that is validated as part of SPB and is highly recommended on SoC systems.

    Microsoft provides Windows Hardware Compatibility Program [requirements for I²C](https://msdn.microsoft.com/library/windows/hardware/dn932557.aspx). Use the [Windows Hardware Lab Kit (HLK)](https://msdn.microsoft.com/library/windows/hardware/dn930814.aspx) to test devices against those requirements.

-   Simple Peripheral Interface (SPI): Support for SPI is optional and up to the SoC partner. The Windows Hardware Compatibility Program does not contain any requirements specific to SPI bus.

## Support for SPB across systems


Microsoft supports SPB on ARM systems and x86/x64 platforms (running in S3 configurations). Microsoft supports SPB on platforms running in both Connected Standby (CS) and S3 configurations.

Please contact your platform provider for drivers and support.

There are a number of device scenarios that leverage SPB for connectivity. I²C is available on CS and S3 traditional power model. Modern SoCs with on-SoC sensor low power cores can implement non-I²C solutions as needed.

Devices on removable docks/ports should also follow the guidance around docking scenarios, also included in the WEG. Some of those devices may make more sense over buses like USB rather than I²C.

## SPB framework extension


The SPB framework extension library extends the Windows Driver Framework to support SPB drivers. The SPB framework simplifies development of an SPB controller driver and improves the compatibility between peripheral drivers and the controller driver by providing common implementation of the "top-half" of the driver that processes I/O requests (as compared to the "bottom-half", which is driven by the top-half and controls the hardware). The SPB Framework Extension is a KMDF extension library. It handles the up-front processing of SPB request and the sequence in which they are handed to the controller driver. The SPB framework extension is designed to support I²C and SPI buses, and may be appropriate for other buses with similar semantics.

## Serial Framework extension


The serial framework extension library extends the Windows driver framework to support serial controller drivers. Similarly to the SPB framework, the serial framework simplifies development of a serial controller driver and improves the compatibility between peripheral drivers and the controller driver by providing common implementation of the "top-half" of the driver that processes I/O requests. The serial framework extension is a KMDF extension library. It handles the up-front processing of the calls to the serial APIs and the sequence in which they are handed to the controller driver. The serial framework extension is designed to support the modern UART controllers and simplify controller driver implementation and diagnosability.

## <a href="" id="i2c-and-uart-hlk-requirements"></a>I²C and UART HLK requirements


There are Hardware Compatibility Program requirements for [I²C](https://msdn.microsoft.com/library/windows/hardware/dn932557.aspx) and [UART](https://msdn.microsoft.com/library/windows/hardware/dn932560.aspx) controllers. Requirements for SPI are being considered for the future as well. The logo requirements are primarily intended for SoC silicon vendors for the bus interface hardware and the associated controller drivers. OEMs and ODMs are not required to revalidate the hardware or controller driver but are welcome to run the tests if desired. Special set-up steps are required to validate these requirements. The setup includes the following:

-   An open system with accessible I²C /UART pins/ports
-   Modifications in ACPI to expose the I²C/ UART test device to software
-   A specific test device (WITT) attached to the system under validation

For additional set-up information, please refer to the [Hardware Lab Kit (HLK) documentation](https://msdn.microsoft.com/library/windows/hardware/dn930814.aspx).

## Peripheral drivers


Peripherals are enumerated by ACPI and are generally static. Peripheral function drivers determine their appropriate bus resources by interacting with the framework extensions. Peripherals and controllers are not hierarchical, and peripherals may use several SPB, GPIO, Serial, and other high speed buses. Peripheral drivers that access embedded devices, such as sensors, input devices, modems, and radios, may be written in kernel mode or user mode. These drivers may be portable across different ODM or OEM board configurations as long as ACPI is updated appropriately.

## Firmware


Controller ACPI settings and bus parameters are vendor-specific and dependent on the particular controller. The following table summarizes the ACPI settings for the controller and the peripheral bus.

<table>
<thead valign="bottom">
<tr class="header">
<th>Bus</th>
<th>Controller ACPI settings</th>
<th>Peripheral ACPI settings</th>
</tr>
</thead>
<tbody valign="top">
<tr class="odd">
<td>I²C</td>
<td><p>Controller addresses</p>
<p>Pin configuration</p></td>
<td><p>Bus address</p>
<p>Clock rate</p>
<p>Slave mode</p>
<p>Addressing mode</p></td>
</tr>
<tr class="even">
<td>SPI</td>
<td><p>Controller addresses</p>
<p>Pin configuration</p></td>
<td><p>Chip select line</p>
<p>Clock rate</p>
<p>Clock polarity</p>
<p>Clock phase</p>
<p>Wire mode</p>
<p>Device selection</p>
<p>Device selection polarity</p>
<p>Slave mode</p></td>
</tr>
<tr class="odd">
<td>UART</td>
<td><p>Controller address / pin</p>
<p>Configure initial baud rate</p></td>
<td><p>Initial baud rate</p>
<p>Parity</p>
<p>Start bit and stop bit length</p>
<p>Flow control method(Hardware/Software/None)</p>
<p>Lines in use</p>
<p>Receive buffer size</p>
<p>Transmit buffer size</p>
<p>Endian-ness</p></td>
</tr>
</tbody>
</table>

 

For an ACPI example, see [How to Get the Connection Settings for a Device](https://msdn.microsoft.com/library/windows/hardware/jj938061.aspx). For more information about how to integrate devices on low power buses, see [Accessing GPIO, I2C, and UART Devices](https://channel9.msdn.com/Events/WinHEC/2015/DDF300).

## Tools and technical reference


| Resource Title                                             | Content type | Description                                                                                                                                                                                         | Link                                                                     |
|------------------------------------------------------------|--------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------|
| Using the Windows Driver Framework to build better drivers | Video        | Discusses how the WDF can improve driver reliability, what’s new in the WDF, and how to better realize power-savings and deploy drivers on multiple versions of Windows.                            | [Channel 9](http://channel9.msdn.com/events/BUILD/BUILD2011/HW-328T)     |
| Understanding Low-Power Buses                              | Video        | Demonstrates how to integrate a device on the new buses and create a driver. You will learn how to write ACPI to enumerate your peripheral and get started writing and testing a peripheral driver. | [Channel 9](http://channel9.msdn.com/events/BUILD/BUILD2011/HW-251T)     |
| Kernel-Mode Driver Framework Design Guide                  | Article      | Introduces Kernel-Mode Driver Framework (KMDF).                                                                                                                                                     | [MSDN](http://msdn.microsoft.com/library/windows/hardware/ff544283.aspx) |
| UMDF 1.x Design Guide                                      | Article      | Introduces User-Mode Driver Framework (UMDF).                                                                                                                                                       | [MSDN](http://go.microsoft.com/fwlink/?LinkId=227355)                    |
| Windows Hardware Compatibility Program                     | Article      | Provides information on the Windows Certification Program.                                                                                                                                          | [MSDN](../compatibility/index.md)                                        |