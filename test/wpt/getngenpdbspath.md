---
title: GetNGenPdbsPath
description: GetNGenPdbsPath
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b3abddcc-b83f-4cfc-9e9a-64ec96465b21
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# GetNGenPdbsPath


Returns the path for both cache and destination NGEN PDB files for managed code.

## Syntax


``` syntax
HRESULT GetNGenPdbsPath
  ([out] VARIANT_BOOL* pfEnable,
  [out] BSTR* pbstrNGenPdbsCachePath,
  [out] BSTR* pbstrNGenPdbsTargetPath)
;
```

## Parameters


<a href="" id="pfenable"></a>*pfEnable*  
\[out\] A Boolean that indicates whether NGEN PDBs are enabled.

<a href="" id="pbstrngenpdbscachepath"></a>*pbstrNGenPdbsCachePath*  
\[out\] A pointer to the source path.

<a href="" id="pbstrngenpdbstargetpath"></a>*pbstrNGenPdbsTargetPath*  
\[out\] A pointer to the destination path.

## Return Value


The following table describes possible return values. Failure return values are implementation-specific.

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
<td><p>Indicates success.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[ITraceMergeTextHandler](itracemergetexthandler.md)

 

 







