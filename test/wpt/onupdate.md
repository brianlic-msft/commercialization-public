---
title: OnUpdate
description: OnUpdate
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 0dff0606-a8f9-4698-a086-1f8ad7e6b695
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# OnUpdate


Instructs the library to continue an operation.

## Syntax


``` syntax
HRESULT OnUpdate
  ([in] ULONG CurrentValuePercent)
;
```

## Parameters


<a href="" id="currentvaluepercent"></a>*CurrentValuePercent*  
\[in\] Indicates the percentage of the operation that has completed.

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
<td><p>Indicates success. The operation continues.</p></td>
</tr>
<tr class="even">
<td><p>E_ABORT</p></td>
<td><p>The client has requested that the library cancel the operation. For example, if the user clicks <strong>Cancel</strong>, the client returns this code to the library.</p></td>
</tr>
</tbody>
</table>

 

## Remarks


This function is called frequently during an action when some update is performed. For example, when starting tracing, it is called after every provider is enabled and when stopping and merging the trace after some percentage of buffers is merged.

## Related topics


[IControlProgressHandler](icontrolprogresshandler.md)

 

 







