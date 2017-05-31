---
title: GetFileName
description: GetFileName
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 15f12bd8-a977-4c39-8da7-74b51bd7d54a
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# GetFileName


Obtains the string from the specified file.

## Syntax


``` syntax
HRESULT GetFileName
  ([out] BSTR* pbstrFileName)
;
```

## Parameters


<a href="" id="pbstrfilename"></a>*pbstrFileName*  
\[out\] A pointer to the string file name.

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

 

 







