---
title: GetElementType
description: GetElementType
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 4546c402-5966-4f36-acad-51418a1698d1
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# GetElementType


Returns the type of the element at which the XML validation error occurred.

## Syntax


``` syntax
HRESULT GetElementType
  ([out, retval] BSTR* pbstrElementType)
;
```

## Parameters


<a href="" id="pbstrelementtype"></a>*pbstrElementType*  
\[out\] A pointer to the type of the element at which the XML validation error occurred.

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
<td><p>The function successfully returned the element type.</p></td>
</tr>
<tr class="even">
<td><p>E_POINTER</p></td>
<td><p>The pointer is invalid.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[IParsingErrorInfo](iparsingerrorinfo.md)

 

 







