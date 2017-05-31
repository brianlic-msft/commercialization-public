---
title: PoolTag
description: PoolTag
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: e544351c-bb0a-4450-a6d4-5fc230bf684d
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# PoolTag


Describes the pool tags to be enabled for analyzing pool pages.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[Profiles](profiles.md)&gt;

          &lt;[SystemProvider](systemprovider.md)&gt;

               &lt;[PoolTags](pooltags.md)&gt;

                     &lt;**PoolTag**&gt;

          &lt;[Profile](profile-wpr.md)&gt;

               &lt;[Collectors](collectors.md)&gt;

                    &lt;[SystemCollectorId](systemcollectorid.md)&gt;

                         &lt;[SystemProviderId](systemproviderid.md)&gt;

                                &lt;[PoolTags](pooltags.md)&gt;

                                     &lt;**PoolTag**&gt;

                         &lt;[SystemProvider](systemprovider.md)&gt;

                                &lt;[PoolTags](pooltags.md)&gt;

                                     &lt;**PoolTag**&gt;

## Syntax


``` syntax
<PoolTag" Value = SystemPoolTagAttributeType>
</PoolTag>
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
<td><p>Describes the value of this element.</p></td>
<td><p>String that must be one to four characters in length.</p></td>
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
<td><p>[PoolTags](pooltags.md)</p></td>
<td><p>Represents a collection of pool tags.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Elements](elements.md)

 

 







