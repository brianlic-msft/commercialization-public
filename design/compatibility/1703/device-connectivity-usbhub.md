---
title: Device.Connectivity.UsbHub
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

<!--
# Device.Connectivity.UsbHub

 - [Device.Connectivity.UsbHub](#device.connectivity.usbhub)
-->

# Device.Connectivity.UsbHub

 - [Device.Connectivity.UsbHub](#device.connectivity.usbhub)
 - [Device.Connectivity.UsbHub.USBC](#device.connectivity.usbhub.USBC)
 
<a name="device.connectivity.usbhub"></a>
## Device.Connectivity.UsbHub

*Requirements that apply only to USB Hubs*

### Device.Connectivity.UsbHub.IdentifyNumOfUserAccessiblePorts

*A USB hub must correctly identify and report the number of ports that the user can access.*

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

The USB hub must include details in its hub descriptor that provide the operating system with an accurate count of the number of downstream-facing ports that the hub supports and that are exposed to the user. See USB Specification, Revision 2.0, Section11.23, and USB 3.0 Specification, Section 10.14. Root hubs are exempt from this requirement.

### Device.Connectivity.UsbHub.SupportSuspend

*USB hubs must support the selective suspend state, and downstream devices must not drop off the bus when the hub resumes from selective suspend.*

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

USB hubs must support the selective suspend state, as stated in both the USB Specification and other logo program requirements. After a hub is resumed from the selective suspend state, all devices that were attached downstream of the hub, and that were not removed while the hub was suspended, must be present.

### Device.Connectivity.UsbHub.Usb3HubCompliesWithUsb3Spec

*USB 3.0 hubs are compliant with the USB 3.0 specification.*

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

USB 3.0 hubs must be compliant with *the* Universal Serial Bus (USB) 3.0 specification. 

USB 3.0 hubs must:

-   Pass the USB-IF interoperability tests

-   Pass the USB 3.0 Hub compliance test suite

-   Pass the USB 3.0 CV test

### Device.Connectivity.UsbHub.Usb3ReportPortStatusBitsCorrectly

*USB 3.0 hubs must always report the port status bits correctly as per the USB 3.0 specification.*

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

In the current stack, a number of invalid port status bit combinations that the hub reports are ignored. Any invalid combination of port status bits will be treated as an error. In particular, checks will follow these actions:
 

-   Resetting a port

-   Suspending and resuming a port

-   System resume

A hub should not report spurious change interrupts. A hub should complete the port status interrupt transfer without reporting changes.

<a name="device.connectivity.usbhub.usbc"></a>
## Device.Connectivity.UsbHub.USBC

### Device.Connectivity.UsbHub.USBC.USBTypeCHubCompat

*USB Type-C Hub Compatibility*

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

USB Type-C hubs must use multiplexers for their SuperSpeed Ports so that a single port can be mapped to either orientation of the attached plug. This enables attaching a USB-C device in either orientation without UI implications or losing state.

If the USB Type-C hub is designed to provide power back to the upstream Host, then its upstream port must be implemented as a charging UFP. In addition, if its upstream port initially resolves as a DFP for data, it must initiate a data role swap; if its upstream port initially resolves as a power sink, it must initiate a power role swap.

