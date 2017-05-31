---
title: prefetch
description: prefetch
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 8769558a-7749-4696-82b3-50e237d846d7
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# prefetch


This action produces a text file that summarizes the metrics regarding prefetches.

``` syntax
-a prefetch [-summary] [-timeunit <unit> [<precision>]] [-min <duration>]
```

## Options


<a href="" id="-summary"></a>**-summary**  
Displays the prefetch scenarios in the trace.

<a href="" id="-timeunit-unit----precision--"></a>**-timeunit***&lt;unit&gt; \[&lt;precision&gt;\]*  
Configures time presentation to use time unit &lt;*unit*&gt; and optionally time precision &lt;*precision*&gt;. The units can be "ns" (nanoseconds), "us" (microseconds), "ms" (milliseconds), or "s" (seconds).

<a href="" id="-min-duration-"></a>**-min***&lt;duration&gt;*  
Shows only individual timings, in microseconds, longer than or equal to &lt;*duration*&gt;.

## Related topics


[Xperf Actions](xperf-actions.md)

[Time and Timestamp Formats](time-and-timestamp-formats.md)

 

 







