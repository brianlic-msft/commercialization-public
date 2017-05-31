---
title: HeapEventProviders
description: HeapEventProviders
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b4582698-fb7f-4158-b41c-d2f1c53f3f87
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# HeapEventProviders


Represents a collection of heap event provider identifiers and heap event providers.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[Profiles](profiles.md)&gt;

          &lt;[Profile](profile-wpr.md)&gt;

               &lt;[Collectors](collectors.md)&gt;

                    &lt;[HeapEventCollectorId](heapeventcollectorid.md)&gt;

                         &lt;**HeapEventProviders**&gt;

## Syntax


``` syntax
<HeapEventProviders Operation = "Set" | "Add" | “Remove” >

  <!-- Child elements -->
  HeapEventProviderId,
  HeapEventProvider

</HeapEventProviders>
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
<td><p>Indicates whether providers should be set or added.</p></td>
<td><p>This attribute can have one of the following values:</p>
<ul>
<li><p>Set</p></li>
<li><p>Add</p></li>
<li><p>Remove</p></li>
</ul></td>
<td><p>No</p></td>
<td><p>Set</p></td>
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
<td><p>[HeapEventProviderId](heapeventproviderid.md)</p></td>
<td><p>Represents a heap event provider identifier.</p></td>
<td><p>Optional, zero or more.</p></td>
</tr>
<tr class="even">
<td><p>[HeapEventProvider](heapeventprovider.md)</p></td>
<td><p>Represents a heap event provider.</p></td>
<td><p>Optional, zero or more.</p></td>
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
<td><p>[HeapEventCollectorId](heapeventcollectorid.md)</p></td>
<td><p>Represents a heap event collector identifier.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Elements](elements.md)

 

 







