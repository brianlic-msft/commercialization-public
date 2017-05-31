---
title: Camera power management modes
description: Describes the power management modes that must be supported in the off-System on a Chip (SoC) and on-System on a Chip (SoC) components of the camera subsystem.
MS-HAID:
- 'cstandby.camera\_power\_management\_modes'
- 'p\_weg\_hardware.camera\_power\_management\_modes'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: D49565DE-4648-4AC4-BBAC-25F23A07AF6A
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Camera power management modes


The off-System on a Chip (SoC) components of the camera subsystem must support two power management modes. The camera components must support an active mode in which the camera device is actively streaming content to an application. In addition, the camera components must support a power-removed mode in which the camera device is turned off, power is removed, and the camera device consumes zero watts. The following table describes the active and power-removed power management modes for the camera device.

<table style="width:100%;">
<colgroup>
<col width="16%" />
<col width="16%" />
<col width="16%" />
<col width="16%" />
<col width="16%" />
<col width="16%" />
</colgroup>
<thead>
<tr class="header">
<th>Mode</th>
<th>Description</th>
<th>Device power state (Dx)</th>
<th>Average power consumption</th>
<th>Exit latency to active</th>
<th>Transition mechanism</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Active (streaming)</p></td>
<td><p>The camera device is actively streaming content to an application. The content might be full-motion, preview, or still photo capture.</p></td>
<td><p>Yes</p></td>
<td><p>Sensor, AF, and flash-specific.</p></td>
<td><p>N/A</p></td>
<td><p>Software-initiated D0 transition.</p>
<p>(An application has initiated streaming by setting the state of a capture pin to KSSTATE_ACQUIRE.)</p></td>
</tr>
<tr class="even">
<td><p>Power - removed</p></td>
<td><p>The camera device is not streaming content to any applications. No context is preserved on the camera sensor, the flash device, or the auto-focus engine.</p></td>
<td><p>Yes</p></td>
<td><p>0 watts</p></td>
<td><p>&lt; 200 milliseconds to first frame (See note following table.)</p></td>
<td><p>Software-initiated D3 transition.</p>
<p>(The state of all streaming pins has been set to any value other than KSSTATE_RUN.)</p></td>
</tr>
</tbody>
</table>

 

**Note**  Windows expects the transition time from the active mode to the power-removed mode (the off latency) to be less than 100 milliseconds. Most power management effort is focused on reducing the transition time from power-removed mode to active mode (the on latency).

 

The same two power management modes, active and power-removed, must be supported by the on-SoC image processing units. The SoC vendor defines the individual components that comprise the image processing units and their power management states. We recommend that a single driver control the on-SoC image processing units, and that all the image processing units for camera capture be presented to the power engine plug-in (PEP) as a single power-managed component.

 

 






