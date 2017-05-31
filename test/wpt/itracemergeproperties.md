---
title: ITraceMergeProperties
description: ITraceMergeProperties
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 6afd2bab-ef90-4182-9757-45d62b4be952
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# ITraceMergeProperties


Enables the client to specify how multiple event trace log (ETL) files should be merged, using XML. It provides functions that load properties, in XML format, either from a file or from a string.

## Syntax


``` syntax
{
  [id(1), helpstring("LoadFromFile")] HRESULT LoadFromFile([in] BSTR bstrTraceMergeName, [in] BSTR bstrFileName);
  [id(2), helpstring("LoadFromString")] HRESULT LoadFromString([in] BSTR bstrTraceMerge);
  [id(3), helpstring("IsEqual")] HRESULT IsEqual([in] ITraceMergeProperties* pTraceMergeProperties);
};
```

## Functions


The following table describes functions that this interface provides.

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
<td><p>[IsEqual](isequal-itracemergeproperties.md)</p></td>
<td><p>Loads the properties from the specified file.</p></td>
</tr>
<tr class="even">
<td><p>[LoadFromString](loadfromstring-itracemergeproperties.md)</p></td>
<td><p>Loads the properties from the specified string.</p></td>
</tr>
<tr class="odd">
<td><p>[IsEqual](isequal-itracemergeproperties.md)</p></td>
<td><p>Compares two <strong>ITraceMergeProperties</strong> objects.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Interfaces](interfaces-wprcontrol.md)

 

 







