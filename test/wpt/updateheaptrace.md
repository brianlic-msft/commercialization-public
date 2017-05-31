---
title: UpdateHeapTrace
description: UpdateHeapTrace
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 5cbff080-bdaa-412d-8412-22013f2717fb
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# UpdateHeapTrace


\[Some information relates to pre-released product which may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.\]

This function updates an existing heap tracing session with a new set of PIDs, stackwalking events, or other ETW session changes.

``` syntax
ULONG
WINAPI
UpdateHeapTrace(
    _Inout_ PEVENT_TRACE_PROPERTIES Properties,
    _In_z_ LPCWSTR wszSessionName,
    _In_reads_opt_(cPids) const ULONG Pids[],
    _In_  ULONG cPids,
    _In_reads_opt_(cStackTracingEventIds) const STACK_TRACING_EVENT_ID StackTracingEventIds[],
    _In_  ULONG cStackTracingEventIds
    );
```

## Parameters


<a href="" id="tracehandle--out-"></a>*TraceHandle* \[out\]  
Stores a handle to an event tracing session. This parameter is set to zero if the handle is not valid. This parameter should not be compared to INVALID\_HANDLE\_VALUE. Do not use this handle if the function fails.

<a href="" id="properties--in--out-"></a>*Properties* \[in, out\]  
A pointer to an [EVENT\_TRACE\_PROPERTIES](https://msdn.microsoft.com/library/windows/desktop/aa363784.aspx) structure with updated properties for the session. Refer to the [ControlTrace](https://msdn.microsoft.com/library/windows/desktop/aa363696.aspx) function with ControlCode EVENT\_TRACE\_CONTROL\_UPDATE for details about which members of this structure can be specified.

<a href="" id="wszsessionname-in-"></a>*wszSessionName*\[in\]  
The name of the heap tracing session to update. This should be the same name that was passed to StartHeapTrace.

<a href="" id="pids--in-"></a>*Pids* \[in\]  
An array of process IDs to enable heap tracing on.

<a href="" id="cpids--in--out-"></a>*cPids* \[in, out\]  
The size of the Pids array.

<a href="" id="stacktracingeventids--in-"></a>*StackTracingEventIds* \[in\]  
An array of [STACK\_TRACING\_EVENT\_ID](https://msdn.microsoft.com/library/windows/hardware/dn631805.aspx) structures specifying which heap events stack walking should be enabled for. Can be NULL.

<a href="" id="cstacktracingeventids--in-"></a>*cStackTracingEventIds* \[in\]  
The size of the StackTracingEventIds array.

## Return Value


ERROR\_SUCCESS indicates success.

Possible error values are described in the following table.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Error Value</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>ERROR_ALREADY_EXISTS</p></td>
<td><p>Only a single instance of the kernel logger runs on the system. If this function attempts to start after another component has started kernel logging, this error is possibly returned.</p></td>
</tr>
<tr class="even">
<td><p>ERROR_INVALID_FLAGS</p></td>
<td><p>Possibly indicates that there are invalid trace flags in <strong>Properties.EnableFlags</strong>.</p></td>
</tr>
<tr class="odd">
<td><p>ERROR_OUT_OF_MEMORY</p></td>
<td><p>Possibly indicates failure to allocate memory for EVENT_TRACE_PROPERTIES.</p></td>
</tr>
</tbody>
</table>

 

If the function fails for a reason other than those listed, a system error code is returned.

## Remarks


None

## Related topics


[Functions](functions-wpa.md)

[StartHeapTrace](startheaptrace.md)

 

 







