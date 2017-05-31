---
title: Xperf Actions
description: Xperf Actions
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 14ea91eb-eb7b-4dd7-a09d-da4743dc3805
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Xperf Actions


Xperf actions are trace processing components that collate event information to produce text reports. Actions produce summarized reports that are specific to a set of events such as registry accesses, context switches, file accesses, or system configuration.

All actions are invoked using the following command-line pattern:

``` syntax
xperf -i input.etl -o output.txt -a <action_name> [action_parameters]
```

Where *input.etl* is the name of the trace file, *output.txt* is the name of the report file, and *&lt;action\_name&gt;* is the name of the action. The action name is always preceded by the `-a` command-line switch. The action name can be followed by one or more action-specific parameters.

## In This Section


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Action</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>[boot](boot.md)</p></td>
<td><p>Shows boot and shut down statistics.</p></td>
</tr>
<tr class="even">
<td><p>[bootprefetch](bootprefetch.md)</p></td>
<td><p>Shows boot pre-fetching events.</p></td>
</tr>
<tr class="odd">
<td><p>[cpudisk](cpudisk.md)</p></td>
<td><p>Shows CPU/disk activity.</p></td>
</tr>
<tr class="even">
<td><p>[cswitch](cswitch.md)</p></td>
<td><p>Shows context switch data.</p></td>
</tr>
<tr class="odd">
<td><p>[diskio](diskio.md)</p></td>
<td><p>Shows disk I/O statistics.</p></td>
</tr>
<tr class="even">
<td><p>[diskidlehistogram](diskidlehistogram.md)</p></td>
<td><p>Shows a histogram of disk activity and idle times.</p></td>
</tr>
<tr class="odd">
<td><p>[dpcisr](dpcisr.md)</p></td>
<td><p>Shows deferred procedure call and interrupt service routine statistics.</p></td>
</tr>
<tr class="even">
<td><p>[drvdelay](drvdelay.md)</p></td>
<td><p>Shows driver delays.</p></td>
</tr>
<tr class="odd">
<td><p>[dumper](dumper.md)</p></td>
<td><p>Dumps events in text form.</p></td>
</tr>
<tr class="even">
<td><p>[filename](filename-wpa.md)</p></td>
<td><p>Shows file names.</p></td>
</tr>
<tr class="odd">
<td><p>[focuschange](focuschange.md)</p></td>
<td><p>Shows the Windows thread focus change events.</p></td>
</tr>
<tr class="even">
<td><p>[hardfault](hardfault.md)</p></td>
<td><p>Shows hard fault statistics by process and file.</p></td>
</tr>
<tr class="odd">
<td><p>[heap](heap.md)</p></td>
<td><p>Shows process heap information.</p></td>
</tr>
<tr class="even">
<td><p>[marks](marks.md)</p></td>
<td><p>Shows marks information.</p></td>
</tr>
<tr class="odd">
<td><p>[pagefault](pagefault.md)</p></td>
<td><p>Shows page fault information.</p></td>
</tr>
<tr class="even">
<td><p>[perfctrs](perfctrs.md)</p></td>
<td><p>Shows process performance counters.</p></td>
</tr>
<tr class="odd">
<td><p>[pnp](pnp.md)</p></td>
<td><p>Shows Plug and Play events.</p></td>
</tr>
<tr class="even">
<td><p>[prefetch](prefetch.md)</p></td>
<td><p>Shows prefetch information.</p></td>
</tr>
<tr class="odd">
<td><p>[process](process.md)</p></td>
<td><p>Shows process, thread, and image information.</p></td>
</tr>
<tr class="even">
<td><p>[profile](profile-wta.md)</p></td>
<td><p>Shows sampled profiler data.</p></td>
</tr>
<tr class="odd">
<td><p>[registry](registry.md)</p></td>
<td><p>Shows registry access statistics.</p></td>
</tr>
<tr class="even">
<td><p>[services](services.md)</p></td>
<td><p>Shows service status information.</p></td>
</tr>
<tr class="odd">
<td><p>[shutdown](shutdown.md)</p></td>
<td><p>Shows shutdown statistics.</p></td>
</tr>
<tr class="even">
<td><p>[spinlock](spinlock.md)</p></td>
<td><p>Shows spinlock information.</p></td>
</tr>
<tr class="odd">
<td><p>[stack](stack.md)</p></td>
<td><p>Shows stack information.</p></td>
</tr>
<tr class="even">
<td><p>[suspend](suspend.md)</p></td>
<td><p>Shows suspend transition information.</p></td>
</tr>
<tr class="odd">
<td><p>[sysconfig](sysconfig.md)</p></td>
<td><p>Shows system configuration information.</p></td>
</tr>
<tr class="even">
<td><p>[tracestats](tracestats.md)</p></td>
<td><p>Shows trace statistics.</p></td>
</tr>
<tr class="odd">
<td><p>[winlogon](winlogon.md)</p></td>
<td><p>Shows Winlogon events.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Xperf Command-Line Reference](xperf-command-line-reference.md)

 

 







