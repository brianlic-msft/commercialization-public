---
title: GetInnerErrorInfo
description: GetInnerErrorInfo
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: f3cfd46e-bed5-47fd-a2bb-f7e34f7877c6
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# GetInnerErrorInfo


Returns additional information about the error.

## Syntax


``` syntax
HRESULT GetInnerErrorInfo
  ([out, retval] IUnknown** ppVal)
;
```

## Parameters


<a href="" id="ppval"></a>*ppVal*  
\[out\] Pointer to the [IUnknown](http://go.microsoft.com/fwlink/p/?linkid=217447) interface that gives additional information about the cause of the error. If no inner information is available, this parameter is NULL.

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
<td><p>The function successfully returned the error information.</p></td>
</tr>
<tr class="even">
<td><p>S_FALSE</p></td>
<td><p>Indicates that no additional error information is available, and <em>ppVal</em> is NULL.</p></td>
</tr>
<tr class="odd">
<td><p>E_POINTER</p></td>
<td><p>Indicates an invalid pointer.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[IControlErrorInfo](icontrolerrorinfo.md)

 

 







