---
title: pagefault
description: pagefault
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 2d5383e6-626a-4f92-990c-b8cadcb20c2b
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# pagefault


This action produces a text file that summarizes metrics related to page faults.

``` syntax
-a pagefault [-detail -range T1 T2]
```

## Options


<a href="" id="-detail"></a>**-detail**  
Shows the process, the module, and the details of the page faults.

<a href="" id="-ranget1-t2"></a>**-range***T1 T2*  
Shows data between times *T1* and *T2*, both in microseconds.

## Related topics


[Xperf Actions](xperf-actions.md)

[Time and Timestamp Formats](time-and-timestamp-formats.md)

 

 







