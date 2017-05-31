---
title: Device.BusController.I2C
Description: 'Requirements only for I2C controller silicon vendors. System manufacturers may optionally run these tests, but may need hardware customization.'
ms.assetid: 
MSHAttr: 
author: beneluxboy
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Device.BusController.I2C
 - [Device.BusController.I2C](#device.buscontroller.i2c)

<a name="device.buscontroller.i2c"></a>
## Device.BusController.I2C

*These requirements apply only to I2C controller silicon vendors. System manufacturers may optionally run these tests, but may need hardware customization.*

### Device.BusController.I2C.CancellationOfIO

*I2C controller and controller drivers must support the cancellation of I/O requests.*

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

The I2C controller and associated controller driver must conform to the SPB framework and support the following:

-   Driver implements SPB request cancelation logic for read/write/sequence I/O.

### Device.BusController.I2C.ClockStretching

*I2C controller and controller drivers must support peripheral clock stretching.*

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

The I2C controller and associated controller driver must conform to the SPB framework and support the following:

-   Controller can sustain peripheral holding clock for at least 2 seconds during read, write, and sequence I/O.

### Device.BusController.I2C.HCKTestability

*Systems with I2C controllers must expose correct ACPI table information and I2C pin-outs to enable HCK testability.*

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

The objective of this requirement is to enable the controller to be testable by the HCK framework.

Details:

-   Controller under test must provide I2C external connectivity pin-out (SCL, SDA, and GND).

-   Update ACPI to correctly describe HCK test peripheral drivers and its connection to I2C controller under test.

-   Other peripheral devices on the same I2C controller under test must be disabled when running HCK tests.

### Device.BusController.I2C.IdlePowerManagement

*I2C controller and controller drivers must support Idle Power Management.*

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

The I2C controller and associated controller driver must conform to the SPB framework and support the following:

-   Controller should go to the D3 state after it is idle for more than 1 second when the screen is on.

-   Controller should go to the D3 state after idle for more than 100ms when the screen is off.

-   Controller takes less than 75 ms (50+ 25 to account for the timer granularity of 15ms) to resume from the D3 state to the D0 state.

### Device.BusController.I2C.LockUnlockIOCTL

*I2C controller and controller drivers must support the Lock/Unlock IOCTL.*

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

If the Stop condition is supported, the I2C controller and associated controller driver must conform to the SPB framework and support the following:

-   Supports an arbitrary number of read/write operations inside Lock/Unlock pair.

-   Generate the Start condition for the first I/O in the lock/unlock sequence, the Restart condition for subsequent I/O, and the Stop condition when Unlock is called.

### Device.BusController.I2C.NACK

*I2C controller and controller drivers must support peripheral NACK.*

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

The I2C controller and associated controller driver must conform to the SPB framework and support the following:

-   Controller can detect address NACK bus condition and return STATUS\_NO\_SUCH\_DEVICE for request.

-   Controller can detect device NACK during a write operation, complete the request with STATUS\_SUCCESS, and information bytes is set to a number of bytes that is less than what was intended to be written.

-   Controller can detect device NACK during a write operation of a sequence IOCTL, complete the request with STATUS\_SUCCESS, and information bytes is set to number of bytes that is less than what was intended to be written.

### Device.BusController.I2C.SPBRead

*I2C controller and controller drivers must support SPB Read operations correctly.*

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

The I2C controller and associated controller driver must conform to the SPB framework and support the following when reading data from an I2C peripheral:

-   Must support reading from standard (100 Kbps), fast (400 kbps) and fast plus (1 Mbps) peripheral targets. High Speed (3.4 MHz) is optional, but must pass all HCK requirements for I2C if implemented in the I2C controller and controller driver.

-   Must support read size from 1 to 4096 bytes (4 KBytes).

-   Sizes larger than 4 KBytes must succeed or fail with STATUS\_NOT\_SUPPORTED.

-   SPB read is mapped into Start, Read Data, NACK, and Stop I2C conditions.

-   Fail any unsupported data size read request with STATUS\_INVALID\_PARAMETER and not cause any bus activities.

### Device.BusController.I2C.SPBSequenceIOCTL

*I2C controller and controller drivers must support SPB Sequence IOCTL correctly.*

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

The I2C controller and associated controller driver must conform to the SPB framework and support the following:

-   Supports any arbitrary I/O sequences: write-read, read-write, write-write, read-read and complex combined such as write-read-read-write-write

-   SPB sequence IOCTL is mapped into Start, I/O sequence 1, Restart….I/O sequence N, Stop I2C conditions.

-   Controller needs to examine the sequence and determine if it is supported or fail with STATUS\_INVALID\_PARAMETER before causing any bus activities.

-   Support any valid parameters (e.g., DelayInUs) and memory format (SIMPLE, MDL, Buffer list etc.) as defined by SPB.

### Device.BusController.I2C.SPBWrite

*I2C controller and controller drivers must support SPB Write operations correctly.*

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

The I2C controller and associated controller driver must conform to the SPB framework and support the following when writing to an I2C peripheral:

-   Must support writing to standard (100 Kbps), fast (400 kbps) and fast plus (1 Mbps) peripheral targets. High Speed (3.4 MHz) is optional, but must pass all HCK requirements for I2C if implemented in the I2C controller and controller driver.

-   Must support write size from 1 to 4096 bytes (4 KBytes).

-   Sizes larger than 4 KBytes must succeed or fail with STATUS\_NOT\_SUPPORTED.

-   SPB write is mapped into Start, Write Data, and Stop I2C conditions.

-   Fail any unsupported data size write request with STATUS\_INVALID\_PARAMETER and not cause any bus activities.

### Device.BusController.I2C.Stress

*I2C controller and controller driver must operate correctly and recovers from bus hangs or faults under prolonged stress conditions.*

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

The I2C controller and associated controller driver must conform to the SPB framework and support the following:

-   Supports bus recovery when peripheral is hung (watchdog mechanism).

-   Sustain multiple targets stress for more than 1 hour.
