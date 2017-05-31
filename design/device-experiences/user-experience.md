---
title: User Experience
description: From a thermal point of view, the user experience should be such that the user can operate the PC for as long as possible without interruption. And the user should only be notified of thermal problems, when the PC can no longer operate.
MS-HAID:
- 'cstandby.user\_experience'
- 'p\_weg\_hardware.user\_experience'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 81AFB03B-8B53-4777-ACF8-DBDC8E74F69B
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# User Experience


From a thermal point of view, the user experience should be such that the user can operate the PC for as long as possible without interruption. And the user should only be notified of thermal problems, when the PC can no longer operate.

This uninterrupted operation of the PC should continue, even when the PC undergoes some form of thermal mitigation.

## Thermal user experience


Thermal management should be as invisible as possible to end users. Slates and other system on a chip-based (SoC-based) PCs should contain hardware and software to efficiently manage case and component temperatures and to keep the hardware platform running cool under normal use. The PC should stay turned on and fully functioning without any need for thermal mitigation for as long as possible. This goal is dependent on good hardware design.

**Thermal scenarios**

Thermal problems fall into these three categories:

-   **The PC is turned on, but is producing too much heat to be sustainable.**

    The PC is fully functioning when it detects that it is getting warm. Thermal mitigation measures (passive cooling and active cooling) must begin to reduce the heat produced, to a sustainable rate. If thermal mitigation measures are not successful, the PC will turn itself off (see the last item in this list).

-   **The PC is turned on, but is unusable due to thermal constraints.**

    This problem could manifest in a few different ways:

    -   The system display is on but does not respond to the user's inputs.
    -   The PC is too hot to continue running and must initiate shutdown or hibernate now.
    -   The PC is much too hot and firmware needs to cut the power to the system.
-   **The PC is turned off, and cannot boot due to thermal constraints.**

    When a user tries to turn on a PC in an environment that is too hot or too cold, the PC fails to boot.

**Thermal mitigation experience**

While the PC is turned on and being used, thermal mitigation solutions should be as transparent to the user as possible. In other words, the user ideally should never know when their PC is or is not being thermally mitigated. The overarching goal of thermal mitigation is to allow the user to use the PC for as much and as long as possible without disruption.

Hardware vendors and system integrators have a great deal of control in their design of a PC to reduce the need for thermal mitigation by designing hardware that is effective at dissipating heat. For more information about hardware design for thermal management, see [Hardware thermal modeling and evaluation](design-guide.md#hardware-thermal).

In addition, Windows provides thermal management software. For more information, see [Windows thermal management framework](design-guide.md#thermal-framework).

**Critical thermal "shutdown" experience**

In extreme conditions where the ambient temperature is much higher above the targeted temperature range, heavy workloads might cause the system temperature to continue rising even with the throttling mechanisms engaged.

When the critical shutdown threshold is met, the system immediately starts the critical thermal action. By default, systems will hibernate if enabled and shutdown if hibernate is not available. This thermal shutdown path is the shortest shutdown path available and usually completes within one second. No notification is given to apps or services, so apps do not have the opportunity to autosave or close.

Furthermore, each system must have knowledge of its *hardware fail-safe temperature*, which is determined in ACPI by the hardware vendor. This value is very important because the firmware must be able to detect thermal constraints before the operating system is loaded and prevent the system from causing damage to itself and the user. If at any time while the system is on, the hardware fail-safe trip point is reached, the system must immediately cut off the power and turn off. The fail-safe trip point is usually slightly higher than the critical shutdown trip point. This way, the system has the opportunity to hibernate or shutdown before the hardware fail-safe is reached. It is possible to reach the fail-safe trip point before the system has completed a critical hibernate or shutdown. However, if the critical threshold is chosen well, this should seldom occur.

**Thermal boot experience**

Systems have constraints during boot as well. In firmware, each system must check the temperature before boot to ensure that boot can complete successfully. The two primary concerns are:

-   **The ambient temperature is too hot.**

    Boot is often a resource-intensive action, and, as a result, produces a lot of heat. If too much heat is produced during boot, the system might hit the hardware fail-safe temperature and kill power to itself.

-   **The ambient temperature is too cold.**

    The battery might not be able supply enough resources to the system.

System designers should model and predict the thermal characteristics of boot — in particular, the temperature rise. Firmware must check that there is enough headroom for the system to boot without crossing the hardware fail-safe trip point. For example, if the system temperature consistently rises 5<sup>o</sup>C during boot, and the fail-safe temperature is 40<sup>o</sup>C, the system should be at the very most 35<sup>o</sup>C at the start of boot. The firmware must perform this check because the Windows thermal framework will not have been loaded at boot time to mitigate the issue.

**Note**  If a PC is too hot or too cold to boot, the PC should provide user feedback to give the user an opportunity to alleviate the problem and to try to boot again.

 

 

 






