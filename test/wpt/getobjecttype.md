---
title: GetObjectType
description: GetObjectType
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 5df5ef07-aad9-4bbe-a293-05dd18c4b319
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# GetObjectType


Returns the type of the object that caused the error.

## Syntax


``` syntax
HRESULT GetObjectType
  ([out, retval] CObjectType* pObjectType)
;
```

## Parameters


<a href="" id="pobjecttype"></a>*pObjectType*  
\[out\] Pointer to the **CObjectType** field that indicates the element that caused the error.

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
<td><p>The function successfully returned the object type.</p></td>
</tr>
<tr class="even">
<td><p>E_POINTER</p></td>
<td><p>Invalid pointer.</p></td>
</tr>
</tbody>
</table>

 

## Remarks


The object type can be any of the following values:

-   Unknown

-   Profile

-   Collector

-   Provider

## Related topics


[IControlErrorInfo](icontrolerrorinfo.md)

 

 







