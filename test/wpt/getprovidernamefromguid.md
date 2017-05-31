---
title: GetProviderNameFromGuid
description: GetProviderNameFromGuid
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 65612d2b-6fa2-4bda-b183-8e25d62605c1
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# GetProviderNameFromGuid


Gets the provider name that is associated with a GUID identifier.

## Syntax


``` syntax
HRESULT GetProviderNameFromGuid
  ([out] BSTR* bstrProviderIdStr,
  [in] REFGUID ProviderId)
;
```

## Parameters


<a href="" id="bstr--bstrprovideridstr"></a>*BSTR\* bstrProviderIdStr*  
\[out\] A string that indicates the provider name.

<a href="" id="refguid-providerid"></a>*REFGUID ProviderId*  
\[in\] A GUID that indicates the provider identifier.

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
<td><p>E_WPRC_FAILED_TO_TRANSLATE_GUID_TO_EVENT_PROVIDER_NAME</p></td>
<td><p>WPR failed to translate the GUID to an event provider name.</p></td>
</tr>
<tr class="even">
<td><p>S_OK</p></td>
<td><p>The function successfully returned the name.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[IControlManager](icontrolmanager.md)

 

 







