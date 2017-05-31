---
title: Stop a Recording
description: Stop a Recording
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 115ea960-91ab-4f7a-a696-3630a05f8a5b
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Stop a Recording


This procedure describes how to stop and save a currently running recording in Windows Performance Recorder (WPR) from the user interface (UI). For information about how to start a recording from the command line, see [WPR Command-Line Options](wpr-command-line-options.md).

**To stop a recording**

1.  On the WPR screen, click **Save**. (If you click **Cancel**, no recording data is saved.)

2.  Browse to the location to which you want to save the recording file.

3.  Enter a description of the problem for which you created the recording.

4.  Click **Save** and then click **OK**.

    If events have been lost, a warning will display. See [Avoid Lost Events](avoid-lost-events.md) for guidance about how to avoid this problem.

## Security


Recordings can contain personally identifiable or security-related information. This includes paths to files that the recording accesses, or registry access and process names. Be cautious when you share recording files.

## Related topics


[WPR Common Scenarios](windows-performance-recorder-common-scenarios.md)

 

 







