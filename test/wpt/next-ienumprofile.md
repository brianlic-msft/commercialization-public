---
title: Next
description: Next
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 488d7957-a6a6-4961-a7ff-aca254e72eb4
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Next


Returns an array that contains the specified number of elements.

## Syntax


``` syntax
HRESULT Next
  ([in] ULONG celt,
  [out, size_is(celt), length_is(*pCeltFetched)] IProfile** prgVar,
  [out] ULONG* pCeltFetched)
;
```

## Parameters


<a href="" id="celt"></a>*celt*  
\[in\] The number of elements to return.

<a href="" id="prgvar"></a>*prgVar*  
\[out\] An array of at least the size of *celt*, to contain the elements.

<a href="" id="pceltfetched"></a>*pCeltFetched*  
\[out\] A pointer to the number of elements returned in *rgVar*, or NULL.

## Return Value


The following table describes possible return values.

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
<td><p>The function successfully returned the array.</p></td>
</tr>
<tr class="even">
<td><p>S_FALSE</p></td>
<td><p>The number of elements returned is less then <em>celt</em>.</p></td>
</tr>
<tr class="odd">
<td><p>E_POINTER</p></td>
<td><p>Indicates an invalid pointer.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[IEnumProfile](ienumprofile.md)

 

 







