---
title: GetProviderGuidFromName
description: GetProviderGuidFromName
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 855b63df-307e-4e10-bb83-561fa71e13c2
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# GetProviderGuidFromName


Gets the provider GUID associated with the specified name.

## Syntax


``` syntax
HRESULT GetProviderGuidFromName
  ([out] GUID* ProviderId,
  [in] BSTR bstrProViderName)
;
```

## Parameters


<a href="" id="guid--providerid"></a>*GUID\* ProviderId*  
\[out\] A GUID that indicates the provider identifier.

<a href="" id="bstr-bstrprovidername"></a>*BSTR bstrProViderName*  
\[in\] A string that indicates the provider name.

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
<td><p>E_WPRC_FAILED_TO_TRANSLATE_EVENT_PROVIDER_NAME_TO_GUID</p></td>
<td><p>WPR was unable to translate the event provider name to a GUID.</p></td>
</tr>
<tr class="even">
<td><p>S_OK</p></td>
<td><p>The function successfully returned the GUID.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[IControlManager](icontrolmanager.md)

 

 







