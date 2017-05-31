---
title: GetText
description: GetText
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 6abaf7c8-ce52-48af-b4cd-a0039123140c
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# GetText


Obtains the specified text.

## Syntax


``` syntax
HRESULT GetText
  ([in] ULONG iText,
  [out] BSTR* pbstrText)
;
```

## Parameters


<a href="" id="itext"></a>*iText*  
\[in\]

<a href="" id="pbstrtext"></a>*pbstrText*  
\[out\] A pointer to the text string.

## Return Value


The following table describes possible return values. Failure return values are implementation-specific.

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
<td><p>Indicates success.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[ITraceMergeTextHandler](itracemergetexthandler.md)

 

 







