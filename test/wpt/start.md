---
title: start
description: start
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: f99fd1e6-bcc0-443f-9f28-555a46d6c02f
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# start


Displays logger start options.

``` syntax
xperf [-start [LoggerName] [ProfileFileName!ProfileName|SessionName]|-update [LoggerName]|[ProfileFileName!ProfileName|SessionName]] -flush [LoggerName] -save ProfileFileName!ProfileName|SessionName merged.etl -setprofint [<n>] [cached] -seteresourcesample <n1> <n2> <n3> -setspinlocksample <n1> <n2> <n3> -pooltag <P1>+<P2>+<P3>+<P4> -on (GUID|KnownProviderName)[:Flags[:Level[<:0xnnnnnnnn|’stack|[,]sid[,]tsid’]]]
```

## Parameters


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Command</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>-start</strong> <em>[LoggerName]|[ProfileFileName!ProfileName|SessionName]]</em></p></td>
<td><p>Starts a logging session for <em>LoggerName</em>, starts loggers in profile <em>ProfileName</em> defined in the <em>ProfileFileName</em> file, or starts logger <em>SessionName</em> defined in the <em>ProfileFileName</em> file.</p></td>
</tr>
<tr class="even">
<td><p><strong>-update</strong> <em>[LoggerName]|[ProfileFileName!ProfileName|SessionName]]</em></p></td>
<td><p>Updates a logging session for <em>LoggerName</em>, updates loggers in profile <em>ProfileName</em> defined in the <em>ProfileFileName</em> file, or updates logger <em>SessionName</em> defined in the <em>ProfileFileName</em> file.</p></td>
</tr>
<tr class="odd">
<td><p><strong>-flush</strong> <em>LoggerName</em></p></td>
<td><p>Flushes a logging session for <em>LoggerName</em>. This parameter is required to save a buffer mode trace (see <em>-buffering</em> parameter, below). To save a buffer mode trace, you must issue the <em>-flush</em> parameter.</p></td>
</tr>
<tr class="even">
<td><p><strong>-capturestate</strong> <em>LoggerName Flags</em></p></td>
<td><p>Captures state to non-kernel logging session from providers specified in <em>Flags</em>. The accepted provider format is the same as for <em>-on</em>. If flags and level are specified, they are enabled while capturing state.</p>
<p>This is called for tracing started with the <strong>–buffering</strong> option. It must be followed by <strong>–stop</strong> to stop tracing.</p></td>
</tr>
<tr class="odd">
<td><p><strong>-on</strong> <em>Flags|Groups</em></p></td>
<td><p>For kernel logging sessions, the sequence of kernel flags and groups to be enabled, separated by plus signs (+). For user logging sessions, the sequence of providers to be enabled, separated by plus signs (+). The accepted provider format is <code>(GUID|KnownProviderName)[:Flags[:Level]]</code>. See [providers](providers-wpa.md) for a list of valid flags.</p></td>
</tr>
<tr class="even">
<td><p><strong>-f</strong> <em>filename</em></p></td>
<td><p>Logs events to the specified file. The default is \Kernel.etl for kernel traces and \User.etl for user traces.</p></td>
</tr>
<tr class="odd">
<td><p><strong>-buffersize</strong> <em>Size</em></p></td>
<td><p>Sets trace buffer size to <em>Size</em>, in KB. Possible values are 4 to 1024. The default is 64.</p></td>
</tr>
<tr class="even">
<td><p><strong>-minbuffers</strong> <em>n</em></p></td>
<td><p>Sets the minimum number of trace buffers to <em>n</em>. The default is 64.</p></td>
</tr>
<tr class="odd">
<td><p><strong>-maxbuffers</strong> <em>n</em></p></td>
<td><p>Sets the maximum number of trace buffers to <em>n</em>. The default is 320.</p></td>
</tr>
<tr class="even">
<td><p><strong>-maxfile</strong> <em>Size</em></p></td>
<td><p>Sets maximum file size to <em>Size</em> MB.</p></td>
</tr>
<tr class="odd">
<td><p><strong>-flushtimer</strong> <em>n</em></p></td>
<td><p>Sets the flush timer to <em>n</em> seconds.</p></td>
</tr>
<tr class="even">
<td><p><strong>-boottrace</strong> <em>Flags|Groups|off</em></p></td>
<td><p>Configures the Event Tracing for Windows logger to trace boot. Set flags to &quot;off&quot; to turn off boot tracing. All logging control can be used in conjunction with this. Use in conjunction with <strong>-f</strong> to log to a file other than \Perf.etl.</p></td>
</tr>
<tr class="odd">
<td><p><strong>-realtime</strong></p></td>
<td><p>Enables real-time tracing.</p></td>
</tr>
<tr class="even">
<td><p><strong>-buffering</strong></p></td>
<td><p>Enables buffering mode tracing. To save, use <strong>-flush</strong>. The <strong>-stop</strong> option does not save the trace.</p></td>
</tr>
<tr class="odd">
<td><p><strong>-filemode</strong> <em>Mode</em></p></td>
<td><p>Sets the file mode. The default is &quot;Sequential&quot;. Possible modes: &quot;Sequential&quot;, &quot;Circular&quot;, &quot;Append&quot;, and &quot;NewFile&quot;.</p></td>
</tr>
<tr class="even">
<td><p><strong>-clocktype</strong> <em>ClockType</em></p></td>
<td><p>Sets the clock type. The default is &quot;PerfCounter&quot;. Possible types: &quot;Cycle&quot;, &quot;PerfCounter&quot;, and &quot;SystemTime&quot;.</p></td>
</tr>
<tr class="odd">
<td><p><strong>-stackwalk</strong> <em>flags|@file</em></p></td>
<td><p>Enables stack walking for the events specified as <code>Flag+...</code>, or parses the <em>file</em> File for flags. For more information, see [stackwalk](stackwalk.md).</p></td>
</tr>
<tr class="even">
<td><p><strong>-pids</strong> <em>pid [...]</em></p></td>
<td><p>Applies flags to processes <code>pid [...]</code>. Used in conjunction with private loggers.</p></td>
</tr>
<tr class="odd">
<td><p><strong>-pidnewprocess</strong> <em>&lt;command-line&gt;</em></p></td>
<td><p>Applies flags to a new process that Xperf will start with &lt;<em>command-line</em>&gt;. Used in conjunction with private loggers.</p></td>
</tr>
<tr class="even">
<td><p><strong>-waitfornewprocess</strong></p></td>
<td><p>Waits for a new process created using <code>-pidNewProcess</code> to return before exiting.</p></td>
</tr>
<tr class="odd">
<td><p><strong>-heap</strong></p></td>
<td><p>Enables heap tracing in processes specified by <em>Pids</em> and <em>PidNewProcess</em>.</p></td>
</tr>
<tr class="even">
<td><p><strong>-critsec</strong></p></td>
<td><p>Enables critical section tracing in processes specified by <em>Pids</em> and <em>PidNewProcess</em>.</p></td>
</tr>
<tr class="odd">
<td><p><strong>-setprofint</strong> <em>[&lt;n&gt;] [cached]</em></p></td>
<td><p>Sets sampled profile interval to <code>&lt;n&gt; [1221..10000000]</code>. If cached is specified, intervals are cached in ETW and reapplied whenever new ETW kernel loggers with sampled profile are started. The units are 100ns. The default value for <em>n</em> is 10000; that is, 1ms: not cached.</p></td>
</tr>
<tr class="even">
<td><p><strong>-save</strong> <em>ProfileFileName!ProfileName|SessionName merged.etl</em></p></td>
<td><p>Flushes the loggers in profile <em>ProfileName</em> defined in file <em>ProfileFileName</em> and merges the ETL files to merged.etl; or flushes logger <em>SessionName</em> defined in file <em>ProfileFileName</em> and merges the ETL file to Merged.etl.</p></td>
</tr>
<tr class="odd">
<td><p><strong>-seteresourcesample</strong> <em>&lt;n1&gt; &lt;n2&gt; &lt;n3&gt;</em></p></td>
<td><p>Sets ERESOURCE sampling, where n1 release sampling rate is greater than or equal to 1000, n2 contention sampling rate is greater than or equal to 1, and n3 number of excessive timeouts is greater than or equal to 1. The contention sample rate is the rate at which spinlock events are acquired when collisions occur. For example, if this value is 100, one spinlock event is acquired for each one hundred Spin Lock collisions.</p></td>
</tr>
<tr class="even">
<td><p><strong>-setspinlocksample</strong> <em>&lt;n1&gt; &lt;n2&gt; &lt;n3&gt;</em></p></td>
<td><p>Sets the spinlock spin threshold to <code>&lt;n1&gt; [ &gt;=1]</code>. Sets the spinlock acquire sample rate to <code>&lt;n2&gt; [ &gt;= 1000]</code>. Sets the spinlock contention sample rate to <code>&lt;n3&gt; [ &gt;= 1]</code>. Only 64-bit Windows 7, Windows Server 2008 R2, and newer versions of the operating system support spinlock instrumentation.</p></td>
</tr>
<tr class="odd">
<td><p><strong>-pooltag</strong> <em>&lt;P1&gt;+&lt;P2&gt;+&lt;P3&gt;+&lt;P4&gt;</em></p></td>
<td><p>Sets the pool tag filters (<em>Pn</em>) separated by plus signs (+) or semicolons (;). Use a question mark (?) for a single-character wildcard or an asterisk (*) for a multiple-character wildcard. A maximum of four filters can be specified.</p></td>
</tr>
</tbody>
</table>

 

## Remarks


Multiple loggers can be started using multiple start options, each followed by the options to be applied to that logger. If *LoggerName* or `-start LoggerName` is omitted, the kernel logger is implied. Only a single instance of the kernel logger can exist at any time. If one of the loggers fails to start, all the loggers that are already started are stopped.

## Related topics


[Xperf Options](xperf-options.md)

 

 







