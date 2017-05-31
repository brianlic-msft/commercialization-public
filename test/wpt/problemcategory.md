---
title: ProblemCategory
description: ProblemCategory
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 93db9658-1b8a-4713-8cac-702034d017d3
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# ProblemCategory


Represents a problem category for the profile. This element is for internal use only.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[Profiles](profiles.md)&gt;

          &lt;[Profile](profile-wpr.md)&gt;

               &lt;[ProblemCategories](problemcategories.md)&gt;

                    &lt;**ProblemCategory**&gt;-

## Syntax


``` syntax
<ProblemCategory Value = "First Level Triage" | "CPU" | "Storage" ...>
</ProblemCategory>
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
<td><p>Describes the type of problem.</p></td>
<td><p>This attribute can have one of the following values:</p>
<ul>
<li><p>First Level Triage</p></li>
<li><p>CPU</p></li>
<li><p>Storage</p></li>
<li><p>Network</p></li>
<li><p>Memory</p></li>
<li><p>Multimedia</p></li>
<li><p>Energy</p></li>
<li><p>On/Off Transition</p></li>
</ul></td>
<td><p>Yes</p></td>
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
<td><p>[ProblemCategories](problemcategories.md)</p></td>
<td><p>Represents a collection of problem categories.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Elements](elements.md)

 

 







