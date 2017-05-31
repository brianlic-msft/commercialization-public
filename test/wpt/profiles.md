---
title: Profiles
description: Profiles
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 00b0d6dc-d14a-4c70-ab7b-4aa2250c2395
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Profiles


Represents a collection of collectors, providers, and profiles.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;**Profiles**&gt;

## Syntax


``` syntax
<Profiles>

  <!-- Child elements -->
  SystemCollector,
  EventCollector,
  HeapEventCollector,
  SystemProvider,
  EventProvider,
  HeapEventProvider,
  Profile

</Profiles>
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
<td><p>[SystemCollector](systemcollector.md)</p></td>
<td><p>Represents a system collector.</p></td>
<td><p>Optional, zero or more.</p></td>
</tr>
<tr class="even">
<td><p>[EventCollector](eventcollector.md)</p></td>
<td><p>Represents an event collector.</p></td>
<td><p>Optional, zero or more.</p></td>
</tr>
<tr class="odd">
<td><p>[HeapEventCollector](heapeventcollector.md)</p></td>
<td><p>Represents a heap event collector.</p></td>
<td><p>Optional, zero or more.</p></td>
</tr>
<tr class="even">
<td><p>[SystemProvider](systemprovider.md)</p></td>
<td><p>Represents a system provider.</p></td>
<td><p>Optional, zero or more.</p></td>
</tr>
<tr class="odd">
<td><p>[EventProvider](eventprovider.md)</p></td>
<td><p>Represents an event provider.</p></td>
<td><p>Optional, zero or more.</p></td>
</tr>
<tr class="even">
<td><p>[HeapEventProvider](heapeventprovider.md)</p></td>
<td><p>Represents a heap event provider.</p></td>
<td><p>Optional, zero or more.</p></td>
</tr>
<tr class="odd">
<td><p>[Profile](profile-wpr.md)</p></td>
<td><p>Represents a collection of problem categories and collectors.</p></td>
<td><p>Required, 1 to 4.</p></td>
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

 

## Remarks


Only a single **Profiles** element can be defined in a **WindowsPerformanceRecorder** element.

## Related topics


[Elements](elements.md)

 

 







