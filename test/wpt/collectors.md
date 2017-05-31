---
title: Collectors
description: Collectors
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: e94d9c16-0aa7-4af3-80df-5ef086e74293
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Collectors


Represents a collection of system collector identifiers, event collector identifiers, and optionally heap event collector identifiers.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[Profiles](profiles.md)&gt;

          &lt;[Profile](profile-wpr.md)&gt;

               &lt;**Collectors**&gt;

## Syntax


``` syntax
<Collectors Operation = "Set" | "Add" | “Remove” >

  <!-- Child elements -->
  SystemCollectorId,
  EventCollectorId,
  HeapEventCollectorId

</Collectors>
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
<td><p><strong>Operation</strong></p></td>
<td><p>Indicates whether collectors should be set or added.</p></td>
<td><p>This attribute can have one of the following values:</p>
<ul>
<li><p>Set</p></li>
<li><p>Add</p></li>
<li><p>Remove</p></li>
</ul></td>
<td><p>No</p></td>
<td><p>Set</p></td>
</tr>
</tbody>
</table>

 

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
<td><p>[SystemCollectorId](systemcollectorid.md)</p></td>
<td><p>Represents a system collector identifier.</p></td>
<td><p>Optional, zero or 1. There must be at least one collector, either system or event.</p></td>
</tr>
<tr class="even">
<td><p>[EventCollectorId](eventcollectorid.md)</p></td>
<td><p>Represents an event collector identifier.</p></td>
<td><p>Optional, zero or more. There must be at least one collector, either system or event.</p></td>
</tr>
<tr class="odd">
<td><p>[HeapEventCollectorId](heapeventcollectorid.md)</p></td>
<td><p>Represents a heap event collector identifier.</p></td>
<td><p>Optional, zero or more.</p></td>
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
<td><p>[Profile](profile-wpr.md)</p></td>
<td><p>Represents a collection of problem categories and collectors.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Elements](elements.md)

 

 







