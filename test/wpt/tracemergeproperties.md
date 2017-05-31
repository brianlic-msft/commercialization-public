---
title: TraceMergeProperties
description: TraceMergeProperties
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 7771cdc2-3573-4a3b-a52b-70ef77f706dc
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# TraceMergeProperties


Represents a collection of [TraceMergeProperty](tracemergeproperty.md) element. This element is for internal use only.

## Element Syntax


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;**TraceMergeProperties**&gt;

## Syntax


``` syntax
<TraceMergeProperties>

  <!-- Child elements -->
  TraceMergeProperty

</TraceMergeProperties>
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
<th>Requirment</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>[TraceMergeProperty](tracemergeproperty.md)</p></td>
<td><p>Contains configurations that are applied when event trace log (ETL) files from multiple profiles are merged.</p></td>
<td><p>Required, 1 or more.</p></td>
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

 

## Example


The following code example shows how to define this element.

``` syntax
<TraceMergeProperties>
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
</TraceMergeProperties>
```

## Related topics


[Elements](elements.md)

[Inheritance](inheritance.md)

 

 







