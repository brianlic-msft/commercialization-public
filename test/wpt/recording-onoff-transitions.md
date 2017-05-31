---
title: Recording On/Off Transitions
description: Recording On/Off Transitions
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 4fdf35b1-cbe9-4711-a0ac-a2241581425f
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Recording On/Off Transitions


Windows Performance Recorder (WPR) includes built-in profiles for on/off transitions. You can record the following types of boot transition:

-   **On/Off - Boot**: Records performance while booting the computer.

-   **On/Off - FastStartup**: Records performance during a Windows 8 Windows 8’s fast startup operation.

-   **On/Off - Shutdown**: Records performance while shutting the computer down.

-   **On/Off - RebootCycle**: Records performance during the entire cycle while rebooting.

-   **On/Off - Standby/Resume**: Records performance when the computer is placed on standby, and then resumed.

-   **On/Off - Hibernate/Resume**: Records performance when the computer is placed in hibernation, and then resumed.

By default, these profiles reboot the computer three times.

*On/off* transitions are always logged to a file.

## Related topics


[WPR Common Scenarios](windows-performance-recorder-common-scenarios.md)

[Windows On/Off Transition Performance Analysis](http://go.microsoft.com/fwlink/p/?linkid=247578)

[Windows On/Off Transitions Solutions Guide](http://go.microsoft.com/fwlink/p/?linkid=247577)

[Results for the On/Off Assessments](../assessments/results-for-the-onoff-assessments.md)

[On/Off Transition Performance](../assessments/onoff-transition-performance.md)

 

 







