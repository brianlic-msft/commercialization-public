---
title: Query
description: Query
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 676f0ed9-641c-49ea-882f-0607e387f8d0
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Query


Queries the properties of the session and providers in all profiles.

## Syntax


``` syntax
HRESULT Query
  ([out] BSTR* pbstrResults,
  [in] VARIANT_BOOL fValidateRuntimeState)
;
```

## Parameters


<a href="" id="pbstrresults"></a>*pbstrResults*  
\[out\] A string in XML format that contains session and provider properties of all the profiles started by the WPRC library.

<a href="" id="fvalidateruntimestate"></a>*fValidateRuntimeState*  
\[in\] A Boolean that indicates whether the library should determine whether the recording is running.

## Return Value


The following table describes the possible values.

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
<td><p>The function successfully returned the properties.</p></td>
</tr>
<tr class="even">
<td><p>E_POINTER</p></td>
<td><p>The pointer is invalid.</p></td>
</tr>
<tr class="odd">
<td><p>E_WPRC_FAILED_TO_QUERY_PROFILES</p></td>
<td><p>The library failed to query the properties of the session and providers in all the profiles. Use [IControlErrorInfo](icontrolerrorinfo.md) to get detailed error information.</p></td>
</tr>
<tr class="even">
<td><p>E_WPRC_INVALID_PROFILES_RUNTIME_STATE</p></td>
<td><p>The list of profiles that are running on the system does not match those used to start the recording. See <strong>IControlErrorInfo</strong> for detailed error information.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[IControlManager](icontrolmanager.md)

 

 







