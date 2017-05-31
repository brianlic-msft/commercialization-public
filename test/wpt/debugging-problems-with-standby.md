---
title: Debugging Power Problems with Standby
description: After you have developed your Modern Standby system using the proper power management guidance, you have to test and validate that the power floor is optimized to deliver great battery life in standby.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 5A43DECA-DF16-4CE2-BE21-4077D362C8D7
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Debugging Power Problems with Standby


After you have developed your Modern Standby system using the proper power management guidance, you have to test and validate that the power floor is optimized to deliver great battery life in standby. You might need to break down the system to isolate a power offender.

This lab provides a deeper dive on useful tools like **SleepStudy** and **WPA**, and will guide you through various case studies that illustrate commonly encountered problems. Topics include:

-   Impact of USB devices

-   Firmware problems and missing constraints

-   Driver issues

-   Identifying spurious wake sources

## Goals


This guide will show you how to perform the following tasks:

-   Interpret data from **SleepStudy** reports and **WPA DRIPS** plugins

-   Identify common issues that can impact the power floor

## Terminology


-   **Deepest runtime idle platform state (DRIPS)**: The system is said to be in **DRIPS** when the system is consuming the lowest amount of power possible, limited by the system’s power floor. When the screen is turned off, the Modern Standby session starts and the system goes through multiple phases to move into a low-power state. When the system is in the lowest-power state, the system is in **DRIPS**. The system is not in **DRIPS** when it is performing tasks like receiving emails, updating live tiles with fresh content, receiving VoIP calls, or any other background task that requires system resources. The more time the system spends in **DRIPS** before the screen is turned back on, the longer the battery life.

    ``` syntax
    Total standby session time = DRIPS time + non-DRIPS time
    ```

-   **Activators**: Software components that are allowed to perform work in the background while in Modern Standby.

## Tools


The **Windows Performance Toolkit** consists of two independent tools: **Windows Performance Recorder (WPR)** and **Windows Performance Analyzer (WPA)**. **WPR** is a powerful recording tool that creates Event Tracing for Windows (ETW) recordings. You can run **WPR** from the user interface (UI) or from the command line (CL). **WPR** provides built-in profiles that you can use to select the events you want to record. **WPA** is a powerful analysis tool that combines a flexible UI with extensive graphing capabilities and data tables that can be pivoted and have full text search capabilities.

**SleepStudy** is a Windows diagnostics tool that supports Modern Standby (connected or disconnected). It monitors a Modern Standby PC’s behavior and provides actionable diagnostics on Modern Standby battery life. It’s available only on Modern Standby capable PCs. **SleepStudy** generates a summary of top issues that cause poor Modern Standby battery life.

To obtain a **SleepStudy** report, type the following command into an Administrator Command Prompt:

``` syntax
powercfg.exe /SleepStudy
```

The built-in **powercfg.exe** utility will create an HTML file named sleepstudy-report.html in the current working directory.

**Note**  
All the exercises in this guide use pre-generated **SleepStudy** reports, so you won't need to generate any **SleepStudy** reports for this guide.

 

## Exercises


This guide consists of the following exercises.

-   [Exercise 1 - Identify Problems with Spurious Wakes](debugging-problems-with-standby-exercise-1.md)

-   [Exercise 2 - Identify Problems with Missing Drivers](debugging-problems-with-standby-exercise-2.md)

-   [Exercise 3 - Identify Problems with Missing Constraints](debugging-problems-with-standby-exercise-3.md)

-   [Exercise 4 - Identify Problems with USB Devices](debugging-problems-with-standby-exercise-4.md)

 

 






