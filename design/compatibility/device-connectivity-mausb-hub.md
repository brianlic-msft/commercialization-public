---
title: Device.Connectivity.MAUSB.Hub
Description: 'Requirements apply to MA-USB Hubs. However, MA-USB requirements are currently optional and will not be enforced until 2017.'
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
# Device.Connectivity.MAUSB.Hub

 - [Device.Connectivity.MAUSB.Hub ](#device.connectivity.mausb.hub)
-->

<a name="device.connectivity.mausb.hub"></a>
## Device.Connectivity.MAUSB.Hub 

The following requirements apply to MA-USB Hubs

MA-USB requirements are currently optional and will not be enforced until 2017.

### Device.Connectivity.MAUSB.Hub.BulkOutBufferSize

*MA-USB hubs must support at least 64KB of Buffer Space per non SuperSpeed Bulk Out endpoints and at least 512KB of Buffer Space per SuperSpeed Bulk Out endpoints*

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

MA-USB requirements are currently optional and will not be enforced until 2017.

MA-USB Hubs must support these minimum buffer sizes to be able to work reliably and for optimum performance (throughput). These buffer sizes are reported by the MA-USB hub in its Endpoint Response packet as described by MA-USB specification v1.0a, section 6.3.7.

-   SuperSpeed Bulk Out - 512KB

-   non SuperSpeed Bulk Out - 64KB

### Device.Connectivity.MAUSB.Hub.IdentifyNumOfUserAccessiblePorts

*A MA-USB hub must correctly identify and report the number of ports that the user can access.*

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

MA-USB requirements are currently optional and will not be enforced until 2017.

The Integrated USB 2.0/3.1 hub must include details in its hub descriptor that provide the operating system with an accurate count of the number of downstream-facing ports that the hub supports and that are exposed to the user. See USB Specification, Revision 2.0, Section11.23, and USB 3.0 Specification, Section 10.14.

### Device.Connectivity.MAUSB.Hub.IPMode

*MA-USB hubs must implement support for IP Mode*

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

MA-USB requirements are currently optional and will not be enforced until 2017.

MA-USB hubs must implement support for IP Mode as specificed in the MA-USB specification v1.0a, Section 4.5.3.2 “Requirements for IP Mode”

### Device.Connectivity.MAUSB.Hub.MAUSBSpecCompliance

*MA-USB Hubs must be USB-IF Specification Compliant *

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

MA-USB requirements are currently optional and will not be enforced until 2017.

MA-USB Hubs must be compliant with MA-USB specification v1.0a or later.

### Device.Connectivity.MAUSB.Hub.SupportSuspend

*MA-USB hubs must support suspend, and downstream devices must not drop off the bus when the hub resumes from suspend.*

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

MA-USB requirements are currently optional and will not be enforced until 2017.

MA-USBhubs must support MA-USB suspend. After a MA-USB Hub is resumed from suspend state, all devices that were attached downstream of the Integrated USB 2.0/3.1 hub, and that were not removed while the hub was suspended, must be present.

Integrated USB 2.0/3.1 Hubs must support USB suspend. After a Integrated USB 2.0/3.1 Hub is resumed from USB Suspend, all devices that were attached downstream of the Integrated USB 2.0/3.1 hub and that were not removed while Integrated USB 2.0/3.1 Hub was suspended, must be present.

### Device.Connectivity.MAUSB.Hub.SupportsWiFiDirectAndWSB

*MA-USB Hubs support WiFi Direct Connection and WiFi Serial Bus*

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

MA-USB requirements are currently optional and will not be enforced until 2017.

Network interface implementation MA-USB Hub must meet the following requirements to work reliably with the Inbox Windows MA-USB Host.

-   MA-USB Hub/Device must support Wi-Fi Direct Services (Peer-to-Peer Services 1.x) over an 802.11n/ac and/or 802.11ad NIC

    -   Will likely move to ASP2 (Wi-Fi Direct discovery and connect)

-   MA-USB Hub/Device must implement WSB v0.18&lt;latest&gt; as an advertiser

### Device.Connectivity.MAUSB.Hub.TCPImplementation

*MA-USB TCP Implementation for Reliability*

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

MA-USB requirements are currently optional and will not be enforced until 2017.

TCP implementation of MA-USB Hub must meet the following requirements to work reliably with the Inbox Windows MA-USB Host:

-   TCP Delayed ACK optimization must be disabled.

-   TCP Nagle Algorithm implementation must be disabled.

-   TCP must provide at least 64KB of Receive Buffer space.

### Device.Connectivity.MAUSB.Hub.Usb3HubCompliesWithUsb3Spec

*Integrated USB 3.1 hubs are compliant with the USB 3.1 specification.*

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

MA-USB requirements are currently optional and will not be enforced until 2017.

Integrated USB 3.1 hubs must be compliant with *the* Universal Serial Bus (USB) 3.1 specification. 

Integrated USB 3.1 hubs must:

-   Pass the USB-IF interoperability tests

-   Pass the USB 3.1 Hub compliance test suite

-   Pass the USB 3.1 CV test

### Device.Connectivity.MAUSB.Hub.Usb3ReportPortStatusBitsCorrectly

*Integrated USB 3.1 hubs must always report the port status bits correctly as per the USB 3.1 specification.*

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

MA-USB requirements are currently optional and will not be enforced until 2017.

In the current stack, a number of invalid port status bit combinations that the hub reports are ignored. Any invalid combination of port status bits will be treated as an error. In particular, checks will follow these actions:

-   Resetting a port

-   Suspending and resuming a port

-   System resume

A Integrated USB 3.1 Hub should not report spurious change interrupts.

