---
title: Built-in Recording Profiles
description: Built-in Recording Profiles
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: dd2ca0ee-4a15-4d25-8911-8a349e9c8cae
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Built-in Recording Profiles


Windows Performance Recorder (WPR) includes built-in profiles that you can use to specify the kind of recording that WPR makes. You can access the built-in profiles from the WPR user interface (UI) by using the **More Options** menu.

You can also add custom profiles to WPR. For more information, see [Authoring Recording Profiles](authoring-recording-profiles.md) and [Add or Remove a Custom Recording Profile](add-or-remove-a-custom-recording-profile.md).

## Resource Analysis Profiles


The following table describes the built-in profiles that record resource analysis.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Profile name</th>
<th>Recording</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>CPU usage</strong></p></td>
<td><p>CPU utilization for each CPU on the system</p></td>
</tr>
<tr class="even">
<td><p><strong>Disk I/O activity</strong></p></td>
<td><p>All disk I/O activity</p></td>
</tr>
<tr class="odd">
<td><p><strong>File I/O activity</strong></p></td>
<td><p>All file I/O activity</p></td>
</tr>
<tr class="even">
<td><p><strong>Registry I/O activity</strong></p></td>
<td><p>All changes to the registry</p></td>
</tr>
<tr class="odd">
<td><p><strong>Networking I/O activity</strong></p></td>
<td><p>All networking I/O activity</p></td>
</tr>
<tr class="even">
<td><p><strong>Heap usage</strong></p></td>
<td><p>All allocations and de-allocations from the heap for the specified process</p></td>
</tr>
<tr class="odd">
<td><p><strong>Pool usage</strong></p></td>
<td><p>Pool allocations and de-allocations</p></td>
</tr>
<tr class="even">
<td><p><strong>VirtualAlloc usage</strong></p></td>
<td><p>All virtual allocations</p></td>
</tr>
<tr class="odd">
<td><p><strong>Power usage</strong></p></td>
<td><p>Power utilization and idle and sleep states</p></td>
</tr>
<tr class="even">
<td><p><strong>GPU activity</strong></p></td>
<td><p>Graphics Processing Unit (GPU)-specific events, such as GPU utilization</p></td>
</tr>
<tr class="odd">
<td><p><strong>Handle usage</strong></p></td>
<td><p>Usage of handles</p></td>
</tr>
<tr class="even">
<td><p><strong>XAML activity</strong></p></td>
<td><p>Events from XAML-related providers</p></td>
</tr>
<tr class="odd">
<td><p><strong>HTML activity</strong></p></td>
<td><p>Events from HTML-related providers, such as Internet Explorer and JavaScript</p></td>
</tr>
<tr class="even">
<td><p><strong>Desktop composition activity</strong></p></td>
<td><p>All desktop composition activity</p></td>
</tr>
<tr class="odd">
<td><p><strong>Resident Set analysis</strong></p></td>
<td><p>All changes to the resident set</p></td>
</tr>
</tbody>
</table>

 

## Scenario Analysis Profiles


The following table describes the built-in profiles that record specific scenarios.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Profile</th>
<th>Recording</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>Audio glitches</strong></p></td>
<td><p>All glitches that occur during streaming audio</p></td>
</tr>
<tr class="even">
<td><p><strong>Video glitches</strong></p></td>
<td><p>All glitches that occur during streaming video</p></td>
</tr>
<tr class="odd">
<td><p><strong>Internet Explorer</strong></p></td>
<td><p>Windows Internet Explorer performance</p></td>
</tr>
<tr class="even">
<td><p><strong>Minifilter I/O activity</strong></p></td>
<td><p>Minifilter I/O activity</p></td>
</tr>
<tr class="odd">
<td><p><strong>XAML application analysis</strong></p></td>
<td><p>XAML app-related activity</p></td>
</tr>
<tr class="even">
<td><p><strong>HTML application analysis</strong></p></td>
<td><p>HTML app-related activity</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Recording Profiles](recording-profiles.md)

 

 







