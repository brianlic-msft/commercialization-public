---
title: Using Xperf Profiles
description: Using Xperf Profiles
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 31673dde-fe06-4b54-afe2-f9bd9c5e60d2
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Using Xperf Profiles


This section shows how to capture traces by using profiles. If you are analyzing memory, consider writing your trace to a file, because ETW writes through and does not disturb the cache. If you are analyzing disk I/O, consider saving your trace into a circular buffer in memory. There are also other considerations such as whether you need to capture a long trace, which would not fit into a buffer in memory, or if you only care about the last 5-10 seconds of the trace content.

## Procedure


1.  Select a profile such as **perf!FileIOProfiles.InBuffer** and use command similar to the following example to display information about it.

    ``` syntax
    xperf -profiles perf!FileIOProfiles.InBuffer
    ```

    This command lists all profiles, followed by the sessions and providers in that profile:

    Profile: FileIOProfiles.InBuffer

    Sessions: FileIOProfiles.InBuffer.Sessions

    Session: FileIOProfiles.InBuffer.Sessions\[0\].Kernel\[0\]

    Session: FileIOProfiles.InBuffer.Sessions\[0\].User\[0\]

    Providers: FileIOProfiles.InBuffer.Providers

    Provider: FileIOProfiles.InBuffer.Providers\[0\].Kernel\[0\]

    Provider: FileIOProfiles.InBuffer.Providers\[0\].User\[0\]

2.  Assuming that you chose to use a file-based trace, start an **InSequentialFile** trace profile by using the following command.

    ``` syntax
    xperf -start perf!GeneralProfiles.InSequentialFile
    ```

    If a problem occurs, an error is reported. For example, starting the same profile twice would result in an error that the session is already running.

3.  Show which **InSequentialFile** loggers have already started for a specific profile by using the following command.

    ``` syntax
    xperf -profileloggers perf!GeneralProfiles.InSequentialFile
    ```

    The response to this command is similar to the following example.

    Session Status for "perf!GeneralProfiles.InSequentialFile":

    "NT Kernel Logger" : Running

    PerfCoreUserSession\_InSequentialFile : Running

4.  Stop the **InSequentialFile** trace profile, save the traces, and then merge them into a trace file, such as Merged.etl, by using the following command.

    ``` syntax
    xperf -stop perf!GeneralProfiles.InSequentialFile merged.etl
    ```

    If a problem occurs, an error is reported.

5.  Start the **InSequentialFile** trace profile, overriding, at start time, *MaxBuffers* values for all ETW sessions, for which loggers are to be started to 256. To perform this action, use the following command.

    ``` syntax
    xperf -start perf!GeneralProfiles.InSequentialFile -MaxBuffers 256
    ```

    If a problem occurs, an error is reported.

6.  Update *MaxBuffers* values for the active **InSequentialFile** ETW loggers specified in the trace profile by using the following command.

    ``` syntax
    xperf -update perf!GeneralProfiles.InSequentialFile -MaxBuffers 256
    ```

    No response is displayed after issuing this command.

## Related topics


[Xperf Profiles](xperf-profiles.md)

 

 







