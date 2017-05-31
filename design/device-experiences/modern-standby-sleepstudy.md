---
title: Modern standby SleepStudy
description: The SleepStudy tool provides overview information about each modern standby session.
MS-HAID:
- 'cstandby.connected\_standby\_sleepstudy'
- 'p\_weg\_hardware.modern\_standby\_sleepstudy'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
Search.SourceType: Video
ms.assetid: DF846A45-BD05-4486-BC91-0340C648F4AA
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Modern standby SleepStudy


Starting with Windows 8.1, a software tool, SleepStudy, became available as an inbox component in all Windows PCs that implement the modern standby power model. SleepStudy can measure modern standby performance with minimal impact.

<iframe src="https://hubs-video.ssl.catalog.video.msn.com/embed/b9dccad1-575e-49cb-95c7-d883629e2cf8/IA?csid=ux-en-us&MsnPlayerLeadsWith=html&PlaybackMode=Inline&MsnPlayerDisplayShareBar=false&MsnPlayerDisplayInfoButton=false&iframe=true&QualityOverride=HD" width="720" height="405" allowFullScreen="true" frameBorder="0" scrolling="no">A video describing how to use SleepStudy to find and fix components that cause unexpected battery drain.</iframe>

Watch this video to learn how to use SleepStudy to find and fix components that cause unexpected battery drain.

Tracking system activity and battery drain during modern standby can be difficult because the tracking itself can cause unnecessary activity and battery drain. For example, traditional disk-based logging has the unwanted side effect of causing excessive battery usage when the disk is activated for logging. In contrast, the SleepStudy tool is designed to avoid generating activity that could interfere with the modern standby performance that it measures.

The most detailed way to measure power consumption during modern standby is to use an instrumented system, which is a physical system that has power measurement leads connected to every major hardware subsystem of interest. However, testing to this level of detail is not practical in many cases because of engineering cost, and systems that have already been sold to customers typically cannot be tested in this way.

The SleepStudy tool provides overview information about each modern standby session. This information includes the active time, the idle time, and the power consumed. A session starts when the system enters the modern standby state, and ends when it exits this state.

SleepStudy also provides first-level information about the causes of activities that occur during each modern standby session. This feature allows for easy investigation of long-running activities.

## Running SleepStudy


The SleepStudy tool runs from a Command Prompt window and is simple to use. SleepStudy outputs an easy-to-read HTML report.

To run SleepStudy, open a Command Prompt window as Administrator and enter the following command:

```
powercfg.exe /SleepStudy
```

In response to this command, the built-in powercfg.exe command-line tool creates an HTML file named Sleepstudy-report.html in the current working directory.

## Advanced Options


By default, the SleepStudy report covers the last three days of system operation. To change the duration covered by the SleepStudy report, use the powercfg.exe tool's /duration option. With this option, you specify an additional parameter, which is the number of days (up to 28) that the SleepStudy report covers.

For example, to generate a SleepStudy report for the last seven days of system operation, open a Command Prompt window as Administrator and enter the following command:

```cmd
powercfg /sleepstudy /duration 7
```

For more information about powercfg.exe, see [Powercfg command-line options](powercfg-command-line-options.md).

## SleepStudy Reports supporting TShell


You can also generate SleepStudy reports on mobile images that support TShell: connect to TShell, navigate to writeable directory in data partition (eg. 'cd c:\\data\\')

1.  Run the following command:

    ```cmd
    powercfg /sleepstudy /xml
    ```

2.  Copy **sleepstudy-report.xml** that is generated in the local directory to the host machine.

3.  Run the following command:

    ```cmd
    powercfg /sleepstudy /transformxml <path to sleepstudy-report.xml>
    ```

Sleep study traces are automatically generated on mobile for screen off sessions longer than 10 minutes and are maintained for the last 7 days. The reports contain the last 3 days, by default, but can be extended with the '/duration' flag.

## In this section


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Topic</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>[Modern standby SleepStudy report](modern-standby-sleepstudy-report.md)</p></td>
<td><p>Describes the contents of a modern standby SleepStudy report.</p></td>
</tr>
<tr class="even">
<td><p>[Modern standby SleepStudy common problem examples](modern-standby-sleepstudy-common-problem-examples.md)</p></td>
<td><p>Describes how to use the modern standby SleepStudy report to investigate problems such as high email or network activity, high battery drain, and inability to enter DRIPS.</p></td>
</tr>
<tr class="odd">
<td><p>[Modern standby SleepStudy battery information](modern-standby-sleepstudy-battery-information.md)</p></td>
<td><p>Outlines what type of battery information is included in the modern standby SleepStudy report.</p></td>
</tr>
</tbody>
</table>

 

 

 






