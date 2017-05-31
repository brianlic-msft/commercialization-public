---
title: Device.Connectivity.BluetoothDevices
Description: 'Requirements for devices that connect to the computer via Bluetooth.'
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
# Device.Connectivity.BluetoothDevices

 - [Device.Connectivity.BluetoothDevices](#device.connectivity.bluetoothdevices)
-->

<a name="device.connectivity.bluetoothdevices"></a>
## Device.Connectivity.BluetoothDevices

*Devices that connect to the PC via Bluetooth.*

### Device.Connectivity.BluetoothDevices.BluetoothDeviceIdProfileVer13

*Devices which support Bluetooth must implement the Device ID (DI) profile version 1.3 or Device Information Service (DIS), as applicable.*

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

Bluetooth PC peripherals must include the Device ID record as specified in the Device ID profile, version 1.3, for BR/EDR Bluetooth or the Device Information Service (DIS), version 1.1, Bluetooth LE.

### Device.Connectivity.BluetoothDevices.BluetoothHidLimitedDiscoverableMode

*Bluetooth HID devices must be discoverable only in Limited Discoverable Mode.*

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

Bluetooth HID devices must be discoverable only in Limited Discoverable Mode.

### Device.Connectivity.BluetoothDevices.ComplementarySubsystemList

*Bluetooth wireless technology subsystem end product must list Windows operating system in its complementary subsystem list.*

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

The Bluetooth subsystem end product must list the Windows operating system in the complementary subsystem list as described in Bluetooth Qualification Program Reference Document, Version 2.1, Section 6.1, "Bluetooth Subsystems."

### Device.Connectivity.BluetoothDevices.HidInitiatedReconnect

*HID devices that support Bluetooth must support HID-initiated re-connect.*

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

The HIDReconnectInitiate attribute (defined in Bluetooth HID Profile, 1.0, Section7.11.5, "HIDReconnectInitiate") must be enabled. To automatically reconnect to the host if the connection is dropped, the device must enter the page mode.

### Device.Connectivity.BluetoothDevices.KeyboardsSupportPasskeyAuthentication

*Bluetooth keyboards that implement Secure Simplified Pairing must support the Passkey authentication method.*

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

Keyboards that implement Secure Simplified Pairing must support the Passkey authentication method.

### Device.Connectivity.BluetoothDevices.SupportBluetooth21

*Devicesthat support Bluetooth must implement the Bluetooth 2.1 requirements.*

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

The Bluetooth devices must comply with the Bluetooth 2.1 + EDR requirements outlined in Bluetooth Version 2.1 + EDR specifications.

