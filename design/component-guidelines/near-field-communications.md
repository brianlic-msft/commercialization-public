---
title: Near Field Communications
description: Near Field Communications
MS-HAID:
- 'p\_weg\_hardware.near\_field\_proximity\_\_nfp\_nfc\_'
- 'p\_weg\_hardware.near\_field\_communications'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 629D1C23-5293-4F51-8E96-12B42E728440
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Near Field Communications


## Required, recommended, and optional near field proximity features


This topic covers recommendations for near field communications (NFC) in Windows 10. The following table lists required, recommended, and optional near field proximity features.

<table>
<thead valign="bottom">
<tr>
<th>Feature</th>
<th>Remarks</th>
</tr>
</thead>
<tbody valign="top">
<tr class="even">
<td>Bus</td>
<td><p>Refer to Hardware Configurations.</p>
<p>[SPB API support using I²C, SPI or UART](simple-peripheral-bus--spb-.md)</p></td>
</tr>
<tr class="odd">
<td>Antenna</td>
<td><p>Antenna dimensions can vary, as long as the effective actuation successfully connects at a range of 0 cm to 2 cm, is allowed but not required to connect at a range of 2 cm to 10 cm, and is prohibited to connect at a range greater than 10 cm (required).</p>
<p>An antenna dimension of 40 mm x 60 mm is known to best achieve these results, but other configurations are acceptable as long as they meet the range of actuation requirements that enable the Windows scenarios (recommended).</p>
<p>An antenna should be placed according to form factor along with the official NFC Forum N-Mark to indicate antenna location.</p></td>
</tr>
<tr class="even">
<td>Implementation</td>
<td>Compliant with the guidance in [NFC Design Guide](http://go.microsoft.com/fwlink/p/?LinkID=625066) (required).</td>
</tr>
<tr class="odd">
<td>Reliability</td>
<td><ul>
<li>[NFP] 95% success rate without errors based on 100 consecutive session attempts with 5 second intervals (required).</li>
<li>[Smart Card Reader] 95% success rate without errors based on 100 consecutive connection attempts with 5 second intervals (required).</li>
<li>[HCE] 95% success rate without errors based on 100 consecutive connection attempts with 5 second intervals (required).</li>
<li>[UICC] 95% success rate without errors based on 100 consecutive connection attempts with 5 second intervals (required).</li>
</ul></td>
</tr>
<tr class="even">
<td>Near field proximity</td>
<td>Near Field Communication defined by NFC Forum (required). A NFP provider must support the creation of sessions within 0.5 seconds from the point of being detected within the effective operating volume (required).</td>
</tr>
<tr class="odd">
<td>PC/SC Smart Card Reader</td>
<td>Required feature on all platforms.</td>
</tr>
<tr class="even">
<td>Radio Manager</td>
<td>Required feature on all platforms. Must implement the interface to match the defined commands from the Microsoft NFC Radio Manager.</td>
</tr>
<tr class="odd">
<td>Host Card Emulation (HCE)</td>
<td>Required on Windows 10 Mobile.</td>
</tr>
<tr class="even">
<td>UICC Secure Element</td>
<td>This is an optional feature and is supported only on Windows 10 Mobile.</td>
</tr>
</tbody>
</table>

 

Hardware must comply with the Windows HLK requirements for near field proximity, including but not limited to accuracy, resolution, antenna placement, use of the Tap and Do visual mark, and range of values.

## Near field proximity Tap and Do experiences


The Windows near field proximity services and APIs provide a standard way for devices and PCs to connect and communicate with each other through Windows. While other near field proximity technologies are supported, we recommend Near Field Communication (NFC), working in conjunction with Bluetooth, Wi-Fi, and Wi-Fi Direct as out-of-band transports.

Near field proximity enables new [Tap and Do](http://go.microsoft.com/fwlink/p/?LinkId=625070) experiences for PC to PC, mobile phone to PC, and PC to tag interaction. The design supports scenarios that are interpersonal in nature, between two people holding different devices; it also works when one user is holding two devices.

<table>
<tbody valign="top">
<tr class="odd">
<td>Tap and Use, Tap and Launch, Tap and Acquire</td>
<td><ul>
<li>Tap the PC to another PC or a mobile phone to connect two apps if both apps are already running.</li>
<li>If the app isn't running on the other computer, the user is invited to launch the app.</li>
<li>If the app isn't installed on the other computer, the user is invited to install it from the Windows Store.</li>
<li>Tap a PC to a tag to launch the app specified in the tag. If the app isn't installed, the user is invited to install it from the Store.</li>
</ul></td>
</tr>
<tr class="even">
<td>Tap and Share, Tap and Receive</td>
<td><ul>
<li>Tap a PC to another PC or mobile phone to share content such as a URL, photos, or documents to the other user.</li>
<li>Tap a PC to another PC, mobile phone, or a tag to receive content from the other user or the tag.</li>
</ul></td>
</tr>
<tr class="odd">
<td>Tap and Setup, Tap and Reconnect</td>
<td><ul>
<li>Tap a Bluetooth device that supports out-of-band unidirectional pairing to the PC to pair it and set it up.</li>
<li>Tap the Bluetooth device again to the PC to re-pair it if it had previously been paired with another device, and lost its pairing relationship with the PC.</li>
</ul></td>
</tr>
</tbody>
</table>

 

Hardware must comply with the [Windows Hardware Lab Kit (HLK)](https://msdn.microsoft.com/library/windows/hardware/dn930814.aspx) requirements for near field proximity, including but not limited to accuracy, resolution, antenna placement, use of the Tap and Do visual mark, and range of values.

## Firmware


Enumerate the device through ACPI.

## Driver details


Near field proximity devices use IHV developed drivers. The drivers must comply with the guidance in [Proximity Devices Design Guide](http://go.microsoft.com/fwlink/?LinkId=237135). IHV developed drivers must pass the tests for validating near field proximity functionality such as the Windows HLK tests.

## Mechanical


Antenna placement is critical for providing the best user experience and providing a consistent tap interaction between devices. Adding the [NFC Forum’s N-Mark](http://go.microsoft.com/fwlink/p/?LinkId=625072) on the device so the user knows where to tap devices together helps users discover and align the antenna, helping them complete the scenarios in the intended way. Additionally, Windows provides sound feedback during the Tap and Do experience.

The table below describes the location for the antenna by form factor.

<table>
<thead valign="bottom">
<tr class="header">
<th>Form Factor</th>
<th>Antenna Location and Considerations</th>
</tr>
</thead>
<tbody valign="top">
<tr class="odd">
<td>Tablet</td>
<td><p>Place the NFC loop antenna near the surface of the device, not in the middle, with proper shielding to insure sufficient actuation volume (required).</p>
<p>Place in the upper right-hand quadrant seen from the user holding the device to support the most natural interaction (recommended).</p></td>
</tr>
<tr class="even">
<td>Convertible</td>
<td><p>Please use your best sense of judgement for convertible style systems.</p></td>
</tr>
<tr class="odd">
<td>Clamshell</td>
<td><p>Place the NFC loop antenna to the right of the touch pad, under the touch pad or under the right palm rest with proper shielding to ensure sufficient actuation volume (recommended).</p></td>
</tr>
<tr class="even">
<td>All-in-One</td>
<td><p>Place the NFC loop antenna on the front of device (for example, bezel area) (recommended).</p></td>
</tr>
<tr class="odd">
<td>Desktop</td>
<td><p>If you are placing the NFC loop antenna on the chassis for a desktop, we recommend that the loop be placed on the top of the chassis near the edge. It is preferable to include the NFC chip in the keyboard or provide an external USB dongle.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Simplifying wireless and network device discovery and pairing](http://channel9.msdn.com/events/BUILD/BUILD2011/HW-286T)

[Designing Systems and Developing Drivers for NFC](http://channel9.msdn.com/events/BUILD/BUILD2011/HW-269T)

[Connecting and Sharing with Near Field Communication](http://channel9.msdn.com/events/BUILD/BUILD2011/PLAT-270T)

[Proximity Devices](http://go.microsoft.com/fwlink/?LinkId=227340)

[Supporting proximity and tapping (JavaScript)](http://go.microsoft.com/fwlink/?LinkId=227339)

[Proximity and tapping (C#)](http://msdn.microsoft.com/library/windows/apps/hh465221.aspx)

[Proximity Devices Design Guide](http://go.microsoft.com/fwlink/?LinkId=237135)

[Windows Hardware Compatibility Program](../compatibility/index.md)

[Minimum hardware requirements](../minimum/minimum-hardware-requirements-overview.md)

[NFC Devices](https://msdn.microsoft.com/library/windows/hardware/dn905575)

 

 







