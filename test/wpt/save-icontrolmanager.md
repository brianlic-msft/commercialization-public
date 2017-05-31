---
title: Save
description: Save
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: eedd3310-1f95-4e44-9be2-b33ed98dfa9a
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Save


Saves a recording that is logged to circular buffers in memory to the specified event trace log (ETL) file. The recording continues to run.

## Syntax


``` syntax
HRESULT Save
  ([in] BSTR bstrFileName,
  [in] IProfileCollection* pProfileCollection,
  [in] ITraceMergeProperties* pTraceMergeProperties)
;
```

## Parameters


<a href="" id="bstrfilename"></a>*bstrFileName*  
\[in\] The name of the file to which merged events from recordings of all the profiles are saved.

<a href="" id="pprofilecollection"></a>*pProfileCollection*  
\[in\] A pointer to the [IProfileCollection](iprofilecollection.md) object that contains a collection of profiles to save.

<a href="" id="ptracemergeproperties"></a>*pTraceMergeProperties*  
\[in\] A pointer to the [ITraceMergeProperties](itracemergeproperties.md) object that contains properties with which to merge recordings.

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
<td><p>The function successfully saved the recording.</p></td>
</tr>
<tr class="even">
<td><p>E_INVALIDARG</p></td>
<td><p>One or more arguments are invalid.</p></td>
</tr>
<tr class="odd">
<td><p>E_WPRC_FAILED_TO_SAVE_PROFILE</p></td>
<td><p>The library failed to save a profile in the profile collection. Use [IControlErrorInfo](icontrolerrorinfo.md) to obtain detailed error information.</p></td>
</tr>
<tr class="even">
<td><p>E_WPRC_TRACE_MERGE_LOST_EVENTS</p></td>
<td><p>The Event Tracing for Windows (ETW) session lost events, and merging the event trace log (ETL) files from the session may create an incomplete ETL file.</p></td>
</tr>
</tbody>
</table>

 

## Remarks


This function is used only for profiles that are logging to circular buffers. After the sessions are saved, the recording continues to run.

## Related topics


[IControlManager](icontrolmanager.md)

 

 







