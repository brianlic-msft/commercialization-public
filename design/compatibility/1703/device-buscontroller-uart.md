---
title: Device.BusController.UART
Description: 'Requirements only for silicon vendors. UART controller drivers are recommended to use SerCXV2.'
ms.assetid: 
MSHAttr: 
author: beneluxboy
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

<!--
# Device.BusController.UART
 - [Device.BusController.UART](#device.buscontroller.uart)
-->

<a name="device.buscontroller.uart"></a>
## Device.BusController.UART

The requirements apply only to silicon vendors. UART controller drivers are recommended to use SerCXV2.

### Device.BusController.UART.Cancellation

*UART controller and controller drivers must support the cancellation of Read and Write requests.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

The UART controller and associated controller driver must conform to the Serial framework and support the following:

-   Controller implements necessary logic to support I/O cancellation

### Device.BusController.UART.DMA

*UART controller and controller drivers require DMA support for appropriate DMA transactions.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

The UART controller and associated controller driver must conform to the Serial framework and support the following:

-   Peripheral driver can issue read and write request to the controller max at 5 K data size.

### Device.BusController.UART.FlowControl

*UART controller and controller drivers must support the setting of the flow control to on and off.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

The UART controller and associated controller driver must conform to the Serial framework and support the following:

-   Driver implements support for IOCTL\_SERIAL\_GET\_HANDFLOW and IOCTL\_SERIAL\_SET\_HANDFLOW IOCTLs and flow control settings

### Device.BusController.UART.FlushFIFO

*UART controller and controller drivers must support Flush FIFOs.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

The UART controller and associated controller driver must conform to the Serial framework and support the ability to flush FIFO queues.

### Device.BusController.UART.GuardBuffer

*UART controller and associated controller driver must detect and correct the guard buffer’s overflow and underflow.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

The UART controller and associated controller driver must conform to the Serial framework and should not write to memory outside of the transfer buffer. For example, if a 1KB data transfer buffer is allocated for a read, the UART data transfer must not write to memory outside of the 1KB buffer. For this requirement, a test has been added to detect if memory outside of the transfer buffer has been overwritten. Once the transfer has completed, ownership of the transfer buffer is handed to the test application. The test then verifies the transfer buffer memory is not altered to ensure the buffer is not being overwritten.

### Device.BusController.UART.HCKTestability

*Systems with UART controllers must expose correct ACPI table information and UART pin-outs to enable HCK testability.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

The objective of this requirement is to enable the UART controller to be testable by the HCK framework.

Details:

-   Controller under test must provide UART external connectivity pin-out (Rx,Tx, RTS, CTS, and GND).

-   Describe HCK UART test peripheral driver and its connection to UART controller under test in device’s firmware.

### Device.BusController.UART.IdlePowerManagement

*UART controller and controller drivers must support Idle Power Management.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

The UART controller and associated controller driver must conform to the Serial framework and support the following:

-   Controller transitions to the Dx state when there is no pending I/O in the controller for 200 ms.

### Device.BusController.UART.Performance

*UART controller and controller driver has a measured baud rate that matches the expected value.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

The UART controller and associated controller driver must conform to the Serial framework that the measured baud rate matches the expected value.

### Device.BusController.UART.ReadWrite

*UART controller and controller drivers must support read/write Unicode(8 bits) data.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

The UART controller and associated controller driver must conform to the Serial framework and support the following when reading data from an UART peripheral:

-   Support IOCTL\_SERIAL\_SET\_LINE\_CONTROL and IOCTL\_SERIAL\_GET\_LINE\_CONTROL and be able to transfer data according to the data length settings (8 bits).

### Device.BusController.UART.Stress

*UART controller and controller driver operates correctly (and recovers appropriately from bus errors) under prolonged stress conditions.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

The UART controller and associated controller driver must conform to the Serial framework and support the following:

-   Sustain stress test passes for at least 1 hour.

### Device.BusController.UART.SupportedBaudRates

*UART controller and controller drivers must support basic baud rate 115200 and faster speed for higher bandwidth communications.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

The UART controller and associated controller driver must conform to the Serial framework and support the following:

-   Driver supports IOCTL\_SERIAL\_SET\_BAUD\_RATE and IOCTL\_SERIAL\_GET\_BAUD\_RATE IOCTL.

-   Driver should fail baud rate setting for non-supported baud rate and is able perform I/O using the baud rate set.

