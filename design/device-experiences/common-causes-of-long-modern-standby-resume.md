---
title: Common causes of long modern standby resume
description: Examines the common causes of long modern standby resumption times.
MS-HAID:
- 'cstandby.common\_causes\_of\_long\_connected\_standby\_resume'
- 'p\_weg\_hardware.common\_causes\_of\_long\_modern\_standby\_resume'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 8EA57D61-9F40-4CB9-AE97-0E379484B984
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Common causes of long modern standby resume


Some common problems might cause long latencies during resume from modern standby. The most likely causes of such latencies are turning on the display and re-enabling network connections.

The Windows Performance Analyzer (WPA) is used to obtain the graphs that are discussed in this article. For more information, see [Using Windows Performance Analyzer to analyze modern standby issues](using-windows-performance-analyzer-to-analyze-modern-standby-issues.md) and [Modern standby resume performance](modern-standby-resume-performance.md).

### Display issues

From the time that the system completes the PDC phases to the end of modern standby exit, a variety of processes can cause delays. The foremost cause of delays is turning on the display. The request to turn on the display is sent at the end of the PDC phases while exiting modern standby.

To determine the time required to turn the display on, review the **Connected Sessions Check** event in the **PDC Notification Phase** graph. This event indicates the initial request to turn on the monitor. Look at the **Exit Time**, which is the time stamp when the notification to turn on the display is sent.

Next, review the **Generic Events** graph for the provider named **Microsoft-Windows-Kernel-Power**. The **DisplaySessionStatus** event located in the **Task Name** column indicates when the kernel received notification that the monitor finished turning on.

Take the difference of these two event times, and the result is the time that is required to turn on the display.

If this value is greater than expected, contact the system graphics device vendor.

### Network connectivity issues

Re-enabling network connectivity is a major cause of long modern standby resume latency. The time required to finish the resiliency phase (so that the next PDC phase can start) depends on how quickly the D0 IRP for the required network device can be completed. A D0 IRP is an IRP\_MJ\_POWER IRP that specifies a DEVICE\_POWER\_STATE enumeration value of PowerDeviceD0. If a Wi-Fi connection is available, the system will wait for the Wi-Fi device only, regardless of whether a mobile broadband (MBB) connection is available. Otherwise, the system will wait for the MBB device to complete the D0 IRP. If no network device is available, the system does not wait for these devices before proceeding to the next phase. As a result, the time spent in the resiliency phase often reflects the time that is needed to complete the D0 IRP for the network device. To find the time taken to complete the D0 IRP, pull up the Device Dstate graph under Power. Zoom into the section for Connected Standby Exit. Look for devices that are changing D-states (device power states) during this time. Find the column labeled D-Irp Duration (ms). (Look for this exact column name—there are other columns with similar names.) This number indicates how long it took to complete the IRP for the D-state transition. For a system that has Wi-Fi enabled, look for the Wi-Fi device.

TWith mobile broadband, the system takes about twice as long to resume from modern standby.

If mobile broadband is enabled on the system, try removing the SIM card and retrying the modern standby exit test. The Windows HCK test only checks that Wi-Fi is connected.

If the latency of any network device seems long, contact the Wi-Fi or mobile broadband device vendor for the system.

 

 






