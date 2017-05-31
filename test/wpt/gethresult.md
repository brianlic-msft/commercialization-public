---
title: GetHResult
description: GetHResult
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 5c7606d5-3a6d-4dc5-b232-ed24974d662c
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# GetHResult


Returns an HRESULT value that indicates the error code.

## Syntax


``` syntax
HRESULT GetHResult
  ([out, retval] HRESULT* pHResult)
;
```

## Parameters


<a href="" id="phresult"></a>*pHResult*  
\[out\] Pointer to the HRESULT value that indicates the error code.

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
<td><p>The function successfully returned the error code.</p></td>
</tr>
<tr class="even">
<td><p>E_POINTER</p></td>
<td><p>Invalid pointer.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[IControlErrorInfo](icontrolerrorinfo.md)

 

 







