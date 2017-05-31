---
title: WPR Quick Start
description: WPR Quick Start
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: bb93222f-a938-45a9-8fd7-0a1eb254537c
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WPR Quick Start


This article summarizes the features that are available in the Windows Performance Recorder (WPR) user interface (UI).

**Note**  
You can also run WPR from the command-line; for information about that option, see [WPR Command-Line Options](http://go.microsoft.com/fwlink/p/?linkid=223233).

 

**In this article:**

-   [Recording by using the WPR Default Settings](#default)

-   [Using Recording Profiles](#profiles)

-   [Using Performance Scenarios](#perf)

-   [Using Detail Levels](#detail)

-   [Using Logging Mode](#logmode)

## <a href="" id="default"></a>Recording by using the WPR Default Settings


On the **Start** screen, click **Windows Performance Recorder** to open the WPR UI. In WPR, click **Start** to record system performance by using the default settings from the **General** profile.

For more information about this feature, see [Start a Recording](http://go.microsoft.com/fwlink/?LinkId=249060) and [Recording for Basic System Diagnosis](http://go.microsoft.com/fwlink/?LinkId=249061).

## <a href="" id="profiles"></a>Using Recording Profiles


WPR recording profiles contain all the information that is necessary to enable performance recording for a specific scenario. You can include multiple profiles in a single recording.

For general information about WPR profiles, see [Recording Profiles](http://go.microsoft.com/fwlink/?LinkId=249062).

WPR provides a wide selection of built-in recording profiles that are sorted into groups by function. For more information about WPR built-in profiles, see [Built-in Recording Profiles](http://go.microsoft.com/fwlink/?LinkId=249063) and [Select Built-in Profiles](http://go.microsoft.com/fwlink/?LinkId=249064).

You can also author and add custom profiles (.wprp files) to record sets of events. For more information about custom profiles, see [Authoring Recording Profiles](http://go.microsoft.com/fwlink/p/?linkid=223238) and [Add or Remove a Custom Recording Profile](http://go.microsoft.com/fwlink/?LinkId=249068).

## <a href="" id="perf"></a>Using Performance Scenarios


You can use performance scenarios to record common scenarios such as on/off transitions or heap analysis. You can select only one scenario for a recording. For more information about performance scenarios, see [WPR Scenarios](http://go.microsoft.com/fwlink/p/?linkid=223244) and [Change the Performance Scenario](http://go.microsoft.com/fwlink/?LinkId=249066).

## <a href="" id="detail"></a>Using detail levels


You can select a detail level for each recording. The available levels are **Light** and **Verbose**. The **Light** detail level is used primarily for timing recordings. The **Verbose** detail level provides the detailed information that you need for analysis. For more information about detail levels, see [Detail Level](http://go.microsoft.com/fwlink/?LinkId=249070) and [Change the Detail Level](http://go.microsoft.com/fwlink/?LinkId=249069).

## <a href="" id="logmode"></a>Selecting a logging mode


WPR can log events either to a sequential file or to circular buffers in memory. Logging to a file is used for short traces, when you know when to expect the events that you want to trace. Logging to memory is used for continuous tracing, when you want to log events that can occur at any time. General scenarios can use both types of logging. However, on/off transitions can only use file logging.

For more information about logging modes, see [Logging Mode](http://go.microsoft.com/fwlink/?LinkId=249071) and [Change the Logging Mode](http://go.microsoft.com/fwlink/?LinkId=249072).

## Related topics


[Introduction to WPR](introduction-to-wpr.md)

[WPR Features](http://go.microsoft.com/fwlink/p/?linkid=223236)

[WPR How-to Topics](http://go.microsoft.com/fwlink/p/?linkid=223237)

[WPR Reference](http://go.microsoft.com/fwlink/p/?linkid=223245)

 

 







