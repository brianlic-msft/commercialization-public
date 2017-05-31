---
title: Turning off
description: The user experience for turning off the modern standby PC is instant.
MS-HAID:
- 'cstandby.turning\_off'
- 'p\_weg\_hardware.turning\_off'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 807B1820-537A-4384-914C-1A8CD048B1B4
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Turning off


The fundamental user experience of connected standby is simply putting the PC to sleep. The system will go to sleep and enter connected standby when the user does any of the following:

-   Presses the system power button.
-   Closes the lid or tablet cover, or closes the tablet into an attached dock.
-   Selects Sleep from the Power button on the Windows Start menu.
-   Waits for the system to idle and enter sleep automatically, according to the Power and sleep settings.

The user experience for turning off the modern standby PC is instant. The display is immediately powered off when the user presses the Power button or does something in the preceding list. The system might still be active for a few seconds after the Power button is pressed and the screen turns off, but the experience is smartphone-like and instant. While the system appears to the user to be asleep, it can transition between different hardware and software power modes. But, whenever the screen is off, the system is in standby, maintaining connectivity and ready to instantly resume.

 

 






