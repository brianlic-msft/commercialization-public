---
title: Device.Connectivity.MAUSB.Device
Description: 'Requirements apply to MA-USB Devices. However, MA-USB requirements are currently optional and will not be enforced until 2017.'
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
# Device.Connectivity.MAUSB.Device

 - [Device.Connectivity.MAUSB.Device ](#device.connectivity.mausb.device)
-->

<a name="device.connectivity.mausb.device"></a>
## Device.Connectivity.MAUSB.Device 

The following requirements apply to MA-USB Devices.

MA-USB requirements are currently optional and will not be enforced until 2017.

Following table of definitions are used in the context of MA-USB Hub and MA-USB Device requirements:

MA-USB Device PAL:

MA-USB Device PAL, as defined in the MA-USB Specification, is the component of a MA-USB Device or MA-USB Hub that manages the transport of USB payload over the MA link interface.

Integrated USB Device behind a MA-USB Device:

This refers to the USB device logic block in a MA-USB Device that performs USB device functions, as defined by the USB 2.0 or USB 3.1 specification, except those that involve the physical USB medium. For brevity, an Integrated USB Device behind a MA-USB Device will be referred to as Integrated USB Device,

Integrated USB 2.0 Hub behind a MA-USB Hub:

This refers to the USB hub logic block in a MA-USB Hub that performs USB device functions as defined by the USB 2.0 specification, except those upstream port requirements that involve the physical USB medium. For brevity, an Integrated USB 2.0 Hub behind a MA-USB Hub will be referred to as Integrated USB 2.0 Hub,

Integrated USB 3.1 Hub behind a MA-USB Hub:

This refers to the USB hub logic block in a MA-USB Hub that performs USB device functions as defined by the USB 3.1 specification, except those upstream port requirements that involve the physical USB medium. For brevity, an Integrated USB 3.1 Hub behind a MA-USB Hub will be referred to as Integrated USB 3.1 Hub,

Note that Integrated USB Devices behind a USB 2.0 or USB 3.1 hub behind a MA-USB Hub are required to meet Wired USB Device Requirements listed under Device.Connectivity.UsbDevices category.

### Device.Connectivity.MAUSB.Device.BulkOutBufferSize

*MA-USB device must support at least 64KB of Buffer Space per non SuperSpeed Bulk Out endpoints and at least 512KB of Buffer Space per SuperSpeed Bulk Out endpoints*

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


MA-USB device must support these minimum buffer sizes to be able to work reliably and for optimum performance (throughput). These buffer sizes are reported by the MA-USB device in its Endpoint Response packet as described by MA-USB specification v1.0a, section 6.3.7.

 - SuperSpeed Bulk Out - 512KB

 - non-SuperSpeed Bulk Out - 64KB

### Device.Connectivity.MAUSB.Device.FunctionSuspendSelectiveSuspend

*MA-USB devices that have integrated 3.1 devices behind them must correctly implement Function Suspend.*

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

Any function of the integrated 3.1 device that is in a suspend state before a MA-USB device is suspended remains in the function suspend state when the MA-USB device is resumed from the suspended state. Any function of the integrated 3.1 device that is in a suspend state before the integrated device is suspended remains in the function suspend state when the integrated device is resumed from the suspended state. Integrated USB devices that are resumed from the suspended state retain a minimum set of device state information as specified in section 9.2.5.2 of the USB 3.0 Specification. Integrated USB device that is in a suspended stare before a MA-USB device is suspended remains in the suspended state when the MA-USB device is resumed from the suspended state.

### Device.Connectivity.MAUSB.Device.IPMode

*MA-USB devices must implement support for IP Mode*

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

MA-USB devices must implement support for IP Mode as specified in the MA-USB specification v1.0a, Section 4.5.3.2 “Requirements for IP Mode”.

### Device.Connectivity.MAUSB.Device.IsochronousDeviceAndDriver

*Isochronous USB device and driver requirement*

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

-   **Integrated ISO USB device and driver provide multiple alternate settings to support maximum flexibility of hardware interface options:**

    -   If any alternate setting consumes isochronous bandwidth, devices and drivers must provide multiple alternate settings for each interface.

-   **Integrated USB device and driver do not use isochronous bandwidth for alternate setting 0:**

    -   Integraetd USB Devices and drivers must not use isochronous bandwidth for alternate setting 0. Devices must consume bandwidth only when they are in use.

-   **Integrated USB isochronous full-speed or high-speed device that uses more than 50 percent of USB bus bandwidth provides alternate settings:**

    -   If an Integrated USB isochronous full-speed or high-speed device uses more than 50 percent of USB bus bandwidth, it must provide alternative settings that allow the device to switch to a setting that uses less than 50 percent of the bus bandwidth and operate as a device of that particular class (ex. if it is a camera then it must continue to stream video), even though it may be in a lower quality mode.
        Integrated USB Devices with attached host controllers are exempt from this requirement.

-   **Integrated USB device with interfaces containing isochronous endpoints has at least one alternative interface for low bandwidth scenarios:**

    -   Integrated USB device must provide at least one alternative interface for low bandwidth as described in USB Specification, Revision 2.0 or later, Section 9.6.5.

*Design Notes*

See section 9.6.5 in the Universal Serial Bus Specification, Revision 2.0.
If two or more devices are connected that use more than 50 percent of the bus bandwidth and do not provide alternate settings, only one of the devices works at a time.
See USB Specification, Revision 2.0 or later, Sections 5.6 and 5.7.

### Device.Connectivity.MAUSB.Device.MAUSBSpecCompliance

*MA-USB Devices must be USB-IF Specification Compliant*

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

MA-USB Devices must be compliant with MA-USB specification v1.0a or later.

### Device.Connectivity.MAUSB.Device.MsOsContainerId

*USB devices that implement the Microsoft OS Container ID descriptor must implement it correctly.*

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

If an Integrated multifunction USB device implements the Microsoft® operating system **ContainerID** descriptor, the device does this in the Microsoft operating system feature descriptor. 

The Microsoft operating system **ContainerID** descriptor allows Windows® to correctly detect Integrated multifunction devices. The descriptor provides a way for all the device nodes to appear as one physical object in the **Devices and Printers** user interface (UI).

### Device.Connectivity.MAUSB.Device.MustBeFunctionalAfterResume

*MA-USB devices must be functional after resuming from system power states.*

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

After MA-USB Resume, MA-USB Device PAL must be in a functional state without requiring a MA-USB Device Reset. In addition, Integrated USB Device must be in a functional state after USB Resume without requiring either a MA-USB Device Reset or a USB Device Reset.

Devices not entering a timely ready state will be marked code 10 or other by the system. Certain classes of devices do not properly respond to system events, such as resume, and require upper driver or expect precise boot timings in order to function properly.

### Device.Connectivity.MAUSB.Device.MustNotDisconnectDuringSuspend

*MA-USB devices or Integrated USB Devices must not disconnect while going to or resuming from suspend.*

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

MA-USB Device must not disconnect from the host during MA-USB Suspend or Resume.

Integrated USB devices must not disconnect during USB Suspend/Resume or MA-USB Suspend/Resume process.

### Device.Connectivity.MAUSB.Device.ReportManufacturerAndModelNameAndNumber

*MA-USB device must report their Manufacturer, Model Name and Model Number.*

> [!WARNING]
> Certification for Windows Server 2016, Azure Stack, and SDDC must continue to meet the Windows Hardware Compatibility Requirements as stated in version 1607 of documentation, must use [version 1607 of the HLK (build 14393)](https://go.microsoft.com/fwlink/p/?LinkID=404112) with [matching playlist](http://aka.ms/hlkplaylist) and supplemental content to generate logs, and must follow policies as stated in the [Windows Server Policy document](https://go.microsoft.com/fwlink/p/?linkid=834831). Questions about the Azure Stack or SDDC programs or how to submit the results for solution validation should be directed to the appropriate Microsoft technical account manager or partner management contact.

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

A MA-USB dock or device must report the Manufacturer, Model Name, and Model Number attributes as defined in section 8.2.5 – “Probe Response (D-AP/Registrar)” of the “Wi-Fi Simple Configuration Technical Specification” version 2.01.  The Model Number attribute will be used to communicate the Firmware version of the MA-USB dock or device.

### Device.Connectivity.MAUSB.Device.RespondAllStringRequests

*A Integrated USB device must respond to all string requests that the host sends to indexes.*

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

Integrated USB devices must respond accordingly to string requests that the host sends. Integrated devices must stall if no string is stored at the index being queried or if a request error exists. Integrated devices must not reset themselves or stop functioning. This is described in USB Specification, Revision 2.0 or later, Section 9.6.

### Device.Connectivity.MAUSB.Device.ResponsesLimitedByWlengthField

*Integrated USB device responss to host requests are limited in size by the wLength field.*

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

All USB device requests contain a wLength field. Responses by the Integrated USB device to host requests must be of size &lt;= wLength field of the device request as defined in the USB Specification, Revision1.1 or later, Section 9.3.5.
 

### Device.Connectivity.MAUSB.Device.SerialNumbers

*USB serial numbers are implemented by the Integrated USB Device for specific device classes and are unique across specific device models.*

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

USB serial numbers must be implemented by the Integrated USB Device for the following device classes:

-   Bluetooth (Class Code 0xE0, SubClass 0x01, Protocol 0x01)

-   Communication device class (Class Code 0x02)

-   Mass storage (Class Code 0x08)

-   Scanning/imaging (Class Code 0x06)

-   Printing (Class Code 0x07)

-   Host Wire Adapters and Device Wire Adapters (Class Code 0xE0, subclass 02)

USB serial numbers are optional for all other device classes.    Additionally, if serial numbers are implemented on the device's model, all devices of the same model must have unique serial numbers.

*Design Notes*

For more information on USB device class details, see "Defined 1.0 Class Codes" at: <http://go.microsoft.com/fwlink/?LinkId=40497>.
For more information on implementation of serial numbers, see USB Specification, Revision 2.0 or later, Section 9.6.
 

### Device.Connectivity.MAUSB.Device.SerialNumbersUseValidCharacters

*An Integrated USB device that implements manufacturer-defined serial numbers must contain valid characters.*

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

A USB serial number must be a string that contains a manufacturer-determined ID composed of valid characters. Valid characters are defined in the Windows Driver Kit, "USB\_DEVICE\_DESCRIPTOR."

### Device.Connectivity.MAUSB.Device.SpeedCapabilityMatch

*Integrated USB Device must enumerate at the USB speed advertised in the Speed Capability Descriptor of the MA-USB Device.*

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

*Integrated USB Device must enumerate at the USB speed advertised in the Speed Capability Descriptor of the MA-USB Device. Speed Capability Descriptor is part of the Capability Response returned by the MA-USB Device as specified in Section 6.3.3.1 of MA-USB Specification v1.0a.*

### Device.Connectivity.MAUSB.Device.SupportsWiFiDirectAndWSB

*MA-USB Devices support WiFi Direct Connection and WiFi Serial Bus*

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

Network interface implementation MA-USB Device must meet the following requirements to work reliably with the Inbox Windows MA-USB Host:

-   MA-USB Hub/Device must support Wi-Fi Direct Services (Peer-to-Peer Services 1.x) over an 802.11n/ac and/or 802.11ad NIC

    -   Will likely move to ASP2 (Wi-Fi Direct discovery and connect)

-   MA-USB Hub/Device must implement WSB v0.18&lt;latest&gt; as an advertiser

### Device.Connectivity.MAUSB.Device.TCPImplementation

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

TCP implementation of MA-USB Device must meet the following requirements to work reliably with the Inbox Windows MA-USB Host:

-   TCP Delayed ACK optimization must be disabled.

-   TCP Nagle Algorithm implementation must be disabled.

-   TCP must provide at least 64KB of Receive Buffer space.

### Device.Connectivity.MAUSB.Device.UseUsbClassOnlyForControllerOrHub

*Third-party INF files include the class "USB" only if the device is a USB host controller, a root, or an external hub.*

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

Class USB is often used incorrectly for devices that do not have a predefined class. For example, a USB mouse uses class HID, whereas a USB smartcard uses class smartcard reader. Class USB is reserved for host controllers and root or external USB hubs. If the vendor has a device that has no Windows-defined class but uses USB as the bus, it must define its own class or class GUID. The setup class associated with the type of USB device, not with the bus type, must be used. The setup class "USB" (ClassGuid = {36fc9e60-c465-11cf-8056-444553540000}) is reserved for USB host controllers (including MA-USB host PAL) and root or external USB hubs. It must not be used for other device categories.

 
*Design Notes*

Microsoft provides system-defined setup classes for most device types. System-defined setup class GUIDs are defined in the Windows Driver Kit, "Devguid.h."
If you choose the wrong class, the device appears in an incorrect location in Device Manager and in the Windows Vista UI. Using this class incorrectly may cause the device driver to fail hardware compatibility testing.
For a list of Windows class GUIDs, see the Windows Driver Kit, "System-Supplied Device Setup Classes" at: <http://msdn.microsoft.com/en-us/library/ff553419.aspx>.

