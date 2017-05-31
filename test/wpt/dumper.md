---
title: dumper
description: dumper
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: e5fec87c-6945-4611-8e50-52d279357004
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# dumper


This action produces an ANSI text file of the ETL trace log.

``` syntax
-a dumper [-range T1 T2] [-stacktimeshifting] [exc_dpcisr] [-provider id1 id2 …] [-add_rawdata] [-add_pgodata] [-add_inline]
```

## Options


<a href="" id="-ranget1-t2"></a>**-range***T1 T2*  
Dumps only data between times *T1* and *T2*, both in microseconds.

<a href="" id="-stacktimeshifting"></a>**-stacktimeshifting**  
Combines user and kernel stack fragments and places them after the trigger event.

<a href="" id="-exc-dpcisr"></a>**-exc\_dpcisr**  
Excludes time spent in DPCs or ISRs. DPC and interrupt tracing must be enabled for this option to have any effect. Currently this affects only **cswitch** events.

<a href="" id="-providerid1-id2--"></a>**-provider***id1 id2 …*  
Dumps events for the specified provider(s). Takes as input any number of provider GUIDs.

<a href="" id="-add-rawdata"></a>**-add\_rawdata**  
Adds a raw information line before each event.

<a href="" id="-add-pgodata"></a>**-add\_pgodata**  
Adds PGO training information to each stack frame.

<a href="" id="-add-inline"></a>**-add\_inline**  
Appends inline function names to the end of each stack frame.

## Remarks


Events in the trace are dumped in text form.

## Example


The following is an example of this action with providers specified.

``` syntax
xperf -i trace.etl -o trace.etl.csv -a dumper -provider {315a8872-923e-4ea2-9889-33cd4754bf64} {7dd42a49-5329-4832-8dfd-43d979153a88}
```

## Related topics


[Xperf Actions](xperf-actions.md)

[Time and Timestamp Formats](time-and-timestamp-formats.md)

 

 







