---
title: dpcisr
description: dpcisr
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 8bab6760-0aa9-403b-b552-eabe21f780dd
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# dpcisr


This action produces a text report that summarizes the various metrics regarding deferred procedure calls (DPCs) and interrupt service routines (ISRs).

``` syntax
-a dpcisr [-dpc | -isr] [-summary] [-interval [n]] [-bucket [n]] [-range T1 T2 ]
```

## Options


<a href="" id="-dpc"></a>**-dpc**  
Shows statistics for DPCs only.

<a href="" id="-isr"></a>**-isr**  
Shows statistics for ISRs only.

<a href="" id="-summary"></a>**-summary**  
Shows a summary report.

<a href="" id="-interval-dt-"></a>**-interval***\[dt\]*  
Shows usage report for intervals of *dt* seconds. The default value is 1.

<a href="" id="-bucket-dt-"></a>**-bucket***\[dt\]*  
Show histogram for intervals of *dt* seconds. The default value is 2.

<a href="" id="-ranget1-t2"></a>**-range***T1 T2*  
Show delays between *T1* and *T2*.

## Remarks


If no data type is specified, the action shows a report of both DPCs and ISRs. If no report type is specified, the default is to print all three reports: DCPs, ISRs, and summary.

## Related topics


[Xperf Actions](xperf-actions.md)

[Time and Timestamp Formats](time-and-timestamp-formats.md)

 

 







