---
title: ACPI firmware implementation requirements
description: The checklists in this article contain requirements that the ACPI platform firmware must meet to properly support the power and battery subsystem.
MS-HAID:
- 'cstandby.acpi\_firmware\_implementation\_requirements'
- 'p\_weg\_hardware.acpi\_firmware\_implementation\_requirements'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: BA1A0057-A246-4497-A861-1861AC42F90B
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# ACPI firmware implementation requirements


The checklists in this article contain requirements that the ACPI platform firmware must meet to properly support the power and battery subsystem. For each requirement in a checklist, the column marked "Applies to S3/S4" indicates whether the requirement applies to PCs that implement the traditional ACPI S3 and S4 power states. The column marked "Applies to CS" indicates whether the requirement applies to PCs that implement the modern standby power model, which is supported starting with Windows 8.

## Power supply checklist


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
<td><p><strong>Power Source device object is present in the ACPI namespace.</strong></p></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td><p></p>
<ul>
<li>Device() object for an AC adapter/Power Source is present in the ACPI namespace.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p><strong>Power source device provides the following control methods and objects:</strong></p></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td><p></p>
<ul>
<li>Hardware ID (_HID) with a value of &quot;ACPI0003&quot;.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p></p>
<ul>
<li>Power Source (_PSR) control method to report whether the power source is currently online (AC power) or offline (battery power). All input power sources for the system must be multiplexed through this _PSR method. For example, _PSR must indicate that the power source is online if the system is powered through a DC barrel connector or a separate dock connector. Do not use multiple ACPI Power Source Devices.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
</tbody>
</table>

 

## Battery checklist


System designers should make sure that they have completed the items in the following table for each battery present in the system. For systems that have multiple batteries, the first battery in the namespace should be the primary battery for the system, for debugging purposes.

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
<td><p><strong>A Device() object for each battery device in the ACPI namespace.</strong></p></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td><p></p>
<ul>
<li>Device() object for each battery is present in the ACPI namespace.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p><strong>Each battery device provides the following control methods and objects:</strong></p></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td><p></p>
<ul>
<li>_HID with a value of &quot;PNP0C0A&quot;.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p></p>
<ul>
<li>General Status (_STA) to report to Windows whether the battery is present in a system in which the battery can be removed or the battery is located in a portable dock.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p></p>
<ul>
<li>Battery Information Extended (_BIX) to report battery static information, which includes last full charge capacity, design capacity, and cycle count.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p></p>
<ul>
<li>Battery Status (_BST) to report the current battery status, including remaining capacity, rate of drain and charging state.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p></p>
<ul>
<li>Battery Trip Point (_BTP) to enable an event-driven battery status model to reduce periodic work for polling. _BTP enables Windows to specify a threshold of remaining charge capacity at which the platform should issue a Notify(0x80) command on the battery device to notify Windows that it needs to update its battery status information.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p></p>
<ul>
<li>(Optional) Slot Unit Number (_SUN) to indicate the order in which the battery should appear in the UI.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p><strong>The _BIX method must support the following fields and constraints as described in battery static information section:</strong></p></td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td><p></p>
<ul>
<li>The Revision field must be set to 0x0.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p></p>
<ul>
<li>The Power Unit field must be set of 0x0.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p></p>
<ul>
<li>The Design Capacity and Last Full Charge Capacity values must be set to accurate values from the battery and charging subsystem and not set equal to 0xFFFFFFFF or 0x00000000.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p></p>
<ul>
<li>The Battery Technology field must be set to 0x1.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p></p>
<ul>
<li>The Design Voltage field must be set accurately and not set equal to 0x00000000 or 0xFFFFFFFF.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p></p>
<ul>
<li>The Design Capacity of Low must be set to the minimum value required to Hibernate or Shutdown the system from a fully on state.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p></p>
<ul>
<li>The Battery Capacity Granularity 1 and Battery Capacity Granularity 2 fields must be set to a value no larger than 1 percent of the battery design capacity.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p></p>
<ul>
<li>The Cycle Count field must be accurately filled in from the battery subsystem.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p></p>
<ul>
<li>The Measurement Accuracy field must be set to 80,000 or better.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p></p>
<ul>
<li>The Model Number and Serial Number fields must not be set to NULL.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p></p>
<ul>
<li>When information in _BIX, including last full charge capacity, design capacity, and cycle count changes, the platform will issue an ACPI Notify(0x81) command on the battery device.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p><strong>The _BST method must report real-time battery status.</strong></p></td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td><p></p>
<ul>
<li>All information returned by the _BST method must be obtained dynamically from the underlying power and battery charging subsystem.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p></p>
<ul>
<li>Data accuracy must be within the value of <strong>Measurement Accuracy</strong> as reported in the _BIX object.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p><strong>Support for ACPI Battery Trip Points</strong></p></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td><p></p>
<ul>
<li>A _BTP method is provided that allows Windows to specify a remaining charge capacity threshold at which the platform will issue an ACPI Notify(0x80) command on the battery device.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p></p>
<ul>
<li>The battery device issues an ACPI Notify command when the battery charge reaches the critical level.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p></p>
<ul>
<li>When the battery charge level reaches the value specified in _BIX.DesignCapacityofLow, the platform must generate a Notify(0x80) command on the Control Method Battery device.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p><strong>Implement Device Specific Methods as appropriate</strong></p></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td><p></p>
<ul>
<li>Implement the Device Specific Method (_DSM) under each battery device to indicate if the battery is user-serviceable.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p></p>
<ul>
<li>Implement the _DSM method if a periodic watchdog reset is required during charging and Windows will guarantee execution of the _BST method within the polling window for each period.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p></p>
<ul>
<li>Implement the _DSM method if the platform's thermal model requires control over the battery charging rate.</li>
</ul></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
</tr>
</tbody>
</table>

 

 

 






