---
title: Update
description: Update
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 4d3707c3-2694-47e9-845b-8d3767c0b2cc
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Update


Updates a profile collection.

## Syntax


``` syntax
HRESULT Update
  ([in] IProfileCollection* pProfileCollection)
;
```

## Parameters


<a href="" id="pprofilecollection"></a>*pProfileCollection*  
\[in\] A pointer to the [IProfileCollection](iprofilecollection.md) object that contains a collection of profiles to update.

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
<td><p>The function successfully updated the <strong>IProfileCollection</strong>.</p></td>
</tr>
<tr class="even">
<td><p>E_INVALIDARG</p></td>
<td><p>One or more arguments are invalid.</p></td>
</tr>
<tr class="odd">
<td><p>E_WPRC_FAILED_TO_UPDATE_PROFILE</p></td>
<td><p>The library failed to update a profile in the profile collection. Use [IControlErrorInfo](icontrolerrorinfo.md) to obtain detailed error information.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[IControlManager](icontrolmanager.md)

 

 







