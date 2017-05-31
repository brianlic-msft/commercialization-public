---
title: bootprefetch
description: bootprefetch
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 482e724b-bf10-4181-a77f-40e5fdc8db7e
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# bootprefetch


This action collates and summarizes events that are relevant to boot when you use the **On/Off Trace Capture** tool.

``` syntax
bootprefetch [-summary | -events [-pattern [-type name]] [-range T1 T2] | disktime]
```

## Options


<a href="" id="-xml"></a>**-xml**  
Shows the output in XML format. This currently works only with **-summary**.

<a href="" id="-summary"></a>**-summary**  
Shows the summary of boot prefetching.

<a href="" id="-events"></a>**-events**  
Dumps ReadyBoot events with earliness information.

<a href="" id="-pattern"></a>**-pattern**  
Used only in conjunction with **-events**. When dumping events, also dumps overlapping events.

<a href="" id="-typename"></a>**-type***name*  
Used only in conjunction with **-pattern**. Dumps only the specified type of events when dumping events in pattern view. *name* is one of the following values: "hit", "prefetch", "miss", "pend", or "write".

<a href="" id="-ranget1-t2"></a>**-range***T1 T2*  
Used only in conjunction with **-events**. Process ReadyBoot events completed between times *T1* and *T2*.

<a href="" id="-disktime"></a>**-disktime**  
Shows the disk time breakdown during boot prefetching.

## Remarks


If no report type is selected, the default is to show the summary.

## Related topics


[Xperf Actions](xperf-actions.md)

[Time and Timestamp Formats](time-and-timestamp-formats.md)

 

 







