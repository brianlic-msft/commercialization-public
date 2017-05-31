---
title: QueryXML
description: QueryXML
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 1dd74aaf-f16c-47f8-9eda-876a404ef59a
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# QueryXML


Indicates the XML format of the currently running profile and whether the profile is running properly.

## Syntax


``` syntax
HRESULT QueryXML
  ([out] BSTR* pbstrResults,
  [in] VARIANT_BOOL fValidateRuntimeState)
;
```

## Parameters


<a href="" id="bstr--pbstrresults"></a>*BSTR\* pbstrResults*  
\[out\] A pointer to a result string.

<a href="" id="variant-bool-fvalidateruntimestate"></a>*VARIANT\_BOOL fValidateRuntimeState*  
\[in\] A Boolean that indicates whether the runtime state is valid.

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
<td><p>E_WPRC_RUNTIME_STATE_PROFILES_NOT_RUNNING</p></td>
<td><p>Indicates that the profile is not running.</p></td>
</tr>
<tr class="even">
<td><p>S_OK</p></td>
<td><p>The function successfully returned the XML format.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[IControlManager](icontrolmanager.md)

 

 







