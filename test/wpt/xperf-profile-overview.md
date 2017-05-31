---
title: Xperf Profile Overview
description: Xperf Profile Overview
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 2de4bf4a-eb88-4dd9-a91d-2b049ce9cd49
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Xperf Profile Overview


A trace profile is a collection of settings about a specific type of trace. These profiles are not compatible for recording with Windows Performance Recorder (WPR). You can gather and control these settings with a single command per operation. Most profiles are one of these two types: memory-based or file-based. Select the profile that matches the mechanism that you use for tracing: writing to a buffer in memory or writing to a file.

The following table describes the types of sessions.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Session Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>InSequentialFile sessions</p></td>
<td><p>These sessions are saved into a file sequentially, extending it until a preset maximum file size is reached. This behavior maps to the ETW sequential mode.</p></td>
</tr>
<tr class="even">
<td><p>InBuffer sessions</p></td>
<td><p>These sessions save data in memory, overwriting the oldest data with the most recent data when the buffer is full. These sessions must be saved to a snapshot file for analysis. This behavior maps to the ETW buffering mode.</p></td>
</tr>
</tbody>
</table>

 

**Note**  
The file modes cannot be combined.

 

## Related topics


[Xperf Profiles](xperf-profiles.md)

[Sessions](sessions.md)

[Providers](providers.md)

 

 







