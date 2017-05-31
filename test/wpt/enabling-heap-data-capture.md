---
title: Enabling Heap Data Capture
description: Enabling Heap Data Capture
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 73d49914-7f60-426e-9833-cee7c5ec5d10
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Enabling Heap Data Capture


Process heap analysis is most effective when stacks are collected capturing **HeapAlloc** and **HeapRealloc** events. To decode stacks with symbols, you must enable symbol decoding. You can capture heap data either when a process is started or on an existing process.

## To Enable Data Capture When a Process Is Started


This example starts the process being analyzed from the command-line sequence that starts data capture. Enabling data capture when a process is started guarantees that there is no loss of allocation information or history. Take the following steps to enable data capture on process launch:

1.  From an elevated command prompt, type the following command: `xperf -on Base -BufferSize 1024 -MinBuffers 10 -MaxBuffers 16`

2.  The following is an example command: `xperf -start HeapSession -heap -PidNewProcess "C:\Program Files\Windows Sidebar\sidebar.exe" -BufferSize 1024 -MinBuffers 128 -MaxBuffers 128 -stackwalk HeapAlloc+HeapRealloc`

    The sidebar opens on the desktop.

    The following table describes these commands.

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
    <td><p>-start HeapSession</p></td>
    <td><p>Initializes a tracing session or logger session. In this case the session is named &quot;HeapSession&quot;.</p></td>
    </tr>
    <tr class="even">
    <td><p>-heap</p></td>
    <td><p>Identifies &quot;HeapSession&quot; as a heap trace.</p></td>
    </tr>
    <tr class="odd">
    <td><p>-PidNewProcess</p></td>
    <td><p>Initializes a process. In this case, initializes the Windows Sidebar.</p></td>
    </tr>
    <tr class="even">
    <td><p>-BufferSize</p></td>
    <td><p>Sets the buffer size of the buffer in which the event data is stored. An optimum size for a buffer is 1024 KB. The default is 64 KB.</p></td>
    </tr>
    <tr class="odd">
    <td><p>-MinBuffers</p></td>
    <td><p>Sets the minimum number of buffers for event data storage. <strong>MinBuffers</strong> should be equal to <strong>MaxBuffers</strong> to guarantee consistency between traces.</p></td>
    </tr>
    <tr class="even">
    <td><p>-MaxBuffers</p></td>
    <td><p>Allocate <strong>MaxBuffers</strong> conservatively, because buffers are allocated from non-paged memory, which is a finite system resource.</p></td>
    </tr>
    <tr class="odd">
    <td><p>-stackwalk</p></td>
    <td><p>Initializes the stackwalk facility to collect allocation and deallocation information and associate that information with specific threads.</p></td>
    </tr>
    <tr class="even">
    <td><p>HeapAlloc+HeapRealloc</p></td>
    <td><p>Identifies specific heap events to be captured and presented by the stackwalk facility.</p></td>
    </tr>
    </tbody>
    </table>

     

3.  Type the following command: `xperf -stop -stop HeapSession -d HeapTrace.etl`

    The `-d HeapTrace.etl` command merges traces produced in the session into the HeapTrace.etl file.

## To Enable Data Capture on an Existing Process


This option enables data capture without stopping and restarting the process. This may be advantageous when the scenario being analyzed does not occur until well after the application starts, and initial heap allocation (which can generate extremely large trace files) is not needed.

Take the following steps:

1.  From an elevated command prompt, start the NT Kernel Logger with the BASE flag as follows: `xperf -on BASE`

2.  To enable heap tracing on an existing process, substitute the actual process ID for *XXX* in the following command: `xperf -start HeapSession -heap -Pid XXX -BufferSize 1024 -MinBuffers 128 -MaxBuffers 128 -stackwalk HeapAlloc+HeapRealloc`

3.  Prepare the traces for analysis in the same manner as done for data capture when a process is started: `xperf -stop -stop HeapSession -d heapTrace.etl`

## Related topics


[heap](heap.md)

 

 







