---
title: Keyword (in SystemProvider)
description: Keyword (in SystemProvider)
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: afe8e6db-f5ad-4a94-9878-97840f91b8b2
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Keyword (in SystemProvider)


Describes the kernel flags that can be enabled for the kernel-mode session.

## Element Hierarchy


&lt;[WindowsPerformanceRecorder](windowsperformancerecorder.md)&gt;

     &lt;[Profiles](profiles.md)&gt;

          &lt;[SystemProvider](systemprovider.md)&gt;

               &lt;[Keywords (in SystemProvider)](keywords--in-systemprovider-.md)&gt;

                    &lt;**Keyword (in SystemProvider)**&gt;

          &lt;[Profile](profile-wpr.md)&gt;

               &lt;[Collectors](collectors.md)&gt;

                    &lt;[SystemCollectorId](systemcollectorid.md)&gt;

                         &lt;[SystemProviderId](systemproviderid.md)&gt;

                                &lt;[Keywords (in SystemProvider)](keywords--in-systemprovider-.md)&gt;

                                     &lt;**Keyword (in SystemProvider)**

                         &lt;[SystemProvider](systemprovider.md)&gt;

                                &lt;[Keywords (in SystemProvider)](keywords--in-systemprovider-.md)&gt;

                                     &lt;**Keyword (in SystemProvider)**

## Syntax


``` syntax
<Keyword Value = "AllFaults" | "CompactCSwitch" | "ContiguousMemorygeneration" | ... >
</Keyword>
```

## Attributes and Elements


### Attributes

<table>
<colgroup>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
</colgroup>
<thead>
<tr class="header">
<th>Attribute</th>
<th>Description</th>
<th>Data type</th>
<th>Required</th>
<th>Default</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>Value</strong></p></td>
<td><p>Describes the system Event Tracing for Windows (ETW) event.</p></td>
<td><p>See the Remarks section for possible values.</p></td>
<td><p>Yes</p></td>
<td><p></p></td>
</tr>
</tbody>
</table>

 

### Child Elements

None.

### Parent Elements

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Element</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>[Keywords (in SystemProvider)](keywords--in-systemprovider-.md)</p></td>
<td><p>Represents a collection of system keywords.</p></td>
</tr>
</tbody>
</table>

 

## Remarks


The following table describes possible values for the **Value** attribute.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Value</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>AllFaults</p></td>
<td><p>All faults are logged.</p></td>
</tr>
<tr class="even">
<td><p>CompactCSwitch</p></td>
<td><p>Used in connection with &quot;CSwitch&quot;, this reduces the information logged for each CSwitch, as well as uses differential compression and batching.</p></td>
</tr>
<tr class="odd">
<td><p>ContiguousMemorygeneration</p></td>
<td><p>Contiguous memory generation is logged.</p></td>
</tr>
<tr class="even">
<td><p>CpuConfig</p></td>
<td><p>Changes in CPU configuration are logged.</p></td>
</tr>
<tr class="odd">
<td><p>CSwitch</p></td>
<td><p>Context switch activity is logged.</p></td>
</tr>
<tr class="even">
<td><p>DiskIO</p></td>
<td><p>Disk I/O is logged.</p></td>
</tr>
<tr class="odd">
<td><p>DiskIOInitialization</p></td>
<td><p>Disk I/O initialization is logged.</p></td>
</tr>
<tr class="even">
<td><p>DPC</p></td>
<td><p>Deferred procedure calls are logged.</p></td>
</tr>
<tr class="odd">
<td><p>Drivers</p></td>
<td><p>Driver activity is logged.</p></td>
</tr>
<tr class="even">
<td><p>FileIO</p></td>
<td><p>File I/O is logged.</p></td>
</tr>
<tr class="odd">
<td><p>FileIOInit</p></td>
<td><p>File I/O initialization is logged.</p></td>
</tr>
<tr class="even">
<td><p>Filename</p></td>
<td><p>The file name is logged.</p></td>
</tr>
<tr class="odd">
<td><p>FootPrint</p></td>
<td><p>Used to do memory analysis, this specifies to flush the working set on a special flush mark.</p></td>
</tr>
<tr class="even">
<td><p>HardFaults</p></td>
<td><p>Hard faults are logged.</p></td>
</tr>
<tr class="odd">
<td><p>IdleStates</p></td>
<td><p>Idle states are logged.</p></td>
</tr>
<tr class="even">
<td><p>Interrupt</p></td>
<td><p>Interrupts are logged.</p></td>
</tr>
<tr class="odd">
<td><p>KernelQueue</p></td>
<td><p>Changes to the kernel queue are logged.</p></td>
</tr>
<tr class="even">
<td><p>Loader</p></td>
<td><p>Kernel and user mode load and unload events are logged.</p></td>
</tr>
<tr class="odd">
<td><p>Memory</p></td>
<td><p>Provides events about physical memory usage.</p></td>
</tr>
<tr class="even">
<td><p>MemoryInfo</p></td>
<td><p>Provides basic information about the memory manager, such as number of free, used, and standby pages, and so on.</p></td>
</tr>
<tr class="odd">
<td><p>Pool</p></td>
<td><p>Changes to the memory pool are logged.</p></td>
</tr>
<tr class="even">
<td><p>Power</p></td>
<td><p>Power consumption is logged.</p></td>
</tr>
<tr class="odd">
<td><p>ProcessCounter</p></td>
<td><p>Indicates that the profile has a process counter.</p></td>
</tr>
<tr class="even">
<td><p>ProcessThread</p></td>
<td><p>Process and thread creation and deletion events are logged.</p></td>
</tr>
<tr class="odd">
<td><p>ReadyThread</p></td>
<td><p>Ready thread events are logged.</p></td>
</tr>
<tr class="even">
<td><p>Registry</p></td>
<td><p>Changes to the registry are logged.</p></td>
</tr>
<tr class="odd">
<td><p>SampledProfile</p></td>
<td><p>The profile is sampled.</p></td>
</tr>
<tr class="even">
<td><p>SpinLock</p></td>
<td><p>Spinlock information is logged.</p></td>
</tr>
<tr class="odd">
<td><p>SplitIO</p></td>
<td><p>Provides events about split I/O requests. Single I/O requests can be split into multiple requests because of disk fragmentation or other reasons.</p></td>
</tr>
<tr class="even">
<td><p>SystemCall</p></td>
<td><p>System calls are logged.</p></td>
</tr>
<tr class="odd">
<td><p>ThreadPriority</p></td>
<td><p>Changes in thread priority are logged.</p></td>
</tr>
<tr class="even">
<td><p>Timer</p></td>
<td><p>Provides events about the system timer.</p></td>
</tr>
<tr class="odd">
<td><p>VirtualAllocation</p></td>
<td><p>Virtual memory allocation is logged.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Elements](elements.md)

[CustomKeyword](customkeyword.md)

 

 







