---
title: IsEqual
description: IsEqual
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b555fa8d-71fc-4ca1-a1e8-592cce52d738
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# IsEqual


Compares two [IProfile](iprofile.md) objects.

## Syntax


``` syntax
HRESULT IsEqual
  ([in] IProfile* pProfile)
;
```

## Parameters


<a href="" id="pprofile"></a>*pProfile*  
\[in\] A pointer to an **IProfile** object to be compared.

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
<td><p>The objects have the same profile, session, and provider properties.</p></td>
</tr>
<tr class="even">
<td><p>S_FALSE</p></td>
<td><p>The objects are not equal.</p></td>
</tr>
<tr class="odd">
<td><p>E_INVALIDARG</p></td>
<td><p>One or more arguments are invalid. See [IParsingErrorInfo](iparsingerrorinfo.md) for detailed error information.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[IProfile](iprofile.md)

 

 







