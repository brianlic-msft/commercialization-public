---
title: HeapProcessIds
description: HeapProcessIds
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: bc7619b5-11f7-48d1-93f3-5103fbfc52ce
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# HeapProcessIds


Represents a collection of heap process identifiers.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[HeapEventProvider](heapeventprovider.md)&gt;

           &lt;**HeapProcessIds**&gt;

     &lt;[Profiles](profiles.md)&gt;

          &lt;[Profile](profile-wpr.md)&gt;

               &lt;[Collectors](collectors.md)&gt;

                    &lt;[HeapEventCollectorId](heapeventcollectorid.md)&gt;

                         &lt;[HeapEventProviders](heapeventproviders.md)&gt;

                              &lt;[HeapEventProviderId](heapeventproviderid.md)&gt;

                                   &lt;**HeapProcessIds**&gt;

                              &lt;[HeapEventProvider](heapeventprovider.md)&gt;

                                   &lt;**HeapProcessIds**&gt;

## Syntax


``` syntax
<HeapProcessIds Operation = "Set" | "Add" | “Remove” >

  <!-- Child elements -->
  HeapProcessId

</HeapProcessIds>
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
<td><p>Indicates whether <strong>HeapProcessId</strong> elements should be set or added.</p></td>
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
<td><p>[HeapProcessId](heapprocessid.md)</p></td>
<td><p>Uniquely identifies a heap process.</p></td>
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
<td><p>[HeapEventProvider](heapeventprovider.md)</p></td>
<td><p>Represents a heap event provider.</p></td>
</tr>
<tr class="even">
<td><p>[HeapEventProviderId](heapeventproviderid.md)</p></td>
<td><p>Represents a heap event provider identifier.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Elements](elements.md)

 

 







