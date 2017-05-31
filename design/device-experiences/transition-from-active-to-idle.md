---
title: Transition from active to idle
description: Windows transitions the SoC platform from active mode to idle mode after all software activity is stopped and the devices on and off the SoC chip have entered low-power states.
MS-HAID:
- 'cstandby.transition\_from\_active\_to\_idle'
- 'p\_weg\_hardware.transition\_from\_active\_to\_idle'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: C5ED0F62-3AC1-4850-8631-E102023EADD3
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Transition from active to idle


Windows transitions the SoC platform from active mode to idle mode after all software activity is stopped and the devices on and off the SoC chip have entered low-power states.

The SoC transitions between idle and active modes during modern standby based on the triggers explained in the previous section. Whenever the SoC is active, Windows will aggressively attempt to return it to the idle (DRIPS) state to reduce power consumption.

**Note**  During modern standby, the SoC can be idle or active.

 

The SoC will also be active when the system exits modern standby in response to user input, such as a power button press. The SoC will be put back in the idle (DRIPS) state automatically when all of the following conditions are true:

-   All devices outside of the SoC have been powered down.
-   All network and radio devices have entered their low-power state to wait for interesting network packets or wake interrupts.
-   All host controllers on the SoC have been powered down.
-   All app background tasks have completed.
-   All CPU and GPU activity has stopped and all CPUs are idle.

Almost all modern standby power problems are related to making sure all of these five conditions have been met. Windows includes a built-in diagnostic tool called SleepStudy to help discover which of these conditions is not being met when the SoC is prevented from entering the idle (DRIPS) state.

 

 






