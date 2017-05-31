---
title: Start
description: Start
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 58474a2e-2e53-487e-8cca-a09959559fb7
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Start


Starts a recording.

## Syntax


``` syntax
HRESULT Start
  ([in] IProfileCollection* pProfileCollection,
  [out, retval] CLoggingMode* pLoggingMode)
;
```

## Parameters


<a href="" id="pprofilecollection"></a>*pProfileCollection*  
\[in\] A pointer to an **IProfileCollection** object that contains a collection of profiles to start.

<a href="" id="ploggingmode"></a>*pLoggingMode*  
\[out\] A pointer to a **CLoggingMode** enumeration element that indicates whether the profiles log to memory or write to a file.

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
<td><p>The function successfully started the recording.</p></td>
</tr>
<tr class="even">
<td><p>E_INVALIDARG</p></td>
<td><p>One or more arguments are invalid.</p></td>
</tr>
<tr class="odd">
<td><p>One or more arguments are invalid.</p></td>
<td><p>The pointer is invalid.</p></td>
</tr>
<tr class="even">
<td><p>E_WPRC_FAILED_TO_START_PROFILE</p></td>
<td><p>The library failed to start a profile in the profile collection. Use [IControlErrorInfo](icontrolerrorinfo.md) to obtain detailed error information.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[IControlManager](icontrolmanager.md)

 

 







