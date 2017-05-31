---
title: LoadFromString
description: LoadFromString
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: c1066650-2cf9-4ac0-bf68-9895465a844d
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# LoadFromString


Loads trace merge properties from an XML definition string.

## Syntax


``` syntax
HRESULT LoadFromString
  ([in] BSTR bstrTraceMerge)
;
```

## Parameters


<a href="" id="bstrtracemerge"></a>*bstrTraceMerge*  
\[in\] A string that contains the XML-formatted trace merge properties.

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
<td><p>The function successfully loaded the properites.</p></td>
</tr>
<tr class="even">
<td><p>E_INVALIDARG</p></td>
<td><p>One or more arguments are invalid. Use [IParsingErrorInfo](iparsingerrorinfo.md) to obtain detailed error information.</p></td>
</tr>
<tr class="odd">
<td><p>E_WPRC_FAILED_TO_VALIDATE_TRACEMERGE_PROPERTIES</p></td>
<td><p>The library failed to validate the XML of the trace merge properties. Use <strong>IParsingErrorInfo</strong> to obtain detailed error information.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[ITraceMergeProperties](itracemergeproperties.md)

 

 







