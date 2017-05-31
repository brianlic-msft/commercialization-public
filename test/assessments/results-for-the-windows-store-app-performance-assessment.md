---
title: Results for the Windows Store app performance assessment
description: Results for the Windows Store app performance assessment
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 1f0cb16e-c4e1-4953-97c3-b20894d6b667
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Results for the Windows Store app performance assessment


The Windows Store app performance assessment can help you optimize your app for a better customer experience. The assessment measures how quickly the app opens and suspends, and the amount of resources it uses on the PC. You can use this assessment to help you improve an individual app, or to help you optimize a Windows image by picking fast and fluid apps that run well on your PC.

This topic helps you interpret the results produced by the Windows Store app performance assessment. It also provides guidance on how to use the results to identify and resolve common issues that negatively impact app performance.

In this topic:

-   [Goals File](#bkmk-goals)

-   [Metrics](#bkmk-metrics)

-   [Issues](#bkmk-issues)

For more information about the system requirements and assessment settings, see [Windows Store App Performance](windows-store-app-performance.md).

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


The following metrics are reported by the Windows Store app performance assessment.

### Total Windows Store apps

The count of how many Windows Store apps are installed on the device.

### Windows Store apps assessed

The count of how many Windows Store apps were included in the assessment.

### Windows Store app details

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Metric</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Launch:Warm</p></td>
<td><p>The time, in milliseconds, that it takes for the app to come out of a suspended state.</p></td>
</tr>
<tr class="even">
<td><p>Launch:Cold</p></td>
<td><p>The time, in milliseconds, that it takes for the app to open.</p></td>
</tr>
<tr class="odd">
<td><p>Post Launch</p></td>
<td><p>Resource usage during the first ten seconds after the app is launched.</p></td>
</tr>
<tr class="even">
<td><p>Idle</p></td>
<td><p>Resource usage while the app is open without interaction for thirty seconds after the <strong>Post Launch</strong> period.</p></td>
</tr>
<tr class="odd">
<td><p>Suspend</p></td>
<td><p>The time, in milliseconds, that it takes for the app to enter a suspended state.</p></td>
</tr>
</tbody>
</table>

 

## <a href="" id="bkmk-issues"></a>Issues


This assessment performs advanced issue analysis and provides links to Windows Performance Analyzer (WPA) to troubleshoot the issues that are identified. In most cases, you can click the WPA Analysis link to troubleshoot the issues that appear. When WPA opens additional details about disk activity or CPU activity might be available depending on the type of issue identified. For more information about in-depth analysis issues and recommendations, see [Common In-Depth Analysis Issues](common-in-depth-analysis-issues.md).

### The assessment reports an exit code of 0x80050006

This error occurs when maintenance tasks have been registered on the PC but have not completed before the assessment run. This prevents the assessment from running, as maintenance tasks often impact assessment metrics.

To resolve this issue, do one of the following:

1.  Ensure that the computer is connected to a network and is running on AC power. Manually initiate pending maintenance tasks with the following command from an elevated prompt:

    `rundll32.exe advapi32.dll,ProcessIdleTasks`

2.  Disable regular and idle maintenance tasks, and stop all maintenance tasks before running the assessment.

 

 






