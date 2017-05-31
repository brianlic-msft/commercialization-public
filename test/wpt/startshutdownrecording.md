---
title: StartShutdownRecording
description: StartShutdownRecording
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 763c2f77-aeed-43af-9238-c0a041e02867
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# StartShutdownRecording


Starts shutdown recording.

## Syntax


``` syntax
HRESULT StartShutdownRecording
  ([in] IProfileCollection* pProfileCollection)
;
```

## Parameters


<a href="" id="pprofilecollection"></a>*pProfileCollection*  
\[in\] Indicates the **IProfileCollection** object.

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
<td><p>The function successfully started the shutdown recording.</p></td>
</tr>
<tr class="even">
<td><p>E_POINTER</p></td>
<td><p>At least one of function arguments is null.</p></td>
</tr>
<tr class="odd">
<td><p>E_WPRC_RUNTIME_STATE_PROFILES_RUNNING</p></td>
<td><p>Recording is already running (it should be stopped/canceled before call to this function).</p></td>
</tr>
<tr class="even">
<td><p>E_WPRC_RUNTIME_STATE_BOOT_RECORDING</p></td>
<td><p>Boot recording is already running (it should be stopped/canceled before call to this function).</p></td>
</tr>
<tr class="odd">
<td><p>E_WPRC_RUNTIME_STATE_EVENT_SESSION_RUNNING</p></td>
<td><p>One of event sessions that should be started is already running. It could be started earlier by some other application (or as a result of WPR state corruption, for example after WPR crash).</p></td>
</tr>
<tr class="even">
<td><p>E_WPRC_INVALID_STARTSHUTDOWN_OPERATION</p></td>
<td><p>Invalid profile for shutdown recording (for example, logging mode is memory, but only file supported for shutdown).</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[IOnOffTransitionManager](ionofftransitionmanager.md)

 

 







