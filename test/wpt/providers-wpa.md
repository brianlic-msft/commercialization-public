---
title: providers
description: providers
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 19c60e7c-2673-4e7c-9b04-978ac94ce812
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# providers


Displays available providers and groups.

``` syntax
xperf -providers [Installed|I] [Registered|R] [KernelFlags|KF] [KernelGroups|KG] [Kernel|K]
```

## Remarks


This option queries all installed/known and registered providers, as well as all known kernel flags and groups.

The options in the following table are supported.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Option</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>I, Installed</strong></p></td>
<td><p>Includes installed/known providers.</p></td>
</tr>
<tr class="even">
<td><p><strong>R, Registered</strong></p></td>
<td><p>Includes registered providers.</p></td>
</tr>
<tr class="odd">
<td><p><strong>KF, KernelFlags</strong></p></td>
<td><p>Includes kernel flags.</p></td>
</tr>
<tr class="even">
<td><p><strong>KG, KernelGroups</strong></p></td>
<td><p>Includes kernel groups.</p></td>
</tr>
<tr class="odd">
<td><p><strong>K, Kernel</strong></p></td>
<td><p>Includes kernel flags and groups; shortcut for &quot;KF KG&quot;.</p></td>
</tr>
</tbody>
</table>

 

If no options are specified, all providers are included in the output.

## Related topics


[Xperf Options](xperf-options.md)

 

 







