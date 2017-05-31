---
title: CustomKeyword
description: CustomKeyword
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 776e6349-4d19-44a9-b49a-a2c73e218540
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# CustomKeyword


Represents a custom keyword for the profile.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[Profiles](profiles.md)&gt;

          &lt;[SystemProvider](systemprovider.md)&gt;

               &lt;[Keywords (in SystemProvider)](keywords--in-systemprovider-.md)&gt;

                    &lt;**CustomKeyword**&gt;

          &lt;[Profile](profile-wpr.md)&gt;

               &lt;[Collectors](collectors.md)&gt;

                    &lt;[SystemCollectorId](systemcollectorid.md)&gt;

                         &lt;[SystemProvider](systemprovider.md)&gt;

                              &lt;[Keywords (in SystemProvider)](keywords--in-systemprovider-.md)&gt;

                                   &lt;**CustomKeyword**&gt;

## Syntax


``` syntax
<CustomKeyword Value = SystemCustomKeywordAttributeType>
</CustomKeyword>
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
<td><p>The hexadecimal-form string name of the custom event.</p></td>
<td><p>String built with the following pattern: 0x[a-fA-F0-9]{1,8}.</p></td>
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
<td><p>[Keywords (in SystemProvider)](keywords--in-systemprovider-.md)</p></td>
<td><p>Represents a collection of keywords and custom keywords.</p></td>
</tr>
</tbody>
</table>

 

## Remarks


This element enables creation of a custom keyword for any possible Event Tracing for Windows (ETW) event.

## Related topics


[Elements](elements.md)

 

 







