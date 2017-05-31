---
title: Create and run an energy efficiency job
description: Create and run an energy efficiency job
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: c98256c9-59a4-4bcb-b39a-6821719c34fc
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Create and run an energy efficiency job


This topic describes how to create and run a job that assesses the battery life and energy efficiency of a portable computer.

A typical scenario for this type of job involves running the job more than once. The first time that you run the job, use the **Battery run down with energy efficiency diagnostics** mode with workloads that exercise the computer the way that you or your intended end user would use the computer. Several workloads are available. These include file or photo handling, Internet browsing, streaming media, and even a workload to simulate idle time. The diagnostics help you troubleshoot energy-efficiency issues that occur during idle periods and that affect battery consumption. Before you run the job again, resolve any issues that you identified. When the results of running the job in **Battery run down with energy efficiency diagnostics** mode are acceptable, run the job again by using **Battery run down only** mode to verify the battery life without producing diagnostic results.

Another typical scenario includes running this type of job for a short period by using the **Energy efficiency with diagnostics only** mode. By using this mode, you can determine how efficiently the computer uses energy under typical workloads while it's running on battery.

There are multiple workloads and modes for an Energy Efficiency job. The following steps provide guidance but let you determine which modes and which workloads to exercise.

In this topic:

-   [Prerequisites](#prerequisites)

-   [Step 1: Create a new Energy Efficiency job](#step1)

-   [Step 2: Configure job settings](#step2)

-   [Step 3: Configure energy efficiency settings](#step3)

-   [Step 4: Add a workload](#step4)

-   [Step 5: Run the job](#step5)

## Prerequisites


**Requirements**

The computer must run on battery power. Energy Efficiency jobs are designed to run only on mobile devices. If the job doesn't detect a battery, you'll receive an error.

**Recommendations**

Before you begin, configure the settings on the portable computer to reduce the risk of generating warnings in the results and adversely affecting power usage. The following guidelines are recommended settings. They aren't required for the job to run, but the results may be affected if the computer isn't appropriately configured.

-   Make sure that wireless functionality is enabled and connected to a network. If wireless functionality isn't enabled and connected, the results might not reflect realistic scenarios.

    In Control Panel, open **Manage Wireless Networks**. If wireless functionality isn't enabled, turn it on and connect to a wireless network.

    **Note**  
    If wireless connectivity is on, but there's no network to connect to, results are still affected.

     

-   Install and enable antivirus software. If antivirus software isn't enabled and running, the results might not reflect realistic scenarios.

    In Control Panel, open **Action Center**, click **Security**, and check that **Virus protection** is set to **On**. If it isn't set to **On**, click **Change Action Center Settings**, and then select the **Virus protection** check box.

-   Make sure that the power policy is set to **Balanced**. By default, any other power policy generates a warning that may affect the results.

-   Make sure that the computer is configured such that a password isn't required when the computer resumes from a screen saver.

-   Make sure that all device drivers are correctly installed. Results may vary significantly if your computer has missing or incorrect drivers. You can use the [Driver Verification](driver-verification.md) assessment to identify driver issues on the computer that you want to assess.

**Note**  
This job runs with minimal UI, and you may not be able to cancel it after it starts. Depending on which workloads are selected, there may be no further indication that the job is running after it starts.

 

## <a href="" id="step1"></a>Step 1: Create a new Energy Efficiency job


An Energy Efficiency job uses workloads to simulate user activities and generate results for battery life and energy efficiency. Energy Efficiency job results don't include any workload-specific performance results. The results that are logged when the job uses workloads are specific to energy efficiency. They don't indicate how well the workload ran. In the following procedure, you create a new job and then specify Energy Efficiency as the job type so that the correct configuration settings and workloads can be added to the job.

**To create a new Energy Efficiency job**

1.  In the Windows Assessment Console, click **Options**, and then click **New Job**.

2.  In the **New Job** dialog box, type a job name, and then click **Create an energy efficiency job**.

    A new tab appears in Windows Assessment Console, labeled with the job name.

## <a href="" id="step2"></a>Step 2: Configure job settings


After you select the job type, you can adjust job settings. In this step, you configure the general job settings.

**To configure job settings**

1.  Under **Job Settings**, click **Overview** if it isn't already selected.

2.  In the details pane on the right, use the **Name**, **Description**, and **Notes** boxes to add information about this job.

3.  You can also adjust these settings:

    -   **Stop this job if an error occurs**. Select this check box to stop the job from finishing if it encounters an error. This setting is useful when a job takes a long time to run. It can prevent long wait times if the job encounters an error. For shorter jobs, stopping the job is generally not necessary if an error occurs.

    -   **Keep all temporary files created by assessments**. If you want to review the files that are created while the job is running, select this check box.

## <a href="" id="step3"></a>Step 3: Configure Energy Efficiency settings


After you adjust job settings, you configure the settings that provide specific information about how the Energy Efficiency job will run.

**To configure Energy Efficiency settings**

1.  Under **Job Settings**, click **Energy efficiency settings**.

2.  In the details pane on the right, in the **Mode** list, click one of these modes:

    -   **Battery run down only**. Use this mode to determine the amount of time that a portable computer can run on battery power.

    -   **Battery run down with energy efficiency diagnostics**. Use this mode to obtain battery rundown results in addition to diagnostic metrics for CPU utilization, disk utilization, and other energy and power behaviors. If you use the Idle workload, diagnostic metrics for idle intervals and other idle activities also appear.

    -   **Energy efficiency with diagnostics only**. Use this mode to assess energy efficiency while the computer exercises the available workloads. This mode produces diagnostic metrics and issues, but it doesn't generate battery rundown metrics.

3.  If you want to start the job before the battery is completely charged, select the **Start before fully charged** check box. By default, this check box is cleared. If you select it, you must enter a percentage in the **Battery start %** box.

4.  If you selected the **Start before fully charged** check box, enter a number between 1 and 100 in the **Battery start%** box to represent the percentage to which you want the battery charged when the job starts. We recommend a fully charged battery for the **Battery run down only** mode.

    **Note**  
    It might not be possible to charge the battery beyond a certain percentage. If the battery stops charging before it reaches the **Battery start%** value, it's considered fully charged.

     

5.  If you want to end the job before the battery is completely discharged, select the **End before fully discharged** check box. By default, this check box is selected, and you can enter a percentage in the **Battery end %** box. By default, the value is 5.

6.  If you clear the **End before fully discharged** check box, the job will end when the battery is fully discharged.

7.  If you want the job to run without user prompts, select the **Run automated** check box. By default, this check box is cleared. If you select it, you must type disconnect and restore power commands in the next two boxes to automate that phase of the job.

8.  If you selected the **Run automated** check box, type a disconnect power command in the **Disconnect power command** box.

9.  If you selected the **Run automated** check box, type a restore power command in the **Restore power command** box.

10. In the **Logging frequency (minutes)** box, specify, in minutes, how often results are written to the disk after the battery reaches the critical threshold that turns off the computer. The default is 1 minute. When results are written less frequently, more results are lost when the battery power runs out.

## <a href="" id="step4"></a>Step 4: Add a workload


A workload is a set of automated tasks that exercise the computer in a predefined, repeatable manner just as an assessment does. Several workloads are available. In this step, you choose the workload that you want to exercise while you're assessing the battery and energy efficiency. You should select workloads that exercise the computer the way that your intended end user might. You can mix and match workloads, and you can add a workload more than once. The Energy Efficiency job will iterate through the workloads until the job finishes.

**To add a workload**

1.  In the Windows Assessment Console, under **Assessments**, click **Add assessments**.

    The workloads that are available for an Energy Efficiency job appear on the right.

2.  Click the blue plus sign (**+**) next to one or more of the workloads to add them to the job. These workloads are available:

    <table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Workload</th>
    <th>Description</th>
    <th>Requirements</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p><strong>File handling (workload)</strong></p></td>
    <td><p>Simulates a user who's copying, moving, compressing, extracting, and deleting files and folders.</p></td>
    <td><p>Requires Windows 8 or Windows 10.</p></td>
    </tr>
    <tr class="even">
    <td><p><strong>Idle energy efficiency (workload)</strong></p></td>
    <td><p>Puts the system in an idle state for a specified amount of time.</p></td>
    <td><p>Requires Windows 8 or Windows 10.</p></td>
    </tr>
    <tr class="odd">
    <td><p><strong>Streaming media (workload)</strong></p></td>
    <td><p>Simulates a user who's watching a video in Internet Explorer.</p></td>
    <td><p>Requires Windows 8 or Windows 10, and Internet Explorer 9 or Internet Explorer 10.</p></td>
    </tr>
    <tr class="even">
    <td><p><strong>Windows Media Player playback (workload)</strong></p></td>
    <td><p>Simulates streaming of video by using Windows Media Player.</p></td>
    <td><p>Requires Windows 8 or Windows 10.</p></td>
    </tr>
    </tbody>
    </table>

     

3.  Select a workload to modify the settings:

    -   The File Handling workload has these settings available:

        <table>
        <colgroup>
        <col width="50%" />
        <col width="50%" />
        </colgroup>
        <thead>
        <tr class="header">
        <th>Setting</th>
        <th>Description</th>
        </tr>
        </thead>
        <tbody>
        <tr class="odd">
        <td><p>Use recommended settings</p></td>
        <td><p>Specifies whether the File Handling workload runs using the recommended values. By default, this check box is selected. To change the settings, you must first clear this check box.</p></td>
        </tr>
        <tr class="even">
        <td><p>Iterations</p></td>
        <td><p>Specifies the number of times that this workload runs. By default, the value is 1.</p></td>
        </tr>
        <tr class="odd">
        <td><p>Source</p></td>
        <td><p>Specifies the location of the files and folders that the workload copies. By default, the source is on the local computer. Use this setting to specify a different location or to use different files.</p></td>
        </tr>
        <tr class="even">
        <td><p>Destination</p></td>
        <td><p>Specifies the location that the workload copies files or folders to. You must have write access to the destination folder. You can use the default folder or specify a different folder. If you provide a different destination folder, the folder must be empty before you run the job.</p></td>
        </tr>
        <tr class="odd">
        <td><p>Import data location</p></td>
        <td><p>Specifies a user-created payload for use during workload operations. When you specify an import data location, the data is copied from the import location to the Source folder. When the workload runs, the source content is copied to the Destination folder. For this reason, when you import data, both the Source and Destination folders must be empty when the job starts.</p></td>
        </tr>
        </tbody>
        </table>

         

        For more information about the File Handling assessment, see [File Handling](file-handling.md).

    -   The Idle Energy Efficiency workload has these settings available:

        <table>
        <colgroup>
        <col width="50%" />
        <col width="50%" />
        </colgroup>
        <thead>
        <tr class="header">
        <th>Setting</th>
        <th>Description</th>
        </tr>
        </thead>
        <tbody>
        <tr class="odd">
        <td><p>Use recommended settings</p></td>
        <td><p>Specifies whether the Idle Energy Efficiency workload runs using the recommended values. By default, this check box is selected. To change the settings, you must first clear this check box.</p></td>
        </tr>
        <tr class="even">
        <td><p>Minutes</p></td>
        <td><p>Specifies the number of minutes that the system should remain in the idle mode. By default, the value is 11.</p></td>
        </tr>
        </tbody>
        </table>

         

    -   The Streaming Media workload has these settings available:

        <table>
        <colgroup>
        <col width="50%" />
        <col width="50%" />
        </colgroup>
        <thead>
        <tr class="header">
        <th>Setting</th>
        <th>Description</th>
        </tr>
        </thead>
        <tbody>
        <tr class="odd">
        <td><p>Use recommended settings</p></td>
        <td><p>Specifies whether the Streaming Media workload runs using the default values. By default, this check box is selected. To change the settings, you must first clear this check box.</p></td>
        </tr>
        <tr class="even">
        <td><p>Iterations</p></td>
        <td><p>Specifies the number of times that the workload runs. By default, the value is 3.</p></td>
        </tr>
        <tr class="odd">
        <td><p>Content Path</p></td>
        <td><p>Specifies the path of the source directory for the dataset that contains media and HTML files that the workload uses. By default, the content at /Content/Streaming Media is used.</p></td>
        </tr>
        <tr class="even">
        <td><p>Server Name</p></td>
        <td><p>Specifies the name of the streaming media server on the local network. Even though the box appears to be blank, the path of the default server is defined. If an alternate server name isn't specified, the workload starts the streaming server on the local computer.</p></td>
        </tr>
        <tr class="odd">
        <td><p>Port</p></td>
        <td><p>Specifies the port that the server accepts requests on. The default is port 80.</p></td>
        </tr>
        <tr class="even">
        <td><p>Streaming Time</p></td>
        <td><p>Specifies the maximum time, in seconds, that the job waits for a video workload to finish playing. By default, the value for this setting is 65.</p></td>
        </tr>
        <tr class="odd">
        <td><p>Workloads</p></td>
        <td><p>The Streaming Media workload can stream video to Internet Explorer by using content that has various resolutions. The default is 720p (30 FPS).</p></td>
        </tr>
        </tbody>
        </table>

         

        For more information about the Streaming Media assessment, see [Streaming Media Performance](streaming-media-performance.md).

    -   The Windows Media Player playback workload has these settings available:

        <table>
        <colgroup>
        <col width="50%" />
        <col width="50%" />
        </colgroup>
        <thead>
        <tr class="header">
        <th>Setting</th>
        <th>Description</th>
        </tr>
        </thead>
        <tbody>
        <tr class="odd">
        <td><p>Use recommended settings</p></td>
        <td><p>Specifies whether the Windows Media Player playback workload runs using the default values. By default, this check box is selected. To change the settings, you must first clear this check box.</p></td>
        </tr>
        <tr class="even">
        <td><p>Content Path</p></td>
        <td><p>Specifies the source folder for the media clips that are played in Windows Media Player when the workload runs. By default, the folder is at \Content\Streaming Media Assessment. If you supply your own media content, specify the full path to the content on the local computer or a network share.</p></td>
        </tr>
        <tr class="odd">
        <td><p>Duration</p></td>
        <td><p>Specifies the duration of single playback session, in seconds. The default is 600.</p></td>
        </tr>
        </tbody>
        </table>

         

    -   The Internet Explorer playback (HTML5) workload has these settings available:

        <table>
        <colgroup>
        <col width="50%" />
        <col width="50%" />
        </colgroup>
        <thead>
        <tr class="header">
        <th>Setting</th>
        <th>Description</th>
        </tr>
        </thead>
        <tbody>
        <tr class="odd">
        <td><p>Use recommended settings</p></td>
        <td><p>Specifies whether the Internet Explorer playback (HTML5) playback workload runs using the default values. By default, this check box is selected. To change the settings, you must first clear this check box.</p></td>
        </tr>
        <tr class="even">
        <td><p>Content Path</p></td>
        <td><p>Specifies the source folder for the media clips that are played in Internet Explorer playback (HTML5) when the workload runs. By default, the file that is used is \Content\Streaming Media Assessment\720p.mp4. If you supply your own media content, specify the full path to the content on the local computer or a network share.</p></td>
        </tr>
        <tr class="odd">
        <td><p>Duration</p></td>
        <td><p>Specifies the duration of single playback session, in seconds. The default is 600.</p></td>
        </tr>
        </tbody>
        </table>

         

## <a href="" id="step5"></a>Step 5: Run the Job


When an Energy Efficiency job runs, it runs silently to prevent the Windows Assessment Console UI from affecting power usage and adversely affecting the job results. But, several dialog boxes appear before the job starts. The following procedure helps you through those dialog boxes.

**To run the job**

1.  When you're satisfied with the settings, click **Run**.

    If the **User Account Control** dialog box appears, click **Yes**.

2.  The next dialog box is informational. Close all open applications before the job starts, and then click **Next**.

    Before the job starts, the job checks the computer configuration to make sure that the workloads can run successfully. For more information about computer configuration, see [Prerequisites](#prerequisites). The job generates error messages, warnings, and informational messages based on the computer configuration. If you're running the job silently, the job logs the notifications. Otherwise, the notifications appear in the **Assessment Launcher** dialog box, as follows:

    -   Errors block the start of the job. Error messages appear when the job finds a problem with the computer hardware or configuration that must be fixed before the job can continue. If an error message appears, the **Start** button isn't available in the dialog box.

    -   Warnings appear when the job finds a problem that doesn't block running the job but may influence the results. You can review the warnings, fix issues, and then click **Refresh**. Or, you can ignore the warnings and click **Start**.

    -   Informational messages provide additional instructions or information about actions that will occur when the job runs. After you've read the information, click **Start** to start the job.

    Click the symbol (&gt;) to view additional details about any message that appears in the **Microsoft Assessment Launcher** window.

3.  When the **Preparing System** dialog box appears, you must wait while the system is checked for tasks that the operating system has scheduled to run. If a task is scheduled, the computer runs it before the job starts. This process can take several minutes to an hour to finish, depending on the tasks that are scheduled. When the tasks finish, click **Next**.

4.  If the battery isn't fully charged, you might see the **Battery Charging** dialog box. You can do one of the following:

    -   Allow the job to start before the battery is fully charged by selecting the **Start before fully charged** check box and setting a start percentage in the **Battery start %** box. This allows the job to start as long as the current battery power is above the end condition that you specified in the Energy Efficiency job settings.

    -   Wait for the battery to charge.

5.  The next dialog box indicates when the battery is fully charged. You must unplug your computer from AC power for the job to start.

6.  A dialog box describes when the job will start. Click **Start Now** to run the job, or wait for the countdown to finish and let the job start automatically.

**Important**  
After the job starts, don't interact with the computer. The screen might go dark and resume, but no interaction is needed unless the computer shuts down while the job is running. If the computer shuts down, plug in the AC power and restart the computer. The state of the Energy Efficiency job will persist through the reboot if the end condition wasn't met. After the job starts exercising the workloads, you can't cancel the job.

 

## Next Steps


When the job is finished, review the results and issues.

## Related topics


[Assessments](assessments.md)

[Windows Assessment Console](windows-assessment-console.md)

[Connected Standby Energy Efficiency](connected-standby-energy-efficiency.md)

 

 







