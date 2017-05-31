---
title: Other modern standby functionality
description: Additional activities that occur during modern standby include Automatic Maintenance.
MS-HAID:
- 'cstandby.other\_connected\_standby\_functionality'
- 'p\_weg\_hardware.other\_modern\_standby\_functionality'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: E763DF3F-1567-4FE0-A2DA-D162AE2BEDAE
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Other modern standby functionality


Additional activities that occur during modern standby include Automatic Maintenance. The reason to perform maintenance activities during modern standby is to avoid interrupting users when they are actively using the system. Windows performs these activities with minimal impact on standby battery life.

## Automatic Maintenance


As part of Automatic Maintenance, Windows performs periodic system maintenance and optimization. Automatic Maintenance batches system optimization and background tasks and executes them all at once when the user is not interacting with the system.

Modern standby, particularly when on AC power, is the perfect time to perform Automatic Maintenance because the user is guaranteed to not be interacting with the system when the screen is off. Windows will perform Automatic Maintenance on a modern standby PC at the scheduled time if the system is on AC power at the time.

When an Automatic Maintenance task is running, desktop applications and services are allowed to run normally and the network is available. When Automatic Maintenance is being performed, [SleepStudy](modern-standby-sleepstudy.md) and other diagnostics indicate that the system is in the maintenance phase.

For more information, see Automatic Maintenance.

 

 






