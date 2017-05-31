---
title: GetElementId
description: GetElementId
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 43a95260-6098-47a9-b087-fd1b477af263
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# GetElementId


Returns the identifier of the element at which the XML validation error occurred.

## Syntax


``` syntax
HRESULT GetElementId
  ([out, retval] BSTR* pbstrElementId)
;
```

## Parameters


<a href="" id="pbstrelementid"></a>*pbstrElementId*  
\[out\] A pointer to identifier of the element at which the XML validation error occurred.

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
<td><p>The function successfully returned the element identifier.</p></td>
</tr>
<tr class="even">
<td><p>E_POINTER</p></td>
<td><p>The pointer is invalid.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[IParsingErrorInfo](iparsingerrorinfo.md)

 

 







