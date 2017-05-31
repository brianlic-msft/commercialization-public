---
title: Platform hardware implementation requirements
description: Windows supports two hardware topologies for the power and charging subsystem.
MS-HAID:
- 'cstandby.platform\_hardware\_implementation\_requirements'
- 'p\_weg\_hardware.platform\_hardware\_implementation\_requirements'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 725D77D5-67BB-48F0-A9D4-303F4C400F3C
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Platform hardware implementation requirements


Windows supports two hardware topologies for the power and charging subsystem. For S3/S4-based systems, only embedded controller-based solutions are allowed. For modern standby systems, the system designer can choose between an embedded controller-based solution and an SPB-based solution. This topic describes the requirements for each of the two topologies. A system must comply with the requirements for the selected topology only.

Each of the following two tables contains a checklist of requirements for the designated hardware topology. For each requirement in the checklist, the column marked "Applies to S3/S4" indicates whether the requirement applies to PCs that implement the traditional ACPI S3 and S4 power states. The column marked "Applies to CS" indicates whether the requirement applies to PCs that implement the modern standby power model, which is supported starting with Windows 8.

For more information about these two hardware topologies, see [Battery and power subsystem hardware design](battery-and-power-subsystem-hardware-design.md).

## Embedded controller-based solution


If the platform designer chooses to use an embedded-controller based solution, the requirements that are listed in the following table apply.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Requirement</th>
<th>Applies to S3/S4</th>
<th>Applies to CS</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>The embedded controller (EC) is defined in the ACPI namespace as described in section 12.11 of the ACPI 5.0 specification.</strong></p></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td><p></p>
<ul>
<li>Device() object for the EC is present in the ACPI namespace.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p><strong>EC device provides the following control methods and objects:</strong></p></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td><p></p>
<ul>
<li>_HID with a value of &quot;PNP0C09&quot;.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p></p>
<ul>
<li>_CRS object denoting the I/O resources for the embedded controller.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p></p>
<ul>
<li>_GPE object that defines the SCI for the embedded controller.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p></p>
<ul>
<li>An operation region describing the information contained within the embedded controller that can be accessed by other ACPI control method code in the namespace, including battery status and information methods.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p><strong>Embedded controller solution meets power goals.</strong></p></td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td><p></p>
<ul>
<li>Nominal power consumed by the EC for power and battery subsystem is below 5 milliwatts.</li>
</ul></td>
<td><p>No</p></td>
<td><p>Yes</p></td>
</tr>
</tbody>
</table>

 

## Simple peripheral bus (SPB)-connected solution


If the platform designer chooses to use an SPB-connected power and battery subsystem solution, the requirements that are listed in the following table apply. This solution is supported starting with Windows 8, but only on modern standby systems.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Requirement</th>
<th>Applies to S3/S4</th>
<th>Applies to CS</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>The embedded controller (EC) is defined in the ACPI namespace as described in section 12.11 of the ACPI 5.0 specification.</strong></p></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td><p></p>
<ul>
<li>Device() object for the EC is present in the ACPI namespace.</li>
</ul></td>
<td><p>No</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p><strong>EC device provides the following control methods and objects:</strong></p></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td><p></p>
<ul>
<li>_HID with a value of &quot;PNP0C09&quot;.</li>
</ul></td>
<td><p>No</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p></p>
<ul>
<li>_CRS object denoting the I/O resources for the GPIO controller.</li>
</ul></td>
<td><p>No</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p></p>
<ul>
<li>For each interrupt, an _AEI object that maps the GPIO to the corresponding ACPI event method.</li>
</ul></td>
<td><p>No</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p><strong>A Device() node for the SPB controller.</strong></p></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td><p></p>
<ul>
<li>_HID with the appropriate hardware ID for the device.</li>
</ul></td>
<td><p>No</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p></p>
<ul>
<li>_CSR object describing the interrupt and hardware resources of the GPIO controller.</li>
</ul></td>
<td><p>No</p></td>
<td><p>No</p></td>
</tr>
<tr class="even">
<td><p></p>
<ul>
<li>A GenericSerialBus operation region within the scope of the SPB device describing the virtual command registers for the SPB device.</li>
</ul></td>
<td><p>No</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p></p>
<ul>
<li>Field definitions within the GenericSerialBus operation region. The field definitions allow ASL code outside of the SPB device to access the virtual command registers for the SPB device.</li>
</ul></td>
<td><p>No</p></td>
<td><p>Yes</p></td>
</tr>
</tbody>
</table>

 

 

 






