---
title: EnableBootRecording
description: EnableBootRecording
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: a1b68ad9-c479-4646-be41-a1dfbf346369
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# EnableBootRecording


Enables boot recording for the specified profile collection.

## Syntax


``` syntax
HRESULT EnableBootRecording
  ([in] IProfileCollection* pProfileCollection)
;
```

## Parameters


<a href="" id="pprofilecollection"></a>*pProfileCollection*  
\[in\] A pointer to an [IProfileCollection](iprofilecollection.md) object that contains a collection of profiles to start during boot.

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
<td><p>The function successfully enabled boot recording.</p></td>
</tr>
<tr class="even">
<td><p>E_WPRC_FAILED_TO_ENABLE_PROFILES_FOR_BOOT_TRACING</p></td>
<td><p>The library failed to save the profiles. Use [IControlErrorInfo](icontrolerrorinfo.md) to get detailed error information.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[IOnOffTransitionManager](ionofftransitionmanager.md)

 

 







