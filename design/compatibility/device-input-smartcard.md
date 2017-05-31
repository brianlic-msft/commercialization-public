---
title: Device.Input.SmartCard
Description: 'Requirements.'
ms.assetid: 
MSHAttr: 
author: beneluxboy
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Device.Input.SmartCard

 - [Device.Input.SmartCardMiniDriver](#device.input.smartcardminidriver)
 - [Device.Input.SmartCardReader](#device.input.smartcardreader)

<a name="device.input.smartcardminidriver"></a>
## Device.Input.SmartCardMiniDriver

*MiniDriver program for smart cards*

### Device.Input.SmartCardMiniDriver.DoNotStopWhenResourcesAreUnavailable

*Smart card driver must not stop the system if required resources are not available.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

A smart card driver must not interrupt system operation if resources that are required by the reader are not available.

### Device.Input.SmartCardMiniDriver.SpecsAndCertifications

*Windows Smart Card Minidrivers must meet Windows Smart Card Minidriver Version 5 Specifications and Certification Criteria.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Smart Card Minidrivers are pluggable security components that provide an abstraction layer between the base CSP and the smartcard to provide secure storage for cryptographic keys and certificates. Smart Card Minidrivers perform secure cryptographic operations including encryption, decryption, key establishment, key exchange, and digital signatures. Smart Card Minidrivers also include other form factors, such as a USB tokens or other personal trusted devices.
Smart Card Minidrivers must adhere to the following specifications:

-   Smart Card Minidriver Specification for Windows Base Cryptographic Service Provider (Base CSP) and Smart Card Key Storage Provider (KSP), Version 5.06 (or later).

-   Smart Card Minidriver Certification Criteria, Version 5.06 (or later).

Smart Card Minidrivers must adhere to the following basic criteria:

-   If the device submitted for testing is a smart card and has an ISO 7816 ID-1 smart card form factor, it must be tested with a smart card reader that has passed the WHQL Testing Requirements for smart cards.

-   If the device is a multi-function device, it must pass the logo requirements for each device category if a logo program exists.

-   The card minidriver may not implement additional functionality beyond that specified in the Card Minidriver Specification.

-   The card minidriver may not contain any Trojan's or "backdoors".

-   The card minidriver may not present any UI to the end user.

-   All cryptographic operations must take place on the device.

-   All cryptographic keys must be stored on the device and must not be exportable from the device.

Smart Card Minidrivers must adhere to the following general criteria in the Card Minidriver Certification Criteria:

-   Card Minidriver Management and Installation

-   Card Minidriver Logical File System Requirements

-   Card Minidriver General Conventions

-   Card Minidriver Memory Management

-   Optional General Requirements

Smart Card Minidriver must adhere to the criteria governing each of the Functional Exports for each function in the Card Minidriver specification, including:

-   Functionality

-   Performance

-   Error Handling

Smart Card Minidrivers must support the sequenced invocation of card minidriver functions.
A Smart Card Minidriver may support multiple smart cards, but must pass the certification criteria for each of the supported smart cards separately.

*Design Notes*  

See Smart Card Minidriver Specification for Windows Base Cryptographic Service Provider (Base CSP) and Smart Card Key Storage Provider (KSP), Version specifications at <http://msdn.microsoft.com/en-us/windows/hardware/gg487500.aspx>.
See Smart Card Minidriver Certification Criteria, at <http://msdn.microsoft.com/en-us/windows/hardware/gg487504>.
The following table describes the minimum and maximum specification version that must be supported on any given OS family:

| Operating system family | Allowed specification versions                                                                         |
|-------------------------|--------------------------------------------------------------------------------------------------------|
| Windows 7 client        | 5,6,7 (any combination allowed such as 5 and 7 only, 5 only, 7 only, 5 and 6 only, 6 and 7 only, etc.) |
| Windows Server 2008     | 5,6,7 (any combination allowed such as 5 and 7 only, 5 only, 7 only, 5 and 6 only, 6 and 7 only, etc.) |
| Windows 8 client        | 5,6,7 (any combination allowed such as 5 and 7 only, 5 only, 7 only, 5 and 6 only, 6 and 7 only, etc.) |
| Windows Server 2016     | 5,6,7 (any combination allowed such as 5 and 7 only, 5 only, 7 only, 5 and 6 only, 6 and 7 only, etc.) |

 

### Device.Input.SmartCardMiniDriver.SupportMultipleInstancesOnASystem

*Smart card driver can support multiple instances of the same device on a system.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

The smart card driver must be able to function properly if more than one instance of the devices is installed on a system. The functionality of each device instance must be consistent. When a separate instance is loaded, functionality cannot be reduced.

<a name="device.input.smartcardreader"></a>
## Device.Input.SmartCardReader

### Device.Input.SmartCardReader.PinDataEntryKeyboardCompliesWithIso

*An input device that implements a PIN data-entry keyboard must comply with ISO.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

An input device that uses a keyboard for PIN entry must comply with ISO 13491-1:1998 Banking--Secure Cryptographic Devices (retail) Part 1: Concepts, Requirements, and Evaluation Methods.
 

### Device.Input.SmartCardReader.SmartCardService

*The Smart Card Service must start after a Smart Card is inserted into a reader.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

The Smart Card Service must be started after a Smart Card is inserted into the Smart Card reader.

**Business Justification**

This requirement is necessary for reliability of the smart card function.

### Device.Input.SmartCardReader.Supports258And259BytePackets

*A reader must support 258-byte packets in T=0 and 259-byte packets in T=1.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

A smart card reader must support the exchange of the following in a single transmission:

-   .258-byte packets in T=0; that is, 256 data bytes plus the two status words SW1 and SW2.

-   259-byte packets in T=1; that is, 254 information bytes plus node address, packet control bytes, length, and two error detection code bytes.

### Device.Input.SmartCardReader.SupportsDirectAndInverseConvention

*A smart card reader must support direct and inverse-convention smart cards.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

A smart card reader must support both direct and inverse-convention smart cards either in hardware or in the operating system driver.
 

### Device.Input.SmartCardReader.SupportsInsertionAndRemovalMonitor

*A reader must support smart card insertion and removal monitor.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

A smart card reader must be able to detect and report smart card insertions and removals with no user intervention other than removing or inserting the smart card itself. The reader must use an interrupt mechanism to report the smart card insertion or removal to the system. A driver polling method to detect smart card insertion and removals is not an acceptable way to meet this requirement.
 

### Device.Input.SmartCardReader.SupportsMinClockFrequency

*A smart card reader must support a 3.5795-MHz minimum clock frequency.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

A smart card reader must support a minimum clock frequency of 3.5795 MHz.
 

### Device.Input.SmartCardReader.SupportsMinDataRateOf9600bps

*A smar card reader must support a minimum data rate of 9600 bps.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

A smart card reader must be able to transfer data at a rate of 9600 bps or higher.

### Device.Input.SmartCardReader.SupportsNegotiableAndSpecificModes

*A reader must support negotiable and specific modes according to the ISO/IEC specification.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

To support multiple-protocol smart cards and smart cards that use higher data rates and higher clock frequencies, the reader must support negotiable and specific modes according to ISO/IEC 7816-3 (1997-12-15), Sections 5.4 and 7.
The **Power Down** command for ISO 7816-3 is optional, but the **Reset** command is required.
PTS is not required.
 

### Device.Input.SmartCardReader.SupportsResetCommand

*A smart card reader must support the Reset command.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

A smart card reader must support the asynchronous protocols T=0 and T=1 as described in either the hardware or the driver. Both protocols must be fully supported. The smart card reader and the driver must support cards that can handle both protocols. Support is not required for protocols other than T=0 and T=1.
The following protocol rules apply for the T=1 protocol:

-   A transmission is defined as sending a command to a smart card by using one or more T=1 blocks and receiving the corresponding answer by using one or more T=1 blocks as defined in ISO/IEC 7816-3.

-   For cards that support IFSC requests, the first transmission after a reset of the smart card must begin with an IFSD request, as defined in ISO/IEC 7816-3, Amendment 1, Section 9.5.1.2.

-    For cards that do not support an IFSD request (that is, the card replies with an R-Block indicating "Other error"), the transmission must continue with an I-Block.

-   After a successful RESYNCH request, the transmission must restart from the beginning with the first block with which the transmission originally started.

 

### Device.Input.SmartCardReader.UsbCcidCompliesWithUsbDeviceClassSpec

*A USB smart card CCID reader must comply with USB Device Class Specification for USB Chip/Smart Card Interface Devices.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

If the reader supports USB connectivity, CCID is required. To ensure that USB smart card readers function properly with the USB host, smart card CCID readers must comply with USB Device Class: Smart Card Specification for Integrated Circuit(s) Cards Interface Devices, Revision 1.00 or later.

### Device.Input.SmartCardReader.UsbCcidIssuesNak

*A USB CCID reader must issue an NAK on an interrupt pipe if a device has no interrupt data to transmit.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

USB CCIDs must issue an NAK on an interrupt pipe unless the state changes. This prevents the necessity of repeatedly polling the device for status.

*Design Notes*

See USB Device Class Specification for USB Chip/Smart Card Interface Devices, Revision 1.00 or later, Chapter 3. See USB Specification, Revision 1.1 or later, Sections 5.7.4 and 8.5.4.

