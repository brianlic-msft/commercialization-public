---
title: HeapEventCollector
description: HeapEventCollector
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: e8f6e4d9-b037-49ca-b816-cc7757b98b3d
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# HeapEventCollector


Represents a collector for heap events.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[Profiles](profiles.md)&gt;

          &lt;**HeapEventCollector**&gt;

## Syntax


``` syntax
<HeapEventCollector Id       = IdType
                    Base     = string
                    Name     = string
                    FileName = string
                    Realtime = boolean
                    Secure   = boolean>

  <!-- Child elements -->
  BufferSize,
  Buffers,
  StackCaching

</HeapEventCollector>
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
<td><p><strong>Id</strong></p></td>
<td><p>Uniquely identifies the heap event collector.</p></td>
<td><p>String that must have at least one character and cannot contain colons (:) or spaces.</p></td>
<td><p>Yes</p></td>
<td><p></p></td>
</tr>
<tr class="even">
<td><p><strong>Base</strong></p></td>
<td><p>Indicates the base of the collector.</p></td>
<td><p>string</p></td>
<td><p>No</p></td>
<td><p></p></td>
</tr>
<tr class="odd">
<td><p><strong>Name</strong></p></td>
<td><p>Indicates the name of the heap event collector.</p></td>
<td><p>string</p></td>
<td><p>Yes</p></td>
<td><p></p></td>
</tr>
<tr class="even">
<td><p><strong>FileName</strong></p></td>
<td><p>Indicates the name of the file to which events should be written.</p></td>
<td><p>string</p></td>
<td><p>Yes</p></td>
<td><p></p></td>
</tr>
<tr class="odd">
<td><p><strong>Realtime</strong></p></td>
<td><p>Indicates whether the event collector operates in real time.</p></td>
<td><p>boolean</p></td>
<td><p>No</p></td>
<td><p>false</p></td>
</tr>
<tr class="even">
<td><p><strong>Secure</strong></p></td>
<td><p>If set to &quot;true&quot;, indicates that only users with administrative privileges and proper access rights can control the session. If set to &quot;false&quot;, indicates that all users can control the session.</p></td>
<td><p>boolean</p></td>
<td><p>No</p></td>
<td><p>true</p></td>
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
<td><p>Describes either the number of buffers to be allocated when starting a session or the percentage of total memory to be allocated for the session, depending on the value of the <strong>PercentageOfTotalMemory</strong> attribute.</p></td>
<td><p>Required, exactly 1.</p></td>
</tr>
<tr class="odd">
<td><p>[StackCaching](stackcaching.md)</p></td>
<td><p>Describes stack caching attributes of collectors.</p></td>
<td><p></p></td>
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
<td><p>[Profiles](profiles.md)</p></td>
<td><p>Represents a collection of collectors, providers, and profiles.</p></td>
</tr>
</tbody>
</table>

 

## Remarks


Derived event collectors have the attributes of the base collector by default. These can be overridden by explicitly specifying them in the derived collector. For more information, see [Inheritance](inheritance.md).

## Related topics


[Elements](elements.md)

[Inheritance](inheritance.md)

 

 







