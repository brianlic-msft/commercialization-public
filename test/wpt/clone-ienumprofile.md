---
title: Clone
description: Clone
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 057b095c-c244-434e-bf0f-09fb54089390
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Clone


Creates a clone enumerator.

## Syntax


``` syntax
HRESULT Clone
  ([out] IEnumProfile** ppEnum)
;
```

## Parameters


<a href="" id="ppenum"></a>*ppEnum*  
\[out\] Returns a pointer to the location of the clone enumerator.

## Return Value


The following table describes possible return values.

## Exceptions


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Return Value</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>S_OK</p></td>
<td><p>The function successfully created the clone enumerator.</p></td>
</tr>
<tr class="even">
<td><p>E_OUTOFMEMORY</p></td>
<td><p>Indicates insufficient memory to complete the operation.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[IEnumProfile](ienumprofile.md)

 

 







