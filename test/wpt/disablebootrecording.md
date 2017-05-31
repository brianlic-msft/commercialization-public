---
title: DisableBootRecording
description: DisableBootRecording
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 9de515ce-d77e-4a5d-95d8-b611eea5394a
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DisableBootRecording


Disables boot recording for the specified profile collection.

## Syntax


``` syntax
HRESULT DisableBootRecording
  ([in] IProfileCollection* pProfileCollection)
;
```

## Parameters


<a href="" id="pprofilecollection"></a>*pProfileCollection*  
\[in\] A pointer to an [IProfileCollection](iprofilecollection.md) object that contains a collection of profiles that must be removed so that they do not start during boot.

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
<td><p>The function successfully disabled boot recording.</p></td>
</tr>
<tr class="even">
<td><p>E_WPRC_FAILED_TO_DISABLE_PROFILES_FOR_BOOT_TRACING</p></td>
<td><p>The library failed to remove the profiles. Use [IControlErrorInfo](icontrolerrorinfo.md) to get detailed error information.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[IOnOffTransitionManager](ionofftransitionmanager.md)

 

 







