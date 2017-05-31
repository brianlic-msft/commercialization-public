---
title: IsEqual
description: IsEqual
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 358b6599-0360-47ee-bac7-8ae0f119c01f
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


Compares two [IProfileCollection](iprofilecollection.md) objects to see whether they have matching profile properties. Ordering of the profiles is not taken into account.

## Syntax


``` syntax
HRESULT IsEqual
  ([in] IProfileCollection* pProfileCollection)
;
```

## Parameters


<a href="" id="pprofilecollection"></a>*pProfileCollection*  
\[in\] A pointer to the **IProfileCollection** object to be compared.

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
<td><p>The profile collections are equal.</p></td>
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


[IProfileCollection](iprofilecollection.md)

 

 







