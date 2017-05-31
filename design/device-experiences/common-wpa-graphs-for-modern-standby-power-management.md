---
title: Common WPA graphs for modern standby power management
description: Describes the two common WPA graphs (Platform Idle State and DRIPS) for modern standby power management.
MS-HAID:
- 'cstandby.common\_wpa\_graphs\_for\_connected\_standby\_power\_management'
- 'p\_weg\_hardware.common\_wpa\_graphs\_for\_modern\_standby\_power\_management'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 810F646C-1D97-4516-A9BB-017E2F0B3F6C
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Common WPA graphs for modern standby power management


The graphs that are generated from the modern standby WPA profile are key to observing system behavior in modern standby and identifying problems. Two commonly used WPA graphs are the Platform Idle State graph, which shows how much time the platform spends in the various platform idle states, and the DRIPS graph, which shows the activity levels of software and hardware components.

Each graph has a table view that shows the raw data that was used to construct the graph. The view can be configured by using the buttons that are located at the upper right-hand corner of the graph window.

The default view is graph only. The following paragraphs explain how to change the default view to obtain information about modern standby behavior.

## Platform Idle State graph


The **Platform Idle State** graph shows the residency in platform idle states plotted against time.

On different platforms, the numerical states might correspond to different System on a Chip (SoC) states. Contact the SoC vendor to get the specific mapping for their hardware. This section covers only the lowest power platform state because the time spent in this state is critical to modern standby battery life.

The most important of the platform idle states is the deepest state, DRIPS. The DRIPS state corresponds to the lowest power state for the SoC during modern standby. Each SoC defines its own DRIPS state and corresponding state index.

The percentage of time that is spent in the DRIPS state (DRIPS percent) is an important metric for modern standby because it is directly proportional to battery life. If the DRIPS percent is high (above 90 percent), battery life will be longer than if the DRIPS percent is lower (for example, below 80 percent).

To obtain the DRIPS percent, open the table view and drag the % Duration column to filter on State. This column will then display the percentage of time that the system was in each state.

## DRIPS graph


The DRIPS graph shows the components that are active during the trace period, including activators, devices, and processes. You can use this graph to identify the components that are active the longest and that prevent the system from entering DRIPS.

Activators are components that take references and perform tasks while in modern standby. The most common activators are BI, WNS, and WU. To learn more about each activator and its behavior, see [Activators](activators.md).

You can use the DRIPS graph to identify the most active activator during a modern standby session. This information is important because a particular activator can hold a reference for long periods of time, which prevents the system from entering DRIPS.

All components that are shown in preceding graph, except for Devices and CPU Activity, are activators. For example, the preceding graph shows BI, WNS, NCSI, and Image Download Manager as activators. To identify the top activators, open the table view and look at the % Reason Time column, which shows the percentage of time the activator was active during the modern standby session. For example, the following screenshot shows that BI is the top activator with 49.71 percent active.

BI is a special activator because it provides broker services to apps to access system resources. When BI shows up as an active activator, you can expand the BI row and determine which apps are causing BI to be active. You can use this graph to determine the top active apps during the modern standby session.

In addition to activators, active devices might prevent the system from entering DRIPS.

Similar to system idle states, devices have low-power states that range from D0 to D3. Device low-power states are generally standardized by device class. Low-power states for devices the SoC itself are defined by the SoC manufacturer. Low-power states for devices outside of the SoC are typically standardized across all systems.

You can use the DRIPS graph to determine the top active devices during the modern standby session. The graph shows only those devices that can block the SoC idle state (DRIPS), based on information provided by the platform power engine plug-in (PEP). For more information about the PEP, see PoFxPowerControl.

**Note**  Some devices can be active because an activator is running tasks that require the device to be active. Common examples are the primary storage (eMMc/SSD) and Wi-Fi devices, which are active whenever the BI activator is active.

 

To identify the most active devices, open the table view and look at the % Reason Time column, which shows the percentage of time that each device was active during the modern standby session.

In addition to activators and devices, a final reason that the system cannot enter DRIPS is due to excessive CPU activity. CPU activity is a less common problem compared to activators and devices, but might be exacerbated by OEM pre-installed desktop applications and services.

You can view the active processes by expanding the CPU Activity row.

 

 






