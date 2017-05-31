---
title: Clone
description: Clone
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 0f8f2e42-f67c-4523-a81a-5a2e34dc4e8f
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


Clones the whole set of errors and warnings.

## Syntax


``` syntax
HRESULT Clone
  ([out] IEnumControlWarningInfo** ppEnum)
;
```

## Parameters


<a href="" id="ppenum"></a>*ppEnum*  
\[out\] On return, a pointer to the location of the clone enumerator.

## Return Value


The following table describes possible values.

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


[IEnumControlWarningInfo](ienumcontrolwarninginfo.md)

 

 







