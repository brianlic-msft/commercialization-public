---
title: User experience principles for battery charging
description: Outlines the five fundamental user experience principles for battery charging.
MS-HAID:
- 'cstandby.user\_experience\_principles\_for\_battery\_charging'
- 'p\_weg\_hardware.user\_experience\_principles\_for\_battery\_charging'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: EFFAD328-31C9-44B2-92DF-499A57E0555E
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# User experience principles for battery charging


Users expect to have a consistent and quality experience around battery charging. Therefore, all systems in the Windows ecosystem must have a consistent battery charging experience, regardless of form factor, instruction set, or platform architecture.

From a user experience perspective, there are five fundamental principles for battery charging:

-   **Charging always occurs when connected to the charger.** The system always charges the battery when it is connected to the charger, except in cases of battery failure or thermal conditions. The term charger is used to describe the AC adapter or power brick that is included with the system.
-   **Windows can always boot when connected to the charger.** If the system is shut down (ACPI S5 state), it is always able to boot into Windows when connected to the charger provided with the system. Furthermore, the system must boot even if the battery is not present, as can be the case for a system with a removable battery.
-   **Charging is managed autonomously by the hardware.** Battery charging in a Windows PC is performed independently by the system hardware and does not require intervention by firmware, drivers, Windows, or other software running on the main CPU. Battery charging continues even when the user completely shuts down the system, and during the rare instances in which Windows encounters a fatal error.
-   **Charging stops automatically when the battery is fully charged or when a fault occurs.** The system hardware automatically stops charging when the battery is completely charged. (The term completely charged refers to the level of charge at which the OEM considers the battery to be fully charged. For reasons of battery maintenance and lifecycle, this state may not be 100 percent of the cell's capacity.) This is done without requiring firmware, Windows, drivers, or other software running on the main CPU(s). Charging is also automatically halted in the case of a battery or thermal fault condition.
-   **Windows does not automatically boot when power is applied.** This requirement does not apply when the system is in a test lab environment, as described in [Automated lab testing considerations](automated-lab-testing-considerations.md). When the system is in the off state (ACPI S5 state), it does not automatically boot when power is applied to the system. The system remains in the off state until it is manually powered on by the user. This applies to UEFI and Windows boot.

**Note**  Systems that can only charge through a Universal Serial Bus (USB) connector might not be able to support all of these user-experience goals. These systems might require booting into firmware or Windows to interrogate the USB port and determine the correct charge rate.

 

 

 






