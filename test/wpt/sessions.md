---
title: Sessions
description: Sessions
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: cb2a15ea-3519-4efb-8031-93b19fac10d4
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Sessions


Windows Performance Recorder (WPR) extends Event Tracing for Windows (ETW). An ETW logging session is a collection of in-memory buffers that accepts events through the ETW Provider application programming interface (API). These buffers are typically non-paged and are managed by the kernel. ETW assigns a buffer to each processor. ETW event generation and buffering is lock-free to enable ETW to log all kinds of events.

Every time that ETW calls the **EventWrite** method, ETW reserves space in the current buffer that ETW has allocated to the processor that is running the calling thread. Then, ETW copies the event header and user data into that space. When the buffer is full, ETW flushes the buffer to the logging session’s log file or the real-time streaming consumer. ETW then assigns a free buffer to that processor.

If the logging throughput exceeds the ability of the flusher to free buffers, all available buffer space in the logging session might become unavailable. For example, this might occur because the disk write throughput is lower than the incoming event throughput. This causes **EventWrite** to raise an ERROR\_NOT\_ENOUGH\_MEMORY error and lose the event data. In such cases, ETW increments the **EventsLost** property of the logging session so that consumers can see the data loss.

For more information about how to avoid losing events in a recording, see [Avoid Lost Events](avoid-lost-events.md).

## Logging to Memory or to a File


You can configure profiles to record the event data to buffers in memory or to a file. Buffering mode is an in-memory circular session. You can save the content of this session as a snapshot to an event trace log (ETL) file on request. WPR does not flush the content of the in-memory buffer space when you save the content.

You can leave buffering mode sessions on constantly. This is especially useful if you do not know when the behavior of interest will occur. Choose buffering mode when the required circular buffer space is small enough to be kept in memory. Sequential log files are best for controlled scenarios. For example, you can use sequential log files for regression testing or when the occurrence of the behavior of interest is easier to predict.

For more information about logging options, see [Logging Mode](logging-mode.md).

## Recording Profiles


A recording profile controls each session. The profile can be either a built-in profile or a user-defined profile. For more information, see [Recording Profiles](recording-profiles.md).

## Buffer Size


Buffer size is important for controlling I/O efficiency and ensuring that WPR does not skip large events. Very small buffers can reduce I/O write efficiency. We recommend a minimum buffer size of 64 KB or 128 KB to promote good write performance and to reduce disk overhead and lost events. Buffer size determines the maximum duration of a recording. ETW limits the largest event size to approximately 64 KB.

## Collectors


You must define a system collector and one or more event collectors for a session in the recording profile. The collector name must be unique to the system and the system must have exclusive write access to the log file. The name of the log file must also be unique among the file names of all collectors. WPR does not expand environment variables, so the path to the log file must be specified without environment variables. For more information, see [1. Collector Definitions](1-collector-definitions.md).

## Providers


Logging sessions collect from a defined set of system and event providers. This is an important item to configure on a per-session basis. Most providers can have a many-to-many relationship with sessions. Special providers are necessary for some events, such as kernel or heap events. For more information, see [Providers](providers.md).

## Related topics


[WPR Features](wpr-features.md)

[WPR Common Scenarios](windows-performance-recorder-common-scenarios.md)

[Recording Profiles](recording-profiles.md)

[Buffers](buffers.md)

[BufferSize](buffersize.md)

 

 







