---
title: Transition from idle to active
description: During modern standby, Windows periodically transitions the SoC platform from idle mode to active mode to perform kernel maintenance tasks.
MS-HAID:
- 'cstandby.transition\_from\_idle\_to\_active'
- 'p\_weg\_hardware.transition\_from\_idle\_to\_active'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 848A53F5-1FDD-4B2F-B823-B96DE2FCED94
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Transition from idle to active


During modern standby, Windows periodically transitions the SoC platform from idle mode to active mode to perform kernel maintenance tasks. In addition, on-demand transitions to active mode can occur in response to user inputs, interrupts from networking devices, and other hardware events.

After the SoC has entered the DRIPS state, the platform will typically be in its lowest power mode. In modern standby, the platform will switch between this idle (DRIPS) mode and the active mode periodically. Low power is achieved in modern standby by spending the majority of the time in the DRIPS mode and very small amounts of time in the active mode.

Windows will transition the SoC to the active mode for the following reasons:

-   An on-demand wake event due to an interrupt from a networking device (Wi-Fi, mobile broadband, or Ethernet). The networking device generates an interrupt when a matching WoL pattern is detected or when the media or connection state changes. The interrupt wakes the SoC using an out-of-band GPIO, in-band USB resume signaling, or PCI PME interrupt.
-   An on-demand wake event due to a platform device interrupt from a source such as the battery fuel gauge, battery charge controller, or thermal sensors.
-   An on-demand wake event due to an interrupt caused by user input at a keyboard, touchpad, external USB peripheral, power button, or lid switch.

As soon as the SoC wakes and the platform exits the DRIPS state, the CPUs start running code again. However, the screen stays powered off unless the interrupt was a result of user input or a power source change. The Windows power manager determines whether the screen should be powered on; the system designer needs only to ensure that the interrupt from each device is connected and programmed to wake the SoC from the DRIPS state.

System designers must work closely with the SoC vendor to connect device interrupts for SoC wakeup. Some SoC devices require device interrupts to be connected to special "wake-capable" inputs or configured for wake using system firmware.

 

 






