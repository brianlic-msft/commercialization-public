---
title: Device.Connectivity.UsbDevices
Description: 'Requirements for all devices that connect via USB, including USB hubs, but not USB controllers.'
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
# Device.Connectivity.UsbDevices

 - [Device.Connectivity.UsbDevices](#device.connectivity.usbdevices)
-->

# Device.Connectivity.UsbDevices

 - [Device.Connectivity.UsbDevices](#device.connectivity.usbdevices)
 - [Device.Connectivity.UsbDevices.USBC](#device.connectivity.usbdevices.usbc)

<a name="device.connectivity.usbdevices"></a>
## Device.Connectivity.UsbDevices

*Applies to all devices connected via USB including USB hubs. Does not apply to USB controllers.*

### Device.Connectivity.UsbDevices.DebugCompliesWithDebugSpec

*USB debug device must comply with the USB2 debug device specification.*

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

USB devices designed for debug purposes over USB 2.0 must comply with USB2 Debug Device Functional Specification, which includes details on the device framework, commands, and additional operational requirements.

### Device.Connectivity.UsbDevices.DebugCompliesWithDebugSpecUSB3

*USB 3.0 debug cables must comply with the USB 3.0 specification.*

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

USB cables designed for USB 3.0 host debugging must comply with the Universal Serial Bus 3.0 Specification, section 5.5.2.

### Device.Connectivity.UsbDevices.DeviceAttachLessThan100ms

*USB device that signals device-attach must respond after at least 100 ms.*

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

When the USB device has signaled device-attach, the operating system provides a debounce interval of 100ms. The device must respond at the end of that interval. This is described in USB Specification, Revision2.0, Section 7.1.7.3. This requirement ensures that the electrical and mechanical connections are stable before the attached device is reset.

### Device.Connectivity.UsbDevices.FunctionSuspendSelectiveSuspend

*USB 3.0 devices must correctly implement Function Suspend and Selective Suspend.*

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

Any function that is in a suspend state before a device is selectively suspended remains in the function suspend state when the device is resumed from the selective suspend state. Devices must not place all device functions in the function suspend state. Devices must report the selective suspend state.

SuperSpeed devices ignore the DEVICE\_REMOTE\_WAKEUP feature selector.

When all functions of a SuperSpeed device are in the function suspend state and the PORT\_U2\_TIMEOUT field is programmed to 0xFF, the device initiates U2 after 10 milliseconds (ms) of link inactivity. For more information, see section 9.2 of the USB 3.0 Specification.

Devices that are resumed from the selective suspend state retain a minimum set of device state information as specified in section 9.2.5.2 of the USB 3.0 Specification.
 

### Device.Connectivity.UsbDevices.InternalDevicesMustSupportSuspend

*All internally connected USB devices must go to Selective Suspend after periods of inactivity.*

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

All internally connected USB devices must be capable of entering the suspend state after device drivers for those devices initiate the USB Selective Suspend process. Third-party drivers for internal devices on applicable systems must implement USB Selective Suspend.

Devices belonging to these device classes can opt out of supporting USB Selective Suspend:

-   Printers

-   Scanners

-   Fax

### Device.Connectivity.UsbDevices.IsochronousDeviceAndDriver

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

**1. ISO USB device and driver provide multiple alternate settings to support maximum flexibility of hardware interface options:**

If any alternate setting consumes isochronous bandwidth, devices and drivers must provide multiple alternate settings for each interface.

**2. USB device and driver do not use isochronous bandwidth for alternate setting 0:**

Devices and drivers must not use isochronous bandwidth for alternate setting 0. Devices must consume bandwidth only when they are in use.

**3.USB isochronous full-speed or high-speed device that uses more than 50 percent of USB bus bandwidth provides alternate settings:**

If a USB isochronous full-speed or high-speed device uses more than 50 percent of USB bus bandwidth, it must provide alternative settings that allow the device to switch to a setting that uses less than 50 percent of the bus bandwidth and operate as a device of that particular class (ex. if it is a camera then it must continue to stream video), even though it may be in a lower quality mode.
Devices with attached host controllers are exempt from this requirement.

**4. USB device with interfaces containing isochronous endpoints has at least one alternative interface for low bandwidth scenarios:**

USB device must provide at least one alternative interface for low bandwidth as described in USB Specification, Revision 2.0 or later, Section 9.6.5.

*Design Notes*

See section 9.6.5 in the Universal Serial Bus Specification, Revision 2.0.
If two or more devices are connected that use more than 50 percent of the bus bandwidth and do not provide alternate settings, only one of the devices works at a time.
See USB Specification, Revision 2.0 or later, Sections 5.6 and 5.7.
 

### Device.Connectivity.UsbDevices.MsOsContainerId

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

If a multifunction USB device implements the Microsoft® operating system **ContainerID** descriptor, the device does this in the Microsoft operating system feature descriptor. 

The Microsoft operating system **ContainerID** descriptor allows Windows® to correctly detect multifunction devices. The descriptor provides a way for all the device nodes to appear as one physical object in the **Devices and Printers** user interface (UI).

### Device.Connectivity.UsbDevices.MustBeFunctionalAfterResume

*Attached USB devices must be functional after resuming from system power states.*

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

Devices not entering a timely ready state will be marked code 10 or other by the system. Certain classes of devices do not properly respond to system events, such as resume, and require upper driver or expect precise boot timings in order to function properly. A device must be able to function without a port reset upon resume, but must also remain functional if a reset does occur.
A device must be in the attached state (USB Specification 2.0, section 9.1) to be configured and the device must be in the configured state before its functions maybe used (aka, the device is useable). This is per the USB spec 2.0 as in sections 9.1 and 9.2.6.2 "After a port is reset or resumed, the USB System Software is expected to provide a "recovery" interval of 10 ms before the device attached to the port is expected to respond to data transfers. The device may ignore any data transfers during the recovery interval."

*Clarification:*

Devices must be functional after resuming from system power states whether a port reset is issued or not.

### Device.Connectivity.UsbDevices.MustNotDisconnectDuringSuspend

*USB devices must not disconnect from the upstream port while going to or resuming from selective suspend.*

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

USB devices must not disconnect from the upstream port during the selective suspend process.

To test this requirement, we will cause the device to go into the selective suspend state and then resume the device. During this process, we will observe the port status bits of the upstream port and verify that the device does not disconnect during this time. We will repeat this process serveral times.
 

### Device.Connectivity.UsbDevices.MustResumeWithoutForcedReset

*All USB devices work properly upon resume from sleep, hibernation, or restart without a forced reset of the USB host controller.*

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

All USB devices work properly upon resume from sleep, hibernation, or restart without a forced reset of the USB host controller.

*Design Notes*  

Registry key ForceHCResetOnResume documented at the KB below is not needed for devices to function properly upon resume in Windows 7: <http://support.microsoft.com/kb/928631>.
Note that a known set of currently existing devices do require a forced reset upon resume, these devices should be covered in a list kept by the OS which will reset these devices upon resume. The goal of this requirement is to ensure that this list of devices that must be reset to appear after resume does not grow and that devices can properly handle sleep state transitions without being reset.
A reset of the entire USB Host Controller results in significantly increased time that it takes for all USB devices to become available after system resume since there could be only one device at address 0 at a time, this enumeration has to be serialized for all USB devices on the bus. We have also seen that resetting the host controller can lead to an illegal SE1 signal state on some host controllers, which in turn can cause some USB devices to hang or drop off the bus. Moreover, devices cannot maintain any private state across sleep resume as that state will be lost on reset.

### Device.Connectivity.UsbDevices.MustSignalAttachWithin500ms

*Devices must signal attach within 500 ms after the system resumes.*

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

After the system resumes from sleep, the hub driver will fetch the status of the port to which the device is connected. If the device does not show as connected, the hub driver will wait 500 milliseconds (ms) before the hub driver queries the port status again. If the device appears as connected within that time, the hub will not need to re-enumerate the device for Plug and Play, which will result in a better user experience. This requirement already exists for bus-powered devices in the USB specification. The requirement will now also apply to self-powered devices.

### Device.Connectivity.UsbDevices.MustSupportSuspend

*All bus powered USB devices must support USB Suspend after periods of inactivity.*

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

The device driver for a bus-powered device initiates the USB Selective Suspend process. The device can enter the suspend state from any powered state. The device must begin the transition to the suspend state after it sees a constant idle state on its upstream facing bus lines for more than 3.0 ms. In suspend state, the device must only draw suspend current from the bus after no more than 10 ms of bus inactivity on all its ports, as described in the USB Specification, Revision 2.0, Sections 7.1.7.6, 6 9.1.1.6 and 9.2.6.2.

Clarification about USB Selective Suspend in embedded USB devices can be found in the following requirement: Device.Connectivity.UsbDevices.InternalDevicesMustSupportSuspend.

Clarification about USB Selective Suspend in Windows RT systems can be found in the following requirements: Device.Connectivity.UsbDevices.MustSupportSuspendOnRT.

### Device.Connectivity.UsbDevices.RespondAllStringRequests

*A USB device must respond to all string requests that the host sends to indexes.*

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

USB devices must respond accordingly to string requests that the host sends. Devices must stall if no string is stored at the index being queried or if a request error exists. Devices must not reset themselves or stop functioning. This is described in USB Specification, Revision 2.0 or later, Section 9.6.

### Device.Connectivity.UsbDevices.ResponsesLimitedByWlengthField

*USB device responses to host requests are limited in size by the wLength field.*

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

All USB device requests contain a wLength field. Responses by the USB device to host requests must be of size &lt;= wLength field of the device request as defined in the USB Specification, Revision1.1 or later, Section 9.3.5.
 

### Device.Connectivity.UsbDevices.SerialNumbers

*USB serial numbers are implemented for specific device classes and are unique across specific device models.*

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

USB serial numbers must be implemented for the following device classes:

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
 

### Device.Connectivity.UsbDevices.SerialNumbersUseValidCharacters

*A USB device that implements manufacturer-defined serial numbers must contain valid characters.*

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

A USB serial number must be a string that contains a manufacturer-determined ID composed of valid characters. Valid characters are defined in the Windows Driver Kit, "USB\_DEVICE\_DESCRIPTOR."

### Device.Connectivity.UsbDevices.SuperSpeedOnConnectViaUsb3Port

*If upstream SuperSpeed termination is on, devices must always connect on the USB 3.0 port and never connect on the USB 2.0 port.*

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

In a USB 3.0 hub, two downstream ports, a USB 2.0 port and a Superspeed port share the same connector. When a SuperSpeed (that is, non-hub) device is plugged into such a connector, the device must always connect on the SuperSpeed port. The device must never connect on the USB 2.0 port.

To test this requirement, the software will verify that the USB 3.0 port status bits show a connected device and that the USB 2.0 port status bits do not show a connected device. 

For a definition of "connect", see section 2 of the USB 3.0 Specification under "connected".

### Device.Connectivity.UsbDevices.TestedUsingMicrosoftUsbStack

*USB devices must be tested with Microsoft's xHCI Stack installed.*

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

All USB Devices (Low, Full, High, and Super Speed devices) must be tested with Microsoft's Extensible Host Controller Interface (xHCI) Stack installed and enabled on a Windows system.

**Note:** During USB-IF self-testing a specific USB Test Stack is installed for testing purposes, this is expected and acceptable.

### Device.Connectivity.UsbDevices.UseUsbClassOnlyForControllerOrHub

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

Class USB is often used incorrectly for devices that do not have a predefined class. For example, a USB mouse uses class HID, whereas a USB smartcard uses class smartcard reader. Class USB is reserved for host controllers and root or external USB hubs. If the vendor has a device that has no Windows-defined class but uses USB as the bus, it must define its own class or class GUID. The setup class associated with the type of USB device, not with the bus type, must be used. The setup class "USB" (ClassGuid = {36fc9e60-c465-11cf-8056-444553540000}) is reserved for USB host controllers and root or external USB hubs. It must not be used for other device categories.

 
*Design Notes*

Microsoft provides system-defined setup classes for most device types. System-defined setup class GUIDs are defined in the Windows Driver Kit, "Devguid.h."
If you choose the wrong class, the device appears in an incorrect location in Device Manager and in the Windows Vista UI. Using this class incorrectly may cause the device driver to fail hardware compatibility testing.
For a list of Windows class GUIDs, see the Windows Driver Kit, "System-Supplied Device Setup Classes" at: <http://msdn.microsoft.com/en-us/library/ff553419.aspx>.

### Device.Connectivity.UsbDevices.WirelessUsbObtainsWusbLogoFromUsbif

*Wireless USB device or host must obtain a Certified Wireless USB logo from the USB-IF.*

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

All Wireless USB devices must get a Certified Wireless USB Logo from the USB-IF.

### Device.Connectivity.UsbDevices.WirelessUsbWiMediaAlliace

*Certified Wireless USB device or host must pass all required WiMedia Alliance compliance tests.*

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

Wireless USB device must pass WiMedia Alliance radio compliance tests.

<a name="device.connectivity.usbdevices.usbc"></a>
## Device.Connectivity.UsbDevices.USBC

> [!WARNING]
> Certification for Windows Server 2016, Azure Stack, and SDDC must continue to meet the Windows Hardware Compatibility Requirements as stated in version 1607 of documentation, must use [version 1607 of the HLK (build 14393)](https://go.microsoft.com/fwlink/p/?LinkID=404112) with [matching playlist](http://aka.ms/hlkplaylist) and supplemental content to generate logs, and must follow policies as stated in the [Windows Server Policy document](https://go.microsoft.com/fwlink/p/?linkid=834831). Questions about the Azure Stack or SDDC programs or how to submit the results for solution validation should be directed to the appropriate Microsoft technical account manager or partner management contact.

### Device.Connectivity.UsbDevices.USBC.UsbifCertification

*USB devices must either pass USB IF tests or be USB IF certified.*

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

USB devices must pass USB Implementers Forum (IF) tests or be USB-IF certified.

USB-C PD-capable devices, hubs, and chargers must implement version 1.1 of the USB Type-C spec or higher and revision 2.0 v1.1 of the PD spec or higher, and must use PD silicon that is certified according to the USB-IF’s USB-C product testing matrix.

For more information, see the white paper on Windows Logo Kit USB-IF Testing:

-   <http://www.microsoft.com/whdc/connect/usb/wlk-usb-if-testing.mspx>

### Device.Connectivity.UsbDevices.USBC.USBTypeCAltModeCertification

*USB Type-C Alternate Mode devices are certified with their respective organizations.*

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

If a USB Type-C device supports an Alternate Mode Standard and the industry group that owns that Standard has a corresponding certification for it, the device must use PD silicon that is certified by that industry group in addition to the USB-IF.

For example, if a USB Type-C device’s PD silicon supports DisplayPort Alternate Mode in addition to USB and PD, then that silicon must be certified by VESA for the DisplayPort functionality, in addition to the USB-IF for USB and PD functionality.

Certification for vendor-specific Alternate Modes is not required.

### Device.Connectivity.UsbDevices.USBC.USBTypeCCertifiedCables

*USB Type-C Devices that ship with cables ship with certified cables*

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

If a device is USB Type-C and ships with a cable or an adapter, the cable and/or adapter must be USB-IF certified.

In addition, if the USB Type-C cable or adapter is used for an Alternate Mode Standard and the industry group that owns that Standard has a corresponding certification, the cable or adapter must get that certification.

### Device.Connectivity.UsbDevices.USBC.USBTypeCAltModeDeviceCompat

*USB Type-C Alternate Mode Device Compatibility*

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

An Alternate Mode device that only has a single USB port that connects to the downstream facing port (DFP) must also provide USB functionality equivalent to its Alternate Mode.

For example, a Thunderbolt Alternate Mode USB-C storage device must also be able to function as a USB mass storage device over USB 2.0 or USB 3.0.

Note: Alternate Mode adapters are not required to provide USB functionality equivalent to its Alternate Mode. For example, a DisplayPort or MHL Alternate Mode USB-C adapter is not required to also support a video protocol that works over USB 2.0 or USB 3.0.

