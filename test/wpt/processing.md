---
title: processing
description: processing
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: effacd2f-9804-434e-bbd9-128cddd7f940
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# processing


Displays trace post-processing options.

``` syntax
xperf -i <trace file>… [-o output] [-symbols …] [-target {human|machine}] [-a action …[-a action …] …]
```

## Parameters


<a href="" id="-itrace-file"></a>**-i***trace file*  
The trace file to be processed.

<a href="" id="-ooutput-file"></a>**-o***output file*  
The name of the output file. If not given, **stdout** is used.

<a href="" id="-symbols-options-"></a>**-symbols***\[options\]*  
Enable and configure symbol decoding support. For more information see [symbols](symbols.md).

<a href="" id="-target-human-machine-"></a>**-target***{human|machine}*  
Select the target audience of the output. The default value is "human".

<a href="" id="-quiet"></a>**-quiet**  
Do not print progress information.

<a href="" id="-tle"></a>**-tle**  
Process the trace even in the presence of lost events. The acronym *TLE* stands for *tolerate lost events*.

<a href="" id="-tti"></a>**-tti**  
Process the trace even in the presence of time inversions. The acronym *TTI* stands for *tolerate time inversions*.

<a href="" id="-aaction----"></a>**-a***action ...*  
The actions to take. The default action is to dump the event in text form.

## Remarks


The following table describes available actions.

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
<td><p>Shows boot and shutdown statistics.</p></td>
</tr>
<tr class="even">
<td><p>[bootprefetch](bootprefetch.md)</p></td>
<td><p>Shows boot-time prefetching information.</p></td>
</tr>
<tr class="odd">
<td><p>[cpudisk](cpudisk.md)</p></td>
<td><p>Shows CPU/disk activity report.</p></td>
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
<td><p>Shows all disk activity and idle times in histogram format.</p></td>
</tr>
<tr class="odd">
<td><p>[dpcisr](dpcisr.md)</p></td>
<td><p>Show DPC/ISR statistics.</p></td>
</tr>
<tr class="even">
<td><p>[drvdelay](drvdelay.md)</p></td>
<td><p>Shows driver delays.</p></td>
</tr>
<tr class="odd">
<td><p>[dumper](dumper.md)</p></td>
<td><p>Dumps events in the trace in text form.</p></td>
</tr>
<tr class="even">
<td><p>[filename](filename-wpa.md)</p></td>
<td><p>Show file names in the trace.</p></td>
</tr>
<tr class="odd">
<td><p>[focuschange](focuschange.md)</p></td>
<td><p>Shows the Windows thread focus change events in the trace.</p></td>
</tr>
<tr class="even">
<td><p>[hardfault](hardfault.md)</p></td>
<td><p>Shows hard fault statistics by process and file.</p></td>
</tr>
<tr class="odd">
<td><p>[heap](heap.md)</p></td>
<td><p>Shows heap information.</p></td>
</tr>
<tr class="even">
<td><p>[marks](marks.md)</p></td>
<td><p>Shows marks information.</p></td>
</tr>
<tr class="odd">
<td><p>[pagefault](pagefault.md)</p></td>
<td><p>Shows page fault information in the trace.</p></td>
</tr>
<tr class="even">
<td><p>[perfctrs](perfctrs.md)</p></td>
<td><p>Shows process performance counters.</p></td>
</tr>
<tr class="odd">
<td><p>[pnp](pnp.md)</p></td>
<td><p>Shows Plug and Play events in the trace.</p></td>
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
<td><p>Shows information relevant to spinlock activity.</p></td>
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
<td><p>Shows Windows logon events in the trace.</p></td>
</tr>
</tbody>
</table>

 

If no action is present, **dumper** is invoked.

## Example


The following table shows examples of **processing**.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><code>xperf -i trace.etl -o out.csv</code></p></td>
<td><p>Dumps the events in trace.etl to the Out.csv file.</p></td>
</tr>
<tr class="even">
<td><p><code>xperf -help registry</code></p></td>
<td><p>Prints Help for the <strong>registry</strong> action.</p></td>
</tr>
<tr class="odd">
<td><p><code>xperf -i trace.etl -a registry</code></p></td>
<td><p>Prints registry access statistics to <strong>stdout</strong>.</p></td>
</tr>
<tr class="even">
<td><p><code>xperf -i trace32.etl trace64.etl -o out.csv</code></p></td>
<td><p>Dumps the events in Trace32.etl and Trace64.etl to the Out.csv file.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Xperf Options](xperf-options.md)

 

 







