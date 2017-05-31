---
title: StackCaching
description: StackCaching
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 99afd74f-9423-4ff5-8dc7-24c1dd622b7d
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# StackCaching


Describes stack caching attributes of collectors.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[Profiles](profiles.md)&gt;

          &lt;[SystemCollector](systemcollector.md)&gt;

               &lt;**StackCaching**&gt;

&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[Profiles](profiles.md)&gt;

          &lt;[EventCollector](eventcollector.md)&gt;

               &lt;**StackCaching**&gt;

&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[Profiles](profiles.md)&gt;

          &lt;[HeapEventCollector](heapeventcollector.md)&gt;

               &lt;**StackCaching**&gt;

&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[Profiles](profiles.md)&gt;

          &lt;[Profile](profile-wpr.md)&gt;

               &lt;[Collectors](collectors.md)&gt;

                    &lt;[SystemCollectorId](systemcollectorid.md)&gt;

                    &lt;**StackCaching**&gt;

&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[Profiles](profiles.md)&gt;

          &lt;[Profile](profile-wpr.md)&gt;

               &lt;[Collectors](collectors.md)&gt;

                    &lt;[EventCollectorId](eventcollectorid.md)&gt;

                    &lt;**StackCaching**&gt;

&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[Profiles](profiles.md)&gt;

          &lt;[Profile](profile-wpr.md)&gt;

               &lt;[Collectors](collectors.md)&gt;

                    &lt;[HeapEventCollectorId](heapeventcollectorid.md)&gt;

                    &lt;**StackCaching**&gt;

## Syntax


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
<td><p><strong>BucketCount</strong></p></td>
<td><p>Represents the number of buckets.</p></td>
<td><p>Unsigned long.</p></td>
<td><p>Yes</p></td>
<td><p></p></td>
</tr>
<tr class="even">
<td><p><strong>CacheSize</strong></p></td>
<td><p>Represents the size of the cache, in KB.</p></td>
<td><p>Unsigned long.</p></td>
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
<td><p>Represents an event collector for the profile.</p></td>
</tr>
<tr class="even">
<td><p>[EventCollectorId](eventcollectorid.md)</p></td>
<td><p>Represents an event collector identifier.</p></td>
</tr>
<tr class="odd">
<td><p>[HeapEventCollector](heapeventcollector.md)</p></td>
<td><p>Represents a collector for heap events.</p></td>
</tr>
<tr class="even">
<td><p>[HeapEventCollectorId](heapeventcollectorid.md)</p></td>
<td><p>Represents an identifier for a collector of heap events for the profile.</p></td>
</tr>
<tr class="odd">
<td><p>[SystemCollector](systemcollector.md)</p></td>
<td><p>Describes the configurations to enable the Event Tracing for Windows (ETW) kernel-mode session.</p></td>
</tr>
<tr class="even">
<td><p>[SystemCollectorId](systemcollectorid.md)</p></td>
<td><p>Represents the identifier of a system collector.</p></td>
</tr>
</tbody>
</table>

 

## Remarks


If you do not specify values for its attributes, this element is ignored.

## Related topics


[SystemCollector](systemcollector.md)

 

 







