---
title: hardfault
description: hardfault
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: eef636a1-7b5f-48bd-9fa5-cc3d8a74c88d
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# hardfault


This action produces a text report that summarizes hard faults.

``` syntax
-a hardfault [-file] [-bytes] [-range T1 T2]
```

## Options


<a href="" id="-file"></a>**-file**  
Sort first by file, instead of by process.

<a href="" id="-bytes"></a>**-bytes**  
Sort second by total number of bytes, instead of by fault count.

<a href="" id="-ranget1-t2"></a>**-range***T1 T2*  
Shows hard faults recorded between *T1* and *T2*, in microseconds.

## Related topics


[Xperf Actions](xperf-actions.md)

[Time and Timestamp Formats](time-and-timestamp-formats.md)

 

 







