---
title: Clear
description: Clear
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 7c37cc24-75c5-45e3-b35a-7d874574ce54
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Clear


Removes all profiles from the collection.

## Syntax


``` syntax
HRESULT Clear();
```

## Parameters


None.

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
<td><p>The function successfully removed all profiles from the collection.</p></td>
</tr>
<tr class="even">
<td><p>E_WPRC_FAILED_TO_CLEAR_PROFILE_COLLECTION</p></td>
<td><p>The library failed to remove all profiles from the collection. Use [IErrorInfo](http://go.microsoft.com/fwlink/p/?linkid=217161 ) to obtain detailed error information.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[IProfileCollection](iprofilecollection.md)

 

 







