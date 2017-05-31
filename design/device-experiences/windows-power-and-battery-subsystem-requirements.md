---
title: Windows power and battery subsystem requirements
description: This section describes the user experience requirements for the power and battery charging subsystem in a hardware platform that runs Windows.
MS-HAID:
- 'cstandby.windows\_power\_and\_battery\_subsystem\_requirements'
- 'p\_weg\_hardware.windows\_power\_and\_battery\_subsystem\_requirements'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 178037E0-71E1-4A58-8441-A723881AFAEE
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Windows power and battery subsystem requirements


To meet user expectations and provide a quality experience, all Windows PCs must have consistent behavior for battery charging and system power transitions. Starting with Windows 8 and Windows 8.1, this design principle extends to battery-powered hardware platforms that are based on System on a Chip (SoC) integrated circuits and that support the modern standby power model.

This section describes the user experience requirements for the power and battery charging subsystem in a hardware platform that runs Windows. It provides detailed implementation guidance for platform designers and firmware developers. They can use this information to ensure their platforms are compatible with Windows power management software.

The information in this section pertains to all processor architectures—x86, x64, and ARM—that are supported by Windows. In addition, this information applies both to low-power platforms that implement the modern standby power model and to platforms that support the traditional ACPI sleep (S3) and hibernate (S4) power states.

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
<td><p>[User experience principles for battery charging](user-experience-principles-for-battery-charging.md)</p></td>
<td><p>Outlines the five fundamental user experience principles for battery charging.</p></td>
</tr>
<tr class="even">
<td><p>[Power and charging subsystem implementation](power-and-charging-subsystem-implementation.md)</p></td>
<td><p>Describes how to implement the battery power and charging subsystem on a Windows platform.</p></td>
</tr>
<tr class="odd">
<td><p>[ACPI battery and power subsystem firmware implementation](acpi-battery-and-power-subsystem-firmware-implementation.md)</p></td>
<td><p>This topic details how the platform should expose power subsystem information to the Windows power manager.</p></td>
</tr>
<tr class="even">
<td><p>[Battery and power subsystem hardware design](battery-and-power-subsystem-hardware-design.md)</p></td>
<td><p>Explains the many factors in designing the battery and power subsystem hardware.</p></td>
</tr>
<tr class="odd">
<td><p>[Platform requirements and motivation](platform-requirements-and-motivation.md)</p></td>
<td><p>Describes the hardware requirements and motivation for the power and battery subsystem on the Windows platform.</p></td>
</tr>
<tr class="even">
<td><p>[Power and battery subsystem checklist](power-and-battery-subsystem-checklist.md)</p></td>
<td><p>System designers can use the checklists included in this section to verify that their platform designs and system firmware follow the Windows guidelines for power and battery subsystem operation.</p></td>
</tr>
</tbody>
</table>

 

 

 






