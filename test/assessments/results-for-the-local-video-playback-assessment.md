---
title: Results for the Local Video Playback Assessment
description: Results for the Local Video Playback Assessment
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 4b4198f1-99bd-4858-a933-5e194ed3367f
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Results for the Local Video Playback Assessment


Local Video Playback assessment results show metrics and issues that highlight energy efficiency problems. When possible, the cause of the energy efficiency problem is identified. For example, it could be drivers, processes, or services. Recommended solutions for these problems are provided.

This topic helps you interpret the results produced by a Battery Run Down job that uses the Local Video Playback assessment. It also provides guidance on how to use the results to identify and resolve common issues that negatively impact computer battery life.

In this topic:

-   [Goals File](#bkmk-goals)

-   [Metrics](#bkmk-metrics)

-   [Issues](#bkmk-idleissues)

For more information about Battery Run Down jobs, see [Connected Standby Energy Efficiency](connected-standby-energy-efficiency.md).

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

 

## <a href="" id="bkmk-metrics"></a>Metrics


The following metrics are specific to the Local Video Playback assessment:

### Diagnostic Mode Metrics

### System Timer Resolution

This metric represents the resolution, in milliseconds, of the system timer.

### Processes Changing System Timer Resolution

This metric represents the number of processes that request a system resolution change.

### <a href="" id="processes-using--1--cpu-during-idle-period"></a>Processes using &gt;1% CPU during idle period

This metric represents the number of processes, excluding the video playback app, with at least 1% CPU utilization.

### Storage read count

This metric represents the total number of storage reads during the assessment run. This excludes storage reads by the video playback app.

### Data read from storage

This metric represents the total size, in kilobytes, of data that was read from storage during the assessment run. This excludes data that was read by the video playback app.

### Storage write count

This metric represents the total number of writes to storage during the assessment run.

### Data written to storage

This metric represents the total size, in kilobytes, of data that was written to storage during the assessment run.

### Storage flush count

This metric represents the total number of storage flushes during the assessment run.

### <a href="" id="processes-reading---50-times"></a>Processes reading &gt; 50 times

This metric represents the number of processes that read from storage more than 50 times during the assessment run. This excludes the video playback app.

### <a href="" id="processes-reading---1-mb"></a>Processes reading &gt; 1 MB

This metric represents the number of processes that read more than one megabyte from storage during the assessment run. This excludes the video playback app.

### Processes writing to storage

This metric represents the number of process that write to storage during the assessment run. This excludes the video playback app.

### Other Metrics

### DFlip used by playback

This metric represents whether DirectFlip was enabled while playing the media file in full-screen mode.

## <a href="" id="bkmk-idleissues"></a>Issues


The Local Video Playback assessment performs advanced issue analysis and provides links to Windows Performance Analyzer (WPA) to troubleshoot the issues that are identified. WPA might present additional details about disk activity or CPU activity depending on the types of issues that were identified. For more information about in-depth analysis issues and recommendations see, [Common In-Depth Analysis Issues](common-in-depth-analysis-issues.md).

Below is a list of issues that you might encounter when running the Local Video Playback assessment.

### DirectFlip is not enabled

When DirectFlip is not enabled, an issue is generated that highlights the energy efficiency improvements that can be obtained when using DirectFlip.

### DirectFlip is not supported

When DirectFlip is not supported on the display driver, an issue is generated that highlights the energy efficiency improvements that can be obtained when using DirectFlip.

### Total Storage Write Count

An issue is always generated that highlights the total number of writes to storage, along with the threshold. Writing data to storage increases power consumption.

### Total Writes to Storage

An issue is always generated that highlights the total size of the data written to storage during the assessment run. Writing data to storage increases power consumption.

### The assessment reports an exit code of 0x80050006

This error occurs when maintenance tasks have been registered on the PC but have not completed before the assessment run. This prevents the assessment from running, as maintenance tasks often impact assessment metrics.

To resolve this issue, do one of the following:

1.  Ensure that the computer is connected to a network and is running on AC power. Manually initiate pending maintenance tasks with the following command from an elevated prompt:

    `rundll32.exe advapi32.dll,ProcessIdleTasks`

2.  Disable regular and idle maintenance tasks, and stop all maintenance tasks before running the assessment.

## Related topics


[Windows Assessment Toolkit](windows-assessment-toolkit-technical-reference.md)

[Assessments](assessments.md)

[Connected Standby Energy Efficiency](connected-standby-energy-efficiency.md)

 

 







