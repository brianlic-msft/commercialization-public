---
title: THERMAL\_WAIT\_READ structure
description: The THERMAL\_WAIT\_READ struct is used as the input buffer by the IOCTL\_THERMAL\_READ\_TEMPERATURE IOCTL control code.
MS-HAID:
- 'cstandby.thermal\_wait\_read'
- 'p\_weg\_hardware.thermal\_wait\_read'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 4EB9199A-BD40-4599-A6F3-F3E03ED1DFB0
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# THERMAL\_WAIT\_READ structure


The **THERMAL\_WAIT\_READ** struct is used as the input buffer by the [IOCTL\_THERMAL\_READ\_TEMPERATURE](ioctl-thermal-read-temperature.md) IOCTL control code.

## Syntax


<table>
<colgroup>
<col width="100%" />
</colgroup>
<thead>
<tr class="header">
<th>C++</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><code>typedef struct _THERMAL_WAIT_READ {   </code></p>
<p><code>       ULONG Timeout;</code></p>
<p><code> ULONG LowTemperature;</code></p>
<p><code> ULONG HighTemperature;</code></p>
<p><code>} THERMAL_WAIT_READ, *PTHERMAL_WAIT_READ;</code></p></td>
</tr>
</tbody>
</table>

 

## Members


**Timeout**

The time to wait before returning temperature data, in milliseconds. 0 indicates the temperature should be read immediately, with no wait. -1 indicates the read should not time out.

**LowTemperature**

The lower threshold for returning the new temperature given in tenths degrees Kelvin. As soon as the temperature drops below the low temperature threshold, the driver should complete the IOCTL. If the temperature is already below the low temperature, the IOCTL should be completed immediately.

**HighTemperature**

The upper threshold for returning the new temperature given in tenths degrees Kelvin. As soon as the temperature rises above the high temperature threshold, the driver should complete the IOCTL. If the temperature is already above the high temperature, the IOCTL should be completed immediately.

## Related topics


[Thermal Management in Windows](thermal-management-in-windows.md)

[Thermal Management Datatypes](thermal-management-datatypes.md)

[Thermal Management IOCTLs](thermal-management-ioctls.md)

 

 







