---
title: Functions
description: Functions
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: d449cc0e-82fd-484f-8ca6-56a430489e08
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Functions


This section covers the functions available in the Kernel Trace Control API.

## In This Section


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[CreateMergedTraceFile](createmergedtracefile.md)</p></td>
<td><p>Merges multiple WPT/ETW trace files into a single output file.</p></td>
</tr>
<tr class="even">
<td><p>[StartHeapTrace](startheaptrace.md)</p></td>
<td><p>Registers and starts a heap tracing session for a set of specified PIDs. Enables stack walking for certain heap events such as allocation or deletion using this function.</p></td>
</tr>
<tr class="odd">
<td><p>[StartKernelTrace](startkerneltrace.md)</p></td>
<td><p>Registers and starts a kernel event tracing session.</p></td>
</tr>
<tr class="even">
<td><p>[UpdateHeapTrace](updateheaptrace.md)</p></td>
<td><p>Updates an existing heap tracing session with a new set of PIDs, stackwalking events, or other ETW session changes.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Kernel Trace Control API Reference](kernel-trace-control-api-reference.md)

 

 







