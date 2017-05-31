---
title: cswitch
description: cswitch
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: bb976f48-b804-4de3-bbd1-108cbad6e922
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# cswitch


This action produces a report file that summarizes the metrics for context switches.

``` syntax
-a cswitch [-avail [n]] [-util [n]] [-process] [-thread] [-exc_dpcisr] [-range T1 T2]
```

## Options


<a href="" id="-avail-n-"></a>**-avail***\[n\]*  
Shows CPU availability for *n* second intervals. The default is 1.

<a href="" id="-util-n-"></a>**-util***\[n\]*  
Shows CPU utilization for *n* second intervals. The default is 1.

<a href="" id="-process"></a>**-process**  
Shows CPU usage per process as deduced from context switch data.

<a href="" id="-thread"></a>**-thread**  
Shows CPU usage per thread as deduced from context switch data.

<a href="" id="-exc-dpcisr"></a>**-exc\_dpcisr**  
Excludes time spent in DPC/ISR in availability, utilization process, and thread reports. DPC/interrupt tracing must be enabled for this option to have any effect.

<a href="" id="-ranget1-t2"></a>**-range***T1 T2*  
Shows data between times *T1* and *T2*, both in microseconds.

## Remarks


If no report type is selected, the default is to show the CPU availability report.

## Related topics


[Xperf Actions](xperf-actions.md)

[Time and Timestamp Formats](time-and-timestamp-formats.md)

 

 







