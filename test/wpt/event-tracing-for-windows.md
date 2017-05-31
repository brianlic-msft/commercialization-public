---
title: Event Tracing for Windows
description: Event Tracing for Windows
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 5130d144-de4d-4b6e-bfe9-e17aaddff7d0
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Event Tracing for Windows


The Event Tracing for Windows (ETW) infrastructure provides the foundation for Windows Performance Toolkit. These tools provide a set of programs that hide the complexity of working directly with the ETW application programming interfaces (APIs).

This article provides a high-level introduction to ETW. For more information about ETW, see [Event Tracing](http://go.microsoft.com/fwlink/p/?linkid=213103).

ETW enables the consistent, straightforward capture of kernel and application events. You can enable or disable event capture at any time without restarting the system or process. Windows Performance Analyzer (WPA) presents the information that ETW collects in an easy-to-understand set of graphs and tables.

You can capture and present selected events to non-invasively identify and diagnose system and application performance issues. You can enable or disable event tracing dynamically. Windows Performance Recorder (WPR) uses ETW to gather and organize critical system information. WPR acts as the session controller, starting and stopping the session and selecting which ETW events to record.

WPA consumes the event trace log (ETL) file that all event providers produce in an ETW session. Kernel and application events can provide extensive details about the operation of the system. Almost every kernel event that affects overall system performance is defined and available to WPA.

## Related topics


[Windows Performance Toolkit](index.md)

 

 







