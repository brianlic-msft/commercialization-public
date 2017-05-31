---
title: Results for the Media Transcoding Performance assessment
description: Results for the Media Transcoding Performance assessment
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 576a152d-44a7-456f-b305-8bf71dd7ac06
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Results for the Media Transcoding Performance assessment


The Media Transcoding Performance assessment measures the process of changing a video file to a different format or bit rate. Media transcoding is used in several key scenarios in Windows, such as PlayTo and Camera Capture. Understanding a computer’s performance during the media transcoding process is key to improving the experience. The assessment results show you information about the transcoding duration and speed. This topic provides guidance for understanding the results of Media Transcoding performance assessment.

In this topic:

-   [Goals File](#bkmk-goals)

-   [Metrics](#results)

-   [Issues](#issues)

For more information about the system requirement and assessment settings for this assessment, see [Media Transcoding Performance](media-transcoding-performance.md)

## <a href="" id="bkmk-goals"></a>Goals File


You can create custom goals to measure your improvements in the Results View. Goals files are a triage tool that can help you understand how a PC is performing and to compare PCs in your business.

For example, goals for a basic laptop might be different than the goals you set for a high end desktop computer, or market expectations might change in such a way that you want the flexibility to define different goals and key requirements as time passes and technology improves.

When a metric value is compared to the goal for that metric, the status is color coded in the Result View as follows:

-   Light purple means that the system has a great user experience and that there are no perceived problems.

-   Medium purple means that the user experience is tolerable and you can optimize the system. Review the recommendations and analysis to see what improvements can be made to the system. These can be software changes, configuration changes or hardware changes.

-   Dark purple means that the system has a poor user experience and that there is significant room for improvements. Review the recommendations and analysis to see the improvements that can be made to the system. These can be software changes, configuration changes or hardware changes. You might have to consider making tradeoffs to deliver a high quality Windows experience.

-   No color means that there are no goals defined for the metric.

**Note**   In the Windows Assessment Toolkit for Windows 8, some assessments include default goals files. The first time you view results using this version of the tools, the default goals file is used. However, you can also define custom goals for Windows 8 the same way that you can for Windows 8.1 and Windows 10.

 

You can set the goals file location and add a goals file to that location before you can use the UI to apply the custom goals. Once a goals file is selected it will continue to be the goals file that is used for any results that are opened.

Only one goals file can be used at a time. Goals for all assessments are set in a single goals file. The assessment tools will search for goals in the following order:

1.  A custom goals file

2.  Goals that are defined in the results file

3.  Goals that are defined in the assessment manifest

You can use the sample goals file that is provided at %PROGRAMFILES%\\Windows Kits\\10\\Assessment and Deployment Kit\\Windows Assessment Toolkit\\SDK\\Samples\\Goals to create your own goals file.

**Note**  
You cannot package a goals file with a job, but you can store it on a share for others to use.

 

## <a href="" id="results"></a>Metrics


The results show information about transcoding duration and speed on the computer. The Media Transcoding Performance assessment reports two metrics that are tightly bounded: **Transcode Duration** and **Transcode Performance**.

The **Transcode Performance** metric measures the performance in terms of a factor of real-time. For example, the metric value of 1.0 means that transcoding was done in real-time; the metric value of 2.0 means that transcoding was done two times faster than real-time; the metric value of 0.5 means that transcoding was done two times slower than real time – for a 20 second input video, transcoding takes 40 seconds.Because the transcoding performance depends on input and output formats, and on the usage/non-usage of hardware accelerations, the assessment runs a number of tests for permutation of widely used input and output formats combinations as well as with hardware accelerated encoding and decoding turned on and off.

The goals for the **Transcode Performance** metrics are:

-   &gt;1.2 is green, which means that there are no perceived problems.

-   to 1.2 is yellow, which means that you can optimize the system.

-   &lt;1.0 is red, which means that improvements are needed.

If a metric value from a particular test is less than 1.0 this might be acceptable. The metrics are more for comparative purposes – it allows you to see which transcoding input-output combinations are handled by the pipeline in the real time and which are not.

These metric results can also be populated in the registry (see the Issue explanation – New Performance data is available) and then used by the media pipeline parts (MDE and Media Capture) to optimized their workflows.

The other metric reported by the assessment is **Transcode Duration** which measures the time it takes to complete a transcoding operation for a 20 seconds input clip. The metric is calculated for the same tests as **Transcode Performance**.

## Issues


The following issues and recommendations might appear based on the metrics captured during the Media Transcoding Performance assessment. You can choose the link under **More information** to follow recommendations for resolving the issue. The recommended use for this assessment is to compare the media transcoding performance of two or more computers.

### <a href="" id="trascode-issue-dxva"></a>Software decoding is faster than DXVA (default) decoding

This issue is determined during the first test which the assessment runs before the other input/output formats based permutation tests. The situation when the software decoding is faster than hardware accelerated is possible when the system CPU resources are more powerful than the capabilities of system graphics resources. This is usually true for high-end systems with powerful multi-core CPUs or when the video card supports only low DXVA profiles. Resolving this issue can significantly improve the transcoding performance.

To resolve this issue, choose the issue resolution link under More Information in the details pane. This adds a specific key to the registry. The transcoding pipeline checks for the key in the registry, and if it is present, DXVA is not used in the transcode operations.

The presence of this registry key also prevents the Transcoding Performance assessment from running this DXVA/non-DXVA tests again.Note, that this registry key is only used by the transcoding pipeline. The usual playback pipeline remains untouched and DXVA decoding is used if DXVA features are available.

### <a href="" id="trascode-issue-perf"></a>New performance data is available

This issue is present in the assessment results after each run. Having this issue provides a way for you to populate performance data in the registry or to clear performance data from the registry.

You have two options to resolve this issue:

1.  Choose the PerfResults.reg link. This populates the performance data in the registry and gives the Media Pipeline a way to improve transcoding performance.

2.  Choose the ClearPerfResults.reg link. This removes all transcode performance data from the registry including data from the DXVA/non-DXVA test.

Because choosing option 1 populates the data in the registry and the data is used by the PlayTo pipeline and the Capture Scenario, this changes the user experience. Option 2 allows you to roll-back the changes and come back to the original experience for the PlayTo and Capture scenarios.

### <a href="" id="trascode-issue-errors"></a>Some tests have finished with error

This issue is reported if some of the tests failed while the assessment was running. Most often, the reason a test fails is either because third party software prevents the pipeline from operating correctly, or the video driver has issues. The list of the failed tests is presented in the issue description, in the details pane.

To resolve this issue, the general recommendation is to ensure that the most up-to-date video drivers are installed on the system.

### <a href="" id="trascode-issue-missing"></a>Important metrics are missed

This issue is reported when the tests run correctly and no transcoding test failures were detected, but the post process script was unable to get metrics from the test run. This issue should not appear in the normal flow of the assessment. This issue points to a problems with WPR (Windows Performance Recorder).

To resolve this issue, the general recommendation is to ensure that WPR can run on the system correctly, the ADK is properly installed and that none of the features of the ADK were manually removed from the system. It is also important to have the latest video driver installed.

### <a href="" id="trascode-issue-analysis"></a>Metric results analysis

The assessment consists of the number of tests. The metrics are collected on a per-test run basis and should be treated on the per-test basis as well.

The test name tells user about the following:

1.  Input media format

2.  Input video resolution

3.  Output media format

4.  Output video resolution

5.  If the test was run on AC or battery power (AC is by default)

6.  If the DXVA or non-DXVA decode path was used

7.  If hardware or software encoder was used

Here is the typical test name: **“VC1 1080 to H.264 720 Plugged in DXVA On Hardware Encoder”**. The test name includes the input video format – VC-1, and the resolution – 1080p. The output format was H.264 and the output resolution was 720p. The test was run on AC power (Plugged in), with DXVA turned on, and with Hardware Encoder. The test results are grouped by metrics.

As a general rule a modern systems must be able to complete real-time transcoding for formats up to 720p in real time. As a general rule the performance must be higher for the lower resolution input and output than for the higher resolution.If the issue **Software encoding is faster than DXVA** is reported, then DXVA-off tests should show better performance.

We strongly recommended that you follow the recommendations for the **New Performance data is available** issue and populate the performance data to the registry. This allows PlayTo scenarios and Capture scenarios to pick up the best resolutions based on the input resolution and performance data in the registry, and ensures better quality playback.

As mentioned before, during the tests the ETL traces are collected. The links to the ETL trace files for each test can be found on the Assessment Results page. When you choose a link, WPA (Windows Performance Analyzer) opens so that you can analyze the transcode session in depth.

### The assessment reports an exit code of 0x80050006

This error occurs when maintenance tasks have been registered on the PC but have not completed before the assessment run. This prevents the assessment from running, as maintenance tasks often impact assessment metrics.

To resolve this issue, do one of the following:

1.  Ensure that the computer is connected to a network and is running on AC power. Manually initiate pending maintenance tasks with the following command from an elevated prompt:

    `rundll32.exe advapi32.dll,ProcessIdleTasks`

2.  Disable regular and idle maintenance tasks, and stop all maintenance tasks before running the assessment.

## Related topics


[Media Transcoding Performance](media-transcoding-performance.md)

[Windows Assessment Toolkit](index.md)

[Assessments](assessments.md)

 

 







