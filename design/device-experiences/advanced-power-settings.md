---
title: Advanced power settings
description: Describes some of the advanced power settings that you can configure in Windows.
MS-HAID:
- 'cstandby.advanced\_power\_settings'
- 'p\_weg\_hardware.advanced\_power\_settings'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: C3DC2BDB-F4E4-4F10-A791-1606A349318D
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Advanced power settings


Windows has built-in extensibility for power policy settings. The purpose of this support is to allow device vendors and software developers to extend the power policy model to their own hardware and applications.

In Windows 10, the configuration of these settings is exposed to the user in the **Power Options** control panel as the **Change plan settings** option. Many Windows power policy settings are also configurable through the **Change advanced power settings** option, including Wi-Fi power management policy and battery threshold and action policy.

In a modern standby system, the following power policies are displayed in the **Advanced settings** tab, and all other policy policies that exist on a system that uses the traditional ACPI Sleep (S3) and Hibernate (S4) states are removed:

-   Require a password on wakeup
-   Display brightness
-   Desktop background slideshow
-   Power buttons and lid switch
-   Battery levels and actions

 

 






