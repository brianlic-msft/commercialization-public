---
title: MergeShutdownRecording
description: MergeShutdownRecording
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 3f8ac92e-53f4-4f48-8862-d165c84b697e
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# MergeShutdownRecording


Merges recordings collected during last shutdown.

## Syntax


``` syntax
HRESULT MergeShutdownRecording
  ([in] BSTR bstrFileName,
  [in] IProfileCollection* pProfileCollection,
  [in] ITraceMergeProperties* pTraceMergeProperties)
;
```

## Parameters


<a href="" id="bstrfilename"></a>*bstrFileName*  
\[in\] Indicates the name of the Event Tracing for Windows (ETL) file being logged.

<a href="" id="pprofilecollection"></a>*pProfileCollection*  
\[in\] A pointer to an **IProfileCollection** object.

<a href="" id="ptracemergeproperties"></a>*pTraceMergeProperties*  
\[in\] A pointer to an **ITraceMergeProperties** object.

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
<td><p>E_POINTER</p></td>
<td><p>At least one of the function arguments is null.</p></td>
</tr>
<tr class="even">
<td><p>E_WPRC_INVALID_MERGESHUTDOWN_OPERATION</p></td>
<td><p>Indicates an unsuccessful operation. This can occur if no shutdown recording ran during the last shutdown.</p></td>
</tr>
<tr class="odd">
<td><p>E_WPRC_RUNTIME_STATE_PROFILES_NOT_RUNNING</p></td>
<td><p>Indicates that the profile is not running. This can occur if no shutdown recording ran during the last shutdown.</p></td>
</tr>
<tr class="even">
<td><p>S_OK</p></td>
<td><p>The function successfully merged the shutdown recording.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[IOnOffTransitionManager](ionofftransitionmanager.md)

 

 







