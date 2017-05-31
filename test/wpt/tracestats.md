---
title: tracestats
description: tracestats
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 875ee44a-765d-44e4-b303-867b6c766251
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# tracestats


This action produces a text file that summarizes trace statistics.

``` syntax
-a tracestats [-timespan [actual]] [-detail] [-timezone {utc | local}]
```

## Options


<a href="" id="-timespan-actual-"></a>**-timespan***\[actual\]*  
Shows information about the session and trace. By default, *-timespan* requires inspection of trace headers only; no pass is performed through the traces in the session. When "actual" is specified, the actual times of the first event and the last event in the session are added to the report. In this case, a pass through the traces in the session is required.

<a href="" id="-detail--stack-"></a>**-detail *\[stack\]***  
Shows detailed information about providers, identifiers, tasks, operation codes, versions, channels, and levels of events in the session, along with provider and operation code friendly names. Requires a full pass through the traces in the session.

When the *stack* parameter is specified, the count of stacks for each type of event is added to the report. In this case, a second pass through the traces in the session is required.

<a href="" id="-timezone-utc-local-"></a>**-timezone***{utc|local}*  
Shows timestamps in the specified time zone. If no time zone is specified, the local time zone is used by default.

## Related topics


[Xperf Actions](xperf-actions.md)

 

 







