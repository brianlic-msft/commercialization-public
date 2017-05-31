---
title: Device.BusController.Bluetooth
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

# Device.BusController.Bluetooth

 - [Device.BusController.Bluetooth.Base](#device.buscontroller.bluetooth.base)
 - [Device.BusController.Bluetooth.NonUSB](#device.buscontroller.bluetooth.nonusb)
 - [Device.BusController.Bluetooth.USB](#device.buscontroller.bluetooth.usb)

<a name="device.buscontroller.bluetooth.base"></a>
## Device.BusController.Bluetooth.Base

### Device.BusController.Bluetooth.Base.4LeSpecification

*Bluetooth controllers must support the Bluetooth 4.0 specification requirements.*

<table>
<tr>
<th>Applies to   </th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

These requirements are "If Implemented" for Client systems and apply only if a Client system supports Bluetooth.

*The Bluetooth controller must comply with the Basic Rate (BR) and Low Energy (LE) Combined Core Configuration Controller Parts and Host/Controller Interface (HCI) Core Configuration requirements outlined in the Compliance Bluetooth Version 4.0 specifications.*

*“The Bluetooth radio HW shall be qualified as a “Controller Subsystem” and may additionally be qualified as a “Component” through the Bluetooth Special Interest Group.” *

### Device.BusController.Bluetooth.Base.LeStateCombinations

*Bluetooth controllers must support a minimum set of LE state combinations.*

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

The Bluetooth controller must allow the spec LE state combinations (as allowed in section \[Vol 6\] Part B, Section 1.1.1 of the Bluetooth version 4.0 spec): Only the following states are not required to be supported:

-   0x0000000000800000 Active Scanning State and Initiating State combination supported.

-   0x0000000004000000 Passive Scanning state and Slave Role combination supported.

-   0x0000000008000000 Active Scanning state and Slave Role combination supported.

### Device.BusController.Bluetooth.Base.LeWhiteList

*Bluetooth controllers must support a minimum LE white list size of 25 entries.*

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

The Bluetooth controller must support a minimum of 25 entries in its white list for remote Low Energy (LE) devices.

### Device.BusController.Bluetooth.Base.MicrosoftBluetoothStack

*Bluetooth controllers must be tested using Microsoft's Bluetooth stack.*

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

The Bluetooth controllers must be tested with Microsoft's Bluetooth stack when submitting for hardware certification.

### Device.BusController.Bluetooth.Base.HCIExtensions (If Implemented)

*Microsoft defined HCI extensions support for hardware offload of advertisement and RSSI monitoring.*

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

Radios that support the Microsoft defined Bluetooth HCI extensions must comply with the specification and pass the related HLK tests. The details of the specifications are located on MSDN. See link below

[https://msdn.microsoft.com/en-us/library/windows/hardware/dn917903.aspx.](https://msdn.microsoft.com/en-us/library/windows/hardware/dn917903.aspx)

### Device.BusController.Bluetooth.Base.NoBluetoothLEFilterDriver

*Bluetooth LE filter drivers are not allowed to load on BTHLEENUM.SYS.*

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

To ensure a uniform experience across Windows Store Apps using the Bluetooth LE (GATT) WinRT API, filter drivers shall not be loaded on BTHLEENUM.SYS.

### Device.BusController.Bluetooth.Base.OnOffStateControllableViaSoftware

*Bluetooth controllers’ On/Off state must be controllable via software.*

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

When turning the radio “off”, Bluetooth controllers shall be powered down to its lowest supported power state and no transmission/reception shall take place. Windows will terminate Bluetooth activity by unloading the inbox protocol drivers and their children, submitting the HCI\_Reset command to the controller, and then setting the controller to the D3 logical power state, allowing bus drivers to power down the radio as appropriate. The radio can be completely powered off if a bus-supported method is available to turn the radio back on. No additional vendor software control components will be supported.

On turning the radio back on, the Windows Bluetooth stack shall resume the device to D0, allowing bus drivers to restart the device. The Windows Bluetooth stack shall then reinitialize the Bluetooth components of the controller.

Bluetooth Radio Management in Windows 8.1 shall only be enabled for internal Bluetooth 4.0 controllers.

### Device.BusController.Bluetooth.Base.Scatternet

*Bluetooth host controller must support Bluetooth scatternet.*

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

The Bluetooth host controller must support at least two concurrent piconets (also known as a scatternet). The host controller must also be able to allow the host to join a device that is requesting a connection to the existing piconet when the local radio is the master of that piconet. This requirement is described in the Specification of the Bluetooth System, Version 2.1 + Enhanced Data Rate (EDR) (Baseband Specification), Section 8.6.6. 

Design Notes: The scatternet support should follow the enhanced scatternet support errata that are defined by the Bluetooth Special Interest Group (SIG).

### Device.BusController.Bluetooth.Base.SimultaneousBrEdrAndLeTraffic

*Bluetooth controllers must support simultaneous BR/EDR and LE traffic.*

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

Bluetooth controllers must allow the simultaneous use of both Basic Rate (BR)/Enhanced Data Rate (EDR) and Low Energy (LE) radios.

### Device.BusController.Bluetooth.Base.SpecificInformationParameters

*Bluetooth host controller must implement specific Informational parameters to provide accurate information about the host controller's capabilities.*

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

The manufacturer fixes the informational parameters, which provide valuable information about the Bluetooth device and the capabilities of the host controller. Bluetooth host controllers must implement the HCl\_Read\_Local\_Version\_Information command and HCI\_Read\_Local\_Supported\_Features command as described in the Specification of the Bluetooth System, Version 2.1 + Enhanced Data Rate (EDR), Part E, Section 7.4. Required support includes the mechanism for reporting the supported version and features.

### Device.BusController.Bluetooth.Base.SupportsBluetooth21AndEdr

*Bluetooth controllers must support the Bluetooth 2.1+EDR specification requirements.*

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

The Bluetooth host controller must comply with the requirements that are outlined in the Specification of the Bluetooth System Version 2.1 + Enhanced Data Rate (EDR).

### Device.BusController.Bluetooth.WidebandSpeech (If Implemented)

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

Wideband speech enables high definition voice quality (audio is sampled at 16 KHz as opposed to only 8 KHz) for telephony audio on Windows devices when the user is communicating via a Bluetooth peripheral that also supports wideband speech.

What this means is that Bluetooth radios must support wideband speech in the hardware as defined by the Bluetooth SIG [Hands-Free Profile (HFP) 1.6 specification](https://www.bluetooth.org/docman/handlers/downloaddoc.ashx?doc_id=238193) and the [Core Specification Addendum (CSA) 2](https://www.bluetooth.org/docman/handlers/downloaddoc.ashx?doc_id=245127) which is included in the [Core Version 4.1](https://www.bluetooth.org/DocMan/handlers/DownloadDoc.ashx?doc_id=282159) Bluetooth specification. At a minimum it must use at least one Bluetooth SIG defined wideband speech codec (currently mSBC).

**Business Justification:**

We want users to experience the best possible quality audio when using Bluetooth peripherals on Windows. Wideband speech is becoming a standard for peripherals that support the HFP profile. Our competition already supports it

<a name="device.buscontroller.bluetooth.nonusb"></a>
## Device.BusController.Bluetooth.NonUSB

*Bluetooth Controller - NonUSB connected radios *

### Device.BusController.Bluetooth.NonUSB.Performance

*Non-USB Bluetooth controllers must achieve at least a throughput of 700 kbps.*

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

Non-USB Bluetooth controllers must achieve at least a throughput of 700 kbps at the RFCOMM layer.

### Device.BusController.Bluetooth.NonUSB.ScoSupport

*Non-USB connected Bluetooth controllers must use the sideband channel for SCO.*

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

In order to ensure a high quality audio experience, all non-USB connected Bluetooth controllers must use a sideband channel for SCO (e.g., SCO over an I2S/PCM interface).

<a name="device.buscontroller.bluetooth.usb"></a>
## Device.BusController.Bluetooth.USB

*Bluetooth Controller - USB connected radios*

### Device.BusController.Bluetooth.USB.ScoDataTransportLayer

*Bluetooth host controllers must support the SCO data transport layer as specified in the Bluetooth 2.1+EDR specifications.*

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

The Bluetooth host controller must comply with the Synchronous Connection Oriented (SCO)-USB requirements that are outlined in the specification of the Bluetooth System, Version 2.1 + Enhanced Data Rate (EDR), Part A, Section 3.5.
