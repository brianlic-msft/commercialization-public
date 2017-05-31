---
title: Turning on (wake)
description: The largest benefit to the modern standby user experience is the instant resume when the system is turned on.
MS-HAID:
- 'cstandby.turning\_on\_\_wake\_'
- 'p\_weg\_hardware.turning\_on\_\_wake\_'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 73C69F47-F1A5-4DDB-82EC-7812CF6DA871
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Turning on (wake)


The largest benefit to the modern standby user experience is the instant resume when the system is turned on. Because Wi-Fi is always on during modern standby, turning on the system allows the user to immediately get to work—with fast turn-on, Wi-Fi already connected, and email already synced.

The user can turn on a modern standby system in any of the following ways:

-   Pressing the system power button.
-   Opening the lid on a clamshell form-factor system.
-   Opening the tablet if it is connected to a portable dock with a keyboard (similar to a lid in a clamshell system).
-   Generating input on an integrated or attached keyboard, mouse, or touchpad.
-   Pressing the Windows button that is integrated into the system display.

Each of the actions in the preceding list will cause the PC to instantly wake and turn on the display. The first three actions in the preceding list are the same as or similar to how the user turns off the modern standby system.

A modern standby PC will also wake and turn on the display when AC power is attached or removed. This allows the user to see the battery icon on the display for confirmation that attaching power was successful. The display will automatically power off after 5 seconds. Turning on the display when the power source is changed also allows the system designer to remove an AC power status LED, saving both power and system cost.

**Note**  A modern standby PC will also turn on instantly and power on the display when an incoming call is received from a communications app. The display will automatically turn off after 25 seconds if the call is not answered. Many system devices are required to wake the core silicon or SoC from modern standby, even though those events do not turn on the display. A good example is the Wi-Fi device, which will wake the SoC when a push notification for email is received, even though the screen will not turn on.

 

For more information about wake sources for hardware and firmware developers, see [Modern standby wake sources](modern-standby-wake-sources.md).

 

 






