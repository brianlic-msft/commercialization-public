---
title: PoolTags
description: PoolTags
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 819088ce-bfda-4866-a97c-a85b768c5f7a
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# PoolTags


Represents a collection of a maximum of four pool tags. If the **Operation** attribute is specified, the **PoolTag** elements can be set or added to the collection.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

   &lt;[Profiles](profiles.md)&gt;

      &lt;[SystemProvider](systemprovider.md)&gt;

         &lt;**PoolTags**&gt;

&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

   &lt;[Profiles](profiles.md)&gt;

      &lt;[Profile](profile-wpr.md)&gt;

         &lt;[Collectors](collectors.md)&gt;

            &lt;[SystemCollectorId](systemcollectorid.md)&gt;

               &lt;[SystemProviderId](systemproviderid.md)&gt;

                    &lt;**PoolTags**&gt;

&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

   &lt;[Profiles](profiles.md)&gt;

      &lt;[Profile](profile-wpr.md)&gt;

         &lt;[Collectors](collectors.md)&gt;

            &lt;[SystemCollectorId](systemcollectorid.md)&gt;

               &lt;[SystemProvider](systemprovider.md)&gt;

                    &lt;**PoolTags**&gt;

## Syntax


``` syntax
<PoolTags Operation = "Set" | "Add" | “Remove” >

  <!-- Child elements -->
  PoolTag

</PoolTags>
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
<td><p>Indicates whether <strong>PoolTag</strong> elements should be set or added.</p></td>
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
<td><p>[PoolTag](pooltag.md)</p></td>
<td><p>Describes the pool tags to be enabled for analyzing pool pages.</p></td>
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
<td><p>[SystemProvider](systemprovider.md)</p></td>
<td><p>Represents a system provider.</p></td>
</tr>
<tr class="even">
<td><p>[SystemProviderId](systemproviderid.md)</p></td>
<td><p>Represents a system provider identifier.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Elements](elements.md)

 

 







