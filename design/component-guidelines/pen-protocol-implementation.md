---
title: Protocol Implementation
description: This section provides guidelines for pen protocol implementation. Integrated Windows pen devices are expected to use the Human Interface Device (HID) protocol to communicate with the host.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 38FA8176-9EEA-4B52-A230-73D462D4F208
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Protocol Implementation


This section provides guidelines for pen protocol implementation. Integrated Windows pen devices are expected to use the Human Interface Device (HID) protocol to communicate with the host.

A good understanding of the HID protocol is needed to be able to understand the information presented here. See the following resources for information about the HID protocol:

-   [Device Class Definition for Human Interface Devices (HID) Version 1.11](http://www.usb.org/developers/hidpage#Class_Definitions)
-   [HID Usage Tables Version 1.12](http://www.usb.org/developers/hidpage#HID_Usage)
-   [HID Over I2C Protocol Specification Version 1.0](https://msdn.microsoft.com/library/windows/hardware/Dn642101.aspx)

Windows includes a HID class driver and corresponding HID I²C, HID USB and HID BTH miniport drivers. So there is no need to develop 3rd-party drivers for integrated Windows pen devices that use one of these buses. In fact, the Windows 10 Hardware Lab Kit (HLK) doesn't even allow the testing of 3rd-party drivers for Windows pen devices that connect via one of the buses mentioned previously. However, if you want to use a 3rd-party bus controller, or develop your own to use with your Windows pen device, you can do that.

If you want your pen device to connect via an alternate bus, then a 3rd-party HID mini-port driver might be required, and would be allowed according to the Windows 10 HLK requirements. You only need to report the usages described in this topic, in the firmware for your integrated Windows pen device. Windows will use your firmware and its own HID drivers to enable pen and inking capabilities for your device, and also provide Windows applications access to your device.

A sample descriptor is provided in the [Sample Report Descriptors](pen-sample-report-descriptors.md) topic.

## In this section


<table>
<thead valign="bottom">
<tr class="header">
<th>Topic</th>
<th>Description</th>
</tr>
</thead>
<tbody valign="top">
<tr class="odd">
<td><p>[Required HID Descriptors](required-hid-descriptors.md)</p></td>
<td><p>This topic presents the required HID descriptors (and device attributes) for a Windows pen device in Windows 10 and later operating systems.</p></td>
</tr>
<tr class="even">
<td><p>[Required HID Top-Level Collections](required-hid-top-level-collections.md)</p></td>
<td><p>This topic discusses the required HID top-level collections that are used for pen reporting in Windows 10 and later operating systems.</p></td>
</tr>
<tr class="odd">
<td><p>[Windows Pen States](windows-pen-states.md)</p></td>
<td><p>This topic discusses the pen states for a Windows pen device in Windows 10 and later operating systems.</p></td>
</tr>
<tr class="even">
<td><p>[Sample Report Descriptors](pen-sample-report-descriptors.md)</p></td>
<td><p>This topic presents a sample report descriptor and some sample descriptor excerpts for a Windows pen device.</p></td>
</tr>
</tbody>
</table>
