---
title: OnBegin
description: OnBegin
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 125d9c1c-bc34-4642-ae9c-ddd0f62745cb
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# OnBegin


Instructs the library to continue progress of an operation.

## Syntax


``` syntax
HRESULT OnBegin();
```

## Parameters


None.

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
<td><p>The client has requested to cancel the operation. For example, if the user clicks <strong>Cancel</strong>, the client returns this code.</p></td>
</tr>
</tbody>
</table>

 

## Remarks


This method is used in callbacks for various tracing actions, such as starting or stopping a trace. It is called just before the action begins.

## Related topics


[IControlProgressHandler](icontrolprogresshandler.md)

 

 







