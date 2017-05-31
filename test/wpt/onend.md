---
title: OnEnd
description: OnEnd
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 3daba834-c555-40d4-8afa-ed0a1f6aaedf
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# OnEnd


Returns a status code after the end of an operation.

## Syntax


``` syntax
HRESULT OnEnd(HRESULT hrResult);
```

## Parameters


<a href="" id="hrresult--in-"></a>*hrResult* \[in\]  
Status code of the operation after it finishes.

## Return Value


The following table describes possible return values. WPR ignores failure values.

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
<td><p>The function successfully returned the status.</p></td>
</tr>
</tbody>
</table>

 

## Remarks


The library does not check the return value of this function.

When stopping or saving a trace, this callback also returns the number of events lost in the trace.

## Related topics


[IControlProgressHandler](icontrolprogresshandler.md)

 

 







