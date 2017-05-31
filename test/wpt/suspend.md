---
title: suspend
description: suspend
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 76df9308-9496-43a7-90cb-113ff5f672a8
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# suspend


This action produces an XML file that summarizes the metrics for the suspend sequence.

``` syntax
-a suspend [-summary] [-timeout <unit> [<precision>]] [-min <duration>]
```

## Options


<a href="" id="-summary"></a>**-summary**  
Displays the suspend transitions in this trace.

<a href="" id="-timeunit-unit----precision--"></a>**-timeunit***&lt;unit&gt; \[&lt;precision&gt;\]*  
Configure time presentation to use time unit &lt;*unit*&gt; and optionally time precision &lt;*precision*&gt;. Possible units of time are "ns" (nanoseconds), "us" (microseconds), "ms" (milliseconds), or "s" (seconds).

<a href="" id="-min-duration-"></a>**-min***&lt;duration&gt;*  
Shows individual timings longer than or equal to &lt;*duration*&gt;.

## Remarks


If you do not specify an option, **-summary** is used by default.

## Related topics


[Xperf Actions](xperf-actions.md)

[Time and Timestamp Formats](time-and-timestamp-formats.md)

 

 







