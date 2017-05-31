---
title: Platform requirements and motivation
description: Describes the hardware requirements and motivation for the power and battery subsystem on the Windows platform.
MS-HAID:
- 'cstandby.platform\_requirements\_and\_motivation'
- 'p\_weg\_hardware.platform\_requirements\_and\_motivation'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: D9DB75C3-E8E3-4661-87A4-72FED3A49FC9
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Platform requirements and motivation


The Windows hardware requirements for the power and battery subsystem are motivated by the need to meet user expectations and to provide fault-tolerant platform operation.

**Note**  Systems that can only charge from a Universal Serial Bus (USB) port might not be able to support all of the requirements that are listed in this article.

 

## Charging occurs when connected to the charger


Users expect the batteries in their Windows platforms to charge whenever they are connected to an external power source. Therefore, the system must always attempt to charge the battery whenever the platform is connected to AC power or a battery charger regardless of the system power state. This holds true across all of the system power states including active (S0), sleep (S3), hibernate (S4), shutdown (S5), hard off (G2/G3), or modern standby. Charging can stop after the battery is fully charged or if a fault condition occurs.

Though not ideal, a system can be designed to charge the battery at a reduced rate when Windows or the firmware has not been booted or is not running. For example, the battery might charge at a slower rate when the system is completely off and connected to the charger. However, this system should perform more rapid charging after it is booted and the ACPI firmware is available to periodically monitor the battery level.

Finally, some systems can charge the battery at a lower rate when the system is in a thermal condition. In this case, heat is reduced by slowing or eliminating battery charging altogether. Thermal conditions should be the exception case in any good system design.

## Windows can always boot when connected to AC power


Users expect that they can immediately boot and use their system whenever it is connected to AC power. Therefore, the system must always be able to boot and be fully useable when connected to AC power. This is true regardless of battery charge level, battery/charger state, or whether the battery is present in platforms that have removable batteries.

If the platform requires a minimum battery capacity to boot the firmware and operating system, the platform must ensure that it always reserves the required capacity. The reserved battery capacity must not be exposed to Windows, and the platform must autonomously manage this capacity.

Keeping such a reserve limits the chance that a user encounters a situation in which the battery is completely depleted. However, even when the platform is properly designed to maintain the required reserve level in the battery, the user can still encounter a fully depleted battery. For example, the user might run the battery to the depletion point and then neglect to connect it to the charger for a sufficiently long period of time. As a result, the battery falls below the reserve level due to normal degradation. In this scenario, the platform must delay booting Windows until sufficient charge is added to the battery.

## Charging is managed autonomously by the hardware


Because users expect their PC to charge when it is connected to AC power, battery charging must be performed by the system hardware without requiring intervention by firmware, Windows, drivers, or other software running on the main CPU(s). That's because one or more of these components might not be operational or might be in a fault state at any given time.

## Charging stops automatically when fully charged or when a fault occurs


The system automatically stops charging when the battery is completely charged or if a fault has occurred. This must be done without requiring intervention by firmware, Windows, drivers, or other software running on the main CPU(s). In addition, the hardware must comply with all battery safety regulations.

## Windows does not automatically boot when power is applied


The system remains in the off (ACPI S5/G2) state unless it is manually powered on by the user. After the system is shut down or turned off, it must remain in that state. Therefore, the system does not automatically boot or otherwise visibly turn on when power is applied to the system.

As an option, the system can have a firmware setting to configure the system to automatically turn on when power is applied, provided that this is not the default setting. Such an option is useful in automated testing and lab environments. For more information about this setting, see [Automated lab testing considerations](automated-lab-testing-considerations.md).

 

 






