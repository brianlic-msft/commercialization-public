---
title: Memory Footprint Optimization
description: The amount of memory available on a system significantly impacts the user experience.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 8ECD1B28-D98A-406D-8920-BC205D3A1729
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Memory Footprint Optimization


The amount of memory available on a system significantly impacts the user experience. The impact affects areas ranging from the overall responsiveness of the system to battery life. Available memory is an important factor to consider when evaluating the complete experience on a low memory device where Windows relies heavily on paging and swapping of content from memory.

This guide walks you through the process of analyzing memory-related performance issues and identifying the root cause, whether it’s a driver or a user mode process, using the **Windows Performance Toolkit**. Topics include:

-   Driver and application footprint

-   Working Sets and Resident Sets

-   Pool memory allocations

-   Heap and VirtualAlloc memory allocations

## Goals


This guide will show you how to perform the following tasks:

-   Use **Windows Performance Recorder (WPR)** to gather traces of memory-related issues.

-   Use the Assessment and Deployment Kit (ADK) Memory Footprint assessment to gather a memory usage baseline.

-   Analyze paged/non-paged pool memory usage by drivers.

-   Analyze working sets and resident sets of processes.

-   Understand how and when memory is dynamically allocated by drivers and processes.

## Tools


In the past, a kernel debugger along with a large number of cryptic commands had to be used to discover what data and file pages currently occupy physical memory. Now, you can use the **Windows Performance Toolkit (WPT)** to collect and display this information in a more understandable and actionable manner through built-in Windows instrumentation.

**WPT** consists of the **Windows Performance Analyzer (WPA)** and the **Windows Performance Recorder (WPR)**.

The Windows Assessment Toolkit in the ADK can also be used to obtain a memory footprint assessment. This assessment creates a snapshot of memory use during a series of system reboots and immediately after the desktop is visible. It does not evaluate memory use during ordinary computer operations.

The ADK **Windows Assessment Console (WAC)** is the tool used to run assessments and generate visual performance reports.

## Terminology


| Term                            | Definition                                                                                                                                                                                                                             |
|---------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Sharable pages**              | Pages that one or more processes can use. Examples include code pages within executable images (.dll, .exe, and .cpl) or data file pages (.txt, .doc, etc.).                                                                           |
| **Private pages**               | Pages used exclusively by a single process and most commonly contain dynamically allocated data such as Heap or VirtualAlloc.                                                                                                          |
| **Process Working Set**         | Set of pages recently referenced by a process and contains both private and shared pages.                                                                                                                                              |
| **Process Private Working Set** | Set of private non-sharable pages recently referenced by a process.                                                                                                                                                                    |
| **Available**                   | Amount of memory immediately available for use by processes on the system. This metric is composed of pages on the Standby list that do not need to be written to persistent storage before they can be repurposed by other processes. |

 

## Exercises


This guide consists of the following exercises.

-   [Exercise 1 - Identify Processes with Large Working Sets](memory-footprint-optimization-exercise-1.md)

-   [Exercise 2 - Track User Mode Process Allocations](memory-footprint-optimization-exercise-2.md)

-   [Exercise 3 - Track Driver Footprint and Dynamic Allocations During Boot](memory-footprint-optimization-exercise-3.md)

 

 






