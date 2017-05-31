---
title: Protocol Implementation
description: This section provides guidelines for Touchscreen protocol implementation. Windows Touchscreen devices are expected to use the Human Interface Device (HID) protocol to communicate with the host.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 00FC87E0-68AF-475B-B5C7-5B4EA7CB8AC6
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

#  Protocol Implementation


This section provides guidelines for Touchscreen protocol implementation. Windows Touchscreen devices are expected to use the Human Interface Device (HID) protocol to communicate with the host.

A good understanding of the HID protocol is needed to be able to understand the information presented here. See the following resources for information about the HID protocol:

-   [Device Class Definition for Human Interface Devices (HID) Version 1.11](http://www.usb.org/developers/hidpage#class-definitions)
-   [HID Usage Tables Version 1.12](http://www.usb.org/developers/hidpage#hid-usage)
-   [HID Over I2C Protocol Specification Version 1.0](https://msdn.microsoft.com/library/windows/hardware/Dn642101.aspx)

Windows includes a HID class driver and corresponding HID I²C, HID USB and HID BTH miniport drivers. So there is no need to develop 3rd-party drivers for Windows Touchscreen devices that use one of these buses (unless you are developing or using a 3rd-party bus controller). Just be aware that using a bus that is different from the ones listed, might result in the need for a third party miniport driver to expose the Touchscreen as a HID device to Windows.

You only need to report the usages that are described in this section, in the firmware for your Windows Touchscreen device. Windows will use your firmware and its own HID drivers to enable touch and gesture capabilities for your device, and give Windows applications access to your device.

It is important to note that only touch solutions that use Microsoft inbox drivers are considered compatible. Any solutions that use 3rd-party drivers (either miniport or filter drivers) cannot apply for compatibility.

A sample descriptor is provided in [Sample Report Descriptors](touchscreen-sample-report-descriptors.md).

## In this section


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Topic</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>[Required HID Descriptors](touchscreen-required-hid-descriptors.md)</p></td>
<td><p>This topic presents the required HID descriptors (and device attributes) for a Windows Touchscreen device in Windows 10 and later operating systems.</p></td>
</tr>
<tr class="even">
<td><p>[Required HID Top-Level Collections](touchscreen-required-hid-top-level-collections.md)</p></td>
<td><p>This topic discusses the required HID top-level collections that are used for Touchscreen reporting in Windows 10 and later operating systems.</p></td>
</tr>
<tr class="odd">
<td><p>[Packet Reporting Modes](touchscreen-packet-reporting-modes.md)</p></td>
<td><p>This topic provides information about the packet reporting modes for a Windows Touchscreen device in Windows 10.</p></td>
</tr>
<tr class="even">
<td><p>[Sample Report Descriptors](touchscreen-sample-report-descriptors.md)</p></td>
<td><p>This topic presents a sample report descriptor and a sample descriptor excerpt for a Windows Touchscreen device.</p></td>
</tr>
</tbody>
</table>

 

 

 






