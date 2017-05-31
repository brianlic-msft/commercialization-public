---
title: Power and battery subsystem checklist
description: System designers can use the checklists included in this section to verify that their platform designs and system firmware follow the Windows guidelines for power and battery subsystem operation.
MS-HAID:
- 'cstandby.power\_and\_battery\_subsystem\_checklist'
- 'p\_weg\_hardware.power\_and\_battery\_subsystem\_checklist'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 89094E28-F72B-4817-80DC-C416F05A4FB9
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Power and battery subsystem checklist


System designers can use the checklists included in this section to verify that their platform designs and system firmware follow the Windows guidelines for power and battery subsystem operation. Each item in a checklist specifies whether the requirement applies to PCs that implement the traditional ACPI S3 and S4 power states, and/or to PCs that implement the modern standby power model.

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
<td><p>[Power and battery user experience requirements](power-and-battery-user-experience-requirements.md)</p></td>
<td><p>The checklist in this article contains requirements that the power supply and battery subsystem must meet to achieve a satisfactory overall user experience.</p></td>
</tr>
<tr class="even">
<td><p>[ACPI firmware implementation requirements](acpi-firmware-implementation-requirements.md)</p></td>
<td><p>The checklists in this article contain requirements that the ACPI platform firmware must meet to properly support the power and battery subsystem.</p></td>
</tr>
<tr class="odd">
<td><p>[Platform hardware implementation requirements](platform-hardware-implementation-requirements.md)</p></td>
<td><p>Windows supports two hardware topologies for the power and charging subsystem. For S3/S4-based systems, only embedded controller-based solutions are allowed. For modern standby systems, the system designer can choose between an embedded controller-based solution and an SPB-based solution. This topic describes the requirements for each of the two topologies. A system must comply with the requirements for the selected topology only.</p></td>
</tr>
</tbody>
</table>

 

 

 






