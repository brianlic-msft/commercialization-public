---
title: Exercise 2 - Manually Collect ETW Logs for Media Scenarios Using WPR
description: Automated tests are great for verifying the audio or temporal video quality of a device for a specific automated scenario; however, if an audio or video glitch occurs during a manual test, then the Windows Performance Recorder (WPR) tool can be used to manually collect an Event Tracing for Windows (ETW) trace during a repro of the problem.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 89203B18-8C1F-40ED-9DF5-B68F2995BFD9
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Exercise 2 - Manually Collect ETW Logs for Media Scenarios Using WPR


Automated tests are great for verifying the audio or temporal video quality of a device for a specific automated scenario; however, if an audio or video glitch occurs during a manual test, then the **Windows Performance Recorder (WPR)** tool can be used to manually collect an Event Tracing for Windows (ETW) trace during a repro of the problem.

## Step 1: Collect an ETW trace using WPR


1.  Right-click on the **Start** menu and click on **Command Prompt (Admin)**.

2.  Navigate to the folder where you have **WPR** installed.

3.  Run the following command:

    ``` syntax
    wpr -cancel
    ```

4.  Run the following command:

    ``` syntax
    wpr -start Media.wprp -filemode
    ```

5.  Run a workload such as video playback or a real time communications scenario.

6.  Run the following command:

    ``` syntax
    wpr -stop Media.etl
    ```

## Step 2: Visualize the ETW trace in MXA


1.  Install the **Media eXperience Analyzer (MXA)** which can be downloaded [here](https://go.microsoft.com/fwlink/?linkid=525711).

2.  Right-click on the **Start** menu and click on **Command Prompt (Admin)**.

3.  Navigate to the folder where you installed **MXA**.

4.  Run the following command:

    ``` syntax
    xa -i <Media.etl location>\Media.etl
    ```

    For example, if Media.etl were located at C:\\Performance\\Media, you would type the following command:

    ``` syntax
    xa -i C:\Performance\Media\Media.etl
    ```

5.  Press the **Turn Symbols Off** button to turn off symbol lookup.

6.  Explore the various media related datasets and providers enabled in the trace.

 

 






