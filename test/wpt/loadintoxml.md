---
title: LoadIntoXML
description: LoadIntoXML
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: aa5556fa-d58a-450d-b217-93986c383239
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# LoadIntoXML


Obtains the XML format of all profiles in the [IProfileCollection](iprofilecollection.md) object.

## Syntax


``` syntax
[id(5), helpstring("LoadIntoXML")] HRESULT LoadIntoXML([out] BSTR* pbstrResults);
```

## Parameters


<a href="" id="pbstrresults--out-"></a>*pbstrResults* \[out\]  
Pointer to a result string.

## Return Value


## Remarks


This function outputs one combined profile for all the profiles that have been added to the profile collection.

## Related topics


[IProfileCollection](iprofilecollection.md)

 

 







