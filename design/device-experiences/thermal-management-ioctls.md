---
title: Thermal Management IOCTLs
description: This topic discusses the input/output controls (IOCTLs) that are used for Thermal Management in Windows.
MS-HAID:
- 'cstandby.thermal\_management\_ioctls'
- 'p\_weg\_hardware.thermal\_management\_ioctls'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 0B767145-1132-467C-8077-AF913844D7DD
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Thermal Management IOCTLs


This topic discusses the input/output controls (IOCTLs) that are used for Thermal Management in Windows.

Driver implementers need to implement responses to the following input/output (I/O) control codes.

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
<td><p>[IOCTL_THERMAL_READ_POLICY](ioctl-thermal-read-policy.md)</p></td>
<td><p>The [IOCTL_THERMAL_READ_POLICY](ioctl-thermal-read-policy.md) I/O control request is sent by the kernel to a thermal zone’s policy driver to read the drivers' preferred policy.</p></td>
</tr>
<tr class="even">
<td><p>[IOCTL_THERMAL_READ_TEMPERATURE](ioctl-thermal-read-temperature.md)</p></td>
<td><p>The [IOCTL_THERMAL_READ_TEMPERATURE](ioctl-thermal-read-temperature.md) I/O control request is sent by the ACPI driver to a temperature sensor driver. Upon receiving this request, the driver might be required to provide the temperature of the thermal zone.</p></td>
</tr>
</tbody>
</table>

 

 

 






