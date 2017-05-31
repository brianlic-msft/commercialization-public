---
title: Results for the On/Off Assessments
description: Results for the On/Off Assessments
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 7aa9fcbc-4019-4be0-829a-d50eadc6ca02
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Results for the On/Off Assessments


This topic helps you interpret the results produced by the On/Off assessments (Boot Performance (Fast Startup), Boot Performance (Full Boot), Standby Performance, and Hibernate Performance). It also provides guidance on how to use the results to identify and resolve several common issues that negatively impact the end user’s experience when shutting down and booting a computer.

In this topic:

-   [Goals File](#bkmk-goals)

-   [Metrics](#fs-metrics)

-   [Issues](#fs-issues)

-   [Best Practices for Time-Critical Tasks](#fs-analysis)

For more information about On/Off Transition assessments, see [On/Off Transition Performance](onoff-transition-performance.md).

## <a href="" id="bkmk-goals"></a>Goals File


You can create custom goals to measure your improvements in the Results View. Goals files are a triage tool that can help you understand how a PC is performing and to compare PCs in your business.

For example, goals for a basic laptop might be different than the goals you set for a high end desktop computer, or market expectations might change in such a way that you want the flexibility to define different goals and key requirements as time passes and technology improves.

When a metric value is compared to the goal for that metric, the status is color coded in the Result View as follows:

-   Light purple means that the system has a great user experience and that there are no perceived problems.

-   Medium purple means that the user experience is tolerable and you can optimize the system. Review the recommendations and analysis to see what improvements can be made to the system. These can be software changes, configuration changes or hardware changes.

-   Dark purple means that the system has a poor user experience and that there is significant room for improvements. Review the recommendations and analysis to see the improvements that can be made to the system. These can be software changes, configuration changes or hardware changes. You might have to consider making tradeoffs to deliver a high quality Windows experience.

-   No color means that there are no goals defined for the metric.

**Note**  
In the Windows Assessment Toolkit for Windows 8, some assessments include default goals files. The first time you view results using this version of the tools, the default goals file is used. However, you can also define custom goals for Windows 8 the same way that you can for Windows 8.1 and Windows 10.

 

You can set the goals file location and add a goals file to that location before you can use the UI to apply the custom goals. Once a goals file is selected it will continue to be the goals file that is used for any results that are opened.

Only one goals file can be used at a time. Goals for all assessments are set in a single goals file. The assessment tools will search for goals in the following order:

1.  A custom goals file

2.  Goals that are defined in the results file

3.  Goals that are defined in the assessment manifest

You can use the sample goals file that is provided at %PROGRAMFILES%\\Windows Kits\\10\\Assessment and Deployment Kit\\Windows Assessment Toolkit\\SDK\\Samples\\Goals to create your own goals file.

**Note**  
You cannot package a goals file with a job, but you can store it on a share for others to use.

 

## <a href="" id="fs-metrics"></a>Metrics


This section describes the key metrics reported by the On/Off assessments, common causes of poor results for these metrics, and common remediation for issues related to these metrics. This section also helps you identify the audience for which the metric is most applicable.

In this section:

-   [Shutdown Duration & Suspend Duration](#oo-shutdown-duration)

-   [User Session Shutdown Duration](#oo-user-session-shutdown-duration)

-   [Shutdown Processes Duration](#oo-shutdown-processes)

-   [Winlogon Suspend Duration & Winlogon Notifications Duration](#oo-winlogon-suspend)

-   [Suspend Processes Duration](#oo-suspend-processes-duration)

-   [Suspend Services Duration](#oo-suspend-services-duration)

-   [Superfetch Prepare Memory Duration](#oo-superfetch-prepare-memory-duration)

-   [Query Devices Duration](#oo-query-devices-duration)

-   [Flush Storage Volumes Duration](#oo-flush-storage-volumes-duration)

-   [Suspend Devices Duration](#oo-suspend-devices-duration)

-   [Hiberfile Write Duration](#oo-hiberfile-write-duration)

-   [BIOS Initialization Duration](#oo-bios-initialization-duration)

-   [Total Boot \[Excluding BIOS\] Duration & Total Resume \[Excluding BIOS\] Duration](#oo-total-boot)

-   [Main Path Boot Duration & Main Path Resume Duration](#oo-main-path)

-   [Boot Manager](#oo-boot-manager)

-   [Hiberfile Read Duration](#oo-hiberfile-read-duration)

-   [Resume Devices Duration](#oo-resume-devices-duration)

-   [Winlogon Resume Duration](#oo-winlogon-resume-duration)

-   [Explorer Initialization Duration](#oo-explorer-initialization-duration)

-   [Post On/Off Duration](#oo-post-on-off-duration)

**Note**  
If you enabled the Enable Minifilter Diagnostic Mode setting, the assessment results will include minifilter metrics. For more information about minifilter metrics and results, see [Minifilter Diagnostics](minifilter-diagnostics.md).

 

### <a href="" id="oo-shutdown-duration"></a>Shutdown Duration & Suspend Duration

**Relevant Assessments:**

-   Boot Performance (Fast Startup)

-   Boot Performance (Full Boot)

-   Standby Performance

-   Hibernate Performance

This metric measures the time that the computer spends in shut-down or suspend operations. The following table describes the metric for each assessment:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Assessment</th>
<th>Metric Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Boot Performance (Fast Startup) Assessment</p></td>
<td><p>This metric captures the time from the start of the shutdown phase, to the end of writing the hiberfile to disk and the transition to a lower power state (S4).</p></td>
</tr>
<tr class="even">
<td><p>Boot Performance (Full Boot) Assessment</p></td>
<td><p>This metric captures the time from the start of the shutdown phase to the transition to a powered off state.</p></td>
</tr>
<tr class="odd">
<td><p>Standby Performance Assessment</p></td>
<td><p>This metric captures the time from the start of the suspend phase to the transition to a lower power state (S3).</p></td>
</tr>
<tr class="even">
<td><p>Hibernate Performance Assessment</p></td>
<td><p>This metric captures the time from hibernate to the end of writing the hiberfile to disk and the transition to a lower power state (S4).</p></td>
</tr>
</tbody>
</table>

 

**Detailed Sub-metrics**

When the metric is expanded, a list of shutdown or suspend sub-phases is presented.

**Note**  
The durations of the sub-phases do not necessarily add up to the overall duration.

 

**Typical Influencing Factors**

This metric is an overall metric for the system shutdown/suspend. It can be affected by any software components that are running on the shutdown/suspend path.

**Analysis and Remediation Steps**

Expand this metric to see the sub-metrics, which provide more information on individual sub-phases of shutdown/suspend. Examine individual sub-phase metrics and issues to find potential delay contributors.

### <a href="" id="oo-user-session-shutdown-duration"></a>User Session Shutdown Duration

**Relevant Assessments:**

-   Boot Performance (Fast Startup)

This metric measures the time that the computer spends shutting down the user session. This phase includes shutting down user-session processes, logging the user off, and notifying subscribers to Winlogon notifications. When the metric is expanded, a list of shutdown or suspend sub-phases is presented.

**Note**  
The durations of the sub-phases do not necessarily add up to the overall duration.

 

This metric is an overall metric for the system shutdown. It can be affected by any software components that are running on the shutdown path.

**Analysis and Remediation Steps**

Expand this metric to see the sub-metrics that provide more information on individual sub-phases of shutdown. Examine individual sub-phase metrics and issues to find potential delay contributors.

### <a href="" id="oo-shutdown-processes"></a>Shutdown Processes Duration

**Most Applicable to:** Application developers

**Relevant Assessments:**

-   Boot Performance (Fast Startup)

When the assessment initiates the user session shutdown, each UI thread in every Graphical User Interface (GUI) application is sent a WM\_QUERYENDSESSION message. After Windows receives a response to the WM\_QUERYENDSESSION message, Windows sends the WM\_ENDSESSION to the same threads. If after 5 seconds any application has not responded to these notifications, Windows terminates the application. Any application can delay system shutdown by not promptly responding to the messages.

**Note**  
If a user initiates the shutdown, a user dialog box displays after the timeout expires. This dialog shows information about the application that is blocking the shutdown, and allows the user to **Force** or **Cancel** the shutdown.

 

This metric measures the time that the computer spends shutting down all processes in the user session.

**Detailed Sub-metrics**

When the metric is expanded, a more detailed view is presented of a set of sub-metrics that measure times each individual process took to respond to shutdown notifications. The columns show the following information:

-   A PID by iteration in the Detail column. In the default view, this column might contain the value “Various” because PIDs cannot be aggregated across iterations. Expand iterations to see individual PIDs.

-   The time that this particular process took during this phase.

**Typical Influencing Factors**

This metric captures the cumulative time of all running processes that have UI threads to respond to shutdown notification. This metric can be affected by a single process that takes too long, in addition to the cumulative time of all process responses.

Each process that has a UI thread can delay system shutdown by delaying its response to the WM\_QUERYENDSESSION message or WM\_ENDSESSION message.

**Note**  
To impact this metric, a process must be running. Because this assessment reboots before it collects data for analysis, the running processes are almost exclusively from startup applications or scheduled tasks.

 

**Analysis and Remediation Steps**

You can identify processes that most significantly impact this metric by using the [Find the Largest Contributor](#fs-issues) technique.

If possible, remove applications from the startup path. Because the assessment reboots before it performs measurements, the only applications that are running at shutdown are the applications that began at startup. As a best practice, startup applications should be kept to a minimum. If an unessential application is causing delays, consider removing it from the list of startup applications.

Find the possible reasons that responses to WM\_QUERYENDSESSION message or WM\_ENDSESSION can be delayed, and troubleshoot and fix the underlying issues. See [Best Practices for Time-Critical Tasks](#fs-analysis) for a list of common best practices.

**Additional Information**

[MSDN: WM\_QUERYENDSESSION message](http://go.microsoft.com/fwlink/?LinkId=247501)

[MSDN: WM\_ENDSESSION message](http://go.microsoft.com/fwlink/?LinkId=247502)

### <a href="" id="oo-winlogon-suspend"></a>Winlogon Suspend Duration & Winlogon Notifications Duration

**Most Applicable to:** Winlogon subscriber developers, group policy script owners, system administrators

**Relevant Assessments:**

-   Boot Performance (Fast Startup)

-   Boot Performance (Full Boot)

-   Standby Performance

-   Hibernate Performance

This metric measures the time that is spent by Winlogon, including time spent performing subscriber notifications/callbacks.

For the Boot Performance (Fast Startup) scenario, the **Winlogon Notifications** metric in Windows Assessment Console reflects the cumulative time that is spent processing all Winlogon subscriber notifications and callbacks. However, to provide context in the Windows® Performance Analyzer (WPA) timeline, the **Winlogon Notifications** activity starts with the first subscriber notification/callback and ends with the last. The time that is spent processing each notification is represented by individual child activities.

Boot Performance (Fast Startup) is the only assessment that provides additional sub-metrics for this metric. During suspend, Winlogon issues synchronous subscriber notifications to registered subscribers for the following four notification types:

-   Terminate Session

-   End Shell

-   Logoff

-   Create Session

When the metric is expanded, these four notification types are presented as sub-metrics. Each of these types has a list of subscribers (for example, profiles and GPClient) as additional sub-metrics, and each subscriber lists the specific instances of **Connect to Subscriber** and **Call Subscriber** for that subscriber.

In any scenario, Winlogon subscribers can delay shutdown/suspend by taking too long to process these notifications. For example, a profile service (Profiles) must synchronize the user profile if the **Roaming (Remote) Profiles** feature is enabled on the computer. As another example, a Group Policy client (GPClient) might be configured by a system or domain policy to perform certain tasks at user logoff. These tasks are typically configured by a system or domain administrator.

**Typical Influencing Factors**

When you examine this metric, you should focus on the Winlogon Subscribers.

**Analysis and Remediation Steps**

Examine times of individual subscriber operations. Specific issues are usually generated for subscribers that have longer durations. Open WPA to the time interval of a subscriber for more insight. For example, if a GPClient subscriber call takes 10 seconds, an examination of that period in WPA can reveal that a certain custom script runs for 9 seconds out of 10. This points out that the script is a highly-probable root cause of the delay.

**Additional Information**

[MSDN: Winlogon Notification Events](http://go.microsoft.com/fwlink/?LinkId=247505)

### <a href="" id="oo-suspend-processes-duration"></a>Suspend Processes Duration

**Most Applicable to:** Application developers

**Relevant Assessments:**

-   Boot Performance (Fast Startup)

-   Standby Performance

-   Hibernate Performance

This metric measures the time that the computer spends notifying processes of the impending power state change.

During this phase, the Client/Server Runtime Server Subsystem (Csrss.exe) broadcasts WM\_POWERBROADCAST window messages together with the event type of PBT\_APMSUSPEND to every application that owns a window. The system might also power off the monitor.

This activity can be seen in the WPA **Activities** graph as a large gap between consecutive processes that are being suspended. One second or more is expected to power off the monitor. This is a necessary stage during suspend/shut down, and it should not be considered a performance bottleneck for this metric.

Look at the **CPU Usage (Sampled)** graph during this time to show CPU utilization in the csrss.exe process on the following stack:

``` syntax
[Root] (csrss.exe) 
winsrv.dll!RegisterForDeviceBroadcastNotifications 
|- winsrv.dll!ZwUserCallNoParam 
|    win32k.sys!xxxUserPowerStateCalloutWorker 
|    |- win32k.sys!PowerOffMonitor 
|    |    |- win32k.sys!FadeDesktop 
|    |    |- win32k.sys!DrvSetMonitorPowerState 
|    |    |- win32k.sys!UpdateDisplayState 
|    |    |- win32k.sys!DwmSyncClearSwapChain 
|    |    |- win32k.sys!RestoreGammaRamp
```

Gaps in **Suspend Processes** because of CPU consumption on other stacks, or delays without CPU utilization on the current stack, can suggest areas to investigate further.

When the metric is expanded, a more detailed phase view is presented, with a set of sub-metrics that measure the times that each process took to respond to suspend notifications. The columns show the following information:

-   A PID by iteration in the **Detail** column. In the default view, this column might contain the value “Various” because PIDs cannot be aggregated across iterations. Expand iterations to see individual PIDs.

-   The time that this particular process took during this phase.

**Note**  
If an application has more than one window, the same process can receive more than one notification.

 

**Typical Influencing Factors**

Each application has the ability to delay system shutdown by delaying its response to the WM\_POWERBROADCAST message with PBT\_APMSUSPEND event type. Because this metric captures the cumulative time that all windows GUI processes take to respond to the suspend notification, this metric can be affected by a single process that takes too long, in addition to a cumulative time of all process responses. Note that the process must be running to impact this metric; because the Boot Performance (Fast Startup) assessment reboots before it collects data for analysis, these processes come almost exclusively from startup applications or scheduled tasks.

**Analysis and Remediation Steps**

Identify the processes that most significantly impact this metric. In Windows Assessment Console, expand the **Suspend Processes Duration** metric to get the details for this phase. In the **Process** list for this phase, sort the **Duration** in descending order and look for the largest contributors.

If possible, remove applications from the startup path. As a best practice, startup applications should be kept to a minimum. If an unessential application is causing delays, consider removing it from the list of startup applications.

Troubleshooting and fixing issues with that significantly impact the startup path requires deep analysis of application delays. See [Best Practices for Time-Critical Tasks](#fs-analysis) for a list of common best practices.

**Additional Information**

[MSDN: PBT\_APMSUSPEND event](http://go.microsoft.com/fwlink/?LinkId=247503)

### <a href="" id="oo-suspend-services-duration"></a>Suspend Services Duration

**Most Applicable to:** Windows service developers

**Relevant Assessments:**

-   Boot Performance (Fast Startup)

-   Standby Performance

-   Hibernate Performance

This metric measures the time that the computer spends notifying services of the impending power state change. All services that register to receive power management events (SERVICE\_ACCEPT\_POWEREVENT) receive suspend notifications. Because these notifications are sent serially, any delay in a service directly contributes to the overall shutdown/suspend duration. A 30 second timeout is enforced (on a per-service basis) to process this notification; after this timeout, the system moves on to the next phase. Because registering for this notification is optional, no specific action by the service is required by the OS.

**Detailed Sub-metrics**

When the metric is expanded, a more detailed phase view is presented with a list of individual services and their corresponding durations.

**Typical Influencing Factors**

This metric captures the cumulative time that all services take to respond to a power query. This metric can be affected by a single process that takes too long, in addition to the cumulative time of all process responses.

Most services are not required to do any significant work in response to standby and hibernate power notifications. From a service’s perspective, fast startup is similar to hibernate.

**Analysis and Remediation Steps**

Identify a service that significantly impacts this metric. Longer delays in service responses generally produce issues that are specific to a given service. When such an issue is generated, you can follow the link inside the issue to see advanced issue details. When an issue is not generated, subsequent analysis in WPA is required. This additional analysis is beyond the scope of this document. For more information about common best practices, see [Best Practices for Time-Critical Tasks](#fs-analysis).

**Additional Information**

[MSDN: OnNow/ACPI Support](http://go.microsoft.com/fwlink/?LinkId=247504)

### <a href="" id="oo-superfetch-prepare-memory-duration"></a>Superfetch Prepare Memory Duration

**Most Applicable to:** Application developers, Windows service developers

**Relevant Assessments**

1.  Boot Performance (Fast Startup)

2.  Standby Performance

3.  Hibernate Performance

This metric measures the time that the Windows Superfetch service spends preparing the memory state for the subsequent boot/resume. Superfetch pre-fetches data that is frequently accessed on startup, and stores it either in the hiberfile (for Boot Performance (Fast Startup) and Hibernate Performance) or main memory (Standby Performance) to avoid excessive disk accesses on resume. This feature accelerates the resume process.

**Typical Influencing Factors**

During this phase, the Superfetch service accesses data that is read during startup. The duration of this phase is directly influenced by the amount of data that must be read during startup by startup applications, services, credential providers, and so on.

**Analysis and Remediation Steps**

This phase requires advanced analysis that is not included in this document.

### <a href="" id="oo-query-devices-duration"></a>Query Devices Duration

**Most Applicable to:** Driver developers

**Relevant Assessments:**

-   Boot Performance (Fast Startup)

-   Standby Performance

-   Hibernate Performance

During the shutdown/suspend phase, every device driver is sent a power IRP that has a IRP\_MN\_QUERY\_POWER minor code and a power state (S4 for Boot Performance (Fast Startup)/Hibernate Performance, S3 for Standby Performance). This metric measures the duration of all drivers that process the query power IRP.

Each driver can delay system shutdown by not promptly handling the IRP.

**Detailed Sub-metrics**

When the metric is expanded, a more detailed phase view is presented with a list of devices and their corresponding durations.

**Typical Influencing Factors**

This metric captures the cumulative time that all drivers take to respond to power queries. This metric can be affected by a single driver that takes too long to respond, in addition to the cumulative time of all driver responses.

**Analysis and Remediation Steps**

You can identify a driver or drivers that significantly impact this metric by looking at the sub-metrics. Longer delays in the driver response durations usually produce issues that are specific to a given driver. When such an issue is generated, follow the link inside the issue to see advanced issue details. When an issue is not generated, subsequent analysis in WPA is required; this is beyond the scope of this document. See [Best Practices for Time-Critical Tasks](#fs-analysis) for a list of common best practices.

**Note**  
If a driver owns a power policy for a device, it generates a Device Power IRP in response to receiving a System Power IRP. Drivers should not wait to complete the System IRP until the Device IRP is completed because that wait can prevent other devices from receiving their System IRPs. This series of waits cause serialization delays and increases the overall suspend time.

 

**Additional Information**

[MSDN: IRP\_MN\_QUERY\_POWER](http://go.microsoft.com/fwlink/?LinkId=247506)

### <a href="" id="oo-flush-storage-volumes-duration"></a>Flush Storage Volumes Duration

**Most Applicable to:** Application developers, Windows service developers

**Relevant Assessments:**

-   Boot Performance (Fast Startup)

-   Standby Performance

-   Hibernate Performance

This metric measures the time that the computer spends writing to the registry and saving any other modified pages to secondary storage.

**Typical Influencing Factors**

The time that this metric represents depends on the amount of data that needs to be flushed.

**Analysis and Remediation Steps**

Identifying the processes that are responsible for this data requires advanced analysis that is beyond the scope of this document; however, any process that writes large amounts of data directly before shutdown are suspect.

Examples are: an application that wrote a multi-megabyte data file by using cached I/O directly before exiting, or a service that modifies large amounts of file-mapped memory at shutdown time.

### <a href="" id="oo-suspend-devices-duration"></a>Suspend Devices Duration

**Most Applicable to:** Driver developers

**Relevant Assessments:**

-   Boot Performance (Fast Startup)

-   Standby Performance

-   Hibernate Performance

During the shutdown phase of the Boot Performance (Fast Startup) scenario, every device driver is sent a power (IRP\_MJ\_POWER) I/O (IRP that has IRP\_MN\_SET\_POWER minor code and a power state (S4 for Boot Performance (Fast Startup) or Hibernate Performance, S3 for Standby Performance).

This metric measures the time that is required for all drivers to process the set power IRP.

When device drivers process this IRP, they save appropriate device context (if required), and put the device in the appropriate state for sleep or hibernate. Each driver can delay system shutdown by not promptly handling the IRP.

**Detailed Sub-metrics**

When the metric is expanded, a more detailed phase view is presented that includes a list of devices and their corresponding durations.

**Typical Influencing Factors**

This metric captures the cumulative time that all drivers take to respond to a power query. This metric can be affected by a single driver that takes too long to respond in addition to the cumulative time of all responses.

**Note**  
If a driver owns a power policy for a device, it generates a Device Power IRP in response to receiving a System Power IRP. Drivers should not wait to complete the System IRP until the Device IRP is completed because that wait can prevent other devices from receiving their System IRPs. This series of waits cause serialization delays and increases the overall suspend time.

 

**Analysis and Remediation Steps**

You can identify a driver or drivers that significantly impact this metric by looking at the sub-metrics. Long delays in the driver response durations usually produce issues that are specific to a given driver. When such an issue is generated, follow the link inside the issue to see advanced issue details. When an issue is not generated, subsequent analysis in WPA is required; this kind of analysis is beyond the scope of this document.

**Additional Information**

[MSDN: IRP\_MN\_SET\_POWER](http://go.microsoft.com/fwlink/?LinkId=247508)

### <a href="" id="oo-hiberfile-write-duration"></a>Hiberfile Write Duration

**Most Applicable to:** Application developers, Windows service developers, Driver developers

**Relevant Assessments:**

-   Boot Performance (Fast Startup)

-   Hibernate Performance

This metric measures the time that the system spends writing the relevant contents of main memory to secondary storage; specifically, into hiberfile.sys file that is usually found in the root directory of the system drive.

**Detailed Sub-metrics**

When the metric is expanded, the size of the hiberfile is shown in Kilobytes.

**Typical Influencing Factors**

The time it takes to write the hiberfile is directly proportional to the amount of data that needs to be written. This data consists of memory that is in use by the operating system, drivers, and services, in addition to any data that the system must read during system resume (as identified during the Superfetch Prepare Memory phase).

A driver that uses large amounts of memory can influence this metric by having the memory manager write data into the hiberfile. Or, a startup application can cause large amounts of data to be read on the resume path. In these cases, the Superfetch service ensures that data is included into the hiberfile to avoid slow random faulting on the resume path.

**Note**  
Hard drive physical performance characteristics, such as sequential write throughput, also affects this metric.

 

**Analysis and Remediation Steps**

Identifying the specific components that contribute to the longer hiberfile write durations requires detailed memory analysis and is beyond the scope of this document. However, each running driver and service can contribute to this metric by retaining large memory allocations. The number and footprint of the startup applications, and of other components that read data during startup, can also influence this metric.

### <a href="" id="oo-bios-initialization-duration"></a>BIOS Initialization Duration

**Most Applicable to:** BIOS manufacturers

**Relevant Assessments:**

1.  Boot Performance (Fast Startup)

2.  Boot Performance (Full Boot)

3.  Standby Performance

4.  Hibernate Performance

This metric measures the time that the platform firmware spends identifying and initializing hardware devices and running a power-on self-test (POST).

**Note**  
BIOS initialization happens before the operating system receives control. The assessment cannot thoroughly inspect the phase and can only report on its duration.

 

**Detailed Sub-metrics**

Boot Performance (Fast Startup) is the only scenario to provide additional sub-metrics for this metric. For systems that contain BIOS that support the latest Advanced Configuration and Power Interface (ACPI) standard (ACPI 5.0), this metric can be expanded to show the POST time that is reported by the Firmware Performance Data Table (FPDT). This is an alternate measurement for the BIOS Initialization duration, which is reported by kernel instrumentation.

**Typical Influencing Factors**

The boot order that is set for the system can be a significant source of delay during BIOS Initialization. This order can require the system to check for bootable optical, floppy, USB, or other hard drives before it loads Windows. PXE Boot (network/remote boot) can also be set as part of the boot order; if this is enabled, it can significantly affect the delay. Some BIOS configurations also have advanced diagnostics or verification modes that can take longer to complete.

**Analysis and Remediation Steps**

No additional information is captured for the BIOS phase. Typical influencing factors such as enabled PXE boot should be checked. The BIOS manufacturer should be consulted when you need to triage or alter these settings. A deeper investigation of the BIOS Initialization phase is beyond the scope of this document.

### <a href="" id="oo-total-boot"></a>Total Boot \[Excluding BIOS\] Duration & Total Resume \[Excluding BIOS\] Duration

**Relevant Assessments:**

-   Boot Performance (Fast Startup)

-   Boot Performance (Full Boot)

-   Standby Performance

-   Hibernate Performance

This metric measures the time that the computer spends starting up. This metric captures the time from the end of BIOS Initialization to the end of the Post On/Off phase, which ends when the system reaches an idle state.

**Detailed Sub-metrics**

When the metric is expanded, a list of boot/resume sub-phases is presented.

**Note**  
Durations of the sub-phases do not necessarily equal the overall duration.

 

**Typical Influencing Factors**

This metric is an overall metric for system boot/resume, and it can be affected by any software components that run on the boot/resume path.

**Analysis and Remediation Steps**

Expand this metric to see the sub-metrics that provide more information on individual sub-phases. Examine individual sub-phase metrics and issues to find potential delay contributors.

### <a href="" id="oo-main-path"></a>Main Path Boot Duration & Main Path Resume Duration

**Relevant Assessments:**

-   Boot Performance (Fast Startup)

-   Boot Performance (Full Boot)

-   Standby Performance

-   Hibernate Performance

This metric measures the time from when the computer begins start-up until the user’s Desktop is visible. This metric captures the time from the end of BIOS Initialization until the Windows 8 UI is shown, and it does not include the Post On/Off phase.

**Detailed Sub-metrics**

When the metric is expanded, a list of sub-phases (excluding the Post On/Off phase) is presented.

**Note**  
Durations of the sub-phases do not necessarily equal the overall duration.

 

**Typical Influencing Factors**

This metric is an overall metric for boot/resume to a visible Desktop. It can be affected by any software components that run before the Desktop displays.

**Analysis and Remediation Steps**

Expand this metric to see the sub-metrics that provide more information on individual sub-phases. Examine individual sub-phase metrics and issues to find potential delay contributors.

### <a href="" id="oo-boot-manager"></a>Boot Manager

**Most Applicable to:** System administrators

**Relevant Assessments:**

-   Boot Performance (Fast Startup)

-   Boot Performance (Full Boot)

-   Hibernate Performance

This metric measures the time to find and start Winload.exe, the operating system loader, on the Windows boot partition.

**Typical Influencing Factors**

This metric can be affected by BitLocker operations, especially if a PIN is required for BitLocker to start.

**Analysis and Remediation Steps**

Use a BitLocker unlock method that does not require manual PIN entry.

### <a href="" id="oo-hiberfile-read-duration"></a>Hiberfile Read Duration

**Most Applicable to:** Application developers, Windows service developers, driver developers

**Relevant Assessments:**

-   Boot Performance (Fast Startup)

-   Hibernate Performance

This metric measures the time that the system spends reading the contents of the hiberfile into main memory.

**Detailed Sub-metrics**

When the metric is expanded, the size of the hiberfile (in Kilobytes) is shown.

**Typical Influencing Factors**

The time that it takes to read the hiberfile is directly proportional to the amount of data that must be read. This data consists of data in memory that is used by the operating system, drivers, and services, in addition to data that the system uses for system resume (identified during the Superfetch Prepare Memory phase of shutdown/suspend).

**Note**  
Hard drive physical performance characteristics, such as sequential read throughput, also affects this metric.

 

**Analysis and Remediation Steps**

Identifying the specific components that contribute to longer hiberfile read durations requires detailed memory analysis and is beyond the scope of this document.

**Note**  
Each running driver and service can contribute to this metric by retaining large memory allocations. The number and footprint of startup applications and other components that read data during startup also influence this metric.

 

### <a href="" id="oo-resume-devices-duration"></a>Resume Devices Duration

**Most Applicable to:** Driver developers

**Relevant Assessments:**

-   Boot Performance (Fast Startup)

-   Standby Performance

-   Hibernate Performance

During shutdown/suspend, every device driver is sent a power (IRP\_MJ\_POWER) IRP that has an IRP\_MN\_SET\_POWER minor code and working power state. Device drivers subsequently send Device Power IRPs to corresponding devices. This metric measures the time for all drivers to process the set power IRP.

**Note**  
Drivers should not retain the System Power IRP during this phase. Each driver can delay system startup by not promptly handling the system power IRP.

 

**Detailed Sub-metrics**

When the metric is expanded, a more detailed phase view is presented with a list of devices and their corresponding durations.

**Typical Influencing Factors**

This metric captures the cumulative time that all drivers take to respond to an IRP\_MN\_SET\_POWER power request. This metric can be affected by a single driver that takes too much time, in addition to the cumulative time of all driver responses.

**Note**  
If a driver owns a power policy for a device, it generates a Device Power IRP in response to receiving a System Power IRP. Drivers should not wait to complete the System IRP until the Device IRP is completed because that wait can prevent other devices from receiving their System IRPs. This series of waits cause serialization delays and increases the overall suspend time.

 

**Analysis and Remediation Steps**

You can identify a driver or drivers that significantly impact this metric by looking at the sub-metrics. Long delays in the driver responses usually produce issues that are specific to a given driver. When such an issue is generated, follow the link inside the issue to see advanced issue details. When an issue is not generated, subsequent analysis in WPA is required; this is beyond the scope of this document. See [Best Practices for Time-Critical Tasks](#fs-analysis).

**Additional Information**

[MSDN: IRP\_MN\_SET\_POWER](http://go.microsoft.com/fwlink/?LinkId=247508)

### <a href="" id="oo-operating-system-selection-menu-duration"></a>Operating System Selection Menu Duration

**Most Applicable to:** System administrators

**Relevant Assessments:**

-   Boot Performance (Fast Startup)

This metric measures the time that it takes for the operating system selection menu to make its default selection. By default, a selection is made after 30 seconds (in the absence of user interaction).

**Typical Influencing Factors**

This metric is unaffected by system behavior. This metric is reported only on systems that have multiple operating systems installed, and it will always report 30 seconds if no user interaction is performed.

**Note**  
Although system behavior does not affect the duration of this metric, the boot process has many asynchronous processes that can run during this time. These processes can affect the results for activities that occur after the default selection is made, because some of the work that is normally performed during these times might already be completed.

 

**Analysis and Remediation Steps**

Remove all installed operating systems other except for the one that is being analyzed. To view the list of currently installed operating systems (including settings that affect this menu), run **msconfig.exe** at a command prompt and then choose the **Boot** tab.

### <a href="" id="oo-winlogon-resume-duration"></a>Winlogon Resume Duration

**Most Applicable to:** Winlogon subscriber developers, group policy script owners, system administrators, credential provider writers

**Relevant Assessments:**

-   Boot Performance (Fast Startup)

-   Hibernate Performance

This metric represents a timespan of multiple Winlogon callouts and operations, such as interaction with Winlogon subscribers. This metric is not the accumulated time that is spent in subscriber notifications, and it should not be treated as such.

**Detailed Sub-metrics**

Boot Performance (Fast Startup) is the only assessment that provides additional sub-metrics for this metric. When the metric is expanded, a more detailed phase view is presented that includes the times incurred by each of the Winlogon subscribers. During resume, Winlogon issues synchronous subscriber notifications to registered subscribers for the following two notification types:

-   Logon

-   Start Shell

When it is expanded, these two notification types are presented as sub-metrics. Each of these types has a list of subscribers (for example, profiles or GPClient) as additional sub-metrics. Each subscriber lists the specific instances of **Connect to Subscriber** and **Call Subscriber** for that subscriber.

For all scenarios, Winlogon subscribers can delay shutdown by taking too long to process these notifications. For example, a profile service (Profiles) must synchronize the user profile if the **Roaming (Remote) Profiles** feature is enabled on that computer. Or, a group policy client (GPClient) might be configured by a system or domain policy to perform certain tasks upon user logon. These tasks are typically configured by a system or domain administrator, and generally run non-Microsoft owned scripts.

**Typical Influencing Factors**

When you examine this metric, you should focus on the Winlogon subscribers that process the notifications for Logon and Start Shell.

**Analysis and Remediation Steps**

Examine times of individual subscriber operations. Specific issues are usually generated for longer subscriber durations. You can also gain insight by opening WPA to the time interval of a subscriber. For example, if a GPClient subscriber call takes 10 seconds, an examination of that duration in WPA can reveal that a certain custom script is running for 9 seconds out of 10. This can be seen in the **Process Lifetimes** graph. It indicates that this script is a probable root cause for the delay.

**Additional Information**

[Winlogon Notification Events](http://go.microsoft.com/fwlink/?LinkId=247505)

### <a href="" id="oo-explorer-initialization-duration"></a>Explorer Initialization Duration

**Most Applicable to:** Startup application developers

**Relevant Assessments:**

-   Boot Performance (Fast Startup)

This metric captures the time from the end of the Winlogon phase until the Windows Shell (Explorer.exe) reports an initialized Start Screen. It includes the start of the userinit.exe process, which in turn starts Explorer.exe. It also includes the initiation of startup applications that are stored in **RunOnce** registry keys.

**Typical Influencing Factors**

In the absence of **RunOnce** applications, most of the time in this phase should be spent initializing the Explorer process. Explorer reads a number of libraries and data files into memory during its initialization process. Contending I/O from other running components can interfere with and delay this activity.

**Analysis and Remediation Steps**

Specific issues are usually generated for longer durations of the Explorer Initialization phase. You can gain more insight by opening WPA to the time interval of the Explorer Initialization activity. Avoid placing applications in the **RunOnce** key on a recurring basis because it delays Explorer Initialization.

Investigating specific issues during Explorer Initialization is beyond the scope of this document. For a list of common best practices, see [Best Practices for Time-Critical Tasks](#fs-analysis).

### <a href="" id="oo-post-on-off-duration"></a>Post On/Off Duration

**Most Applicable to:** Application developers

**Relevant Assessments:**

-   Boot Performance (Fast Startup)

-   Boot Performance (Full Boot)

-   Standby Performance

-   Hibernate Performance

This metric measures the time from the completion of Post On/Off to the system being reasonably idle and responsive to user input. The goal of this phase is to bind and quantify background processing that continues after the Start Screen displays. This metric measures the duration of the Post On/Off phase, which represents the amount of time that is required for the system to accumulate 5 seconds of idle time. This time is accumulated by checking the CPU and storage utilization in 500ms time windows. If the cumulative time of both CPU and storage utilization is below 20%, the idle time of this window (500ms – max \[CPU time, Disk time\] in the window) is added to the total idle time until 5 seconds is reached. The metric reports this duration minus the 5 seconds of collected idle time.

**Note**  
Low-priority CPU and storage utilization times are ignored for these calculations.

 

Any software component that is running during this phase can affect the phase duration by performing disk I/O or computation.

**Detailed Sub-metrics**

No actual sub-metrics exist for this phase; however, because the phase duration is proportional to resource utilization, you can gain insight by examining processes that are running during this phase (expand **Processes per Phase** in Windows Assessment Console).

**Typical Influencing Factors**

Any software components that utilize CPU or storage resources during this phase can potentially contribute to the overall time. Additional startup applications usually have a negative impact on the Post On/Off phase.

In the Standby Performance and Hibernate Performance scenarios, which do not log off the user session, this phase is affected by applications that are running in the current workload.

**Analysis and Remediation Steps**

Identify processes that are consuming the most resources. You can do this either by expanding **Processes per Phase** in Windows Assessment Console or by looking at CPU and disk utilization graphs and summary tables in WPA. Issues are also likely to be generated for offending processes. See Looking at resource utilization metrics for more details.

To address the issue for the Boot Performance (Fast Startup) and Boot Performance (Full Boot) assessments, consider removing non-essential applications from the startup path or use the Task Scheduler to start these applications at a later time. If an application is critical for user logon (for example, it provides credential provider services or network services), make sure that the application is optimized for minimal resource consumption.

Avoid using managed code (CLR-based) startup applications because their initialization can activate the resource-costly initialization of .NET framework. This will further impact Post On/Off phase times and degrade user responsiveness.

## <a href="" id="fs-issues"></a>Issues


The On/Off Transition Performance assessments perform advanced issue analysis and provide links to WPA to troubleshoot the issues that the assessment has identified. When WPA opens, additional details about disk activity or CPU activity might be available, depending on the type of issue. This section describes common investigative techniques that you can use to analyze performance issues.

**Find the Largest Contributor**

Open the assessment results file in Windows Assessment Console and expand the corresponding parent metric. The child sub-metrics typically provide information on specific components that affect the parent metric.

For example, consider the [Shutdown Processes Duration](#oo-shutdown-processes) metric. You can expand the metric to view three sub-metric tables for this phase. The first two tables show the CPU and disk utilization, and the third table shows the durations of individual processes that are being shut down.

Additional columns, such as the **Detail** column, provide more details for the sub-metrics. In **User Session Shutdown Processes**, the **Detail** column shows a PID.

**Note**  
In the default view, the **Detail** column might contain the value “Various” because PIDs cannot be aggregated across iterations. Expand iterations to see individual PIDs.

 

Windows Assessment Console allows you to sort the sub-metrics list by any data column (except for the top level Fast Startup phase lists, which are sorted by phase order during shutdown/boot).

For example, in the expanded process list for the [User Session Shutdown Processes](#oo-user-session-shutdown-duration) phase, right-click the table header and then choose **Sort rows descending**.

You can use this technique for multiple top level phase durations.

**Look at Resource Utilization Metrics**

View the detailed resource utilization metrics for each process during this phase. To retrieve this information, expand the processes for each phase tab in the section, and then sort by either CPU usage or total disk usage.

**Additional Information**

For more information about in-depth analysis issues and recommendations, see [Common In-Depth Analysis Issues](common-in-depth-analysis-issues.md).

### The assessment reports an exit code of 0x80050006

This error occurs when maintenance tasks have been registered on the PC but have not completed before the assessment run. This prevents the assessment from running, as maintenance tasks often impact assessment metrics.

To resolve this issue, do one of the following:

1.  Ensure that the computer is connected to a network and is running on AC power. Manually initiate pending maintenance tasks with the following command from an elevated prompt:

    `rundll32.exe advapi32.dll,ProcessIdleTasks`

2.  Disable regular and idle maintenance tasks, and stop all maintenance tasks before running the assessment.

## <a href="" id="fs-analysis"></a>Best Practices for Time-Critical Tasks


If you don’t want a task to be delayed, ensure it does not do anything which takes a long time. Below are some things to avoid.

-   If a time-critical response is required, for example, to process the WM\_ENDSESSION during shutdown, do not plan on doing any substantial work when receiving the request (aside from data reliability work like saving user modifications, which must be done).

-   Avoid performing any operations which might take a longer time, unless absolutely necessary. Defer them until the current time-critical task is complete. Avoid any APIs which contain the warning: “beware of performance considerations when using this API”.

-   Avoid any network dependencies because any network request can be delayed by network issues. This is especially true for Startup and Shutdown scenarios since the network is not guaranteed to be available for the entire time.

-   Avoid long timeouts. If a wait is required, ensure the wait time is reasonably bound by a small (in the context of the time critical task in question) timeout value.

-   Avoid excessive computation. Keep in mind that processors vary in speed so a computation taking 100ms on a very fast computer might end up taking seconds on a slower one.

-   Avoid unnecessary storage I/O. Any I/O request could be delayed by other components. At any time there are dozens of application and services running on a typical system and the storage resources are limited. Your I/O request might get queued behind hundreds of similar requests from other components.

-   Avoid disk flushes, for example, those initiated through calling FlushFileBuffers API. Flushing causes the disk stack to delete its caches and is supposed to force the hard drive to write out data in its RAM buffers. Typically, this operation is very costly and does not guarantee data consistency since the hard drives often ignore the request.

-   Avoid flushing registry hives by calling RegFlushKey API. Because of registry design, the API is causing modified data for the entire hive to be flushed to disk, which is a very costly operation. Flushing registry keys is an action that is not typically needed since the operating system provides a consistent registry view to all the components. Also, the registry itself does asynchronous flushes every several seconds.

-   Avoid opening new RPC connections since the RPC authentication process is costly. Establishing a new RPC connection involves costly security checks.

-   Avoid calling transactional APIs such as TxF APIs as they commonly perform a number of costly operations for each API call. These APIs obtain reliability at the cost of performance, so these APIs should not be used during time-critical tasks.

## Related topics


[Assessments](assessments.md)

[On/Off Transition Performance](onoff-transition-performance.md)

[Automate reboots before you run an assessment](automate-reboots-before-you-run-an-assessment.md)

[Windows Assessment Toolkit](index.md)

 

 







