---
title: process
description: process
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 349abd2d-5708-4438-8448-3e9d49618ac5
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# process


This action produces a text file that summarizes metrics related to processes.

``` syntax
-a process [[-thread] [-image] [-vm]]|[-tree] [-range T1 T2] [-withsids] [-withcmdline]
```

## Options


<a href="" id="-thread"></a>**-thread**  
Shows threads.

<a href="" id="-image"></a>**-image**  
Shows images.

<a href="" id="-vm"></a>**-vm**  
Shows allocated virtual memory ranges.

<a href="" id="-tree"></a>**-tree**  
Shows the process tree structure.

<a href="" id="-ranget1-t2"></a>**-range***T1 T2*  
Shows data between times *T1* and *T2*, both in microseconds.

<a href="" id="-withsid"></a>**-withsid**  
Shows security identifiers (SIDs) in process reports.

<a href="" id="-withcmdline"></a>**-withcmdline**  
Shows the command line in process reports.

## Remarks


By default, only processes are shown.

## Related topics


[Xperf Actions](xperf-actions.md)

[Time and Timestamp Formats](time-and-timestamp-formats.md)

 

 







