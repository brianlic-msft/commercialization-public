---
title: diskio
description: diskio
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 7df30160-5a77-40f9-a03f-f21fec9cbafb
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# diskio


This action produces a text report that summarizes the metrics for disk I/O.

``` syntax
-a diskio [-util <n>] [-summary] [-counts] [-detail] [-overlap] [-range T1 T2]
```

## Options


<a href="" id="-util-n-"></a>**-util***\[n\]*  
Shows disk utilization for n-second intervals. The default is 1 second.

<a href="" id="-summary"></a>**-summary**  
Shows an I/O summary report for each file.

<a href="" id="-detail"></a>**-detail**  
Shows details of each I/O event.

<a href="" id="-overlap"></a>**-overlap**  
Shows overlapping of I/O events.

<a href="" id="-ranget1-t2"></a>**-range***T1 T2*  
Shows data between time *T1* and time *T2*, both in microseconds.

## Remarks


If no report type is selected, the default is to show disk utilization report.

## Related topics


[Xperf Actions](xperf-actions.md)

[Time and Timestamp Formats](time-and-timestamp-formats.md)

 

 







