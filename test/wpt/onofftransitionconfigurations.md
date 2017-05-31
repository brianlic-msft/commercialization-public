---
title: OnOffTransitionConfigurations
description: OnOffTransitionConfigurations
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 7046c6c0-8e74-47a1-a4ce-47a7dc5a43c0
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# OnOffTransitionConfigurations


Represents a collection of on/off transitions.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;**OnOffTransitionConfigurations**&gt;

## Syntax


``` syntax
<OnOffTransitionConfigurations>

  <!-- Child elements -->
  OnOffTransitionConfiguration

</OnOffTransitionConfigurations>
```

## Attributes and Elements


### Attributes

None.

### Child Elements

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Element</th>
<th>Description</th>
<th>Requirement</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>[OnOffTransitionConfiguration](onofftransitionconfiguration.md)</p></td>
<td><p>Represents an on/off transition configuration.</p></td>
<td><p>Required, exactly 1.</p></td>
</tr>
</tbody>
</table>

 

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
<td><p>[WindowsPerformanceRecorder](windowsperformancerecorder.md)</p></td>
<td><p>Represents metadata about the authoring of the profile.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Elements](elements.md)

 

 







