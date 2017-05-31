---
title: Skip
description: Skip
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 963dd77f-89cc-414d-80f5-2774311605c9
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Skip


Skips the specified number of errors or warnings.

## Syntax


``` syntax
HRESULT Skip
  ([in] ULONG celt)
;
```

## Parameters


<a href="" id="celt"></a>*celt*  
\[in\] The number of elements to skip.

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
<td><p>The function successfully returned the number of elements to skip.</p></td>
</tr>
<tr class="even">
<td><p>S_FALSE</p></td>
<td><p>The number of elements returned is less then <em>celt</em>.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[IEnumControlWarningInfo](ienumcontrolwarninginfo.md)

 

 







