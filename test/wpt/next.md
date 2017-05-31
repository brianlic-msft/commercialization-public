---
title: Next
description: Next
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: e1016773-7fa6-4f87-a128-cad80c35755a
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


Returns an array that contains the specified number of errors or warnings from the current index of the enumerator.

## Syntax


``` syntax
HRESULT Next
  ([in] ULONG celt,
  [out, size_is(celt), length_is(*pCeltFetched)] const IControlErrorInfo** prgVar,
  [out] ULONG* pCeltFetched)
;
```

## Parameters


<a href="" id="celt"></a>*celt*  
\[in\] The number of elements to be returned.

<a href="" id="prgvar"></a>*prgVar*  
\[out\] An array of at least the size of *celt* in which the elements are to be returned.

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


[IEnumControlWarningInfo](ienumcontrolwarninginfo.md)

 

 







