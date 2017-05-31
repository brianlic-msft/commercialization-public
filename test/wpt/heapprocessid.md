---
title: HeapProcessId
description: HeapProcessId
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b0d95f7c-af59-4452-9a60-3ab1e06b072a
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# HeapProcessId


Uniquely identifies a heap process.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[HeapEventProvider](heapeventprovider.md)&gt;

          &lt;[HeapProcessIds](heapprocessids.md)&gt;

               &lt;**HeapProcessId**

     &lt;[Profiles](profiles.md)&gt;

          &lt;[Profile](profile-wpr.md)&gt;

               &lt;[Collectors](collectors.md)&gt;

                    &lt;[HeapEventCollectorId](heapeventcollectorid.md)&gt;

                         &lt;[HeapEventProviders](heapeventproviders.md)&gt;

                              &lt;[HeapEventProviderId](heapeventproviderid.md)&gt;

                                   &lt;[HeapProcessIds](heapprocessids.md)&gt;

                                        &lt;**HeapProcessId**&gt;

                              &lt;[HeapEventProvider](heapeventprovider.md)&gt;

                                   &lt;[HeapProcessIds](heapprocessids.md)&gt;

                                        &lt;**HeapProcessId**&gt;

## Syntax


``` syntax
<HeapProcessId Value = unsignedLong>
</HeapProcessId>
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
<td><p>Number of the heap process.</p></td>
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
<td><p>[HeapProcessIds](heapprocessids.md)</p></td>
<td><p>Represents a collection of heap process identifiers.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Elements](elements.md)

 

 







