---
title: UpdateShutdownRecording
description: UpdateShutdownRecording
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 0efaf47c-ca92-4be2-bfd4-f71a6b300297
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# UpdateShutdownRecording


Updates shutdown recording.

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
\[in\] Indicates the name of the event trace log (ETL) file to which events are logged.

<a href="" id="pprofilecollection"></a>*pProfileCollection*  
\[in\] Indicates the **IProfileCollection** object.

<a href="" id="ptracemergeproperties"></a>*pTraceMergeProperties*  
\[in\] Indicates the **ITraceMergeProperties** object.

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
<td><p>The function successfully updated the shutdown recording.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[IOnOffTransitionManager](ionofftransitionmanager.md)

 

 







