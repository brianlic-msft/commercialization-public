---
title: Modern Standby
description: Windows 10 Modern Standby (MS) expands the Windows 8.1 Connected Standby power model to be more inclusive and allows systems based on rotational media and hybrid media (for example, SSD + HDD or SSHD), and/or a NIC that doesn’t support all of the prior requirements for Connected Standby to still take advantage of the low power idle model. In Modern Standby, the PC uses the S0 low power idle model. Modern Standby has the flexibility to configure the default behavior to limit network activity while in the low power state.
MS-HAID:
- 'cstandby.connected\_standby\_portal'
- 'p\_weg\_hardware.modern\_standby'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: a5704441-d856-44ae-a3de-82c66af65098
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Modern Standby


With Windows 8, Connected Standby (CS) enables the smartphone power model on the PC. It provides an instant on/instant off user experience that users expect to have with their phones. Just like the phone, the S0 low power idle model on Connected Standby enables the system to stay up-to-date whenever a suitable network is available.

The number of systems capable of S0 low power idle is increasing. We expect more systems to use the always on, instantly available power model instead of the traditional S3/S4 power model. These topics introduce the changes in Windows 10 that support this trend and what partners need to provide.

## Introducing Modern Standby


The low power idle infrastructure is evolving in several significant ways in Windows 10. This helps grow the use of low power idle for market segments that were previously limited to the S3 power model.

Windows 10 Modern Standby (MS) expands the Windows 8.1 Connected Standby power model to be more inclusive and allows systems based on rotational media and hybrid media (for example, SSD + HDD or SSHD), and/or a NIC that doesn’t support all of the prior requirements for Connected Standby to still take advantage of the low power idle model. In Modern Standby, the PC uses the S0 low power idle model. Modern Standby has the flexibility to configure the default behavior to limit network activity while in the low power state.

Windows 10 reduces power consumption by the OS and only wakes from the lowest power state when absolutely necessary. With Modern Standby, the system wakes when there is real time action required, such as OS maintenance, or a user wakes the system.

Modern Standby is available for both Windows 10 desktop and Windows 10 Mobile.

> [!NOTE]
> You cannot switch between S3 and Modern Standby by changing a setting in the BIOS. Switching the power model is not supported in Windows without a complete OS re-install. 

## Terminology


*Platform* refers to a set of firmware, hardware and software components that delivers an S0 low-power state. The low-power idle state is accomplished through tight integration between the firmware, chipset, low-power components, devices and drivers.

*DRIPS* refers to the Deepest Runtime Idle Platform State. The DRIPS state corresponds to the lowest power state for the SoC during Connected Standby or Modern Standby. Each SoC defines its own DRIPS state and corresponding state index. This is also referred to as S0 low power idle.

 

 






