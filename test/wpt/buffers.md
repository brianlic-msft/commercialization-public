---
title: Buffers
description: Buffers
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 8f60d3e3-cb32-4879-8ac2-80ceaea945d3
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Buffers


Describes either the number of buffers to be allocated when starting a session or the percentage of total memory to be allocated for the session, depending on the value of the **PercentageOfTotalMemory** attribute.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[Profiles](profiles.md)&gt;

          &lt;[SystemCollector](systemcollector.md)&gt;

               &lt;**Buffers**&gt;

          &lt;[EventCollector](eventcollector.md)&gt;

               &lt;**Buffers**&gt;

          &lt;[HeapEventCollector](heapeventcollector.md)

               &lt;**Buffers**&gt;

          &lt;[Profile](profile-wpr.md)&gt;

               &lt;[Collectors](collectors.md)&gt;

                    &lt;[SystemCollectorId](systemcollectorid.md)&gt;

                         &lt;**Buffers**&gt;

                    &lt;[EventCollectorId](eventcollectorid.md)&gt;

                         &lt;**Buffers**&gt;

                    &lt;[HeapEventCollectorId](heapeventcollectorid.md)&gt;

                         &lt;**Buffers**&gt;

## Syntax


``` syntax
<Buffers Operation               = "Set" | "Add" | “Remove”
         Value                   = unsignedLong
         PercentageOfTotalMemory = boolean>
</Buffers>
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
<td><p>Indicates whether buffers should be set or added.</p></td>
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
<td><p>Indicates the number of buffers, or if <strong>PercentageOfTotalMemory</strong> is set to &quot;true&quot;, the percentage of memory for the buffers.</p></td>
<td><p>unsignedLong</p></td>
<td><p>Yes</p></td>
<td><p></p></td>
</tr>
<tr class="odd">
<td><p><strong>PercentageOfTotalMemory</strong></p></td>
<td><p>When set to &quot;true&quot;, limits the amount of memory that can be consumed to the value of <strong>Value</strong>.</p></td>
<td><p>boolean</p></td>
<td><p>No</p></td>
<td><p>false</p></td>
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


The following examples show how this element is used in system collector and event collector definitions.

The first example sets the buffer size to 512 KB and limits the total amount of memory consumed to 3 percent. The second example sets 64 buffers of 128 KB each.

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

[BufferSize](buffersize.md)

[SystemCollector](systemcollector.md)

[EventCollector](eventcollector.md)

[HeapEventCollector](heapeventcollector.md)

 

 







