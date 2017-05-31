---
title: IControlProgressHandler
description: IControlProgressHandler
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 05c08784-fcfe-46f8-8209-51fd2b1367fe
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# IControlProgressHandler


This interface is a client-side handler that receives updates when the library performs an operation. The library then executes synchronous callbacks to the client indicating the progress of the operation. Depending on the user action, the client return code instructs the library either to continue the operation or else to cancel it. This process enables the UI to show the user the progress of long operations such as **Save**. If the user chooses to cancel the operation, the UI returns the corresponding code to the library.

## Syntax


``` syntax
{
  [id(1), helpstring("OnBegin")] HRESULT OnBegin();
  [id(2), helpstring("OnUpdate")] HRESULT OnUpdate
    ([in] ULONG CurrentValuePercent);
  [id(3), helpstring("OnEnd")] HRESULT OnEnd
    ([in] HRESULT hrResult);
};
```

## Functions


The following table describes the functions that this interface provides.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Function</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>[OnBegin](onbegin.md)</p></td>
<td><p>Instructs the library to begin an operation.</p></td>
</tr>
<tr class="even">
<td><p>[OnUpdate](onupdate.md)</p></td>
<td><p>Instructs the library to continue progress of an operation.</p></td>
</tr>
<tr class="odd">
<td><p>[OnEnd](onend.md)</p></td>
<td><p>Returns a status code after the end of an operation.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Interfaces](interfaces-wprcontrol.md)

 

 







