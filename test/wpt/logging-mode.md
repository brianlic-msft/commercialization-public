---
title: Logging Mode
description: Logging Mode
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 96dc60e4-0550-4cac-b405-9aab923b7435
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Logging Mode


When you define a Windows Performance Recorder (WPR) profile, you must select a logging mode from the following options:

-   **File**: records logging data to a sequential file

-   **Memory**: records logging data to circular buffers in memory

The logging mode is set to **Memory** by default. However, *On/off* transitions are always logged to a file.

Logging to file is typically used for short recordings for which you can anticipate the events that will be recorded. Logging to memory is typically used to log events that can occur at any time. When WPR logs to memory, buffer size and the level of profile detail determine how long WPR can log data before old events are overwritten.

**Caution**  
To limit file size, choose **Memory**. When logging to file, available disk space is the only limitation to file size. If the file is too large, you might not be able to analyze it in Windows Performance Analyzer (WPA).

 

When you author custom recording profiles, you must define both a file and a memory version in the same recording profile definition (.wprp) file. When you select a profile for a recording, you must select either the file or memory version to use for that recording event. For examples of custom profiles, see [3. Profile Definitions](3-profile-definitions.md).

A .wprp file can have up to four profile definitions: one for each combination of detail level and logging mode. The following constraints are enforced:

-   The profile identifier must be in the following format: &lt;*ProfileName*&gt;.&lt;*DetailLevel*&gt;.&lt;*LoggingMode*&gt;

-   All profiles that exist in a single file must have the same name.

-   A .wprp file must contain profiles for both memory and file logging modes.

When you author a custom profile, you must define the [BufferSize](buffersize.md) element and the [Buffers](buffers.md) element. You can define the total amount of buffer as a fixed number of buffers by using a size that you define in kilobytes (KB), or as a percentage of total memory. The default buffer count is 64, and the default buffer size is 128 KB.

You can use the WPR command-line interface to view the size and number of buffers that each provider uses.

``` syntax
wpr -profiledetails CPU

Microsoft Windows Performance Recorder Version 6.2.9200


Profile                 : CPU.Verbose.Memory


Collector Name          : NT Kernel Logger
Buffer Size (KB)        : 1024
Number of Buffers       : 613
```

**Note**  
WPR supports only single-value *NumberOfBuffers*. It does not support minimum and maximum buffers.

 

General guidelines about how to set buffers are as follows:

-   Event stacks require more space compared to events without stacks. Therefore, WPR uses more buffers and logs more data for the same amount of time.

-   Make sure that your buffers are properly sized. If buffers are too large, too much memory is consumed and system performance is impacted. If buffers are too small, events can be lost, and the trace becomes useless.

-   When logging to memory, buffer size determines how long WPR can log data before old events are overwritten. For memory traces, we recommend that you set buffers as a percentage of total memory, such as 1% to 5% of physical memory, depending on the profile. Unless the recording profile is unusually verbose, 10% of physical memory should be sufficient.

-   Buffers are typically smaller when logging to a file than when logging to memory. However, if the buffers are too small, the buffers will flush to disk too often. Unless the recording profile is unusually verbose, 10-50 MB of physical memory should be sufficient.

For more guidance about buffers, see [Sessions (Windows Drivers)](http://go.microsoft.com/fwlink/p/?linkid=246706).

## Related topics


[WPR Features](wpr-features.md)

[Detail Level](detail-level.md)

[3. Profile Definitions](3-profile-definitions.md)

[Change the Logging Mode](change-the-logging-mode.md)

 

 







