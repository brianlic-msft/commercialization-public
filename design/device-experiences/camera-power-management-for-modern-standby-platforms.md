---
title: Camera power management for modern standby platforms
description: Outlines various aspects of camera power management for modern standby platforms.
MS-HAID:
- 'cstandby.camera\_power\_management\_for\_connected\_standby\_platforms'
- 'p\_weg\_hardware.camera\_power\_management\_for\_modern\_standby\_platforms'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: da3fc709-960d-4ea7-9ffc-8a1fd647a586
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Camera power management for modern standby platforms


The cameras in modern mobile platforms allow users to capture still and motion video of their surroundings, and to use video and audio to communicate with other users over the Internet. The general goal of power management for a camera device can be described simply—the camera subsystem must be powered off, consuming zero watts, unless the camera is in active use.

When the camera is actively being used to stream video to an application, the camera sensor and related components should be powered on. Windows enables the camera hardware to be turned off during modern standby by suspending any foreground Windows Store apps that might be streaming data from the camera device. Windows makes no provisions for the use of camera devices while the system is in modern standby, so a camera device can be used only when the display is turned on.

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
<td><p>[Camera subsystem](camera-subsystem.md)</p></td>
<td><p>Describes the requirements of the camera subsystem in managing camera power on modern standby platforms.</p></td>
</tr>
<tr class="even">
<td><p>[Camera hardware topology overview](camera-hardware-topology-overview.md)</p></td>
<td><p>Provides an overview of camera hardware topology.</p></td>
</tr>
<tr class="odd">
<td><p>[Camera power management modes](camera-power-management-modes.md)</p></td>
<td><p>Describes the power management modes that must be supported in the off-System on a Chip (SoC) and on-SoC components of the camera subsystem.</p></td>
</tr>
<tr class="even">
<td><p>[Software power management mechanisms for cameras](software-power-management-mechanisms-for-cameras.md)</p></td>
<td><p>Both the on-SoC image processing units and the off-SoC camera components are expected to consume no power (zero watts) when the system is in connected standby and the display is turned off. The primary software mechanism for power management is reference counting of the camera capture pin.</p></td>
</tr>
<tr class="odd">
<td><p>[Supported hardware power configuration](supported-hardware-power-configuration.md)</p></td>
<td><p>Windows supports a single hardware power management configuration for camera devices in modern standby platforms. In short, each camera sensor must be connected to the SoC via a MIPI-CSI link, and can optionally be connected to an I2C bus and to one or more GPIO pins. The camera sensor device, its optional flash, and any other off-SoC camera components must be placed on a power rail that can be switched on and off by ACPI firmware.</p></td>
</tr>
<tr class="even">
<td><p>[Camera power management checklist](camera-power-management-checklist.md)</p></td>
<td><p>System integrators, camera sensor vendors, and SoC vendors should use the checklist in this article to ensure that their system power management design is compatible with Windows 10.</p></td>
</tr>
</tbody>
</table>

 

 

 






