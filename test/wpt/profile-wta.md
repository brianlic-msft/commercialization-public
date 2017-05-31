---
title: profile
description: profile
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b0b4c89c-70e7-4fe8-986d-e057b8074c9e
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# profile


This action produces a text file that summarizes metrics for profiles.

``` syntax
-a profile [-util [n]] [-detail] [-range T1 [T2]]
```

## Options


<a href="" id="-util-n-"></a>**-util***\[n\]*  
Shows CPU utilization for *n* second intervals. The default is 1 second.

<a href="" id="-detail"></a>**-detail**  
Shows CPU samples bucketed by process and module if symbol decoding is not enabled, and by process and function name if symbol decoding is enabled.

<a href="" id="-ranget1--t2-"></a>**-range***T1 \[T2\]*  
Shows data between times *T1* and *T2*, both in microseconds. If *T2* is not present, the end of the trace is used instead.

<a href="" id="-freq"></a>**-freq**  
Shows constant sampling frequency zones in the trace.

## Remarks


If none of `-util`, `-detail`, or `-freq` is specified, the default is to show the CPU utilization report.

## Related topics


[Xperf Actions](xperf-actions.md)

 

 







