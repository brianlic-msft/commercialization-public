---
title: IEnumProfile
description: IEnumProfile
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: a7f512d4-13dd-44be-881b-2b705deb973a
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# IEnumProfile


Provides a standard COM enumeration method for enumerating a collection of [IProfile](iprofile.md) interfaces.

## Syntax


``` syntax
{
  [id(1), helpstring("Next")] HRESULT Next
    ([in] ULONG celt,
    [out, size_is(celt), length_is(*pCeltFetched)] IProfile** prgVar,
    [out] ULONG* pCeltFetched);
  [id(2), helpstring("Skip")] HRESULT Skip
    ([in] ULONG celt);
  [id(3), helpstring("Reset")] HRESULT Reset();
  [id(4), helpstring("Clone")] HRESULT Clone
    ([out] IEnumProfile** ppEnum);
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
<th>Method</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>[Next](next-ienumprofile.md)</p></td>
<td><p>Returns an array that contains the specified number of elements.</p></td>
</tr>
<tr class="even">
<td><p>[Skip](skip-ienumprofile.md)</p></td>
<td><p>Indicates the number of elements to skip.</p></td>
</tr>
<tr class="odd">
<td><p>[Reset](reset-ienumprofile.md)</p></td>
<td><p>Resets the enumeration.</p></td>
</tr>
<tr class="even">
<td><p>[Clone](clone-ienumprofile.md)</p></td>
<td><p>Creates a clone enumerator.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Interfaces](interfaces-wprcontrol.md)

 

 







