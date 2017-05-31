---
title: Time and Timestamp Formats
description: Time and Timestamp Formats
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 4ef3a58b-da6e-46cb-9655-9c81abce7b71
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Time and Timestamp Formats


Displays time and timespan formats on the command line.

``` syntax
xperf -help format
```

## Remarks


Various Xperf actions support options that take time and timespan parameters.

Time parameters are usually taken by `-range` options. Time can be read in one of the formats described in the following table.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>1234[s|ms|us|ns]</p></td>
<td><p>1234 [seconds|milliseconds|microseconds|nanoseconds] since start of the trace file.</p>
<p>The default unit is microseconds.</p></td>
</tr>
<tr class="even">
<td><p>2004/12/04:20:05:20.1234[+UTC] physical clock time.</p></td>
<td><p>All date and time components are mandatory except for the time zone. If no time zone is specified, time is assumed to be in the local time zone. (This is also the time format used by <code>-a tracestats</code>.)</p></td>
</tr>
</tbody>
</table>

 

**Note**  
Only local time zone and UTC are currently supported.

 

Timespan parameters are usually taken by options accepting resolutions. Timespans can be read in one of the formats described in the following table.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>1234[s|ms|us|ns]</p></td>
<td><p>1234 [seconds|milliseconds|microseconds|nanoseconds]</p></td>
</tr>
<tr class="even">
<td><p>20:05:20.1234</p></td>
<td><p>20 hours 5 minutes 20 seconds 123.4 milliseconds. All time components are mandatory.</p></td>
</tr>
</tbody>
</table>

 

**Note**  
Event timestamps in the Xperf trace dump are always presented in milliseconds.

 

## Related topics


[Xperf Command-Line Reference](xperf-command-line-reference.md)

 

 







