---
title: Evaluating Spinlock Data
description: Evaluating Spinlock Data
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 9e5e4ffa-5fb7-401e-bfc3-760cbb7955d9
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Evaluating Spinlock Data


The spinlock report presents the following information about spinlocks:

-   Acquire sample rate.

-   Contention sample rate.

-   Spin threshold.

-   Number of CPUs.

-   CPU speed, in megahertz.

-   Trace length, in nanoseconds.

-   Trace length, in cycles.

The next sections of the report show the spinlock usage during the profile time period. Each spin lock is shown separately. Spin locks are sorted with the "hottest" spin locks shown first. Often it is possible to identify the spinlock bottleneck by looking at the top few spin locks.

The following information is presented for each spin lock:

-   Type of lock.

-   Kernel address of lock.

-   Symbol of the lock. Spinlocks created dynamically do not have symbols.

A summary report follows with the follow information:

-   Percentage of CPU time spent on lock acquisition.

-   Percentage of CPU time spent on lock contention.

-   Lock acquisition rate.

-   Collision rate.

-   Spin rate.

-   Contention rate, both sampled and normalized.

The final two sections of the report are the events skipped due to interrupts and the release function.

Interrupts can occur while spin locks are held. When this occurs, the interrupt handling time is included in the spinlock holding time, and the spinlock holding time appears inordinately long. Xperf does not include spinlock events that are held while an interrupt is handled when calculating spinlock holding times. The “Events skipped due to interrupts” line displays the number of events that were not included in the calculation. This number is normally very small.

A spin lock can be acquired or released from different code paths. A list of release functions of the spin lock is displayed at the end of the report. The list is sorted by spinlock holding time. Additional information about a particular release function, such as acquisition or contention, is also presented.

## Example


The following example shows how to obtain a summary of spinlock data.

``` syntax
xperf -i example.etl -symbols -o example.txt -a spinlock -summary
```

The following example shows how to limit the number of records returned to the five most active spin locks.

``` syntax
xperf -i example.etl -symbols -o example.txt -a spinlock -summary -counts 5
```

## Related topics


[spinlock](spinlock.md)

 

 







