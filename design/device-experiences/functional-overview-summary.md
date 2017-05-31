---
title: Functional overview summary
description: Summarizes the capabilities supported by modern standby.
MS-HAID:
- 'cstandby.functional\_overview\_summary'
- 'p\_weg\_hardware.functional\_overview\_summary'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: F734C722-52EE-4230-85FD-509CCB284163
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Functional overview summary


Modern standby achieves low power and constant connectivity by spending the majority of time in a low-power state in which the SoC is powered down (the DRIPS state).

Windows powers up the SoC to perform scheduled background activity or to respond to incoming network activity or device interrupts. Windows achieves low power consumption by aggressively entering the idle power mode and controlling the amount of activity.

If the system is in disconnected standby, very little activity occurs during standby. The system should spend most of its time in the idle power mode (DRIPS).

If the system has an Internet connection through Wi-Fi, mobile broadband, or Ethernet, and is modern standby capable, the amount of activity is higher. This activity is mostly the result of app background tasks that require a network connection to be usable. For example, email will not sync without an Internet connection, and Windows Update will not download critical security updates if an Internet connection is not available. When an active Internet connection is present, the system will transition between the idle and active modes on demand if incoming network packets match WoL patterns.

 

 






