---
title: Results for the File Handling assessment
description: Results for the File Handling assessment
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 9f620d9c-976c-4fdf-ba52-6188b3982305
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Results for the File Handling assessment


The File Handling assessment provides an automated way to exercise common file operations and capture metrics. This assessment measures durations and throughput while copying, moving, compressing, extracting, and deleting files and folders on your computer. The results help you understand how well the computer performs during these operations.

In this topic:

-   [Goals File](#bkmk-goals)

-   [Metrics](#bkmk-fileresults)

-   [Issues](#bkmk-fileissues)

For more information about the system requirements, workloads, and assessment settings, see [File Handling](file-handling.md).

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

 

## <a href="" id="bkmk-fileresults"></a>Metrics


The results for the File Handling assessment show the performance of the computer for copy, move, compress, and delete operations. The following table describes the metrics that the File Handling assessment measures.

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
<td><p>Copy Duration (Programmatic)</p></td>
<td><p>Shows the number of seconds that the programmatic copy operation took to finish.</p></td>
</tr>
<tr class="even">
<td><p>Copy Duration (UX Scripted)</p></td>
<td><p>Shows the number of seconds that the scripted copy operation took to finish.</p></td>
</tr>
<tr class="odd">
<td><p>Copy Throughput (Programmatic)</p></td>
<td><p>Shows the throughput, in megabytes per second, for the programmatic copy operation.</p></td>
</tr>
<tr class="even">
<td><p>Copy Throughput (UX Scripted)</p></td>
<td><p>Shows the throughput, in megabytes per second, for the scripted copy operation.</p></td>
</tr>
<tr class="odd">
<td><p>Delete Duration (Programmatic)</p></td>
<td><p>Shows the number of seconds that the programmatic delete operation took to finish.</p></td>
</tr>
<tr class="even">
<td><p>Delete Duration (UX Scripted)</p></td>
<td><p>Shows the number of seconds that the scripted delete operation took to finish.</p></td>
</tr>
<tr class="odd">
<td><p>Delete File Throughput (Programmatic)</p></td>
<td><p>Shows the file throughput, in files per second, for the programmatic delete operation.</p></td>
</tr>
<tr class="even">
<td><p>Delete Throughput (Programmatic)</p></td>
<td><p>Shows the throughput, in megabytes per second, for the programmatic delete operation.</p></td>
</tr>
<tr class="odd">
<td><p>Delete Throughput (UX Scripted)</p></td>
<td><p>Shows the throughput, in megabytes per second, for the scripted delete operation.</p></td>
</tr>
<tr class="even">
<td><p>File Handling</p></td>
<td><p>Provides an overview that shows the length of time that common file operations (such as copy, move, compress, and delete) took to finish. To see detailed metrics for file handling, expand the result.</p></td>
</tr>
<tr class="odd">
<td><p>File Organization Metrics</p></td>
<td><p>Shows the length of time that programmatic script operations (such as copy, move, compress, and delete) took to finish, and includes the following throughput for each operation:</p>
<ul>
<li><p>Copy Duration (Programmatic) MinifilterDelay (seconds)</p></li>
<li><p>Delete Duration (Programmatic) MinifilterDelay (seconds)</p></li>
<li><p>Move Duration (Programmatic) MinifilterDelay (seconds)</p></li>
<li><p>Copy Throughput (Programmatic) (megabytes per second)</p></li>
<li><p>Delete Throughput (Programmatic) (megabytes per second)</p></li>
<li><p>Move Throughput (Programmatic) (megabytes per second)</p></li>
</ul></td>
</tr>
<tr class="even">
<td><p>Move Duration (Programmatic)</p></td>
<td><p>Shows the number of seconds that the programmatic move operation took to finish.</p></td>
</tr>
<tr class="odd">
<td><p>Move Duration (UX Scripted)</p></td>
<td><p>Shows the number of seconds that the scripted move operation took to finish.</p></td>
</tr>
<tr class="even">
<td><p>Move File Throughput (Programmatic)</p></td>
<td><p>Shows the file throughput, in files per second, for the programmatic move operation.</p></td>
</tr>
<tr class="odd">
<td><p>Move File Throughput (UX Scripted)</p></td>
<td><p>Shows the file throughput, in files per second, for the scripted move operation.</p></td>
</tr>
<tr class="even">
<td><p>Move Throughput (Programmatic)</p></td>
<td><p>Shows the throughput, in megabytes per second, for the programmatic move operation.</p></td>
</tr>
<tr class="odd">
<td><p>Move Throughput (UX Scripted)</p></td>
<td><p>Shows the throughput, in megabytes per second, for the scripted move operation.</p></td>
</tr>
<tr class="even">
<td><p>Zip Duration (UX Scripted)</p></td>
<td><p>Shows the number of seconds that the scripted compress operation took to finish.</p></td>
</tr>
<tr class="odd">
<td><p>Zip Throughput (UX Scripted)</p></td>
<td><p>Shows the throughput, in megabytes per second, for the scripted compress operation.</p></td>
</tr>
<tr class="even">
<td><p>Un-Zip Duration (UX Scripted)</p></td>
<td><p>Shows the number of seconds that the scripted extract operation took to finish.</p></td>
</tr>
<tr class="odd">
<td><p>Un-Zip Throughput (UX Scripted)</p></td>
<td><p>Shows the throughput, in megabytes per second, for the scripted extract operation.</p></td>
</tr>
</tbody>
</table>

 

**Note**  
If you enabled the **Enable Minifilter Diagnostic Mode** assessment setting, the assessment results will include minifilter metrics. For more information about minifilter metrics and results, see [Minifilter Diagnostics](minifilter-diagnostics.md).

 

## <a href="" id="bkmk-fileissues"></a>Issues


### The assessment reports an exit code of 0x80050006

This error occurs when maintenance tasks have been registered on the PC but have not completed before the assessment run. This prevents the assessment from running, as maintenance tasks often impact assessment metrics.

To resolve this issue, do one of the following:

1.  Ensure that the computer is connected to a network and is running on AC power. Manually initiate pending maintenance tasks with the following command from an elevated prompt:

    `rundll32.exe advapi32.dll,ProcessIdleTasks`

2.  Disable regular and idle maintenance tasks, and stop all maintenance tasks before running the assessment.

## Related topics


[File Handling](file-handling.md)

[Assessments](assessments.md)

[Connected Standby Energy Efficiency](connected-standby-energy-efficiency.md)

[Create and Run an Energy Efficiency Job](create-and-run-an-energy-efficiency-job.md)

[Minifilter Diagnostics](minifilter-diagnostics.md)

[Windows Assessment Toolkit Technical Reference](windows-assessment-toolkit-technical-reference.md)

 

 







