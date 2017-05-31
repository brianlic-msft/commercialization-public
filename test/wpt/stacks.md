---
title: Stacks
description: Stacks
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 5ea2e972-ca03-460a-9fed-8eb7670221ac
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Stacks


Represents a collection of stacks. If the **Operation** attribute is specified, the **Stack** elements can be set or added to the collection.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[Profiles](profiles.md)&gt;

          &lt;[SystemProvider](systemprovider.md)&gt;

               &lt;**Stacks**&gt;

          &lt;[Profile](profile-wpr.md)&gt;

               &lt;[Collectors](collectors.md)&gt;

                    &lt;[SystemCollectorId](systemcollectorid.md)&gt;

                         &lt;[SystemProviderId](systemproviderid.md)&gt;

                                &lt;**Stacks**&gt;

                         &lt;[SystemProvider](systemprovider.md)&gt;

                                &lt;**Stacks**&gt;

## Syntax


``` syntax
<Stacks Operation = OperationEnumeration>

  <!-- Child elements -->
  Stack

</Stacks>
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
<td><p>Indicates whether <strong>Stack</strong> elements should be set or added.</p></td>
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
<td><p>[Stack](stack-wpa.md)</p></td>
<td><p>Represents a system stack.</p></td>
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

 

 







