---
title: FileCompression
description: FileCompression
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: fcc2cd71-7246-40f5-ba9c-2ba79b8ffdfc
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# FileCompression


Indicates whether the ETL file is compressed. This element is for internal use only.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[TraceMergeProperties](tracemergeproperties.md)&gt;

          &lt;[TraceMergeProperty](tracemergeproperty.md)&gt;

               &lt;**FileCompression**&gt;

## Syntax


``` syntax
<FileCompression = Value boolean>
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
<td><p>Indicates whether the ETL file is compressed.</p></td>
<td><p>Boolean.</p></td>
<td><p>No</p></td>
<td><p></p></td>
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
<td><p>Contains configurations that are applied when recordings from multiple profiles are merged. This element is for internal use only.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Elements](elements.md)

 

 







