---
title: View a Recording Status
description: View a Recording Status
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: a0df113f-d0be-4560-9f6a-3df9ae93bdd4
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# View a Recording Status


After you start a recording in Windows Performance Recorder (WPR), you can follow the status of the recording as it transpires. This article describes the recording status.

## <a href="" id="viewstat"></a>


When you start a recording by using the WPR user interface (UI), the recording status immediately displays on the WPR screen. If you start a recording by using the WPR command-line interface, you can view the recording status by using either of the following methods:

-   In the command prompt window, type `wpr –status`. For more information about this command, see [WPR Command-Line Options](wpr-command-line-options.md#status).

-   Open the WPR UI. The status of the recording that you started from the WPR command line will display.

For more information about how to use these methods to start a WPR recording, see [Start a Recording](start-a-recording.md) and [WPR Command-Line Options](wpr-command-line-options.md).

**Note**  
WPR can only display a recording’s status if the recording is started by WPR. It cannot display recording status for recordings that are started by Xperf or other applications.

 

The recording status displays the following information:

-   **Recording Time**: This is the length of time that the recording has been running.

-   **Buffer**: This is the buffer size that the recording is using. It is displayed in both MB and percentage of available pooled memory.

-   **Events dropped**: The number of lost events since the recording was started. For more information about this issue, see [Avoid Lost Events](avoid-lost-events.md).

## Related topics


[Sessions](sessions.md)

 

 







