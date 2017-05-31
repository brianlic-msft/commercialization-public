---
title: BufferSize
description: BufferSize
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 2ff38035-21a6-4081-b8e7-37b6fd3b6f4e
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# BufferSize


Describes the size of each buffer, in KB.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[Profiles](profiles.md)&gt;

          &lt;[SystemCollector](systemcollector.md)&gt;

               &lt;**BufferSize**&gt;

          &lt;[EventCollector](eventcollector.md)&gt;

               &lt;**BufferSize**&gt;

          &lt;[HeapEventCollector](heapeventcollector.md)

               &lt;**BufferSize**&gt;

          &lt;[Profile](profile-wpr.md)&gt;

               &lt;[Collectors](collectors.md)&gt;

                    &lt;[SystemCollectorId](systemcollectorid.md)&gt;

                         &lt;**BufferSize**&gt;

                    &lt;[EventCollectorId](eventcollectorid.md)&gt;

                         &lt;**BufferSize**&gt;

                    &lt;[HeapEventCollectorId](heapeventcollectorid.md)&gt;

                         &lt;**BufferSize**&gt;

## Syntax


``` syntax
<BufferSize Operation = "Set" | "Add" | “Remove”
            Value     = unsignedLong>
</BufferSize>
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
<td><p>Indicates whether elements should be set or added.</p></td>
<td><p>This attribute can have one of the following values:</p>
<ul>
<li><p>Set</p></li>
<li><p>Add</p></li>
<li><p>Remove</p></li>
</ul></td>
<td><p>No</p></td>
<td><p>Set</p></td>
</tr>
<tr class="even">
<td><p><strong>Value</strong></p></td>
<td><p>Indicates the size of the buffers, in KB.</p></td>
<td><p>unsignedLong</p></td>
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
<td><p>[EventCollector](eventcollector.md)</p></td>
<td><p>Represents an event collector.</p></td>
</tr>
<tr class="even">
<td><p>[EventCollectorId](eventcollectorid.md)</p></td>
<td><p>Represents an event collector identifier.</p></td>
</tr>
<tr class="odd">
<td><p>[HeapEventCollector](heapeventcollector.md)</p></td>
<td><p>Represents a heap event collector.</p></td>
</tr>
<tr class="even">
<td><p>[HeapEventCollectorId](heapeventcollectorid.md)</p></td>
<td><p>Represents a heap event collector identifier.</p></td>
</tr>
<tr class="odd">
<td><p>[SystemCollector](systemcollector.md)</p></td>
<td><p>Represents a system collector.</p></td>
</tr>
<tr class="even">
<td><p>[SystemCollectorId](systemcollectorid.md)</p></td>
<td><p>Represents a system collector identifier.</p></td>
</tr>
</tbody>
</table>

 

## Remarks


This element is used only for in-memory capture.

## Example


The following code examples show how this element is used in system collector and event collector definitions.

``` syntax
<SystemCollector
  Id="WPRSystemCollector"
  Name="NT Kernel Logger"
  FileName="WPRKernel.etl">
  <BufferSize
    Value="512"/>
  <Buffers
    Value="3"
    PercentageOfTotalMemory="true"/>
</SystemCollector>

<EventCollector
  Id="WPREventCollector"
  Name="WPR Event Collector"
  FileName="somefilename.etl">
  <BufferSize
    Value="128"/>
  <Buffers
    Value="64"/>
</EventCollector>
```

## Related topics


[Elements](elements.md)

[Buffers](buffers.md)

[SystemCollector](systemcollector.md)

[EventCollector](eventcollector.md)

[HeapEventCollector](heapeventcollector.md)

 

 







