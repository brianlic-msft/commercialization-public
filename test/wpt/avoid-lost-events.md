---
title: Avoid Lost Events
description: Avoid Lost Events
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 7512de7a-de82-43e5-b100-d82faf59a7cb
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Avoid Lost Events


In Windows Performance Recorder (WPR), some applications generate so many events that Event Tracing for Windows (ETW) cannot keep up with the logging frequency. This problem manifests as lost events in the recordings. The problem can lead to analysis difficulties or erroneous conclusions because of incomplete data.

**Note**  
By default, WPR uses paged memory for buffers. To set WPR to use non-paged memory for buffers, set the *NonPagedMemory* attribute to *true* for the provider. For more information about how to create a custom profile, see [Authoring Recording Profiles](authoring-recording-profiles.md) and [2. System and Event Provider Definitions](2-system-and-event-provider-definitions.md).

 

You can help prevent WPR from losing ETW buffers or events in the following ways:

-   Use larger buffers to enable more efficient disk I/O when WPR writes the buffers to disk.

-   Count requests for the data collection the first time that you use a particular buffer configuration on a computer.

-   Use the command-line **recordTempTo** option to record to a different location than the default.

-   Increase the number of buffers.

-   Simplify the scenario that you are testing, or select fewer profiles.

-   Free disk space on the system drive.

-   Use advanced hardware to collect the data; for example, use a disk subsystem that has higher throughput. This is the last option to consider. You can usually avoid losing events by carefully selecting the providers to enable and the buffers to use.

## Related topics


[WPR Common Scenarios](windows-performance-recorder-common-scenarios.md)

[Recording Profiles](recording-profiles.md)

[Logging Mode](logging-mode.md)

[Change the Logging Mode](change-the-logging-mode.md)

[Detail Level](detail-level.md)

[Change the Detail Level](change-the-detail-level.md)

[Sessions](sessions.md)

[Sessions (Windows Drivers)](http://go.microsoft.com/fwlink/p/?linkid=246706)

 

 







