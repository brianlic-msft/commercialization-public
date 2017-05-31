---
title: What's New in the Windows Performance Toolkit
description: What's New in the Windows Performance Toolkit
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 3e27707c-fcba-4052-8cd9-bd04760b7439
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# What's New in the Windows Performance Toolkit


Windows Performance Analyzer (WPA) visualizes traces from Windows Performance Recorder and Windows Assessment Console as graphs and tables to allow you to analyze system and application performance. WPA offers the following new features:

-   Analysis Assistant pane that displays helpful content to help you determine how to best use a given graph, preset, or analysis tab. Rich text support for the Analysis Assistant that lets you format your text to make it easier to read and parse, as well as add links to reference materials, videos, or more detailed help pages on the web.

-   [List of WPA Graphs](list-of-wpa-graphs.md) for your reference

-   New version of the [File menu](introduction-to-the-wpa-user-interface.md) (called Rich Menu) with the option to switch back to the Classic Menu

-   Point in time [rectangle viewer](how-to-use-the-rectangle-viewer.md) that allows you to visualize what happened on the screen during your trace

-   [Regions of Interest](regions-of-interest.md) that allow you to highlight important time ranges in a trace

-   [Stack tags](stack-tags.md) for creating labels that help you better identify which parts of the call stack(s) are affected

-   Support for multiple traces in a single session

-   Support for recovering a profile

Windows Performance Recorder (WPR) is a performance tool that you can use to record system events that you can then analyze by using WPA. WPR offers the following new feature:

-   After recording a trace, you can now immediately open it in WPA by choosing the **Open in WPA** button.

-   Direct handling of CLR symbols, so no flags are necessary when configuring and using [NGEN support](using-clr-40-ngen-pdb-support.md)

The Kernel Trace Control API Reference covers the Kernel Trace Control API available in previous versions of WPA. This API is an extension of the ETA Event Tracing API and is supported for backward compatibility with existing scripts and profiles. However, it is obsolete, and new profiles should be created using the current version. No public API is available for the current version of WPA. This API enables capturing kernel stack traces, merging multiple trace files for analysis, and including system information in the merged files. From time to time, functions are added or updated. This reference document adds the following new functions:

-   [StartHeapTrace](startheaptrace.md)

-   [UpdateHeapTrace](updateheaptrace.md)

## Related topics


[Windows Performance Toolkit Technical Reference](windows-performance-toolkit-technical-reference.md)

 

 







