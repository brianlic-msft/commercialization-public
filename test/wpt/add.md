---
title: Add
description: Add
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 85e46ed9-12d7-45b8-8e5a-ffbd9193e668
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Add


Adds a profile to the collection.

## Syntax


``` syntax
HRESULT Add
  ([in] IProfile* pProfile,
  [in] VARIANT_BOOL fMerge)
;
```

## Parameters


<a href="" id="pprofile"></a>*pProfile*  
\[in\] A pointer to an **IProfile** object to be added to the collection.

<a href="" id="fmerge"></a>*fMerge*  
\[in\] A Boolean value that indicates whether to merge the *pProfile* with one in the collection with the same name. If a mutable profile is in the collection and this parameter is set to TRUE, the profiles are merged. Otherwise, the method returns an error. If the collection does not have a profile with the same name, the method ignores this parameter and adds the profile to the collection.

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
<td><p>The function successfully added the profile to the collection.</p></td>
</tr>
<tr class="even">
<td><p>E_INVALIDARG</p></td>
<td><p>One or more arguments are invalid. Use [IErrorInfo](http://go.microsoft.com/fwlink/p/?linkid=217161) to obtain detailed error information.</p></td>
</tr>
<tr class="odd">
<td><p>E_WPRC_FAILED_TO_ADD_PROFILE</p></td>
<td><p>The library failed to add a profile to the collection. Use <strong>IErrorInfo</strong> to obtain detailed error information.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[IProfileCollection](iprofilecollection.md)

 

 







