---
title: TraceMergeProperty
description: TraceMergeProperty
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b3640f46-7bf4-4ee3-8094-ace27f275bd8
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# TraceMergeProperty


Contains configurations that are applied when recordings from multiple profiles are merged. This element is for internal use only.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[TraceMergeProperties](tracemergeproperties.md)&gt;

          &lt;**TraceMergeProperty**&gt;

## Syntax


``` syntax
<TraceMergeProperty Id   = IdType
                    Name = string
                    Base = string>

  <!-- Child elements -->
  DeletePreMergedTraceFiles,
  FileCompression
  CustomEvents
</TraceMergeProperty>
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
<td><p><strong>ID</strong></p></td>
<td><p>Uniquely identifies this element.</p></td>
<td><p>String that must have at least one character and cannot contain colons (:) or spaces.</p></td>
<td><p>Yes</p></td>
<td><p></p></td>
</tr>
<tr class="even">
<td><p><strong>Name</strong></p></td>
<td><p>Indicates the name of this element.</p></td>
<td><p>string</p></td>
<td><p>Yes</p></td>
<td><p></p></td>
</tr>
<tr class="odd">
<td><p><strong>Base</strong></p></td>
<td><p>Indicates the base of this element. Derived elements have all the attributes of the base by default. You can override these attributes by explicitly specifying them in the derived element.</p></td>
<td><p>string</p></td>
<td><p>No</p></td>
<td><p></p></td>
</tr>
</tbody>
</table>

 

### Child Elements

<table>
<colgroup>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
</colgroup>
<thead>
<tr class="header">
<th>Element</th>
<th>Description</th>
<th>Requirement</th>
<th>Possible Values</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>[DeletePreMergedTraceFiles](deletepremergedtracefiles.md)</p></td>
<td><p>Indicates whether to delete premerged event trace log (ETL) files.</p></td>
<td><p>Optional</p></td>
<td><p>true, false</p></td>
</tr>
<tr class="even">
<td><p>[FileCompression](filecompression.md)</p></td>
<td><p>Indicates whether to compress the ETL file.</p></td>
<td><p>Optional</p></td>
<td><p>true, false</p></td>
</tr>
<tr class="odd">
<td><p>[CustomEvents](customevents.md)</p></td>
<td><p>Represents a collection of custom events.</p></td>
<td><p>Optional</p></td>
<td><p>true, false</p></td>
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
<td><p>[TraceMergeProperties](tracemergeproperties.md)</p></td>
<td><p>Represents a collection of trace merge properites.</p></td>
</tr>
</tbody>
</table>

 

## Example


The following code example shows a trace merge property definition.

``` syntax
<TraceMergeProperty
  Id="TraceMerge_Default"
  Name="TraceMerge_Default">
  <DeletePreMergedTraceFiles
    Value="true"/>
  <FileCompression
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

 

 







