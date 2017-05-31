---
title: GetColumnNumber
description: GetColumnNumber
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: abe730ac-4c04-48f0-b37c-6e096dca07c5
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# GetColumnNumber


Gets the number of the column at which the XML validation error occurred.

## Syntax


``` syntax
HRESULT GetColumnNumber
  ([out, retval] ULONG* pColumnNumber)
;
```

## Parameters


<a href="" id="pcolumnnumber"></a>*pColumnNumber*  
\[out\] A pointer to the number of the column at which the XML validation error occurred.

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
<td><p>The function successfully returned the column number.</p></td>
</tr>
<tr class="even">
<td><p>E_POINTER</p></td>
<td><p>Indicates an invalid pointer.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[IParsingErrorInfo](iparsingerrorinfo.md)

 

 







