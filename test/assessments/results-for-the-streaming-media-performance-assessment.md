---
title: Results for the Streaming Media Performance Assessment
description: Results for the Streaming Media Performance Assessment
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 238eba8e-fe97-4422-be7a-88e4e232de8a
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Results for the Streaming Media Performance Assessment


The Streaming Media Performance assessment helps you assess and improve a computers streaming media performance. This assessment uses a streaming server application that is deployed either on a local computer or on a remote server. The assessment starts Internet Explorer® 10 and plays back the media content from start to finish or to a specified time. Then, Internet Explorer closes and results are generated.

This topic provides guidance for understanding the results of Streaming Media performance assessment in addition to guidance on how to use those results to identify and resolve common issues that negatively affect the streaming media experience. Although Internet Explorer is used as a streaming client in this analysis, the techniques discussed in this topic can be applied to improve the general streaming media experience on Windows.

In this topic:

-   [Goals File](#bkmk-goals)

-   [Metrics](#bkmk-metrics)

-   [Issues](#bkmk-streamingissues)

For more information about this assessment, system requirements and assessment settings, see [Streaming Media Performance](streaming-media-performance.md).

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


The Streaming Media Performance assessment reports audio and video glitch metrics. Instead of directly reporting the count of video glitches encountered, the glitches are classified based on human perception. Most people start perceiving video and audio being out-of-sync in the range of 80ms to 160ms. Within this time range, the number of consecutive frames that can glitch in a 30 FPS video before it can be perceived, is calculated. Based on the count of consecutive frames that have glitches, the video glitches are classified as major, medium or minor glitches as follows:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Count of consecutive frames with glitches</th>
<th>Glitch classification</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>1</p></td>
<td><p>Minor glitch</p></td>
</tr>
<tr class="even">
<td><p>2 to 4</p></td>
<td><p>Medium glitch</p></td>
</tr>
<tr class="odd">
<td><p>&gt;=5</p></td>
<td><p>Major glitch</p></td>
</tr>
</tbody>
</table>

 

The 60 second playback duration of the assessment workload can be divided into 60 1-second intervals. Based on the type of glitches that occurred in an interval, every interval is classified as either a major, medium, minor or no-glitch interval. For example, a medium glitch interval is one in which at least one medium glitch occurred but no major glitch was noticed. Similarly a minor glitch interval is one in which at least one minor glitch occurred but no medium or major glitches were noticed.

By default, this assessment runs 3 iterations of the workloads. However, the video plays 5 times during 3 iterations. The first iteration is to initialize Internet Explorer, and then there are 3 video playbacks for calculating the metrics. The last iteration is for assessing the results.

-   **Training iteration**. This is the first iteration to ensure that Internet Explorer DLLS are loaded.

-   **Timing iterations**. These iterations serve as a basis for the metric values. The metric values are an average of these three iterations. By default, three full iterations of 60 seconds of streaming generate StreamingMediaAssessment.etl trace files that are used for calculating metrics. During these iterations only light logging is enabled to reduce the overhead of instrumentation on generated metrics. As a result, detailed diagnostic events are not collected in this trace file.

-   **Analysis iteration**. This iteration collects information while the assessment is running and serves as basis for issues generated by the assessments. This is a full iteration of 60 seconds of streaming. During this iteration verbose logging is enabled to collect detailed diagnostic information. The trace file that is generated in this iteration (StreamingMediaAssessmentDiagTrace.etl) is analyzed by the assessment to detect common media-related issues on the system.

Links to the trace files are available in the details pane in the UI. To see the values for individual iterations, in the Results View, right-click the results column header, and then choose **Show iterations**.

## <a href="" id="bkmk-streamingissues"></a>Issues


This assessment performs advanced issue analysis and provides links to Windows Performance Analyzer (WPA) to troubleshoot the issues that are identified. In most cases, you can choose the WPA in-depth analysis link to troubleshoot the issues that appear. When WPA opens, additional details about disk activity or CPU activity might be available depending on the type of issue identified. For more information about in-depth analysis issues and recommendations, see [Common In-Depth Analysis Issues](common-in-depth-analysis-issues.md).

When the assessment is started, it performs certain preliminary checks on the computer that ensure consistent results can be generated across different uses of the assessment. Various warning can appear in the assessment results if the warnings are not addressed before the assessment runs. After completing the Streaming media assessment, based on the automated analysis of the diagnostic trace file, the assessment generates issues for common media problems identified in the system. These issues can be analyzed in WPA. In addition to addressing the generated issues, additional manual analysis can be performed on the diagnostic trace file by using WPA and GPUView, a tool that is included in the Windows Performance Toolkit.

This section includes:

-   [Common Problems](#bkmk-streamingproblems)

-   [Pre-check Warnings](#bkmk-precheck)

-   [Analyzing Generated Issues](#bkmk-streaminganalyze)

-   [Correlating Glitches](#bkmk-streamingglitches)

-   [Software vs. Hardware Decoding](#bkmk-streamingsoftware)

-   [High GPU Utilization](#bkmk-streaminggpu)

-   [The assessment reports an exit code of 0x80050006](#exitcode)

### <a href="" id="bkmk-streamingproblems"></a>Common Problems

Some of the main causes for audio glitches include the following:

-   **Long running Interrupt Service Routines (ISR) and Deferred Procedure Calls (DPC)**

    An ISR is a device driver routine that the kernel’s interrupt dispatcher transfers control to when a device issues an interrupt. In Windows I/O model, ISRs run at a high device interrupt request level (IRQL), so that they perform as little work as possible to avoid blocking lower-level interrupts unnecessarily. An ISR usually queues a DPC, which runs at a lower IRQL, to execute the rest of interrupt processing. DPCs should not run longer than 100 microseconds and ISRs should not run longer than 25 microseconds. In addition to other system performance affects, long-running ISRs and DPCs may cause delays in the audio engine that result in audio glitches. An ISR or DPC running for durations greater than 1ms to 3ms can affect media performance on a system. Similar to long-running ISRs and DPCs, frequent ISRs and DPCs (an ISR/DPC storm) can have similar effects on performance. Usually such ISR and DPC problems are found in network, storage, and graphics drivers. The assessment generates a warning for long-running ISR/DPC between 1ms to 3ms and an error for durations greater than 3ms. For more information, see [Analyzing Generated Issues](#bkmk-streaminganalyze).

-   **Kernel worker thread running at dispatch level**

    In addition to DPCs some kernel worker threads might also be running at dispatch level (IRQL = 2). Similarly these can also cause delays that result in audio glitches. To detect such cases, look for low priority system threads that run non-stop for long durations without being preempted.

-   **Client side starvation**

    This is when the source cannot read from disk or network fast enough to keep up with real-time decoding and rendering. For example, the disk may be pegged by a hard page fault and as a result samples cannot be read from the disk in a faster than real-time manner.

The top causes of video glitches include the following:

1.  **Downstream bottleneck**: Source Starvation (disk is pegged)

2.  **Midstream bottleneck**: Decoder is maxed out (either software or hardware decoder is pegged)

3.  **Upstream bottleneck**: GPU is pegged or experiencing slow memory transfers

### <a href="" id="bkmk-precheck"></a>Pre-check Warnings

Before starting the assessment (streaming the video), the Streaming Media Performance assessment runs some pre-checks on the system. When these pre-checks fail, the assessment generates errors and warnings. While errors block the assessment from running, warnings are non-blocking and allow the assessment to continue. Some important pre-checks which affect the assessment results include the following:

-   **AC Power is required (Warning)**

    We recommend running the Streaming media performance assessment on a computer that uses AC power, because some devices on the computer can scale down while they are running on battery, affecting the assessment results.

-   **Running with VGA driver is not recommended (Warning)**

    Missing display drivers, such as the Microsoft basic display driver, can cause additional video glitches. To obtain accurate results, ensure that the correct display drivers are installed before you run the assessment. For additional details on drivers, run the [Driver Verification](driver-verification.md) assessment.

-   **Running without an active audio rendering device is not recommended (Warning)**

    If there are no audio rendering devices on the system, some of the assessment results related to audio might not be accurate. If you have audio devices, install drivers for them before you run the assessment. If there are no built-in speakers in the computer, connect a headphone or a speaker to the audio output port of the computer to resolve this warning.

-   **Remote session is not recommended (Warning)**

-   To obtain more accurate results, we recommend that the assessment is run locally on the computer (instead of using a remote desktop session).

-   **Multi-monitor (Warning)**

    To obtain more accurate results, we recommend running the assessment on a computer that has only a single monitor attached. Since the assessment starts Internet Explorer in kiosk mode (full screen), on a single monitor system, Internet Explorer is the only top-level window to be composited to the desktop. On a multi-monitor computer, there may be other top-level windows. This can influence the assessment results.

### <a href="" id="bkmk-streaminganalyze"></a>Analyzing Generated Issues

In most cases, you can choose the WPA in-depth analysis link to troubleshoot the issues that are generated. This opens the StreamingMediaAssessmentDiagTrace.etl in WPA with an appropriate profile for analyzing the issue. In WPA, you can expand the issue in **Issue Details and Areas of Investigation** to narrow down the problem. For more information about in-depth analysis issues and recommendations, see [Common In-Depth Analysis Issues](common-in-depth-analysis-issues.md).

### <a href="" id="bkmk-streamingglitches"></a>Correlating Glitches

After analyzing the issues generated by the assessment, additional analysis can be performed by opening the diagnostic trace in WPA, and then using the **Streaming Media Analysis** link. This starts WPA with a view which is appropriate for streaming media trace analysis.

The first table of interest is the **Activities** table which provides a hierarchical view of activities (or intervals) which occurred during the analysis iteration of the assessment. For example, the following intervals can be examined:

-   Streaming Media Assessment – root interval of the assessment, spanning the entire trace.

-   Streaming Media Assessment Iteration – an interval for every iteration of the assessment in the trace file; by default the diagnostic trace will contain only one iteration.

-   Workload – an interval for every workload video in the iteration. By default, only 1080p workload is present.

-   Media Engine Lifetime – the interval in which the workload video was streamed.

When you find an interval of interest in the trace, select the interval in WPA, and zoom into the selection to narrow down the analysis.

The glitch events that were logged can be viewed in the **Generic Events** table (the bottom most table in the WPA analysis tab). Select the **Glitch Events** preset in the Generic Events table to filter by the required glitch. Having more of these glitch events in the trace indicates a relatively bad streaming experience on the system. To analyze the reason for these glitches, try to correlate them with graphs of other summary tables in WPA. By correlating the glitch events with other summary tables, possible issues in the system can be identified.

### <a href="" id="bkmk-streamingsoftware"></a>Software vs. Hardware Decoding

Software or hardware decoding can be used for decoding the H.264 video which is streamed in this assessment. If the graphics card on the system does not support decoding of H.264 video, then software is used for decoding. With software, the decoding work is performed in the CPU instead of using the GPU. In this case, the CPU can be pegged. This makes it unable to keep up with the real-time decoding needs of the video stream, which results in glitches.

The ability to use hardware decoding can be determined by the DXVA2 modes supported by the graphics card. DXVA2 modes with DXVA2\_ModeH264\_VLD prefix (such as DXVA2\_ModeH264\_VLD\_FGT) indicate that the graphics card can support hardware decoding of H.264 video. The DXVA2 modes supported by the graphics card can be obtained from the JobResults XML file in the following XML element: /AxeJobResults/ MachineConfiguration/EcoSysInfo/Graphics/DXVA2Modes. The JobResults XML file location is displayed in the Result View details pane.

### <a href="" id="bkmk-streaminggpu"></a>High GPU Utilization

Video glitches can also be caused due to upstream bottleneck when the GPU is pegged. GPU utilization can be visualized by opening the Streaming media diagnostic trace in the GPUView tool. The GPUView tool can read logged video and kernel events from an event trace log (.etl) file and presents the data graphically. The GPUView tool is part of Windows Performance Toolkit and is available in the following location after installation: "%ProgramFiles(x86)%\\Windows Kits\\10\\Windows Performance Toolkit\\gpuview\\GPUView.exe". The streaming media diagnostic trace has a path similar to: "&lt;Job Results Directory&gt;\\000\_StreamingMedia\\StreamingMediaAssessmentDiagTrace.etl".

GPUView can be used to determine the performance of the graphics processing unit (GPU) and the central processing unit (CPU) with regard to direct memory access (DMA) buffer processing (and all other video processing) on the video hardware. Developers and testers can use GPUView to show different kinds of events that might lead to unusual conditions like glitches, preparation delays, and poor synchronization. For more information about how to use GPUView, see the documentation help file, GPUView.chm, that is installed with the tool.

### <a href="" id="exitcode"></a>The assessment reports an exit code of 0x80050006

This error occurs when maintenance tasks have been registered on the PC but have not completed before the assessment run. This prevents the assessment from running, as maintenance tasks often impact assessment metrics.

To resolve this issue, do one of the following:

1.  Ensure that the computer is connected to a network and is running on AC power. Manually initiate pending maintenance tasks with the following command from an elevated prompt:

    `rundll32.exe advapi32.dll,ProcessIdleTasks`

2.  Disable regular and idle maintenance tasks, and stop all maintenance tasks before running the assessment.

## Related topics


[Streaming Media Performance](streaming-media-performance.md)

[Windows Assessment Toolkit Technical Reference](windows-assessment-toolkit-technical-reference.md)

[Assessments](assessments.md)

[Common In-Depth Analysis Issues](common-in-depth-analysis-issues.md)

[Connected Standby Energy Efficiency](connected-standby-energy-efficiency.md)

 

 







