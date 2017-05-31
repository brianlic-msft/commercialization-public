---
title: EventCollectorId
description: EventCollectorId
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: a5a87699-9bd5-4ae9-9707-773ece45b4fc
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# EventCollectorId


Represents an event collector identifier.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[Profiles](profiles.md)&gt;

          &lt;[Profile](profile-wpr.md)&gt;

               &lt;[Collectors](collectors.md)&gt;

                    &lt;**EventCollectorId**&gt;

## Syntax


``` syntax
<EventCollectorId Value = IdType>

  <!-- Child elements -->
  BufferSize,
  Buffers,
  StackCaching,
  EventProviders

</EventCollectorId>
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
<td><p>Uniquely identifies the event collector.</p></td>
<td><p>String that must have at least one character and cannot contain colons (:) or spaces.</p></td>
<td><p>Yes</p></td>
<td><p></p></td>
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
<td><p>[BufferSize](buffersize.md)</p></td>
<td><p>Describes the size of each buffer, in KB.</p></td>
<td><p>Required, exactly 1.</p></td>
</tr>
<tr class="even">
<td><p>[Buffers](buffers.md)</p></td>
<td><p>Describes the number of buffers to be allocated when starting a session.</p></td>
<td><p>Required, exactly 1.</p></td>
</tr>
<tr class="odd">
<td><p>[StackCaching](stackcaching.md)</p></td>
<td><p>Describes stack caching attributes of collectors.</p></td>
<td><p></p></td>
</tr>
<tr class="even">
<td><p>[EventProviders](eventproviders.md)</p></td>
<td><p>Represents a collection of event provider identifiers and event providers.</p></td>
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
<td><p>[Collectors](collectors.md)</p></td>
<td><p>Represents a collection of system collector identifiers, event collector identifiers, and optionally heap collector identifiers.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Elements](elements.md)

 

 







