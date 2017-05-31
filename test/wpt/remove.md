---
title: Remove
description: Remove
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 41897744-5d47-4fec-8f9d-490e98e17e14
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Remove


Removes an [IProfile](iprofile.md) object from the collection.

## Syntax


``` syntax
HRESULT Remove
  ([in] IProfile* pProfile)
;
```

## Parameters


<a href="" id="pprofile"></a>*pProfile*  
\[in\] A pointer to the **IProfile** object to be removed from the collection.

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
<td><p>The function successfully removed the profile from the collection.</p></td>
</tr>
<tr class="even">
<td><p>E_INVALIDARG</p></td>
<td><p>The argument is invalid. Use [IErrorInfo](http://go.microsoft.com/fwlink/p/?linkid=217161) to obtain detailed error information.</p></td>
</tr>
<tr class="odd">
<td><p>E_WPRC_FAILED_TO_REMOVE_PROFILE</p></td>
<td><p>The library failed to remove the profile from the collection. Use <strong>IErrorInfo</strong> to obtain detailed error information.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[IProfileCollection](iprofilecollection.md)

 

 







