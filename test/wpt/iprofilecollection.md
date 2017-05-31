---
title: IProfileCollection
description: IProfileCollection
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 74833b03-86f0-4909-b497-f409365d4ea7
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# IProfileCollection


Represents a collection of profiles that the library runs as a unit. The interface provides functions that enable the client to add a profile to the collection, compare a profile to one already in the collection, of remove one or all profiles from the collection.

## Syntax


``` syntax
{
    [id(1), helpstring("Add")] HRESULT Add([in] IProfile* pProfile, [in] VARIANT_BOOL fMerge);
    [id(2), helpstring("Remove")] HRESULT Remove([in] IProfile* pProfile);
    [id(3), helpstring("Clear")] HRESULT Clear();
    [id(4), helpstring("IsEqual")] HRESULT IsEqual([in] IProfileCollection* pProfileCollection);    [id(5), helpstring("LoadIntoXML")] HRESULT LoadIntoXML([out] BSTR* pbstrResults);
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
<td><p>[Add](add.md)</p></td>
<td><p>Adds a profile to the collection.</p></td>
</tr>
<tr class="even">
<td><p>[Remove](remove.md)</p></td>
<td><p>Removes a profile from the collection.</p></td>
</tr>
<tr class="odd">
<td><p>[Clear](clear.md)</p></td>
<td><p>Clears all profiles from the collection.</p></td>
</tr>
<tr class="even">
<td><p>[IsEqual](isequal-iprofilecollection.md)</p></td>
<td><p>Compares two <strong>IProfileCollection</strong> objects to see whether they have matching profile properties.</p></td>
</tr>
<tr class="odd">
<td><p>[LoadIntoXML](loadintoxml.md)</p></td>
<td><p></p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Interfaces](interfaces-wprcontrol.md)

 

 







