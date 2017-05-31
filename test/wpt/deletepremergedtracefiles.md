---
title: DeletePreMergedTraceFiles
description: DeletePreMergedTraceFiles
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 6c9424dd-6ec3-4835-af18-541cec28da76
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DeletePreMergedTraceFiles


Indicates whether to delete premerged event trace log (ETL) files.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[TraceMergeProperties](tracemergeproperties.md)&gt;

          &lt;[TraceMergeProperty](tracemergeproperty.md)&gt;

               &lt;**DeletePreMergedTraceFiles**&gt;

## Syntax


``` syntax
<DeletePreMergedTraceFiles Value = boolean>
</DeletePreMergedTraceFiles>
```

## Attributes and Elements


### Attributes

<table>
<colgroup>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
</colgroup>
<thead>
<tr class="header">
<th>Attribute</th>
<th>Description</th>
<th>Data type</th>
<th>Required</th>
<th>Default</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>Value</strong></p></td>
<td><p>Indicates whether to delete premerged ETL files.</p></td>
<td><p>boolean</p></td>
<td><p>No</p></td>
<td><p>true</p></td>
</tr>
</tbody>
</table>

 

### Child Elements

None.

### Parent Elements

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Element</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>[TraceMergeProperty](tracemergeproperty.md)</p></td>
<td><p>Contains configurations that are applied when recordings from multiple profiles are merged.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Elements](elements.md)

 

 







