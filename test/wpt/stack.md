---
title: stack
description: stack
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 7f8b4905-4702-4bba-998e-baa533adcdb2
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# stack


This action produces a text file that summarizes metrics related to stacks.

``` syntax
-a stack [-butterfly [n]] [-range T1 T2] [-export <format>] [-pid <pid> ...] [-tid <tid> ...] [-process RegEx1 RegEx2 ... RegExN] [-symbol RegEx1 RegEx2 ... RegExN] [-event RegEx1 RegEx2 ... RegExN]
```

## Options


<a href="" id="-butterfly-n-"></a>**-butterfly***\[n\]*  
Displays the butterfly view of stacks in this trace, including only symbols that have at least &lt;*min\_hits*&gt; hits, whether every occurrence is counted or only the first occurrence. The default value of *min\_hits* is 10.

<a href="" id="-ranget1-t2"></a>**-range***T1 T2*  
Limits the report to the interval `[lo, hi]`. The default value of *T1* is zero. The default value of *T2* is `_I64_MAX`.

<a href="" id="-pid-pid-"></a>**-pid***&lt;pid&gt;*  
Includes only stacks from processes with matching process identifiers.

<a href="" id="-tid-tid-"></a>**-tid***&lt;tid&gt;*  
Includes only stacks from threads with matching thread identifiers.

<a href="" id="-processregex1-regex2---regexn"></a>**-process***RegEx1 RegEx2 … RegExN*  
Includes only stacks from threads that match the provided ATL regular expression(s).

<a href="" id="-symbolregex1-regex2---regexn"></a>**-symbol***RegEx1 RegEx2 … RegExN*  
Includes only stacks that contain symbols that match the provided ATL regular expression(s).

<a href="" id="-eventregex1-regex2---regexn"></a>**-event***RegEx1 RegEx2 … RegExN*  
Includes only stacks for events that match the provided ATL regular expression(s).

## Related topics


[Xperf Actions](xperf-actions.md)

[Time and Timestamp Formats](time-and-timestamp-formats.md)

 

 







