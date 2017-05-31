---
title: LoadFromFile
description: LoadFromFile
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 73d323b7-1a32-4f0a-aa5a-bd61d96af687
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# LoadFromFile


Loads trace merge properties from a file.

## Syntax


``` syntax
HRESULT LoadFromFile
  ([in] BSTR bstrTraceMergeName,
  [in] BSTR bstrFileName)
;
```

## Parameters


<a href="" id="bstrtracemergename"></a>*bstrTraceMergeName*  
\[in\] The name of the merge properties to load.

<a href="" id="bstrfilename"></a>*bstrFileName*  
\[in\] The name of the file that contains the *bstrTraceMergeName* merge properties.

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
<td><p>The function successfully loaded the properties.</p></td>
</tr>
<tr class="even">
<td><p>E_INVALIDARG</p></td>
<td><p>One or more arguments are invalid. Use [IParsingErrorInfo](iparsingerrorinfo.md) to obtain detailed error information.</p></td>
</tr>
<tr class="odd">
<td><p>E_WPRC_FAILED_TO_VALIDATE_TRACEMERGE_PROPERTIES</p></td>
<td><p>The library failed to validate the XML that defines the trace merge properties. Use <strong>IParsingErrorInfo</strong> to obtain detailed error information.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[ITraceMergeProperties](itracemergeproperties.md)

 

 







