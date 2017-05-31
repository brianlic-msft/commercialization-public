---
title: Stop
description: Stop
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 7f5736cc-4ec7-4b6a-bf93-b421a3fd5c39
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Stop


Stops a recording in file logging mode.

## Syntax


``` syntax
HRESULT Stop
  ([in] BSTR bstrFileName,
  [in] IProfileCollection* pProfileCollection,
  [in] ITraceMergeProperties* pTraceMergeProperties)
;
```

## Parameters


<a href="" id="bstrfilename"></a>*bstrFileName*  
\[in\] The name of the file to which merged events from recordings of all the profiles are saved.

<a href="" id="pprofilecollection"></a>*pProfileCollection*  
\[in\] A pointer to an [IProfileCollection](iprofilecollection.md) object that contains a collection of profiles to save.

<a href="" id="ptracemergeproperties"></a>*pTraceMergeProperties*  
\[in\] A pointer to an [ITraceMergeProperties](itracemergeproperties.md) object that contains properties with which to merge recordings.

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
<td><p>The function successfully stopped the recording.</p></td>
</tr>
<tr class="even">
<td><p>E_INVALIDARG</p></td>
<td><p>One or more arguments are invalid.</p></td>
</tr>
<tr class="odd">
<td><p>E_WPRC_FAILED_TO_STOP_PROFILE</p></td>
<td><p>The library failed to stop a profile in the profile collection. Use [IControlErrorInfo](icontrolerrorinfo.md) to obtain detailed error information.</p></td>
</tr>
<tr class="even">
<td><p>E_WPRC_TRACE_MERGE_LOST_EVENTS</p></td>
<td><p>The Event Tracing for Windows (ETW) session lost events, and merging the event trace log (ETL) files from the session may create incomplete ETL file.</p></td>
</tr>
</tbody>
</table>

 

## Remarks


Use this function only for profiles that are logging sequentially to a file. After the sessions are saved, the recording stops.

## Related topics


[IControlManager](icontrolmanager.md)

 

 







