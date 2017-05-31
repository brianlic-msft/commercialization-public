---
title: Start a Recording
description: Start a Recording
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: a873691c-d198-4131-aa5d-849b4c6159d7
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Start a Recording


This procedure describes how to start a Windows Performance Recorder (WPR) recording from the user interface (UI). For information about how to start a recording from the command line, see [WPR Command-Line Options](wpr-command-line-options.md).

WPR requires Windows 7 or later version operating system.

**To start a recording**

1.  On the **Start** screen, click **Windows Performance Recorder**.

2.  To run the default profile, click **Start**. Or, to view and use other profiles, click **More options**.

    1.  In the **Select profiles for performance recording** box, select at least one profile.

    2.  You can optionally add a custom profile. To do so, click **Add Profiles**, navigate to the profile that you want, and then click **Open**. Under **Custom measurements**, select the profile.

    3.  From the **Performance scenario** drop-down list, select the scenario that you want. Unless the recording is for an on/off scenario, select **General**.

    4.  You can optionally record at the light detail level. (**Verbose** is the default.level.) To do so, select **Light** in the **Detail level** drop-down list.

    5.  To log the recording to a file, select **File** in the **Logging mode** drop-down list. **Memory** is the default logging mode, except for on/off transition logs, which must be logged to a file.

        **Caution**  
        For longer recordings, select **Memory**. When you select **File**, the file can grow very large because the only limitation to the file size is the available disk space. Windows Performance Analyzer (WPA) cannot analyze extremely large files.

         

3.  Click **Start** to begin recording, or click **Cancel** to end without recording.

**Note**  
If you start WPR while another application is recording (such as Xperf or an application that uses NT Kernel Logger, such as logman or PerfTrace), WPR will not immediately detect that a recording is taking place and it will initially display a message that recording has not started. However, if you try to start a recording in WPR during the time that another application is recording, WPR will detect a conflict and prompt you with the following query:

`An existing session is already running. Click OK to stop the running session and start the selected profile(s) or Cancel to abort the operation.`

To stop the current session, click **OK**. WPR will start to record. Note that this action can impact the application that started the cancelled session. To allow the current session to continue, click **Cancel**. In this case, WPR does not start a recording and the other application is not affected.

 

## Related topics


[WPR Common Scenarios](windows-performance-recorder-common-scenarios.md)

[Recording for Basic System Diagnosis](recording-for-basic-system-diagnosis.md)

 

 







