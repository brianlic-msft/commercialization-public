---
title: SystemCollector
description: SystemCollector
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: e7b9b910-9fe4-4dca-a61a-2599f67caf00
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# SystemCollector


Describes the configurations to enable the Event Tracing for Windows (ETW) kernel-mode session.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[Profiles](profiles.md)&gt;

          &lt;**SystemCollector**&gt;

## Syntax


``` syntax
<SystemCollector Id       = IdType
                 Base     = string
                 Name     = "NT Kernel Logger" | "Circular Kernel Context Logger"
                 Realtime = boolean>

  <!-- Child elements -->
  BufferSize,
  Buffers,
  StackCaching

</SystemCollector>
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
<td><p>Uniquely identifies the system collector.</p></td>
<td><p>String that must have at least one character and cannot contain colons (:) or spaces.</p></td>
<td><p>Yes</p></td>
<td><p></p></td>
</tr>
<tr class="even">
<td><p><strong>Base</strong></p></td>
<td><p>Identifies the base of the system collector. Derived collectors have all the attributes of the base collector. These can be overridden by explicitly specifying them in the derived collector.</p></td>
<td><p>string</p></td>
<td><p>No</p></td>
<td><p></p></td>
</tr>
<tr class="odd">
<td><p><strong>Name</strong></p></td>
<td><p>Indicates the name of the system collector.</p></td>
<td><p>This attribute can have one of the following values:</p>
<ul>
<li><p>NT Kernel Logger</p></li>
<li><p>Circular Kernel Context Logger</p></li>
</ul></td>
<td><p>Yes</p></td>
<td><p></p></td>
</tr>
<tr class="even">
<td><p><strong>Realtime</strong></p></td>
<td><p>Indicates whether the collector works in real time.</p></td>
<td><p>boolean</p></td>
<td><p>No</p></td>
<td><p>false</p></td>
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
<th>Requirement.</th>
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


System collector definitions should precede event collector definitions.

## Example


The following code example defines a system collector.

``` syntax
<SystemCollector
  Id="WPRSystemCollector”
  Name="NT Kernel Logger"
  FileName="WPRKernel.etl">
  <BufferSize Value="512"/>
  <Buffers Value="3" PercentageOfTotalMemory="true"/>
</SystemCollector>
```

## Related topics


[Elements](elements.md)

 

 







