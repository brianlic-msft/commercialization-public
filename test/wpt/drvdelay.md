---
title: drvdelay
description: drvdelay
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: bddf3860-873b-470d-8f41-a678f48e04b5
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# drvdelay


This action produces a text report that summarizes the metrics regarding drivers.

``` syntax
-a drvdelay [-min [t]] [-name <driver>] [-range T1 T2]
```

## Options


<a href="" id="-min-t-"></a>**-min***\[t\]*  
Show only delays longer than *n*, in microseconds.

<a href="" id="-name-driver-"></a>**-name***&lt;driver&gt;*  
Show only delays by the specified driver.

<a href="" id="-ranget1-t2"></a>**-range***T1 T2*  
Show delays between *T1* and *T2*, in microseconds.

## Related topics


[Xperf Actions](xperf-actions.md)

[Time and Timestamp Formats](time-and-timestamp-formats.md)

 

 







