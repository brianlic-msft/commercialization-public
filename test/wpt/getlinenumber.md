---
title: GetLineNumber
description: GetLineNumber
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: d25dc5f0-386e-4dc1-aaaf-c59523a23c21
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# GetLineNumber


Gets the number of the line at which the XML validation error occurred.

## Syntax


``` syntax
HRESULT GetLineNumber
  ([out, retval] ULONG* pLineNumber)
;
```

## Parameters


<a href="" id="plinenumber"></a>*pLineNumber*  
\[out\] A pointer to the number of the line at which the XML validation error occurred.

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
<td><p>The function successfully returned the line number.</p></td>
</tr>
<tr class="even">
<td><p>E_POINTER</p></td>
<td><p>The pointer is invalid.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[IParsingErrorInfo](iparsingerrorinfo.md)

 

 







