---
title: Reset
description: Reset
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: ef800c09-aeda-4e16-a12b-9938faccf5ff
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Reset


Resets the enumerator back to the beginning.

## Syntax


``` syntax
HRESULT Reset();
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
<td><p>The function successfully reset the enumeration.</p></td>
</tr>
<tr class="even">
<td><p>S_FALSE</p></td>
<td><p>Indicates failure.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[IEnumControlWarningInfo](ienumcontrolwarninginfo.md)

 

 







