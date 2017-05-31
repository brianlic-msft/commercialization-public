---
title: CustomEvent
description: CustomEvent
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 4ce7091b-4e6a-40c3-aeff-1c9434310f44
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# CustomEvent


Represents a custom event.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[TraceMergeProperties](tracemergeproperties.md)&gt;

          &lt;[TraceMergeProperty](tracemergeproperty.md)&gt;

               &lt;[CustomEvents](customevents.md)&gt;

                    &lt;**CustomEvent**&gt;

## Syntax


``` syntax
<CustomEvent Value = "None" | "ImageId" | "BuildInfo" | ...>
</CustomEvent>
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
<td><p>Describes the value of the custom event.</p></td>
<td><p>This attribute can have one of the following values:</p>
<ul>
<li><p>None</p></li>
<li><p>ImageId</p></li>
<li><p>BuildInfo</p></li>
<li><p>VolumeMapping</p></li>
<li><p>EventMetadata</p></li>
<li><p>PerfTrackMetadata</p></li>
<li><p>WinSAT</p></li>
<li><p>NetworkInterface</p></li>
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
<td><p>[CustomEvents](customevents.md)</p></td>
<td><p>Represents a collection of custom events.</p></td>
</tr>
</tbody>
</table>

 

## Example


The following code example shows how this element is used in a trace merge property definition.

``` syntax
<TraceMergeProperty
  Id="TraceMerge_Default"
  Name="TraceMerge_Default">
  <DeletePreMergedTraceFiles
    Value="true"/>
  <CustomEvents>
    <CustomEvent
      Value="ImageId"/>
    <CustomEvent
      Value="BuildInfo"/>
    <CustomEvent
      Value="VolumeMapping"/>
    <CustomEvent
      Value="EventMetadata"/>
    <CustomEvent
      Value="PerfTrackMetadata"/>
    <CustomEvent
      Value="WinSAT"/>
    <CustomEvent
      Value="NetworkInterface"/>
  </CustomEvents>
</TraceMergeProperty>
```

## Related topics


[Elements](elements.md)

 

 







