---
title: HeapEventProvider
description: HeapEventProvider
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 0f2fe538-bfd6-490b-b1c8-8f151153b8ef
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# HeapEventProvider


Represents a provider of heap events for the profile.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[Profiles](profiles.md)&gt;

          &lt;**HeapEventProvider**&gt;

          &lt;[Profile](profile-wpr.md)&gt;

               &lt;[Collectors](collectors.md)&gt;

                    &lt;[HeapEventCollectorId](heapeventcollectorid.md)&gt;

                         &lt;[HeapEventProviders](heapeventproviders.md)&gt;

                              &lt;**HeapEventProvider**&gt;

## Syntax


``` syntax
<HeapEventProvider Id   = IdType
                   Base = string>

  <!-- Child elements -->
  HeapProcessIds

</HeapEventProvider>
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
<td><p>Uniquely identifies the heap event provider.</p></td>
<td><p>String that must have at least one character and cannot contain colons (:) or spaces.</p></td>
<td><p>Yes</p></td>
<td><p></p></td>
</tr>
<tr class="even">
<td><p><strong>Base</strong></p></td>
<td><p>Indicates the base heap event provider.</p></td>
<td><p>string</p></td>
<td><p>No</p></td>
<td><p></p></td>
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
<td><p>[HeapProcessIds](heapprocessids.md)</p></td>
<td><p>Represents a collection of heap process identifiers.</p></td>
<td><p>Required, exactly 1.</p></td>
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
<td><p>[HeapEventProviders](heapeventproviders.md)</p></td>
<td><p>Represents a collection of heap event provider identifiers and heap event providers.</p></td>
</tr>
<tr class="even">
<td><p>[Profiles](profiles.md)</p></td>
<td><p>Represents a collection of collectors, providers, and profiles.</p></td>
</tr>
</tbody>
</table>

 

## Remarks


Derived heap event providers have all the attributes of the base provider by default. These can be overridden by explicitly specifying them in the derived provider. For more information, see [Inheritance](inheritance.md).

## Related topics


[Elements](elements.md)

 

 







