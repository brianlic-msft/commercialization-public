---
title: Device.Input.HID
Description: 'All HID devices connected over I2C must comply with Microsoft HID I2C Protocol specification.'
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
# Device.Input.HID

 - [Device.Input.HID](#device.input.hid)
-->

<a name="device.input.hid"></a>
## Device.Input.HID

### Device.Input.HID.I2CProtocolSpecCompliant

*All HID devices connected over I2C must comply with Microsoft HID I2C Protocol specification.*

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

All HID over I2C compatible devices must comply with the Microsoft published documentation for the HID I2C protocol specification.

*Design Notes*

See Microsoft published HID I2C protocol specification (link not provided yet)

Exceptions:
This requirement is only enforced for HID I2C devices and not generalized for SPB.

### Device.Input.HID.UsbSpecificationCompliant

*All HID devices that are connected over USB must comply with the USB HID Specification (V1.1 or later).*

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

Version 5: Defines WMC AQ requirements

-   For WMC AQ, this requirement is:

	-   REQUIRED for desktop systems

	-   REQUIRED for laptop systems if laptop system includes remote and receiver.

-   For non AQ systems, this requirement is:

	-   REQUIRED if system (either desktop or laptop) includes remote and receiver.<br/><br/>

-   IR receivers (input only) and IR transceivers (input and IR emitting/learning) interface with the Windows Media Center class driver. In a system with a TV tuner, IR Transceivers must be used that support all functions of the *Remote Control and Receiver-Transceiver Specifications and Requirements for Windows Media Center in Windows Operating Systems* document.

-   For tunerless systems with an IR receiver, only IR Input and wake functions are required. The IR learning and emitting functions are optional.

-   DVB-T solutions are not required to support learning and emitting. These functions are optional.

-   In locales that do not use set top boxes, the learning and emitting functions are optional.

-   In those regions that support a secondary 10 foot application, the IR receiver/transceivers are not required to meet the IR learning requirement.

-   In those regions that support DVB-S, Microsoft strongly recommends the use of IR transceivers (input and IR emitting/learning).

-   If shipping a laptop system, IR learning and IR emitting is optional.

-   For IR receivers (input only) that use Microsoft authorized IR protocols and all IR Transceiver (input and emitter functions), the device will return an IR waveform envelope to software for software decoding of IR signal. An IR signal cannot be decoded in the hardware. The only exception to this is the "wake-from-remote" power key.

-   An IR receiver (input only) is allowed to perform hardware decoding of an IR signal. These IR receivers (input only) must not receive and respond to any currently authorized Microsoft IR protocol. IR receivers that use hardware decoding of an IR signal also need to support the "wake-from-remote" functionality. These devices must comply with the Remote *Control and Receiver-Transceiver Specifications and Requirements for Windows Media Center in Windows Operating Systems* document.

*Design Notes*

Microsoft recommends that IR cables be labeled and well documented for end users. An insert showing a small diagram of the IR control cable and how it connects to the digital cable or satellite receiver could help prevent support calls.

