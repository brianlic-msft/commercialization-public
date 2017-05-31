---
title: spinlock
description: spinlock
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 5ca2ee5f-ad3f-42ec-91e4-a044ce982650
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# spinlock


This action produces a text file listing information related to spinlock activity.

``` syntax
-a spinlock [-summary] [-counts [n]]
```

## Options


<a href="" id="-summary"></a>**-summary**  
Summarizes spinlock event information in a tab-delimited format.

<a href="" id="-count-n-"></a>**-count***\[n\]*  
Maximum number of files to show.

## Remarks


Xperf spinlock analysis is available for 64-bit architectures. Spinlock instrumentation is supported beginning with Windows 7, Windows Server 2008 R2, and newer versions of the operating system. Xperf supports normal spin locks and queued spin locks. For more information about spin locks, see [Spin Locks](http://go.microsoft.com/fwlink/p/?linkid=213937). To reduce overhead, ETW spinlock instrumentation is sample-based. The sampling frequency can be tuned with `-setspinlocksample`. For more information about starting spinlock sampling, see [start](start.md).

To perform meaningful analysis, familiarity with WPA symbols is recommended. For information on symbols, see [Symbol Support](symbol-support.md).

If your test scenario is already running, it is not necessary to stop the scenario to collect spinlock events. You can start spinlock event collection while the code of interest is being actively exercised. Nor is it necessary to suspend your scenario when spinlock event data has been collected.

**Note**  
Large numbers of spinlock events may overload the trace buffers and cause events to be lost. A message will appear when merging and loading the trace if this happens. For more information about avoiding event loss, see [Avoid Lost Events](avoid-lost-events.md).

For more information about the **spinlock** action, see [Customizing Spinlock Parameters](customizing-spinlock-parameters.md).

 

## Example


The following command example shows how to start a trace with spinlock data.

``` syntax
xperf -on PROC_THREAD+LOADER+SPINLOCK
```

Spinlock event data can also be collected using only the "SPINLOCK" option, as shown in the following command example.

``` syntax
xperf -on SPINLOCK
```

However, if the "PROC\_THREAD+LOADER" options are omitted, symbol information is not available for decoding. For more information about symbols, see [Symbol Support](symbol-support.md).

After event data has been collected into an ETL file, process the ETL file as shown in the following command example.

``` syntax
xperf -i example.etl -symbols -o example.txt -a spinlock
```

This produces a spinlock report. For information about this report, see [Evaluating Spinlock Data](evaluating-spinlock-data.md).

## Related topics


[Xperf Actions](xperf-actions.md)

 

 







