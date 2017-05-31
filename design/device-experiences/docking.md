---
title: Docking
description: Provides guidance on wired and wireless docking scenarios.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 9a7c246a-1efe-4079-b166-ba959bc7edd2
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Docking


To enable fast, seamless connections between desktops and mobile devices to external equipment, Windows 10 supports single cable docking and wireless docking. Interoperability is the key goal of the docking recommendations included here. These recommendations comprise both system and dock recommendations to ensure that a user can confidently dock their desktop system devices and their mobile system devices.

A dock is a device that is intended to enhance the productivity of a system. At a minimum, a dock has the followiing capabilities:

1. Contains a display-out option or a built-in monitor
2. Allows the user to connect to external peripheral devices

The dock manufacturer is responsible for properly advertising and marketing the type of display and peripheral devices that are supported by the dock.

## Wired docking


A wired docking configuration uses a single connection to a dock. The connection is either through a cable or a device to an adjacent dock attachment. The dock provides ports for input devices, such as mice and keyboards, and for output devices like displays and printers. Better docking equipment provides a power connection, for both use and charging of the device, and a wired network connection.

Wired docking features to consider:

-   Use of a single cable from the device to the dock
-   Support for phone, tablet, and laptops
-   Wired or wireless mouse and keyboard input
-   Multiple connections on the dock
-   Monitor outputs using HDMI, DisplayPort, or both
-   A power connection to the device
-   An Ethernet port

### Overall recommendations

The device-to-dock connection should be USB Type-C. The introduction of the USB Type-C connector allows us to truly reach a single-cable solution that supports docks, displays, data devices, and power for the majority of portable systems (phones, tablets, and laptops). We expect the largest changes in the wired docking space to be around USB Type-C alternate modes, with minor changes coming with updates of graphics standards.

USB Type-C introduced the concept of alternate modes (protocols other than USB over a symmetrical and reversible Type-C connector and cable), but because this technology is still “young,” we expect to see other alternate modes defined in the future. As more alternate modes are added, we will continue to reevaluate our USB Type-C recommendations.

Currently, we are recommending that DisplayPort over Type-C be used as the alternate mode for docks and displays. Although we do allow docks and displays to use other USB Type-C alternate modes, these devices must be able to fall back to the DisplayPort over Type-C alternate mode to ensure interoperability. For example, Thunderbolt 3 docks and displays must still work when the dock or display is connected to a system that only supports DisplayPort over Type-C alternate mode.

Additionally, Windows 10, version 1607 supports Indirect Display over USB, so any dock that supports Indirect Display over USB must also have a fallback to DisplayPort. Indirect Display is a simple user-mode driver model to support monitors that are not connected to traditional graphics processing unit (GPU) display outputs. An example would be a USB dongle connected to a PC that has a regular Video Graphics Array (VGA), Digital Visual Interface (DVI), High-Definition Multimedia Interface (HDMI), or DisplayPort monitor attached to it. The Indirect Display interface works over all USB ports, including Type A and Type-C (with and without alternate mode). For more information about Indirect Display, see [Indirect Display Driver Model Overview](https://docs.microsoft.com/en-us/windows-hardware/drivers/display/indirect-display-driver-model-overview).

As HDMI and DisplayPort protocol specifications mature, our recommendations will change to take advantage of new features.

#### Wired docking system recommendations

All systems should meet at least the [minimum hardware requirements](../minimum/minimum-hardware-requirements-overview.md) and the [Windows Hardware Compatibility Specifications](../compatibility/index.md). In addition to these requirements, we recommend that systems work with docks built to the wired docking recommendations. This section covers what additionally is needed on the system side.

<table>
<tbody>
<tr>
  <th align="left" valign="top">System connection to the dock</th>
  <td>The system should include at least one USB Type-C port that supports USB Host or USB Dual Role/USB On-The-Go (OTG). All USB Type-C ports should include support for the following:
    <ul>
      <li>USB Data, with <a href="http://www.usb.org/developers/ssusb">USB 3.1 Gen 2</a> being optimal</li>
      <li><a href="http://www.usb.org/developers/powerdelivery/">USB Power Delivery (PD)</a> power sink to allow systems to charge using USB-C from dock, so that a user only needs to connect one wire to their system to be productive for several hours</li>
      <li><a href="https://www.vesa.org/wp-content/uploads/2016/10/USB-DevDays-DisplayPort-Alternate-Mode-2016-final4.pdf">DisplayPort Alternate Mode</a>, pin assignment C, D, E, and F, with support for High Bit Rate (HBR) and High Bit Rate 2 (HBR2) signaling on those pin assignments, and the ability to source DisplayPort on at least two DisplayPort lanes for all supported pin assignments</li>
    </ul>
    <p>For systems with multiple USB Type-C ports, we recommend that all ports support the specifications above. If the specifications are not supported by all of the included USB Type-C ports, we recommend that these ports be visually differentiable to the user as defined in the <a href="http://www.usb.org/developers/logo_license/USB-IF_TLA_and_Logo_Usage_Guidelines_FINAL_March_13.2017.pdf">USB-IF Trademark License Agreement</a> under the section “Logo Guidelines for USB Type-C Products and Cables that Support Alternate Modes.”</p>
    <p>If you plan on including an alternate mode other than DisplayPort over USB Type-C alternate mode, review the fallback requirements in the [Overall recommendations](#overall-recommendations) section above.</p>
    <p>For more information about implementing USB Type-C, see <a href="https://msdn.microsoft.com/en-us/library/windows/hardware/mt595926.aspx">Developing Windows drivers for USB Type-C connectors</a> on MSDN.</p>
  </td>
</tr>
<tr>
  <th align="left" valign="top">RAM</th>
  <td>The system should have at least 2 GB of RAM.</td>
</tr>
<tr>
  <th align="left" valign="top">Flash storage</th>
  <td>The system should have at least 16 GB of nonremovable flash memory.</td>
</tr>
<tr>
  <th align="left" valign="top">Audio/video latency</th>
  <td>Audio or video latency should not exceed 80 milliseconds.</td>
</tr>
</tbody>
</table>

#### Wired dock (device) recommendations

The end goal of these docking recommendations is to maximize compatibility and interoperability. For docks that support other USB Type-C alternate modes (such as Thunderbolt 3), we strongly recommend they also support the following specifications in addition to ensure interoperability with all systems. These recommendations are in addition to the [Windows Hardware Compatibility Specifications](../compatibility/index.md).

<table>
<tbody>
<tr>
  <th align="left" valign="top">Dock connection to the system</th>
  <td>We recommend that the dock connect to the system by using USB Type-C. At a minimum, the dock's USB Type-C connector should support the following features:
    <ul>
      <li>USB Data (<a href="http://www.usb.org/developers/ssusb">USB 3.1 Gen 2</a>) to enable USB-connected peripheral devices</li>
      <li><a href="http://www.usb.org/developers/powerdelivery/">USB Power Delivery (PD)</a> power provider for charging a system while it is docked, with a minimum power of 30W, following the PD power rules (see section 10 of the Power Delivery specification); for additional information, see the "Power budget policy" section</li>
      <li>USB Type-C <a href="https://www.vesa.org/wp-content/uploads/2016/10/USB-DevDays-DisplayPort-Alternate-Mode-2016-final4.pdf">DisplayPort Alternate Mode</a>, pin assignments C and D, with support for HBR and HBR2 signaling on those pin assignments (and pin assignments E and F, if supported), and the ability to sink DisplayPort on at least two DisplayPort lanes for all supported pin assignments</li>
    </ul>
    <p>If you plan on including an alternate mode other than DisplayPort over USB Type-C alternate mode, review the fallback requirements in the [Overall recommendations](#overall-recommendations) section above.</p>
  </td>
</tr>
<tr>
  <th align="left" valign="top">Dock (downstream) I/O ports</th>
  <td>The downstream device I/O ports between a dock and other peripheral devices should always interoperate with any system that meets the system docking requirements.
  <ul>
    <li>For peripheral device connectivity, a combination of at least three USB Type-A and/or USB Type-C 3.1 Gen 2 ports
      <ul>
        <li>The USB Type-C ports should provide a minimum of 15W to devices through USB Type-C current, and optionally USB PD; see the Power Budget Policy Section.</li>
        <li>The USB Type-A ports should provide either 2.5, 4.5, or 7.5 W to devices according to the port type defined in the USB Battery Charging 1.2 standard; see the Power Budget Policy Section.</li>
      </ul>
    </li>
    <li>USB Type-C power input; see the "Power" recommendation</li>
    <li>Ethernet connectivity (optional), to ensure that you choose a USB Ethernet adapter that works on mobile devices</li>
    <li>Audio output port (optional)</li>
    <li>An external monitor connection, if the dock does not include a built-in monitor (see the "Display output" recommendation)</li>
  </ul>
  </td>
</tr>
<tr>
  <th align="left" valign="top">Power</th>
  <td>For the power input to the dock, we have the following recommendations:
    <ul>
      <li>The power input port should be a USB Type-C port.</li>
      <li>If the power input port is a USB Type-C port and cannot be used to connect to the host system or to other devices, it should be clearly marked so that the user can easily determine that it is the power input port.</li>
      <li>If the power adapter that ships with the dock is a USB Type-C power adapter, it must follow the PD Power Rules (see Section 10 of the <a href="http://www.usb.org/developers/powerdelivery/">Power Delivery specification</a>). For example, a 36W supply must support the following contracts: 15V/2.4A, 9V/3A, and 5V/3A.</li>
      <li>The power adapter that ships with the dock should budget enough power to charge the system connected to the dock along with other downstream devices connected to the dock, according to the following guidelines:
        <ul>
          <li>For the upstream USB-C host, budget a minimum of 30W (15V/2A).</li>
          <li>For each downstream USB-C port, budget 15W (5V/3A).</li>
          <li>For each downstream USB-A 2.0 port, budget 2.5W (5V/0.5A).</li>
          <li>For each downstream USB-A 3.0 port, budget 4.5W (5V/0.9A).</li>
          <li>For each downstream USB-A charging downstream port, budget 7.5W (5V/1.5A).</li>
        </ul>
        <p>For example, if a dock has a USB-C port for the host (30W), two USB-A 3.0 ports (2 x 4.5W), and a USB-A charging downstream port (7.5W), the power adapter should budget at least 46.5W.</p>
      </li>
      <li>The dock’s upstream Type-C port that connects to the host should be capable of performing data and power role swaps, and it should request to be a PD power source when it is connected to the host.</li>
      <li>The dock’s upstream Type-C port that connects to the host should support fast role swap so that functionality provided by connected devices is not interrupted when external power is connected or disconnected.</li>
    </ul>
  </td>
</tr>
<tr>
  <th align="left" valign="top">Power budget policy</th>
  <td>A dock’s power budget is the total amount of power that the dock can provide to the connected host and connected devices. The dock can receive its power budget from a combination of internal sources and external sources (for example, a battery and a power adapter, respectively). A power budget policy is required to allocate power in a consistent manner if the total power requirements of the connected host and connected devices exceeds the dock’s power budget, such as if a 30W charger is connected to the dock that is connected to a PC that is requesting 27W, while a device is requesting 15W.

  <p>The following are recommendations for the power budget policy:</p>
  <ul>
    <li>If a host is charging from the dock and a device is connected that would cause the dock’s total power budget to be exceeded, the dock should determine whether the amount of power needed by the connected device can be satisfied by reducing the amount of power provided to the host.
      <ol>
        <li>If the answer to the question is yes, reduce the amount of power provided to the host by the amount needed to meet the power requirements of the connected device, and notify the host accordingly.
          <ul>
            <li>The PD power rules may cause the voltage offered to the host to be reduced and/or cause the host to stop charging from the dock altogether.</li>
            <li>Later, if the dock’s power budget is increased, or if another device is disconnected allowing the dock to reclaim some power, the dock should allocate that power back to the host and notify it accordingly.</li>
          </ul>
        </li>
        <li>If the answer to question is no, do not provide any power to the connected device. Later, if the dock’s power budget is increased, or if another device is disconnected allowing the dock to reclaim some power, the dock should redetermine whether it can allocate sufficient power to the connected device that was not initially powered.</li>
      </ol>
    </li>
    <li>If a host is not already charging from the dock and charging the host would exceed the dock’s total power budget, the dock should allow the host to enumerate the dock and the connected devices on the dock as normal, and the dock should keep providing power to the connected devices instead of charging the host. Later, if the dock’s power budget is increased, or if another device is disconnected allowing the dock to reclaim some power, the dock should redetermine whether it can allocate sufficient power to charge the host.</li>
    <li>In general, docks should avoid sinking power from hosts. However, if the dock is not connected to external power, it can attempt to sink power from the host so that its connected devices can function.</li>
  </ul>
  </td>
</tr>
<tr>
  <th align="left" valign="top">Display output</th>
  <td>The connection from the dock to an external monitor should be provided by at least one digital connector that is at a minimum either HDMI 1.4 or DisplayPort 1.2 (supporting DP++). However, if the device is a docking display (that is, the dock and the monitor are in the same device), it is optional to include an additional display output to enable a multimonitor experience. The resolution supported should at a minimum be 1080p, regardless of whether the display is externally connected through an external video port or is internally connected to the display.
    <p>If you plan on including an alternate mode other than DisplayPort, review the fallback requirements in the [Overall recommendations](#overall-recommendations) section above.</p>
  </td>
</tr>
<tr>
  <th align="left" valign="top">Audio output</th>
  <td>If the dock has one or more 3.5 mm audio output jacks, a minimum of stereo outputs need to be supported at 16 bits / 44.1 kHz format. Audio support in the dock must comply with the USB Audio Device Class 2 specification and implement jack insertion detection as outlined in the specification.</td>
</tr>
<tr>
  <th align="left" valign="top">Audio/video latency</th>
  <td>The audio and video latency of devices attached either through USB (or for audio through a 3.5 mm jack) should not exceed 40 milliseconds.</td>
</tr>
<tr>
  <th align="left" valign="top">Touchpad (optional)</th>
  <td>If the dock has an embedded touchpad, the touchpad needs to be a precision touchpad (PTP). We recommend that IHVs follow the <a href="https://msdn.microsoft.com/en-us/library/windows/hardware/mt604177(v=vs.85).aspx">PTP implementation guide</a> to create PTPs that are on par with traditional laptop PTPs. The <a href="https://msdn.microsoft.com/en-us/library/windows/hardware/mt604198(v=vs.85).aspx">Device Integration</a>, <a href="https://msdn.microsoft.com/en-us/library/windows/hardware/mt604199(v=vs.85).aspx">Experience Customization</a>, and <a href="https://msdn.microsoft.com/en-us/library/windows/hardware/mt604201(v=vs.85).aspx">Module Design for HLK Requirements</a> sections in the implementation guide describe the best practices for creating a touchpad that is superior aesthetically and experience-wise.</td>
</tr>
</tbody>
</table>
All these recommendations are in addition to the touchpad requirements detailed in the [minimum hardware requirements](../minimum/minimum-hardware-requirements-overview.md).

## Wireless docking


Like a wired dock, a wireless dock has ports for input and output peripherals. The connection to the device is wireless only. The dock does not provide power or a wired network connection to the device.

Wireless docking features to consider:

-   A wireless connection from the device to the dock
-   Support for phone, tablet, and laptops
-   Wired or wireless mouse and keyboard input
-   Monitor outputs using HDMI, DisplayPort, or both

### Wireless dock discovery

Windows 10 will discover, pair, connect, and manage docks.

### Recommendations

-   Include Wifi-Display (Miracast) extensions in receiver firmware.
-   Support WSB and MA-USB.
-   Support WiGig for enterprise class docking equipment.

## Related topics

[Windows support for USB Type-C connectors](https://msdn.microsoft.com/library/windows/hardware/mt628692)
<br/>[Continuum](continuum.md)