---
title: Results for the Windows Media Player Performance and Quality Assessment
description: Results for the Windows Media Player Performance and Quality Assessment
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 2503b5ce-6b01-4a49-b3a3-8c4b84419152
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Results for the Windows Media Player Performance and Quality Assessment


The Windows Media Player Performance and Quality assessment starts Windows Media Player and plays multiple media clips one after another to assess media playing capabilities and capture performance and quality metrics. The assessment results include metrics for the number of audio and video glitches, or detectable visual or auditory defect in the user experience. The focus is on the quality and performance of steady-state playback in Windows Media Player, which mimics the workload of a user watching a movie. This assessment does not evaluate any seeking or pausing functionality.

In this topic:

-   [Goals File](#bkmk-goals)

-   [Metrics](#bkmk-wmpmetrics)

-   [Issues](#bkmk-wmpissues)

For more information about the assessment, system requirements and assessment settings, see [Windows Media Player Performance and Quality](windows-media-player-performance-and-quality.md).

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

 

## <a href="" id="bkmk-wmpmetrics"></a>Metrics


The results show information about the performance and quality of Windows Media Player playback on the computer. The following table provides a brief description for each metric that the Windows Media Player Playback assessment captures.

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
<td><p>Total Audio Drops</p></td>
<td><p>The total number of audio drops that were recorded during playback.</p></td>
</tr>
<tr class="even">
<td><p>Total Audio Glitches</p></td>
<td><p>The total number of audio glitches that were recorded during playback.</p>
<div class="alert">
<strong>Note</strong>  
<p>A glitch is any detectable visual or auditory defect in the user experience.</p>
</div>
<div>
 
</div></td>
</tr>
<tr class="odd">
<td><p>Total Audio Starvation</p></td>
<td><p>The total number of times that audio starvation occurred during playback.</p>
<div class="alert">
<strong>Note</strong>  
<p>Audio starvation occurs when the audio data cannot be read fast enough to keep pace with the rendering or composition of the file.</p>
</div>
<div>
 
</div></td>
</tr>
<tr class="even">
<td><p>Total DWM Glitches</p></td>
<td><p>The total number of times that Desktop Window Manager (DWM) caused playback glitches. DWM is involved in the composition of the playback.</p></td>
</tr>
<tr class="odd">
<td><p>Total MF Data Drops</p></td>
<td><p>The total number of times that Microsoft Media Foundation data was dropped during playback. For more information about this media platform, see [MSDN: Microsoft Media Foundation](http://go.microsoft.com/fwlink/?LinkId=232723).</p></td>
</tr>
<tr class="even">
<td><p>Total Enhanced Video Glitches</p></td>
<td><p>The total Enhanced Data Rate (EDR) video glitches that were recorded during playback.</p></td>
</tr>
</tbody>
</table>

 

More information may be available for each metric. To view that information, choose the link to the (ETL) file. The ETL file opens automatically in Windows® Performance Analyzer (WPA) for additional analysis.

## <a href="" id="bkmk-wmpissues"></a>Issues


The Windows Media Player Playback assessment does not display issues or provide recommendations. The best use for this assessment is to compare the Windows Media Player playback performance of two or more computers.

### The assessment reports an exit code of 0x80050006

This error occurs when maintenance tasks have been registered on the PC but have not completed before the assessment run. This prevents the assessment from running, as maintenance tasks often impact assessment metrics.

To resolve this issue, do one of the following:

1.  Ensure that the computer is connected to a network and is running on AC power. Manually initiate pending maintenance tasks with the following command from an elevated prompt:

    `rundll32.exe advapi32.dll,ProcessIdleTasks`

2.  Disable regular and idle maintenance tasks, and stop all maintenance tasks before running the assessment.

## Related topics


[Windows Media Player Performance and Quality](windows-media-player-performance-and-quality.md)

[Windows Assessment Toolkit](index.md)

[Assessments](assessments.md)

[Media Transcoding Performance](media-transcoding-performance.md)

 

 







