---
title: merge
description: merge
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: d450807c-ad86-4d1d-a089-0b3cfa86219c
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# merge


Displays trace merge options.

``` syntax
xperf -merge trace1.etl trace2.etl … merged.etl
```

## Example


The following example merges individual trace files into merged.etl and adds image identification information and event manifest information that is required for safe symbol decoding.

``` syntax
-merge trace1.etl trace2.etl … merged.etl
```

## Related topics


[Xperf Options](xperf-options.md)

 

 







