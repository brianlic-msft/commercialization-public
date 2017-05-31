---
title: Cancel
description: Cancel
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 282d79d5-7acd-442a-8528-f5894dfde2dc
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Cancel


Cancels a recording without saving any data.

## Syntax


``` syntax
HRESULT Cancel
  ([in] IProfileCollection* pProfileCollection)
;
```

## Parameters


<a href="" id="pprofilecollection"></a>*pProfileCollection*  
\[in\] A pointer to an [IProfileCollection](iprofilecollection.md) object, which contains a collection of profiles to cancel.

## Return Value


The following table describes possible values.

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
<td><p>E_INVALIDARG</p></td>
<td><p>The pointer was invalid.</p></td>
</tr>
<tr class="even">
<td><p>E_WPRC_RUNTIME_STATE_PROFILES_NOT_RUNNING</p></td>
<td><p>The profile is not currently running.</p></td>
</tr>
<tr class="odd">
<td><p>ERROR_WMI_INSTANCE_NOT_FOUND</p></td>
<td><p>The requested instance was not found.</p></td>
</tr>
<tr class="even">
<td><p>S_OK</p></td>
<td><p>The function successfully returned the <strong>IProfileCollection</strong>.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[IControlManager](icontrolmanager.md)

 

 







