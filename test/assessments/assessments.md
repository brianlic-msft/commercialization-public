---
title: Assessments
description: Assessments
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 23640a08-1459-4676-a522-daf8bbc49c7d
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Assessments


Assessments are a combination of .xml and binary files that induce a specific set of states on a computer, measure and record the activity, and preserve the recorded results. The results provide metrics and sometimes recommendations for resolving issues that the assessments found. Assessments help you assess hardware or software that has been added to a computer.

Assessments and the Windows Assessment Console are available as part of the Windows Assessment Toolkit that's available in the Windows Assessment and Deployment Kit (Windows ADK). After you install the Windows Assessment Toolkit, you can use the Windows Assessment Console to create and run a job that includes one or more assessments. You can also package jobs to run them on computers that don't have the Windows Assessment Toolkit installed.

Assessments are also available when you install Windows Assessment Services and the Windows Assessment Services - Client (Windows ASC).

This diagram shows the general workflow for an assessment:

![workflow graphic for assessments](images/dep-win8-adk-assessmentoverviewflowchart.jpg)

## In This Section


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[Connected Standby energy efficiency](connected-standby-energy-efficiency.md)</p></td>
<td><p>This assessment measures the impact of software and devices on the battery life of a system while it is in Connected Standby. The assessment also measures the time spent transitioning into and out of Connected Standby.</p></td>
</tr>
<tr class="even">
<td><p>[Driver Verification](driver-verification.md)</p></td>
<td><p>This assessment verifies that an offline Windows image or a running Windows operating system contains the correct set of drivers.</p></td>
</tr>
<tr class="odd">
<td><p>[Edge Security Software Impact](edge-security-software-impact.md)</p></td>
<td><p>This assessment measures aspects of Microsoft Edge that are typically impacted by antimalware. The assessment measures the impact on the launch and navigate times of Microsoft Edge.</p></td>
</tr>
<tr class="even">
<td><p>[File Handling](file-handling.md)</p></td>
<td><p>This assessment simulates file operations like copying, moving, compressing, uncompressing, and deleting files. It also measures duration and throughput to help you evaluate the computer's performance.</p></td>
</tr>
<tr class="odd">
<td><p>[Internet Explorer Startup Performance](internet-explorer-startup-performance.md)</p></td>
<td><p>This assessment measures the time to fully render a blank page in Internet Explorer. This measurement includes the load time of the IExplore.exe process and the frame-creation and tab-creation intervals. It also measures the effect of all extensions, add-ins, and toolbars that are installed on the system. It doesn't measure any network or browsing performance.</p></td>
</tr>
<tr class="even">
<td><p>[Internet Explorer Security Software Impact](internet-explorer-security-software-impact.md)</p></td>
<td><p>This assessment measures aspects of Internet Explorer that are typically impacted by antimalware and other browser add-ins.</p></td>
</tr>
<tr class="odd">
<td><p>[Local Video Playback](local-video-playback.md)</p></td>
<td><p>This assessment measures the usage rate of a computer’s battery during full-screen local video playback.</p></td>
</tr>
<tr class="even">
<td><p>[Media Transcoding Performance](media-transcoding-performance.md)</p></td>
<td><p>This assessment measures the transcode duration and relative speed of changing a video file to a different format or bit rate.</p></td>
</tr>
<tr class="odd">
<td><p>[Memory Footprint](memory-footprint.md)</p></td>
<td><p>This assessment creates a snapshot of memory use during a series of system boots. It then helps you identify ways to improve performance and efficiency by optimizing memory use. You can also use this assessment to compare a baseline operating system image against an Original Equipment Manufacturer (OEM) image.</p></td>
</tr>
<tr class="even">
<td><p>[Minifilter Diagnostics](minifilter-diagnostics.md)</p></td>
<td><p>Describes the minifilter diagnostic setting that's available in several assessments. You can use the minifilter diagnostic setting to measure the time that the computer spends in minifilter operations and identify minifilter drivers that are inefficient, using too much memory, or not working.</p></td>
</tr>
<tr class="odd">
<td><p>[On/Off Transition Performance](onoff-transition-performance.md)</p></td>
<td><p>Describes the system requirements, assessment settings, results, and issues that are associated with the Boot Performance (Fast Startup), Hibernate Performance, and Standby Performance assessments. These assessments measures the transition from various computer states.</p></td>
</tr>
<tr class="even">
<td><p>[Out of Box Experience](out-of-box-experience.md)</p></td>
<td><p>This assessment measures the duration of key aspects of the first startup experience (OOBE) that are typically impacted by image customizations and software add-ons applied to the Windows retail image. The assessment measures the duration of First Logon as well as specific aspects such as Active Setup and Provisioned App Install.</p></td>
</tr>
<tr class="odd">
<td><p>[Streaming Media Performance](streaming-media-performance.md)</p></td>
<td><p>This assessment streams media in Internet Explorer by using video content that ranges from low resolution to high resolution. It then evaluates video playback quality based on the number of glitches that it detects.</p></td>
</tr>
<tr class="even">
<td><p>[Windows Media Player Performance and Quality](windows-media-player-performance-and-quality.md)</p></td>
<td><p>This assessment evaluates the performance and quality of Windows Media® Player playback and is used in a set of multimedia battery-life assessments.</p></td>
</tr>
<tr class="odd">
<td><p>[Windows Store App Performance](windows-store-app-performance.md)</p></td>
<td><p>This assessment can help you optimize your app for a better customer experience.</p></td>
</tr>
<tr class="even">
<td><p>[Common In-Depth Analysis Issues](common-in-depth-analysis-issues.md)</p></td>
<td><p>Describes common in-depth analysis issues that you can view in the Windows Assessment Console and further analyze in Windows® Performance Analyzer (WPA).</p></td>
</tr>
<tr class="odd">
<td><p>[Troubleshooting Assessments](troubleshooting-assessments-wac.md)</p></td>
<td><p>Describes common problems that cause assessments to fail.</p></td>
</tr>
</tbody>
</table>

 

 

 






