---
title: IEnumControlWarningInfo
description: IEnumControlWarningInfo
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 49078217-91ef-444e-9d08-88f87d1b0280
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# IEnumControlWarningInfo


Provides a standard COM enumeration method for enumerating a collection of [IControlErrorInfo](icontrolerrorinfo.md) interfaces. When the library performs an operation such as start or update, it may not enable some providers, such as those that are not supported on the system. In that case, the library creates a list of **IControlErrorInfo** objects, each of which contains more detailed contextual error information that describes why the provider was not enabled. The client can query for this interface from [IControlManager](icontrolmanager.md) to determine whether any errors are listed.

## Syntax


``` syntax
{
  [id(1), helpstring("Next")] HRESULT Next
    ([in] ULONG celt,
    [out, size_is(celt), length_is(*pCeltFetched)] IControlErrorInfo** prgVar,
    [out] ULONG* pCeltFetched);
  [id(2), helpstring("Skip")] HRESULT Skip
    ([in] ULONG celt);
  [id(3), helpstring("Reset")] HRESULT Reset();
  [id(4), helpstring("Clone")] HRESULT Clone
    ([out] IEnumControlWarningInfo** ppEnum);
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
<td><p>[Next](next.md)</p></td>
<td><p>Returns an array that contains the specified number of elements.</p></td>
</tr>
<tr class="even">
<td><p>[Skip](skip.md)</p></td>
<td><p>Indicates the number of elements to skip.</p></td>
</tr>
<tr class="odd">
<td><p>[Reset](reset.md)</p></td>
<td><p>Resets the enumeration.</p></td>
</tr>
<tr class="even">
<td><p>[Clone](clone.md)</p></td>
<td><p>Creates a clone enumerator.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Interfaces](interfaces-wprcontrol.md)

 

 







